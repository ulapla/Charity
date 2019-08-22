package pl.coderslab.charity;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pl.coderslab.charity.donation.DonationService;
import pl.coderslab.charity.email.EmailServiceImpl;
import pl.coderslab.charity.institution.InstitutionService;


@Controller
public class HomeController {

    private InstitutionService institutionService;
    private DonationService donationService;
    private EmailServiceImpl emailService;

    public HomeController(InstitutionService institutionService, DonationService donationService, EmailServiceImpl emailService) {
        this.institutionService = institutionService;
        this.donationService = donationService;
        this.emailService = emailService;
    }

    @RequestMapping("/")
    public String homeAction(Model model){
        model.addAttribute("institutions", institutionService.getAllInstitutions());
        model.addAttribute("allDonations", donationService.allDonationQuantity());
        model.addAttribute("supportedInstitutions", donationService.countAllInstitutions());
        return "index";
    }

    @PostMapping("/")
    public String sentEmail(@RequestParam String name, @RequestParam String surname, @RequestParam String message){
        emailService.sendSimpleMessage("ulaplacek@gmail.com","Wiadomość od "+ name + " "+ surname, message);
        System.out.println("dziala");
        return "redirect:/";
    }


}
