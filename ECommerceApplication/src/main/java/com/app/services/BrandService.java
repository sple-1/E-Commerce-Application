package com.app.services;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

import com.app.entites.Brand;
import com.app.payloads.BrandDTO;
import com.app.payloads.BrandResponse;

public interface BrandService {
    
    BrandDTO createBrand(Brand brand);

    BrandResponse getBrands(Integer pageNumber, Integer pageSize, String sortBy, String sortOrder);

    BrandDTO updateBrand(Brand brand, Long brandId);

    BrandDTO updateBrandLogo(Long brandId, MultipartFile logo) throws IOException;

    String deleteBrand(Long brandId);

}
