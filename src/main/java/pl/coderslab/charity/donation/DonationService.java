package pl.coderslab.charity.donation;

import org.springframework.stereotype.Service;
import pl.coderslab.charity.user.UserService;

import java.util.List;

@Service
public class DonationService {

    private DonationRepository donationRepository;
    private UserService userService;

    public DonationService(DonationRepository donationRepository, UserService userService) {
        this.donationRepository = donationRepository;
        this.userService = userService;
    }

    public int allDonationQuantity(){
        if(donationRepository.findAll().size() == 0){
            return 0;
        }
        return donationRepository.allDonationQuantity();
    }

    public int countAllInstitutions(){
        if(donationRepository.findAll().size() == 0){
            return 0;
        }
        return donationRepository.sumAllInstitutions();
    }

    public void saveDonation(Donation donation){
        donationRepository.save(donation);
    }

    public List<Donation> findAllByUserId(Long id){
       return donationRepository.findAllOrdered(userService.findById(id));
    }
}
