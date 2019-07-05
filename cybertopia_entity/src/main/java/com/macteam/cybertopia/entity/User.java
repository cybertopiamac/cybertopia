package com.macteam.cybertopia.entity;

public class User {
    private int id;
    private String username;//用户名
    private String password;
    private int role;
    private String nickName;//昵称
    private int sex;
    private String school;
    private String major;
    private int grade;
    private String email;
    private String desc;
    private String picture;
    private String phone;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getSex() {
        String sexString = "未知";
        if (sex == 1){
            sexString = "男";
        }
        else if(sex == 0){
            sexString = "女";
        }
        return sexString;
    }

    public void setSex(int sex) {
        this.sex = sex;
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getGrade() {
        String gradeString = "未知";
        switch (grade){
            case 1:{
                gradeString = "大一";
                break;
            }
            case 2:{
                gradeString = "大二";
                break;
            }
            case 3:{
                gradeString = "大三";
                break;
            }
            case 4:{
                gradeString = "大四";
                break;
            }
            case 5:{
                gradeString = "研一";
                break;
            }
            case 6:{
                gradeString = "研二";
                break;
            }
            case 7:{
                gradeString = "研三";
                break;
            }
            case 8:{
                gradeString = "博一";
                break;
            }
            case 9:{
                gradeString = "博二";
                break;
            }
            default:{break;}
        }

        return gradeString;
    }

    public void setGrade(int grade) {
        this.grade = grade;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", role='" + role + '\'' +
                ", nickName='" + nickName + '\'' +
                ", sex='" + sex + '\'' +
                ", school='" + school + '\'' +
                ", major='" + major + '\'' +
                ", grade='" + grade + '\'' +
                ", email='" + email + '\'' +
                ", desc='" + desc + '\'' +
                ", picture='" + picture + '\'' +
                ", phone='" + phone + '\'' +
                '}';
    }
}
