package com.proyect.modeslDTO.General;

import jakarta.servlet.http.Part;

import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

public class saveImage {

    public String saveImageProduct(Part part) {

        String absolutePath = "C:\\Users\\sebas\\Documents\\IntelliProjects\\integrator\\src\\main\\webapp\\views\\admin\\assets\\img";
        File fileUpload = new File(absolutePath);
        String pathFile = "";
        try {
            Path path = Paths.get(part.getSubmittedFileName());
            String fileName = path.getFileName().toString();
            InputStream input = part.getInputStream();
            if (input != null) {
                File file = new File(fileUpload, fileName);
                pathFile += file.getName();
                Files.copy(input, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pathFile;
    }

    public String saveAvatarClient(Part part) { //Usar para editar imagen del cliente

        String absolutePath = "C:\\Users\\sebas\\Documents\\IntelliProjects\\integrator\\src\\main\\webapp\\views\\user\\assets\\avatar";
        File fileUpload = new File(absolutePath);
        String pathFile = "";
        try {
            Path path = Paths.get(part.getSubmittedFileName());
            String fileName = path.getFileName().toString();
            InputStream input = part.getInputStream();
            if (input != null) {
                File file = new File(fileUpload, fileName);
                pathFile += file.getName();
                Files.copy(input, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pathFile;
    }

    public String saveAvatarEmployee(Part part) { //Usar para editar imagen del empleado
        String absolutePath = "C:\\Users\\sebas\\Documents\\IntelliProjects\\integrator\\src\\main\\webapp\\views\\admin\\assets\\avatar";
        File fileUpload = new File(absolutePath);
        String pathFile = "";
        try {
            Path path = Paths.get(part.getSubmittedFileName());
            String fileName = path.getFileName().toString();
            InputStream input = part.getInputStream();
            if (input != null) {
                File file = new File(fileUpload, fileName);
                pathFile += file.getName();
                Files.copy(input, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pathFile;
    }

}
