package pl.coderslab.charity.donation;

import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DonationService {

    private DonationRepository donationRepository;

    public DonationService(DonationRepository donationRepository) {
        this.donationRepository = donationRepository;
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
       return donationRepository.findAllByUserId(id);
    }
}
