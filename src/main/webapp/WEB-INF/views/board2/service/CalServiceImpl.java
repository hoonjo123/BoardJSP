package woo.edu.c.service;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import woo.edu.c.controller.HomeController;
import woo.edu.c.dao.CalDao;
import woo.edu.c.vo.calVo;


@Service
public class CalServiceImpl implements CalService{
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Resource
	private CalDao calDao;


	@Override
	public int calInsert(calVo calVo) {
		return calDao.calInsert(calVo);
	}
	
//	@Override
//	public List<calVo> calList() {
//		return calDao.calList();
//	}
    @Override
    public List<calVo> calSelect(int year, int month) {
        return calDao.calSelect(year, month);
    }

	@Override
	public int calDelete(calVo calVo) {
		return calDao.calDelete(calVo);
	}
	

	
}
