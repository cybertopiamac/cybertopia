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

import java.util.List;

@Controller
@RequestMapping("main")
public class MainController {
    @Autowired
    private CompServiceImpl comp;

    @RequestMapping("/index.do")
    public String init(Model model, @RequestParam(defaultValue = "1")int page,@RequestParam(defaultValue = "12")int size){
        List<Competition> comps=comp.getCompetitions(page,size);

        PageInfo pageInfo=new PageInfo(comps);
        model.addAttribute("pageInfo",pageInfo);

        model.addAttribute("comps",comps);
        model.addAttribute("count",comps.size());
        return "index";
    }

    @RequestMapping("/filterComp.do")
    public String searchComp(Model model, @RequestParam(defaultValue = "1")int page,@RequestParam(defaultValue = "12")int size,@RequestParam String selectedType,@RequestParam String keywords){
        System.out.println(selectedType);
        System.out.println(keywords);

        List<Competition> comps=comp.getCompetitionsBySearch(page,size,keywords,selectedType);
        PageInfo pageInfo=new PageInfo(comps);
        model.addAttribute("pageInfo",pageInfo);

        model.addAttribute("comps",comps);
        model.addAttribute("count",comps.size());
        return "index";
    }




}
