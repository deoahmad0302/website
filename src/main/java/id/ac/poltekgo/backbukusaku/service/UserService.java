package id.ac.poltekgo.backbukusaku.service;

import org.springframework.stereotype.Service;

import id.ac.poltekgo.backbukusaku.dao.UserDao;
import id.ac.poltekgo.backbukusaku.entity.User;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserService {

    private final UserDao userDao;

    public User findByUsername(String username) {
        return userDao.findByUsername(username);
    }

}
