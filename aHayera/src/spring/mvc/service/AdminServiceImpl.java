package spring.mvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.mvc.dao.AdminDAO;
import spring.mvc.domain.AdminVO;
import spring.mvc.domain.ProductVO;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDAO adminDAO;
	
	public AdminVO adminLogin(AdminVO vo) {
		return adminDAO.adminLogin(vo);
	}
	
	public List<ProductVO> adminProduct(ProductVO vo) {
		return adminDAO.adminProduct(vo);
	}
	
	public void insertProduct(ProductVO vo) {
		System.out.println(" == insertProduct // service 진입 == ");
		adminDAO.insertProduct(vo);
	}
}
