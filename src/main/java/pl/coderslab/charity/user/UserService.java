package pl.coderslab.charity.user;

import pl.coderslab.charity.security.Role;

import java.util.List;

public interface UserService {

    User findByUserName(String name);

    User findById(Long id);

    void saveUser(User user);
    void updateUser(User user);

    List<User> findUserByRole(Role role);

    List<User> findAll();

    void addRole(User user, String roleName);

    void deleteUser(User user);
}
