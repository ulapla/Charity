package pl.coderslab.charity.donation;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import pl.coderslab.charity.user.User;

import java.util.List;

@Repository
public interface DonationRepository extends JpaRepository<Donation, Long> {

    @Query(value = "SELECT SUM(d.quantity) FROM Donation d ")
    int allDonationQuantity();

    @Query(value = "SELECT COUNT(DISTINCT d.institution) FROM Donation d ")
    int sumAllInstitutions();

    List<Donation> findAllByUserId(Long id);

    @Query(value="SELECT d FROM Donation d WHERE d.user = ?1 ORDER BY d.pickedUp, d.pickUpDate, d.createdOn")
    List<Donation> findAllOrdered(User user);

}
