package pl.coderslab.charity.category;

import org.springframework.stereotype.Service;


import java.util.List;


@Service
public class CategoryService {

    private CategoryRepository categoryRepository;

    public CategoryService(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    public List<Category> findAll(){return categoryRepository.findAll();    }
}
