package com.ssafy.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ssafy.model.dto.Food;
import com.ssafy.model.dto.Ingestion;
import com.ssafy.model.service.IngestionService;

@Controller
public class IngestionController {
	@Autowired
	private IngestionService service;

	@ExceptionHandler
	public ModelAndView handler(Exception e) {
		ModelAndView mav = new ModelAndView("ErrorHandler");
		mav.addObject("msg", e.getMessage());
		return mav;
	}
	
	@GetMapping("showGraph.do")
	public String showGraph(Model model, HttpSession session) {
		System.out.println("## showGraph.do ##");
		String id = (String)session.getAttribute("id");
		List<Food> list = service.searchNutrient(id);
		Food food = new Food();
		double calory =	 	0.0;
		double carbo = 		0.0;
		double protein = 	0.0;
		double fat = 		0.0;
		double sugar = 		0.0;
		double natrium = 	0.0;
		double chole = 		0.0;
		double fattyacid = 	0.0;
		double transfat = 	0.0;
		
		for(Food f : list) {
			calory 		+= 	f.getCalory();
			carbo 		+= 	f.getCarbo();
			protein 	+=	f.getProtein();
			fat 		+=	f.getProtein();
			sugar 		+=	f.getProtein();
			natrium 	+=	f.getProtein();
			chole 		+=	f.getProtein();
			fattyacid 	+=	f.getProtein();
			transfat 	+=	f.getProtein();
			protein 	+=	f.getProtein();
		}
		
		food.setCalory(calory);
		food.setCarbo(carbo);
		food.setProtein(protein);
		food.setFat(fat);
		food.setSugar(sugar);
		food.setNatrium(natrium);
		food.setChole(chole);
		food.setFattyacid(fattyacid);
		food.setTransfat(transfat);
		System.out.println("## food info");
		System.out.println(food);
		model.addAttribute("food", food);
		return "user/ingestionGraph";
	}

	@GetMapping("ingestion.do")
	public String ingestion(Model model, HttpSession session, String code) throws SQLException {
		System.out.println("code : " + code);
		int codeInt = Integer.parseInt(code);
		if(session.getAttribute("id") == null) {
			model.addAttribute("msg", "로그인부터 하세요!");
			return "redirect:index.do";
		}
		service.add(new Ingestion((String) session.getAttribute("id"), codeInt, 1));
		return "redirect:foodList.do";
	}

	@GetMapping("ingestionList.do")
	public String ingestionList(Model model, HttpSession session) throws SQLException {
		
		//그래프 데이터
		System.out.println("## showGraph.do ##");
		String id = (String)session.getAttribute("id");
		List<Food> list = service.searchNutrient(id);
		Food food = new Food();
		double calory =	 	0.0;
		double carbo = 		0.0;
		double protein = 	0.0;
		double fat = 		0.0;
		double sugar = 		0.0;
		double natrium = 	0.0;
		double chole = 		0.0;
		double fattyacid = 	0.0;
		double transfat = 	0.0;
		
		for(Food f : list) {
			calory 		+= 	f.getCalory();
			carbo 		+= 	f.getCarbo();
			protein 	+=	f.getProtein();
			fat 		+=	f.getProtein();
			sugar 		+=	f.getProtein();
			natrium 	+=	f.getProtein();
			chole 		+=	f.getProtein();
			fattyacid 	+=	f.getProtein();
			transfat 	+=	f.getProtein();
			protein 	+=	f.getProtein();
		}
		
		food.setCalory(calory);
		food.setCarbo(carbo);
		food.setProtein(protein);
		food.setFat(fat);
		food.setSugar(sugar);
		food.setNatrium(natrium);
		food.setChole(chole);
		food.setFattyacid(fattyacid);
		food.setTransfat(transfat);
		System.out.println("## food info");
		System.out.println(food);
		model.addAttribute("food", food);
		
		
		//섭취 식품 list
		model.addAttribute("list", service.searchAll((String) session.getAttribute("id")));
		
		return "user/ingestionList"; // 메인 화면에 출력할 data 리턴
	}

	@GetMapping("removeIng.do")
	public String removeIng(String ino) throws SQLException {
		int inoInt = Integer.parseInt(ino);
		service.remove(inoInt);
		return "redirect:ingestionList.do";
	}

}
