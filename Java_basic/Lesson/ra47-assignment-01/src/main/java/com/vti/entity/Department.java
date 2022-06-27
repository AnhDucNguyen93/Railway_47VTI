package com.vti.entity;

public class Department {
    public int departmentId;
    public String departmentName;

    @Override
    public String toString() {
        return "Department{" +
                "departmentId=" + departmentId +
                ", departmentName='" + departmentName + '\'' +
                '}';
    }

    public void hienThi(){
        System.out.println(toString());
//        System.out.println("ten cua phong ban la : "+departmentName);
    }
}
