package com.vti.entity;

import java.time.LocalDate;

public class Account {
    public int accountId;
    public String email;
    public String userName;
    public String fullName;
    public Department department;
    public Position position;
    public LocalDate createDate;

    @Override
    public String toString() {
        return "Account{" +
                "accountId=" + accountId +
                ", email='" + email + '\'' +
                ", userName='" + userName + '\'' +
                ", fullName='" + fullName + '\'' +
                ", department=" + department +
                ", position=" + position +
                ", createDate=" + createDate +
                '}';
    }

    public void hienThi(){
         System.out.println(toString());
//         System.out.println("ngay tao : "+createDate);
     }

}
