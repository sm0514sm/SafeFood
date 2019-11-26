package com.ssafy.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ssafy.model.dto.Food;
import com.ssafy.model.dto.FoodPageBean;
import com.ssafy.model.service.FoodService;
import com.ssafy.model.service.IngestionService;

@Controller
public class FoodController {
	@Autowired
	private FoodService service;
	@Autowired
	private IngestionService iService;

	@ExceptionHandler
	public ModelAndView handler(Exception e) {
		ModelAndView mav = new ModelAndView("ErrorHandler");
		mav.addObject("msg", e.getMessage());
		return mav;
	}

	@GetMapping("/")
	public String index0(Model model) {
		model.addAttribute("list", service.searchAll());
		return "index";
	}
	
	@GetMapping("index.do")
	public String index(Model model) {
		model.addAttribute("list", service.searchAll());
		return "index";
	}
	
	@GetMapping("notice.do")
	public String notice(Model model) {
		return "redirect:/notice.jsp";
	}
	
	
	@GetMapping("qna.do")
	public String qna(Model model) {
		return "redirect:/QNA.jsp";
	}

	@GetMapping("foodList.do")
	public String foodList(Model model) {
		model.addAttribute("list", service.searchAll());
		return "foodList";
	}

	@GetMapping("searchKeyword.do")
	public String searchKeyword(Model model, String searchSelect, String searchWord) {
		model.addAttribute("list", service.searchAllBean(new FoodPageBean(searchSelect, searchWord, null, null)));
		return "index"; // 메인 페이지 리턴, 검색 결과 Data는 Request에 가지고
	}

	@GetMapping("foodDetail.do")
	public String foodDetail(Model model, String code) {
		System.out.println("여기까지는 들어옴");
		int codeInt = Integer.parseInt(code);
		service.addCount(codeInt);
		model.addAttribute("food", service.search(codeInt));
		return "foodDetail";
	}

	@GetMapping("searchCharacter.do")
	public String searchCharacter(Model model, String input) {
		String nextPage = "Error";
		if (input.equals(""))
			input = new String("아무것도 입력안해서 검색 안돌아가게 하는 텍스트");
		System.out.println("input : [" + input + "]");
		try {
			List<Integer> codeResults = service.searchCharacter(input);
			List<String[]> results = new ArrayList<String[]>();
			for (int i = 0; i < codeResults.size(); i++) {
				Food temp = service.search(codeResults.get(i));
				results.add(new String[] { temp.getCode() + "", temp.getName() });
				System.out.println(temp.getCode() + " : " + temp.getName());
			}
			model.addAttribute("result", results);
			nextPage = "DescResult";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "오류 발생,  다시 시도해 주세요.");
		}
		return nextPage;
	}

	@PostMapping("calory.do")
	public String calory(Model model, String calval) {
		model.addAttribute("calory", service.caloryCalc("all", calval));
		return "CaloryFood";
	}
	
	@GetMapping("bestfood.do")
	public String bestFood(Model model) {
		model.addAttribute("list", service.freIngesFoodList());
		return "bestFood";
	}
	
	@GetMapping("selectList.do")
	public String selectList(Model model,HttpSession session) {
		//찜 추가 전 그래프
		String id = (String)session.getAttribute("id");
		List<Food> list = iService.searchNutrient(id);
		Food food = new Food();
		double calory =	 	0.0; double carbo = 		0.0; double protein = 	0.0;
		double fat = 		0.0; double sugar = 		0.0; double natrium = 	0.0;
		double chole = 		0.0; double fattyacid = 	0.0; double transfat = 	0.0;
		
		for(Food f : list) {
			calory 		+= 	f.getCalory(); carbo 		+= 	f.getCarbo();
			protein 	+=	f.getProtein(); fat 		+=	f.getProtein();
			sugar 		+=	f.getProtein(); natrium 	+=	f.getProtein();
			chole 		+=	f.getProtein(); fattyacid 	+=	f.getProtein();
			transfat 	+=	f.getProtein(); protein 	+=	f.getProtein();
		}
		
		food.setCalory(calory); 	food.setCarbo(carbo);
		food.setProtein(protein); 	food.setFat(fat);
		food.setSugar(sugar); 		food.setNatrium(natrium);
		food.setChole(chole); 		food.setFattyacid(fattyacid);
		food.setTransfat(transfat);
		model.addAttribute("food", food);
		
		//찜 추가 후 그래프
		List<Food> list2 = service.searchNutrientS(id);
		Food food2 = new Food();
		food2.setCalory(calory); 	food2.setCarbo(carbo);
		food2.setProtein(protein); 	food2.setFat(fat);
		food2.setSugar(sugar); 		food2.setNatrium(natrium);
		food2.setChole(chole); 		food2.setFattyacid(fattyacid);
		food2.setTransfat(transfat);
		
		for(Food f : list) {
			calory 		+= 	f.getCalory(); carbo 		+= 	f.getCarbo();
			protein 	+=	f.getProtein(); fat 		+=	f.getProtein();
			sugar 		+=	f.getProtein(); natrium 	+=	f.getProtein();
			chole 		+=	f.getProtein(); fattyacid 	+=	f.getProtein();
			transfat 	+=	f.getProtein(); protein 	+=	f.getProtein();
		}
		
		food2.setCalory(calory); 	food2.setCarbo(carbo);
		food2.setProtein(protein); 	food2.setFat(fat);
		food2.setSugar(sugar); 		food2.setNatrium(natrium);
		food2.setChole(chole); 		food2.setFattyacid(fattyacid);
		food2.setTransfat(transfat);
		model.addAttribute("food2", food2);
		
		//찜 목록 리스트
		model.addAttribute("list", service.selectSelectFood(id));
		return "user/selectList";
	}
}
