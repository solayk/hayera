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
	private AdminDAO loginDAO;
	
	public AdminVO adminLogin(AdminVO vo) {
		return loginDAO.adminLogin(vo);
	}
	
	public List<ProductVO> adminProduct(ProductVO vo) {
		System.out.println(" == service 진입 == ");
		return loginDAO.adminProduct(vo);
	}
}
