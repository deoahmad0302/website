package id.ac.poltekgo.backbukusaku.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import id.ac.poltekgo.backbukusaku.entity.User;


public interface UserDao extends JpaRepository<User, String> {

    User findByUsername(String username);

}
