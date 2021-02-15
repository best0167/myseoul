package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dto.HouseDTO;
import dto.HousePicsDTO;
import dto.PageDTO;
import service.manager5ServiceImp;

//http://127.0.0.1:8090/myseoul/house_list.do

@Controller
public class manager5Controller {
	private manager5ServiceImp service;
	private int currentPage;
	private PageDTO pdto;

	public void setService(manager5ServiceImp service) {
		this.service = service;
	}

	public manager5Controller() {
	// TODO Auto-generated constructor stub
	}
	//집 리스트
	@RequestMapping("house_list.do")
	public ModelAndView HouseList(ModelAndView mav,PageDTO pv) {
		int totalRecord = service.countProcess(pv);
		if(totalRecord>=1) {
			if(pv.getCurrentPage()==0) {
				currentPage=1;
			} else {
				currentPage = pv.getCurrentPage();
			}
			pdto = new PageDTO(currentPage,totalRecord,pv.getH_type(),pv.getH_rooms(),pv.getH_bath());
			mav.addObject("pv",pdto);
			List<HouseDTO> dtoList = service.houseListProcess(pdto);
			for(int i=0; i<dtoList.size();i++) {
				HouseDTO dto = dtoList.get(i);
				int h_num = dto.getH_num();
				//
				//h_num으로 집의 메인사진경로 가져옴
				//dto.set(가져온String)
				dto.setH_pic(service.houseMainPicProcess(h_num));
			}
			mav.addObject("hdto",dtoList);
		}
		
		mav.setViewName("house_list");
		return mav;
	}
	
	

	
	
}
