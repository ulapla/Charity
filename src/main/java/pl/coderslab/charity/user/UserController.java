package pl.coderslab.charity.user;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import pl.coderslab.charity.security.CurrentUser;

@Controller
public class UserController {

    private final UserService userService;
    private BCryptPasswordEncoder passwordEncoder;

    public UserController(UserService userService, BCryptPasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
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
    public String saveUser(User user){
        user.setEnabled(1);
        userService.saveUser(user);
        return "redirect:/api/form";
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

}
