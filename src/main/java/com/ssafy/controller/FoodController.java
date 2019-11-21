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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ssafy.model.dto.Food;
import com.ssafy.model.dto.FoodPageBean;
import com.ssafy.model.service.FoodService;

@Controller
public class FoodController {
	@Autowired
	private FoodService service;

	@ExceptionHandler
	public ModelAndView handler(Exception e) {
		ModelAndView mav = new ModelAndView("ErrorHandler");
		mav.addObject("msg", e.getMessage());
		return mav;
	}

	@GetMapping("index.do")
	public String index(Model model) {
		model.addAttribute("list", service.searchAll());
		return "index";
	}
	
	@GetMapping("qna.do")
	public String qna(Model model) {
		return "redirect:board.html";
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
}
