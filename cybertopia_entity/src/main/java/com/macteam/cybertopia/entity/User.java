package com.macteam.cybertopia.entity;

public class User {
    private int id;
    private String username;//用户名
    private String password;
    private int role;
    private String nickname;//昵称
    private int sex;
    private String school;
    private String major;
    private int grade;
    private String email;
    private String description;
    private String picture;
    private String phone;
    User(){}

    User(int Id, String Username, String Password, int Role,
         String Nickname, int Sex, String School, String Major,
         int Grade, String Email, String Desc, String Picture, String Phone) {
        id = Id;
        username = Username;
        password = Password;
        role = Role;
        nickname = Nickname;
        sex = Sex;
        school = School;
        major = Major;
        grade = Grade;
        email = Email;
        description = Desc;
        picture = Picture;
        phone = Phone;
    }


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


    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }


    public String showSex() {
        String sexString = "未知";
        if (sex == 1) {
            sexString = "男";
        } else if (sex == 0) {
            sexString = "女";
        }
        return sexString;
    }


    public int getSex() {
        return sex;
    }

    public int getGrade() {
        return grade;
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

    public String showGrade() {
        String gradeString = "未知";
        switch (grade) {
            case 1: {
                gradeString = "大一";
                break;
            }
            case 2: {
                gradeString = "大二";
                break;
            }
            case 3: {
                gradeString = "大三";
                break;
            }
            case 4: {
                gradeString = "大四";
                break;
            }
            case 5: {
                gradeString = "研一";
                break;
            }
            case 6: {
                gradeString = "研二";
                break;
            }
            case 7: {
                gradeString = "研三";
                break;
            }
            case 8: {
                gradeString = "博一";
                break;
            }
            case 9: {
                gradeString = "博二";
                break;
            }
            default: {
                break;
            }
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
                ", nickName='" + nickname + '\'' +
                ", sex='" + sex + '\'' +
                ", school='" + school + '\'' +
                ", major='" + major + '\'' +
                ", grade='" + grade + '\'' +
                ", email='" + email + '\'' +
                ", desc='" + description + '\'' +
                ", picture='" + picture + '\'' +
                ", phone='" + phone + '\'' +
                '}';
    }
}
