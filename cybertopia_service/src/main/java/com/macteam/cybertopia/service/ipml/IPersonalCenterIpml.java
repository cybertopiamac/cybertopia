package com.macteam.cybertopia.service.ipml;

import com.alibaba.dubbo.config.annotation.Service;
import com.macteam.cybertopia.dao.IPersonalCenterDao;
import com.macteam.cybertopia.dao.IUserDao;
import com.macteam.cybertopia.service.IPersonalCenterService;
import org.springframework.beans.factory.annotation.Autowired;

@Service

public class IPersonalCenterIpml implements IPersonalCenterService {
    @Autowired
    IPersonalCenterDao personalCenterDao;
    @Autowired
    IUserDao userDao;

}
