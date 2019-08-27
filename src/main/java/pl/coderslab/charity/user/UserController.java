package pl.coderslab.charity.user;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import pl.coderslab.charity.email.EmailServiceImpl;
import pl.coderslab.charity.security.CurrentUser;

import java.util.UUID;

@Controller
public class UserController {

    private final UserService userService;
    private BCryptPasswordEncoder passwordEncoder;
    private EmailServiceImpl emailService;

    public UserController(UserService userService, BCryptPasswordEncoder passwordEncoder, EmailServiceImpl emailService) {
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
        this.emailService = emailService;
    }

    @GetMapping("/login")
    public String login(){
        return "login";
    }

    @GetMapping("/register")
    public String createUser(Model model) {
        User user = new User();
        model.addAttribute("user", user);
        return "register";
    }

    @PostMapping("/register")
    public String saveUser(User user, RedirectAttributes redirectAttributes){
        String uuid = UUID.randomUUID().toString();
        emailService.sendSimpleMessage(user.getEmail(),"Aktywacja konta","Kliknij link: http://localhost:8082/activate?uuid="+ uuid);
        user.setUuid(uuid);
        userService.saveUser(user);
        redirectAttributes.addFlashAttribute("activateMessage","Sprawdź swoją skrzynkę i kliknij link, aby aktywować konto");
        return "redirect:/login";
    }

    @GetMapping("/edit/user")
    public String editUser(Model model, @AuthenticationPrincipal CurrentUser customUser) {
        model.addAttribute("user", customUser.getUser());
        return "user.edit";
    }

    @PostMapping("/edit/user")
    public String saveUser(@ModelAttribute User user, @AuthenticationPrincipal CurrentUser customUser){
        User userToUpdate = customUser.getUser();
        userToUpdate.setName(user.getName());
        userToUpdate.setSurname(user.getSurname());
        userToUpdate.setEmail(user.getEmail());
        if(!user.getPassword().equals("")){
            userToUpdate.setPassword(passwordEncoder.encode(user.getPassword()));
        }
        userService.updateUser(userToUpdate);
        return "redirect:/api/main_page";
    }

    @GetMapping("/activate")
    public String enableUser(@RequestParam String uuid){
        User user = userService.findByUuid(uuid);
        user.setEnabled(1);
        userService.updateUser(user);
        return "redirect:/login";
    }

}
