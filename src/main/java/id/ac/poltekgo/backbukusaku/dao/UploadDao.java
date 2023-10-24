package id.ac.poltekgo.backbukusaku.dao;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.web.multipart.MultipartFile;

import id.ac.poltekgo.backbukusaku.entity.Upload;

public interface UploadDao extends JpaRepository<Upload, String> {

    String save(MultipartFile file);

    Optional<Upload> findById(String id);

}

