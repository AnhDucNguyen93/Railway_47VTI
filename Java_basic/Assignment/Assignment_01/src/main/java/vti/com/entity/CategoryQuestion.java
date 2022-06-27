package vti.com.entity;

import java.util.Arrays;

public class CategoryQuestion {
    public int categoryId;
    public  String categoryName;
    public Question[] questions;

    @Override
    public String toString() {
        return "CategoryQuestion{" +
                "categoryId=" + categoryId +
                ", categoryName='" + categoryName + '\'' +
                ", questions=" + Arrays.toString(questions) +
                '}';
    }
}
