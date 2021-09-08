package com.proyect.modelsDTO.General;

import jakarta.servlet.http.Part;

import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

public class SaveImage {

    public String saveImage(Part part, String typeModel) {

        String absolutePath = "C:\\Users\\sebas\\Documents\\IntelliProjects\\icis\\src\\main\\webapp\\assets\\image";

        switch (typeModel) {
            case "product" ->
                   absolutePath = "C:\\Users\\sebas\\Documents\\IntelliProjects\\icis\\src\\main\\webapp\\views\\admin\\assets\\img";
            case "client" ->
                   absolutePath = "C:\\Users\\sebas\\Documents\\IntelliProjects\\icis\\src\\main\\webapp\\views\\user\\assets\\avatar";
            case "employee" ->
                   absolutePath = "C:\\Users\\sebas\\Documents\\IntelliProjects\\icis\\src\\main\\webapp\\views\\admin\\assets\\avatar";
        }

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
