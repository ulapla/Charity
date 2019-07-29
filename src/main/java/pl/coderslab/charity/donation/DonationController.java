package pl.coderslab.charity.donation;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import pl.coderslab.charity.category.Category;
import pl.coderslab.charity.category.CategoryService;
import pl.coderslab.charity.institution.Institution;
import pl.coderslab.charity.institution.InstitutionService;

import java.util.List;

@Controller
public class DonationController {

    private DonationService donationService;
    private InstitutionService institutionService;
    private CategoryService categoryService;

    public DonationController(DonationService donationService, InstitutionService institutionService, CategoryService categoryService) {
        this.donationService = donationService;
        this.institutionService = institutionService;
        this.categoryService = categoryService;
    }

    @ModelAttribute("institutions")
    public List<Institution> findAllInstitutions(){
        return institutionService.findAll();
    }

    @ModelAttribute("categories")
    public List<Category> findAllCategories(){
        return categoryService.findAll();
    }

    @GetMapping("/form")
    public String createDonation(Model model){
        model.addAttribute("donation",new Donation());
        return "form";
    }
    @GetMapping("/f")
    public String test(Model model){
        model.addAttribute("donation",new Donation());
        return "formhtml";
    }

}
