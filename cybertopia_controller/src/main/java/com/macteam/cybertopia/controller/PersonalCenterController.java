package com.macteam.cybertopia.controller;

import com.macteam.cybertopia.service.IPersonalCenterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("personalCenter")
public class PersonalCenterController {
    @Autowired
    IPersonalCenterService personalCenterService;


}
