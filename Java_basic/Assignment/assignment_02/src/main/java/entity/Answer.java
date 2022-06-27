package entity;

public class Answer {
    public int answerId;
    public String content;
    public Question question;
    public boolean isCorrect;

    @Override
    public String toString() {
        return "Answer{" +
                "answerId=" + answerId +
                ", content='" + content + '\'' +
                ", question=" + question +
                ", isCorrect=" + isCorrect +
                '}';
    }
}
