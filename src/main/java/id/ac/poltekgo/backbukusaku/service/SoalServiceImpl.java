package id.ac.poltekgo.backbukusaku.service;

import java.util.List;

import org.springframework.stereotype.Service;

import id.ac.poltekgo.backbukusaku.dao.SoalDao;
import id.ac.poltekgo.backbukusaku.entity.Soal;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SoalServiceImpl implements SoalService {

    private final SoalDao soalDao;

    @Override
    public List<Soal> getSoalByDate() {
        // TODO Auto-generated method stub
        return soalDao.findAll();
    }

}

