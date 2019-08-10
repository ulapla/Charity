package pl.coderslab.charity.user;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.security.CurrentUser;

@Controller
@RequestMapping("/admin")
public class AdminController {


    @GetMapping("/panel")
    public String dispalyAdminPanel(Model model, @AuthenticationPrincipal CurrentUser customUser){

        return "admin.panel";
    }

}
