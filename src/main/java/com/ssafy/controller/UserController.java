package com.ssafy.controller;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ssafy.model.dto.User;
import com.ssafy.model.service.UserService;

@CrossOrigin(origins="*", maxAge=6000)
@Controller
public class UserController {
	@Autowired
	private UserService service;

	@ExceptionHandler
	public ModelAndView handler(Exception e) {
		ModelAndView mav = new ModelAndView("ErrorHandler");
		mav.addObject("msg", e.getMessage());
		return mav;
	}

	@GetMapping("session.do")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> qna(HttpSession session) {
		String id = (String)session.getAttribute("id");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		return new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
	}
	
	@PostMapping("signIn.do")
	public String signIn(HttpSession session, String id, String pw, String name, 
			String email, String address, String phone, String[] allergy) {
		System.out.println("### signIn.do ###");
		
		String al = "";
		if(allergy != null) {
			for (String string : allergy) {
				al+= string+", ";
			}
		}
		
		System.out.println("id:" + id + " pw:" + pw);
		service.add(new User(id, pw, name, email, phone, address, al));

		session.setAttribute("id", id);
		return "redirect:index.do";
	}

	@PostMapping("login.do")
	public String login(HttpSession session, Model model, String id, String pw) {
		System.out.println(session.getId()+"id:" + id + "pw:" + pw);
		try {
			service.login(id, pw);
			session.setAttribute("id", id);
			System.out.println(session.getAttribute("id"));
		} catch (Exception e) {
			System.out.println("login 에러");
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
		}
		return "index";
	}

	@GetMapping("logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("id");
		return "redirect:index.do";
	}

	@GetMapping("userInfo.do")
	public String userInfo(Model model, HttpSession session) {
		model.addAttribute("user", service.search((String) session.getAttribute("id")));
		return "userInfo";
	}

	@PostMapping("modify.do")
	public String modify(String id, String pw, String name, 
			String email, String address, String phone, String[] allergy) {
		String alle = "";
		if(allergy != null)
			for (String string : allergy) {
				if(alle == "") {
					alle=(string);
				}else {
					alle+=(", "+string);
				}
			}
		
		User u = new User(id, pw, name, email, phone, address, alle);
				
		service.update(u);
		return "redirect:index.do";
	}

	@GetMapping("remove.do")
	public String remove(String id) {
		service.remove(id);
		return "redirect:logout.do";
	}

	@GetMapping("findPW.do")
	public String findPW() {
		return "findPW";
	}

	@PostMapping("searchPW.do")
	public String searchPW(Model model, String id) {
		User temp =service.search(id);
		model.addAttribute("id", temp.getId());
		model.addAttribute("pw", temp.getPassword());
		return "findPW";
	}

}
