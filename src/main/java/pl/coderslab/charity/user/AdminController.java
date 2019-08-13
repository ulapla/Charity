package pl.coderslab.charity.user;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.institution.Institution;
import pl.coderslab.charity.institution.InstitutionService;
import pl.coderslab.charity.security.Role;
import pl.coderslab.charity.security.RoleRepository;

import java.time.LocalDateTime;
import java.util.Set;

@Controller
@RequestMapping("/admin")
public class AdminController {

    private InstitutionService institutionService;
    private UserService userService;
    private RoleRepository roleRepository;

    public AdminController(InstitutionService institutionService, UserService userService, RoleRepository roleRepository) {
        this.institutionService = institutionService;
        this.userService = userService;
        this.roleRepository = roleRepository;
    }

    @GetMapping("/panel")
    public String showAdminPanel(){
        return "admin/admin.panel";
    }

    @GetMapping("/institutions")
    public String showInstitutions(Model model){
        model.addAttribute("institutions",institutionService.findAll());
        return "admin/institutions";
    }

    @PostMapping("/institutions")
    public String updateInstitution(@RequestParam Long id, Model model, @RequestParam String action){
       if(action.equals("edit")) {
           Institution institution = institutionService.findById(id);
           model.addAttribute("institution", institution);
           return "admin/institution.form";
       }else if(action.equals("delete")){
           institutionService.deleteById(id);
       }
        return "redirect:/admin/institutions";
    }

    @GetMapping("institution/add")
    public String addInstitution(Model model){
        model.addAttribute("institution",new Institution());
        return "admin/institution.form";
    }

    @PostMapping("institution/save")
    public String addInstitution(@ModelAttribute Institution institution){
        institutionService.save(institution);
        return "redirect:/admin/institutions";
    }

    @GetMapping("/allAdmins")
    public String showAdmins(Model model){
        Role role = roleRepository.findByName("ROLE_ADMIN");
        model.addAttribute("admins", userService.findUserByRole(role));
        return"admin/admins.list";
    }

    @GetMapping("/add")
    public String addAdmin(Model model){
        model.addAttribute("users",userService.findAll());
        return "admin/admin.add";
    }

    @PostMapping("/add")
    public String addAdmin(@RequestParam Long id){
        userService.addRole(userService.findById(id),"ROLE_ADMIN");
        return "redirect:/admin/allAdmins";
    }

    @PostMapping("/action")
    public String adminAction(@RequestParam Long id, Model model, @RequestParam String action) {
        if (action.equals("edit")) {
            model.addAttribute("user",userService.findById(id));
            return "admin/admin.form";
        } else if (action.equals("delete")) {
            userService.deleteUser(userService.findById(id));
        }
        return "redirect:/admin/allAdmins";
    }

    @PostMapping("/update")
    public String updateAdmin(@ModelAttribute User user){
        userService.saveUser(user);
        return "redirect:/admin/allAdmins";
    }

    @GetMapping("/allUsers")
    public String showUsers(Model model){
        model.addAttribute("users", userService.findUserByRole(roleRepository.findByName("ROLE_USER")));
        return "admin/users.list";
    }

    @PostMapping("/user/action")
    public String actionUser(@RequestParam Long id, Model model, @RequestParam String action) {
        if (action.equals("edit")) {
            model.addAttribute("user",userService.findById(id));
            return "admin/admin.form";
        } else if (action.equals("delete")) {
            userService.deleteUser(userService.findById(id));
        }
        return "redirect:/admin/allUsers";
    }
}
