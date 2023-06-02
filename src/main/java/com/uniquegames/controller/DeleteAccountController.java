package com.uniquegames.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.uniquegames.dao.MemberDao;
import com.uniquegames.vo.MemberVo;

@Controller
public class DeleteAccountController {

	
	@RequestMapping(value="/deletePwd.do", method=RequestMethod.GET)
	public ModelAndView deletePwd(String member_id) {
		ModelAndView mav = new ModelAndView();
		MemberDao memberDao = new MemberDao();
		MemberVo memberVo = memberDao.select(member_id);
		
		mav.addObject("memberVo", memberVo);
		mav.setViewName("/deleteAccount/deletePwd");
		return mav;
	}
	
	@RequestMapping(value="/delete_check.do", method=RequestMethod.GET)
	@ResponseBody
	public String delete_check(MemberVo memberVo) {
		
		MemberDao memberDao = new MemberDao();
		int result = memberDao.deleteCheck(memberVo);
		
		JsonObject jobj = new JsonObject();
		
		jobj.addProperty("member_id", memberVo.getMember_id());
		jobj.addProperty("password", memberVo.getPassword());
		jobj.addProperty("result", result);
		
		return new Gson().toJson(jobj);
	}
}
