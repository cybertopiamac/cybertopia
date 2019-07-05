package com.macteam.cybertopia.controller;

import com.macteam.cybertopia.entity.Competition;
import com.macteam.cybertopia.service.impl.CompServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("main")
public class MainController {
    @Autowired
    private CompServiceImpl comp;

    @RequestMapping("/index.do")
    public String init(Model model){
        List<Competition> comps=comp.getCompetitions();
        model.addAttribute("comps",comps);
        model.addAttribute("count",comps.size());
        return "index";
    }

}
