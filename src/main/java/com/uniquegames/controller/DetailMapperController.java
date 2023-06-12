package com.uniquegames.controller;

import com.uniquegames.fileutil.FileUtil;
import com.uniquegames.model.SessionConstants;
import com.uniquegames.service.CompanyServiceMapper;
import com.uniquegames.service.CompanyServiceMapper2;
import com.uniquegames.vo.CompanyVo;
import com.uniquegames.vo.IntroVo;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

/**
 * @author jeonb 
 * 회사 소개 페이지 Mybatis 컨트롤러
 * CRUD 메소드 구현
 */
@Controller
@SessionAttributes({"intro","test_id"})
@RequestMapping(value = "/detail")
public class DetailMapperController {

    /**
     * 서비스 객체 의존성 주입
     */
    private final CompanyServiceMapper companyServiceMapper;
    private final CompanyServiceMapper2 companyServiceMapper2;

    @Autowired
    public DetailMapperController(CompanyServiceMapper companyServiceMapper,
            CompanyServiceMapper2 companyServiceMapper2) {
        this.companyServiceMapper = companyServiceMapper; // 매퍼 방식
        this.companyServiceMapper2 = companyServiceMapper2; // 인터페이스 only
    }

    /**
     * @param companyId 회사 소개글 인덱스
     * @return 회사 상세페이지 리턴
     */
    @RequestMapping(value = "/detail1.do",method = RequestMethod.GET)
    public String goDetail() {
//        model.addAttribute("intro",companyServiceMapper.getIntro(companyId));
        return "detail/detail";
    }

    @RequestMapping(value = "/detail2.do",method = RequestMethod.GET)
    public String goDetail2() {
//        model.addAttribute("intro",companyServiceMapper.getIntro(companyId));
        return "detail/detail2";
    }
    @RequestMapping(value = "/detail3.do",method = RequestMethod.GET)
    public String goDetail3() {
//        model.addAttribute("intro",companyServiceMapper.getIntro(companyId));
        return "detail/detail3";
    }
    @RequestMapping(value = "/detail4.do",method = RequestMethod.GET)
    public String goDetail4() {
//        model.addAttribute("intro",companyServiceMapper.getIntro(companyId));
        return "detail/detail4";
    }
    /*@RequestMapping(value = "/{companyId}",method = RequestMethod.GET)
    public String goDetail3(@PathVariable int companyId, Model model) {
        model.addAttribute("intro",companyServiceMapper.getIntro(companyId));
        return "detail/detail3";
    }
    @RequestMapping(value = "/{companyId}",method = RequestMethod.GET)
    public String goDetail4(@PathVariable int companyId, Model model) {
        model.addAttribute("intro",companyServiceMapper.getIntro(companyId));
        return "detail/detail4";
    }
    @RequestMapping(value = "/{companyId}",method = RequestMethod.GET)
    public String goDetail5(@PathVariable int companyId, Model model) {
        model.addAttribute("intro",companyServiceMapper.getIntro(companyId));
        return "detail/detail5";
    }*/
    /**
     * @param vo 회사 소개 저장객체
     * @param request 현재 url을 가져오기 위한 객체
     * @return 이름 또는 제목이 null이면 회사등록 페이지 리턴. 아니면 회사 목록 페이지 리턴
     * @throws IOException
     */
    @RequestMapping(value = "/insertIntro.do")
    public String insertIntro(IntroVo vo, HttpServletRequest request,Model model) throws IOException {
       /* MultipartFile uploadFile = vo.getUploadFile();
        String root_path = request.getSession().getServletContext().getRealPath("/");
        String attach_path = "\\resources\\upload\\";

        if(uploadFile!=null && !uploadFile.isEmpty()){
            String fileName = uploadFile.getOriginalFilename();
            UUID uuid = UUID.randomUUID();
            String upload = uuid + "_" + fileName;
            uploadFile.transferTo(new File(root_path+attach_path + upload));
            vo.setUpload(upload);
        }*/
        FileUtil fileUtil = new FileUtil(vo, request);
        IntroVo introVo = fileUtil.getUpload();
        if(introVo.getTitle() == null || introVo.getName() == null){
            HttpSession session = request.getSession();
            CompanyVo company = (CompanyVo) session.getAttribute(SessionConstants.LOGIN_MEMBER);
            model.addAttribute("company",company);
            return "detail/company_regi";
        }
        else{
            companyServiceMapper2.insertIntro(introVo);
            return "redirect:getIntroList.do";
        }

    }
    @RequestMapping(value = "/updateIntro.do")
    public String updateIntro(@ModelAttribute("intro") IntroVo vo){
        companyServiceMapper.updateIntro(vo);
        return "redirect:getIntroList.do";
    }

    @RequestMapping(value = "/deleteIntro.do")
    public String deleteIntro(IntroVo vo){
        companyServiceMapper.deleteIntro(vo.getId());
        return "redirect:getIntroList.do";
    }

    @RequestMapping(value = "/getIntro.do")
    public String getIntro(Model model, IntroVo vo){
        model.addAttribute("intro",companyServiceMapper.getIntro(vo.getId()));
        return "detail/company";
    }
    @RequestMapping(value = "/getIntroList.do")
    public String getIntroList(Model model){
        model.addAttribute("companyList", companyServiceMapper.getIntroList());
        return "detail/company_list";
    }
}
