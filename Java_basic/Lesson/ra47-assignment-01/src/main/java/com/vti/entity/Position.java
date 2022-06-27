package com.vti.entity;

public class Position {
    public int positionId;
    public PositionName positionName;
    public enum PositionName {
        DEV, TEST, SCRUM_MASTER, PM
    }

    @Override
    public String toString() {
        return "Position{" +
                "positionId=" + positionId +
                ", positionName=" + positionName +
                '}';
    }

    public void hienThi() {
        System.out.println(toString());
//        System.out.println("ten chuc vu la : "+positionName);
    }
}
