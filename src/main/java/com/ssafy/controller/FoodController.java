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
	
	@GetMapping("origin.do")
	public String origin(Model model) {
		List<Food> list = service.searchAll();
		List<Food> domestic = new ArrayList<Food>();
		String[] nations = {"가나","가봉","가이아나","감비아","과테말라","그레나다","그리스","기니","기니비사우",//ㄱ
				"나미비아","나우루","나이지리아","남수단","남아프리카","네덜란드","네팔","노르웨이","뉴질랜드","니제르","니카라과","남오세티야",//ㄴ
				"덴마크","도미니카","독일","동티모르",//ㄷ
				"라오스","라이베리아","라트비아","러시아","레바논","레소토","루마니아","룩셈부르크","르완다","리비아","리투아니아","리히텐슈타인",//ㄹ
				"마다가스카르","마셜","말라위","말레이시아","말리","멕시코","모나코","모로코","모리셔스","모리타니","모잠비크","몬테네그로","몰도바","몰디브","몰타","몽골","미국","미얀마","미크로네시아",//ㅁ
				"바누아투","바레인","바베이도스","바티칸","바하마","방글라데시","베냉","베네수엘라","베트남","벨기에","벨라루스","벨리즈","벨라루스","벨리즈","보스니아","보츠와나","볼리비아","부룬디","부르키나파소","부탄","북마케도니아","북키프로스","불가리아","브라질","브루나이",//ㅂ
				"사모아","사우디아라비아","사하라 아랍 민주 공화국","산마리노","상투메 프린시페","세네갈","세르비아","세이셸","세인트루시아","소말리아","수단","스리랑카","스웨덴","스위스","스페인","슬로바키아","슬로베니아","시리아","싱가포르",//ㅅ
				"아랍에미리트","아르헨티나","아이슬란드","아이티","아일랜드","아프가니스탄","알바니아","에스토니아","에콰도르","에티오피아","영국","예멘","오만","오스트레일리아","오스트리아","온두라스","요르단","우간다","우루과이","우즈베키스탄","우크라이나","이라크","이란","이스라엘","이집트","이탈리아","인도","인도네시아","일본",//ㅇ
				"자메이카","잠비아","북한","짐바브웨",//ㅈ
				"체코","칠레",//ㅊ
				"카메룬","카타르","캄보디아","캐나다","콜롬비아","콩고","쿠바","쿠웨이트","크로아티아",//ㅋ
				"타지키스탄","탄자니아","태국","터키","토고","튀니지",//ㅌ
				"파나마","파라과이","파키스탄","파푸아뉴기니","페루","포르투칼","폴란드","프랑스","피지","핀란드","필리핀",//ㅍ
				"헝가리","호주",//ㅎ
				"외국산","수입산"//번외
				};
		
		for(Food f : list) {
			for(String s : nations) {
				if(f.getMaterial().contains(s)) {
					domestic.add(f);
					break;
				}
			}
		}
		
		model.addAttribute("list", domestic);
		
		return "origin";
	}
}
