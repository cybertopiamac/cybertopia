package com.macteam.cybertopia.controller;

import com.macteam.cybertopia.dao.IAnswerDao;
import com.macteam.cybertopia.dao.IUserDao;
import com.macteam.cybertopia.entity.Question;
import com.macteam.cybertopia.entity.Answer;
import com.macteam.cybertopia.entity.User;
import com.macteam.cybertopia.pojo.QuestionTitle;
import com.macteam.cybertopia.service.IQuestionService;
import com.macteam.cybertopia.service.IQuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("question")
public class QuestionController {

    @Autowired
    private UserLoginController userLoginController;

    @Autowired
    private IQuestionService questionService;

    @Autowired
    private IUserDao userDao;

    @RequestMapping("/list.do")
    public String questionListPage(Model model, int pageIndex){
        int default_pack_size = 10;
        List<QuestionTitle> question_titles = questionService.getQuestionListByRange(
                pageIndex*default_pack_size, default_pack_size);
        model.addAttribute("question_titles",question_titles);
        boolean haveNext = question_titles.size() == default_pack_size;
        model.addAttribute("haveNext",haveNext);
        model.addAttribute("pageIndex", pageIndex);
        return "questionListItem";
    }

    @RequestMapping("/detail.do")
    public String questionDetail(HttpServletRequest request, Model model, int questionId){
        Question question = questionService.getQuestionById(questionId);
        questionService.increaseQuestionBrowseNum(question,1);
        if(question != null){
            User author = userDao.getUserById(question.getAuthorId());

            //分开查询文章和作者
            model.addAttribute("question",question);
            model.addAttribute("author_name",author.getNickname());
        }
        return "questionDetail";
    }

    @RequestMapping("/write.do")
    public String questionWrite(HttpServletRequest request){
//        User user = userLoginController.getCurrentUser(request);
//        if(user != null)
//            return "questionWrite";
//        else
//            return "login";

        // 测试用代码
        return "questionWrite";
    }

    @RequestMapping(value = "/post.do", method= RequestMethod.POST)
    @ResponseBody
    public int questionPost(HttpServletRequest request, @RequestBody Question question){
//        User user = userLoginController.getCurrentUser(request);
//        if(user != null) {
//            question.setAuthorId(user.getId());
//            question.setAuthorId(1);
//            question.setDate(Date.from(LocalDate.now().atStartOfDay(ZoneId.systemDefault()).toInstant()));
//            questionService.insertQuestion(question);
//            return "redirect:/question/all.do";
//        }
//        else
//        return "login";

        // 测试用代码
        question.setAuthorId(1);
        question.setDate(new Date(System.currentTimeMillis()));
        int result = questionService.insertQuestion(question);
        System.out.println(question.toString());
        return result;
    }

    @RequestMapping(value = "/answer.do", method = RequestMethod.POST)
    @ResponseBody
    public int questionAnswer(HttpServletRequest request, Answer answer){
        User user = userLoginController.getCurrentUser(request);
        if (user != null) {
            answer.setUserId(user.getId());
            answer.setDate(new Date(System.currentTimeMillis()));
            return questionService.insertAnswer(answer);
        }else{
            return 0;
        }
    }
}