package pl.coderslab.charity.user;

import pl.coderslab.charity.security.Role;

import java.util.List;

public interface UserService {

    User findByUserName(String name);

    void saveUser(User user);

    List<User> findUserByRole(Role role);
}
