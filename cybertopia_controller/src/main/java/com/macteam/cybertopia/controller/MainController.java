package com.macteam.cybertopia.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.macteam.cybertopia.entity.Competition;
import com.macteam.cybertopia.service.impl.CompServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

@Controller
@RequestMapping("main")
public class MainController {
    @Autowired
    private CompServiceImpl compService;

    @RequestMapping("/index.do")
    public String init(Model model, @RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "12") int size,@RequestParam(defaultValue = "") String selectedType, @RequestParam(defaultValue = "") String keywords) {

        String t_selectedType=null;
        String t_keywords=null;
        //中文转码
        try {
            t_keywords=URLDecoder.decode(keywords,"UTF-8");
            t_selectedType=URLDecoder.decode(selectedType,"UTF-8");

        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        System.out.println(t_keywords);
        System.out.println(t_selectedType);

        if(selectedType==""&&keywords==""){
            List<Competition> comps = compService.getCompetitions(page, size);

            PageInfo pageInfo = new PageInfo(comps);
            model.addAttribute("pageInfo", pageInfo);

            model.addAttribute("comps", comps);
            model.addAttribute("selectedType",selectedType);
            model.addAttribute("keywords",keywords);
            return "index";
        }
        else{
            List<Competition> comps = compService.getCompetitionsBySearch(page, size, t_keywords, t_selectedType);
            PageInfo pageInfo = new PageInfo(comps);
            model.addAttribute("pageInfo", pageInfo);


            model.addAttribute("comps", comps);
            model.addAttribute("selectedType",t_selectedType);
            model.addAttribute("keywords",t_keywords);
            return "index";
        }
    }



    @RequestMapping("/compDetail.do")
    public String articleDetail(HttpServletRequest request, Model model, int id) {
        Competition competition = compService.getCompetitionById(id);

        // 查询该竞赛是否收藏

        model.addAttribute("comp", competition);
        return "compDetail";
    }
}