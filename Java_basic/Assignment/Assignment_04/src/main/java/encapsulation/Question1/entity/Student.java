package encapsulation.Question1.entity;

public class Student {
    private int id;
    private String name;
    private String homeTown;
    private float score;

    public Student(String name, String homeTown) {
        this.score = 0.0f;
    }

    public void setScore(float score) {
        this.score = score;
    }

    public void plusScore(float value) {
        this.score += value;
    }
    public void showInfo(){
        String rank;
        if (score<4){
            rank = "Yếu";
        } else if ( score <6 ){
            rank = "Trung bình";
        } else if ( score < 8) {
            rank = "Khác";
        } else {
            rank = "Giỏi";
        }
        System.out.printf("%s : %s\n", this.name, rank);
    }
}
