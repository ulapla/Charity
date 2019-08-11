package pl.coderslab.charity.user;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pl.coderslab.charity.institution.Institution;
import pl.coderslab.charity.institution.InstitutionService;
import pl.coderslab.charity.security.CurrentUser;

@Controller
@RequestMapping("/admin")
public class AdminController {

    private InstitutionService institutionService;

    public AdminController(InstitutionService institutionService) {
        this.institutionService = institutionService;
    }

    @GetMapping("/panel")
    public String showAdminPanel(){
        return "admin.panel";
    }

    @GetMapping("/institutions")
    public String showInstitutions(Model model){
        model.addAttribute("institutions",institutionService.findAll());
        return "institutions";
    }

    @PostMapping("/institutions")
    public String updateInstitution(@RequestParam Long id, Model model, @RequestParam String action){
       if(action.equals("edit")) {
           Institution institution = institutionService.findById(id);
           model.addAttribute("institution", institution);
           return "institution.form";
       }else if(action.equals("delete")){
           institutionService.deleteById(id);
       }
        return "institutions";
    }

}
