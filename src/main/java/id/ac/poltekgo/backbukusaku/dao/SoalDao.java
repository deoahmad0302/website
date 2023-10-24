package id.ac.poltekgo.backbukusaku.dao;
import org.springframework.data.jpa.repository.JpaRepository;


import id.ac.poltekgo.backbukusaku.entity.Soal;

// import id.ac.poltekgo.bukusaku.entity.Soal;

public interface SoalDao extends JpaRepository<Soal, String> {

}