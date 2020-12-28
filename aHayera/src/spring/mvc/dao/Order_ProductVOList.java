package spring.mvc.dao;

import java.util.List;

import spring.mvc.domain.Order_ProductVO;

public class Order_ProductVOList {
	private List<Order_ProductVO> order_ProductVOList;

	public List<Order_ProductVO> getOrder_ProductVOList() {
		return order_ProductVOList;
	}

	public void setOrder_ProductVOList(List<Order_ProductVO> order_ProductVOList) {
		this.order_ProductVOList = order_ProductVOList;
	}
	
}
