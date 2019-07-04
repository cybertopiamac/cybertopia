package com.macteam.cybertopia.service.impl;


import com.macteam.cybertopia.dao.IPersonalCenterDao;
import com.macteam.cybertopia.dao.IUserDao;
import com.macteam.cybertopia.service.IPersonalCenterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service

public class IPersonalCenterImpl implements IPersonalCenterService {
    @Autowired
    IPersonalCenterDao personalCenterDao;
    @Autowired
    IUserDao userDao;

}
