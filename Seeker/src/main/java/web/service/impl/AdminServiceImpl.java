package web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.AdminDao;
import web.dto.Category;
import web.dto.Goods;
import web.dto.GoodsView;
import web.service.face.AdminService;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired private AdminDao adminDao;
	
	//카테고리
	@Override
	public List<Category> category() {
		
		return adminDao.category();
	}

	//상품등록
	@Override
	public void register(Goods goods) {
		adminDao.register(goods);
	}

	//상품목록
	@Override
	public List<Goods> goodsList() {
		
		return adminDao.goodsList();
	}

	//상품조회 + 카테고리 조인
	@Override
	public GoodsView goodsView(int gdsNum) {
		
		return adminDao.goodsView(gdsNum);
	}

	//상품 수정
	@Override
	public void goodsUpdate(GoodsView goods) {
		adminDao.goodsUpdate(goods);	
	}

	@Override
	public void goodsDelete(Goods goods) {
		adminDao.goodsDelete(goods);
	}

}
