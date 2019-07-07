package com.macteam.cybertopia.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.macteam.cybertopia.entity.Competition;
import com.macteam.cybertopia.pojo.ArticleTitle;
import com.macteam.cybertopia.pojo.QuestionTitle;
import com.macteam.cybertopia.service.impl.ArticleServiceImpl;
import com.macteam.cybertopia.service.impl.CompServiceImpl;
import com.macteam.cybertopia.service.impl.QuestionServiceImpl;
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
    @Autowired
    private ArticleServiceImpl articleService;
    @Autowired
    private QuestionServiceImpl questionService;

    @RequestMapping("/index.do")
    public String init(Model model,
                       @RequestParam(defaultValue = "1") int page,
                       @RequestParam(defaultValue = "12") int size,
                       @RequestParam(defaultValue = "") String selectedType,
                       @RequestParam(defaultValue = "") String keywords) {

        // 获取比赛列表
        List<Competition> comps = compService.getCompetitions(page, size);
        PageInfo pageInfo = new PageInfo(comps);
        model.addAttribute("pageInfo", pageInfo);
        model.addAttribute("comps", comps);

        // 获取文章列表
        List<ArticleTitle> article_titles =
                articleService.getArticleListByRange(4, 4);
        model.addAttribute("article_titles",article_titles);

        // 获取问题列表
        List<QuestionTitle> question_titles =
                questionService.getQuestionListByRange(4, 4);
        model.addAttribute("question_titles",question_titles);

        return "index";
    }


//    @RequestMapping("/compDetail.do")
//    public String articleDetail(HttpServletRequest request, Model model, int id) {
//        Competition competition = compService.getCompetitionById(id);
//
//        // 查询该竞赛是否收藏
//
//        model.addAttribute("comp", competition);
//        return "compDetail";
//    }


}