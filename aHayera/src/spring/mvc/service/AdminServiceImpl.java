package spring.mvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.mvc.dao.AdminDAO;
import spring.mvc.domain.AdminVO;
import spring.mvc.domain.CustomerVO;
import spring.mvc.domain.ProductVO;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDAO adminDAO;
	
	public AdminVO adminLogin(AdminVO vo) {
		return adminDAO.adminLogin(vo);
	}
	
	public void insertProduct(ProductVO vo) {
		adminDAO.insertProduct(vo);
	}

	public List<ProductVO> adminSearchProduct(String search) {
		return adminDAO.adminSearchProduct(search);
	}
	
	public ProductVO adminEditTarget (ProductVO vo) {
		return adminDAO.adminEditTarget(vo);
	}
	
	public void adminEditProduct (ProductVO vo) {
		adminDAO.adminEditProduct(vo);
	}
	
	public void adminRemoveProduct(String prod_no) {
		adminDAO.adminRemoveProduct(prod_no);
	}
	
	public List<ProductVO> viewAllCustomer(CustomerVO vo){
		return adminDAO.viewAllCustomer(vo);
	}
}
