package com.uniquegames.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.mysql.cj.xdevapi.Session;
import com.uniquegames.repository.NoticeMapper;
import com.uniquegames.service.CommentService;
import com.uniquegames.service.IndexServiceMapper;
import com.uniquegames.service.NoticeService;
import com.uniquegames.service.NoticeServiceImpl;
import com.uniquegames.vo.MemberVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.uniquegames.vo.GameVo;

@Controller
@SessionAttributes({"game","test_id"})
public class MainController {

	private final IndexServiceMapper indexServiceMapper;
	NoticeService noticeService;

	@Autowired
	public MainController(IndexServiceMapper indexServiceMapper, NoticeService noticeService) {
		this.indexServiceMapper = indexServiceMapper;
		this.noticeService = noticeService;
	}



	@RequestMapping(value="/index.do", method=RequestMethod.GET)
	public String index(Model model) throws IOException {
		model.addAttribute("gameList",indexServiceMapper.getGameList());
		model.addAttribute("donation",indexServiceMapper.getDonationList());
		model.addAttribute("ranking",indexServiceMapper.getRankingList());
		model.addAttribute("noticeList", noticeService.getNoticeList(1, 4));
        return "/main/index";
	}
	
	@RequestMapping(value="/alllist.do", method=RequestMethod.GET)
	public String alllist(Model model) {
		model.addAttribute("gameList", indexServiceMapper.getGameList());
		return "/main/allList";
	}
	
	@RequestMapping(value="/topgame.do", method=RequestMethod.GET)
	public String topgame(Model model) {
		model.addAttribute("ranking", indexServiceMapper.getRankingList());
		return "/main/topGame";
	}

//	@RequestMapping(value = "/like", method = RequestMethod.POST)
//	public String handleLikeRequest(@RequestParam("gameId") int gameId, HttpSession session) {
//		SessionVo svo = session.getAttribute("member");
//		if (member == null) {
//			model.setViewName("redirect:/login");
//			return model;
//		}
//
//		int memberId = member.getId();
//
//		int hasLiked = gameDao.hasLiked(memberId, gameId);
//
//		if (hasLiked == 1) {
//			gameDao.removeLikeInfo(memberId, gameId);
//			model.addObject("message", "좋아요가 취소되었습니다.");
//		} else {
//			gameDao.addLikeInfo(memberId, gameId);
//			model.addObject("message", "좋아요가 추가되었습니다.");
//		}
//
//		return "redirect:/game/details?gameId=" + gameId;
//	}
}  
