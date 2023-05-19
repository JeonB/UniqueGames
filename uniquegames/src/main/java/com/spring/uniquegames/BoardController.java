package com.spring.uniquegames;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BoardController {
	/**
	 * board-list.do ��ü ����Ʈ
	 */
	@RequestMapping(value = "/board-list.do", method = RequestMethod.GET)
	public String boardList() {
		return "/board/board_list";
	}
	
	/**
	 * board-write.do ��ü ����Ʈ
	 */
	@RequestMapping(value = "/board-write.do", method = RequestMethod.GET)
	public String boardWrite() {
		return "/board/board_write";
	}
	
	/**
	 * board-content.do ��ü ����Ʈ
	 */
	@RequestMapping(value = "/board-content.do", method = RequestMethod.GET)
	public String boardContent() {
		return "/board/board_content";
	}
}
