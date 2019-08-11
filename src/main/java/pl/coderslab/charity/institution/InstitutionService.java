package pl.coderslab.charity.institution;

import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class InstitutionService {
    private InstitutionRepository institutionRepository;

    public InstitutionService(InstitutionRepository institutionRepository) {
        this.institutionRepository = institutionRepository;
    }

    public List<Institution> getAllInstitutions(){
        return institutionRepository.findAll();

    }

    public List<Institution> findAll(){
        return institutionRepository.findAll();
    }

    public Institution findById(Long id){
        return institutionRepository.findById(id).get();
    }

    public void deleteById(Long id){
        institutionRepository.deleteById(id);
    }
}
