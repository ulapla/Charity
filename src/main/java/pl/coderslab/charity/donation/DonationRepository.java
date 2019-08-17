package pl.coderslab.charity.donation;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DonationRepository extends JpaRepository<Donation, Long> {

    @Query(value = "SELECT SUM(d.quantity) FROM Donation d ")
    int allDonationQuantity();

    @Query(value = "SELECT COUNT(DISTINCT d.institution) FROM Donation d ")
    int sumAllInstitutions();

    List<Donation> findAllByUserIdOrderByPickedUp(Long id);

}
