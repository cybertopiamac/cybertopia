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
import java.util.List;

@Controller
@RequestMapping("main")
public class MainController {
    @Autowired
    private CompServiceImpl compService;

    @RequestMapping("/index.do")
    public String init(Model model, @RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "12") int size) {
        List<Competition> comps = compService.getCompetitions(page, size);

        PageInfo pageInfo = new PageInfo(comps);
        model.addAttribute("pageInfo", pageInfo);

        model.addAttribute("comps", comps);
        model.addAttribute("count", comps.size());
        return "index";
    }

    @RequestMapping("/filterComp.do")
    public String searchComp(Model model, @RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "12") int size, @RequestParam String selectedType, @RequestParam String keywords) {
        System.out.println(selectedType);
        System.out.println(keywords);

        List<Competition> comps = compService.getCompetitionsBySearch(page, size, keywords, selectedType);
        PageInfo pageInfo = new PageInfo(comps);
        model.addAttribute("pageInfo", pageInfo);

        model.addAttribute("comps", comps);
        model.addAttribute("count", comps.size());
        return "index";
    }

    @RequestMapping("/compDetail.do")
    public String articleDetail(HttpServletRequest request, Model model, int id) {
        System.err.println("detail");
        Competition competition = compService.getCompetitionById(id);
        System.err.println(competition);

        // 查询该竞赛是否收藏

        return "compDetail";
    }
}