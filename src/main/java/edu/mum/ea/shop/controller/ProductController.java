package edu.mum.ea.shop.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Collection;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import edu.mum.ea.shop.domain.Product;
import edu.mum.ea.shop.domain.CartItem;
import edu.mum.ea.shop.domain.Category;
import edu.mum.ea.shop.service.CategoryService;
import edu.mum.ea.shop.service.ProductService;

@Controller
public class ProductController {

	@Autowired
	private ProductService productService;
	@Autowired
	private CategoryService categoryService;
    @Autowired
    ServletContext context; 
    
	@RequestMapping(value="/admin/addproduct", method=RequestMethod.GET)
	public String addProduct(@ModelAttribute("product") Product product, Model model){
		getCateMap(model);
		return "admin/addproduct";
	}

	@RequestMapping(value="/admin/addproduct", method = RequestMethod.POST)
	public String addProduct(@Validated Product product, BindingResult result, Model model){
		if(product.getCategory().getId() == 0){
			result.addError(new FieldError("product", "category.id", "Please select category"));
		}
		if(result.hasErrors()){
			getCateMap(model);
			return "admin/addproduct";
		}

	   MultipartFile file = product.getPictureFile();
	   if(file != null){
		   String fileName = String.valueOf((new Date()).getTime());
		   uploadFile(file, fileName);
		   product.setImage("/resources/img/" + fileName);	   	
	   }
	 
		productService.save(product);
		return "redirect:/admin/products";
	}
	
	@RequestMapping(value="/admin/editproduct/{id}", method = RequestMethod.GET)
	public String editProduct(@PathVariable int id, Model model){
		getCateMap(model);
		model.addAttribute("product", productService.get(id));
		return "admin/editproduct";
	}

	@RequestMapping(value="/admin/editproduct/{id}", method = RequestMethod.POST)
	public String editProduct(@PathVariable int id, Model model, @Validated Product product, BindingResult result){
		if(product.getCategory().getId() == 0){
			result.addError(new FieldError("product", "category.id", "Please select category"));
		}
		if(result.hasErrors()){
	   	getCateMap(model);
	   	return "admin/editproduct";
	   }
		
		MultipartFile file = product.getPictureFile();
	   
    	Product oldProduct = productService.get(product.getId());
    	if(file != null && file.getSize() > 0){
		   String fileName = String.valueOf((new Date()).getTime());
		   uploadFile(file, fileName);
		   product.setImage("/resources/img/" + fileName);	
		   deleteFile(oldProduct.getImage());
	   }else{
	   	product.setImage(oldProduct.getImage());
	   }
		productService.save(product);
		return "redirect:/admin/products";
	}
	
	@RequestMapping(value="/admin/deleteproduct/{id}")
	public String deleteProduct(@PathVariable int id){
		productService.delete(id);
		return "redirect:/admin/products";
	}
	
	@RequestMapping(value={"/admin/products"})
	public String getProductsAdmin(Model model){
		model.addAttribute("products", productService.getAll());
		/*Collection<? extends GrantedAuthority> authorities = SecurityContextHolder.getContext().getAuthentication().getAuthorities();
       		
		for (GrantedAuthority auth : authorities) {
            if ("ROLE_ADMIN".equals(auth.getAuthority()))
                return "admin/products";
        }*/
		return "admin/products";
	}
	
//	@RequestMapping(value={"/"})
//	public String getProducts(Model model){
//		model.addAttribute("products", productService.getAll());
//		/*Collection<? extends GrantedAuthority> authorities = SecurityContextHolder.getContext().getAuthentication().getAuthorities();
//       		
//		for (GrantedAuthority auth : authorities) {
//            if ("ROLE_ADMIN".equals(auth.getAuthority()))
//                return "admin/products";
//        }*/
//		return "products";
//	}
	
	@RequestMapping(value={"/products", "/"})
	public String getProductsByPage(@RequestParam(name="pg",defaultValue="0") int pg, Model model/*, Pageable pageable*/){
		if(pg == 0) pg = 0;
		Pageable pageable = new PageRequest(pg,2);
		Page<Product> page = productService.getAll(pageable);
		model.addAttribute("page", page);
		
		/*Collection<? extends GrantedAuthority> authorities = SecurityContextHolder.getContext().getAuthentication().getAuthorities();
       		
		for (GrantedAuthority auth : authorities) {
            if ("ROLE_ADMIN".equals(auth.getAuthority()))
                return "admin/products";
        }*/
		return "products";
	}
	
	@RequestMapping(value="/product/{id}", method = RequestMethod.GET)
	public String getProduct(@PathVariable int id, @ModelAttribute CartItem cartItem, Model model){
		System.out.println("****product/****");
		model.addAttribute("product", productService.get(id));
		return "product";
	}
	
	@RequestMapping(value="/product/category/{catid}", method = RequestMethod.GET)
	public String getProductByCategory(@PathVariable int catid, Model model){
		model.addAttribute("products", productService.getByCategoryId(catid));
		return "products";
	}
	
	private void getCateMap(Model model){
		Map<Integer, String> cateMap = new LinkedHashMap();
		for(Category cate: categoryService.getAll()){
			cateMap.put(cate.getId(), cate.getName());
		}
		model.addAttribute("cateMap", cateMap);
	}
	
	private void uploadFile(MultipartFile file, String fileName){
	   String uploadPath = context.getRealPath("") + File.separator + "resources/img/";
	   InputStream inputStream   = null;
	   OutputStream outputStream = null;

	   try {
	       inputStream = file.getInputStream();
	       
	       File newFile = new File(uploadPath + fileName);
	       System.out.println("uploaded file:" + newFile.getPath());
	       outputStream = new FileOutputStream(newFile);
	       int read = 0;
	       byte[] bytes = new byte[1024];

	       while ((read = inputStream.read(bytes)) != -1) {
	           outputStream.write(bytes, 0, read);
	       }
	   } catch (IOException e) {
	       e.printStackTrace();
	   }		
	}
	
	private void deleteFile(String fileName){
	   String filePath = context.getRealPath("") + fileName;

        File newFile = new File(filePath);
        newFile.delete();
	}

}