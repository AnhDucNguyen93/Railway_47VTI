package entity;

import java.time.LocalDate;
import java.util.Arrays;

public class Exam {
    public int examId;
    public String code;
    public String title;
    public CategoryQuestion categoryQuestion;
    public int duration;
    public Account creator;
    public LocalDate createDate;
    public Question[] questions;

    @Override
    public String toString() {
        return "Exam{" +
                "examId=" + examId +
                ", code='" + code + '\'' +
                ", title='" + title + '\'' +
                ", categoryQuestion=" + categoryQuestion +
                ", duration=" + duration +
                ", creator=" + creator +
                ", createDate=" + createDate +
                ", questions=" + Arrays.toString(questions) +
                '}';
    }
}
