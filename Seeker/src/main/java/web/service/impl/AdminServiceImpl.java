package web.service.impl;

import java.io.File;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import web.dao.face.AdminDao;
import web.dto.Category;
import web.dto.Goods;
import web.dto.GoodsView;
import web.service.face.AdminService;

@Service
public class AdminServiceImpl implements AdminService {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminServiceImpl.class);

	@Autowired private AdminDao adminDao;
	
	// 서블릿 컨텍스트 객체
	@Autowired
	ServletContext context;
	
	//카테고리
	@Override
	public List<Category> category() {
		
		return adminDao.category();
	}

	//상품등록
	@Override
	public void register(Goods goods, MultipartFile file) {
		
		logger.info("write() - File");

		if (file.getSize() <= 0) {
			logger.info("파일 크기가 0 이하, 처리 중단");

			return; // 더이상 진행 안되게 막기
		}

		// 파일이 저장될 경로(RealPath)
		String storedPath = context.getRealPath("upload");
		logger.info("upload realPath: {}", storedPath);

		// upload폴더가 존재하지 않으면 생성한다
		File storedFolder = new File(storedPath);
		if (!storedFolder.exists()) {
			storedFolder.mkdir();
		}

		// 저장될 파일의 이름 지정하기
		String filename = file.getOriginalFilename(); // 원본파일명
		filename += UUID.randomUUID().toString().split("-")[4]; // UUID추가
		logger.info("filename : {}", filename);

		// 최종 저장할 파일의 정보 객체
		File dest = new File(storedFolder, filename);

		try {
			// 업로드된 파일을 저장하기
			file.transferTo(dest);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		goods.setImgOriginName(file.getOriginalFilename());
		goods.setImgStoredName(filename);
		
		
		adminDao.register(goods);
	}

	//상품목록
	@Override
	public List<GoodsView> goodsList() {
		
		return adminDao.goodsList();
	}

	//상품조회 + 카테고리 조인
	@Override
	public GoodsView goodsView(int gdsNum) {
		
		return adminDao.goodsView(gdsNum);
	}

	//상품 수정
	@Override
	public void goodsUpdate(GoodsView goods, MultipartFile file) {
		
		logger.info("update() - File");

		if (file.getSize() <= 0) {
			logger.info("파일 크기가 0 이하, 처리 중단");

			return; // 더이상 진행 안되게 막기
		}

		// 파일이 저장될 경로(RealPath)
		String storedPath = context.getRealPath("upload");
		logger.info("upload realPath: {}", storedPath);

		// upload폴더가 존재하지 않으면 생성한다
		File storedFolder = new File(storedPath);
		if (!storedFolder.exists()) {
			storedFolder.mkdir();
		}

		// 저장될 파일의 이름 지정하기
		String filename = file.getOriginalFilename(); // 원본파일명
		filename += UUID.randomUUID().toString().split("-")[4]; // UUID추가
		logger.info("filename : {}", filename);

		// 최종 저장할 파일의 정보 객체
		File dest = new File(storedFolder, filename);

		try {
			// 업로드된 파일을 저장하기
			file.transferTo(dest);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		goods.setImgOriginName(file.getOriginalFilename());
		goods.setImgStoredName(filename);
		
		adminDao.goodsUpdate(goods);	
	}

	@Override
	public void goodsDelete(Goods goods) {
		adminDao.goodsDelete(goods);
	}

}
