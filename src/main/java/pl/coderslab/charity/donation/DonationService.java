package pl.coderslab.charity.donation;

import org.springframework.stereotype.Service;

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
}
