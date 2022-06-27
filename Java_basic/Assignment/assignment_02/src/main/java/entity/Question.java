package entity;

import java.time.LocalDate;
import java.util.Arrays;

public class Question {
    public int questionId;
    public String content;
    public CategoryQuestion categoryQuestion;
    public TypeQuestion typeQuestion;
    public Account creator;
    public LocalDate createDate;
    public Exam[] exams;
    public Answer[] answers;

    @Override
    public String toString() {
        return "Question{" +
                "questionId=" + questionId +
                ", content='" + content + '\'' +
                ", categoryQuestion=" + categoryQuestion +
                ", typeQuestion=" + typeQuestion +
                ", creator=" + creator +
                ", createDate=" + createDate +
                ", exams=" + Arrays.toString(exams) +
                ", answers=" + Arrays.toString(answers) +
                '}';
    }
}
