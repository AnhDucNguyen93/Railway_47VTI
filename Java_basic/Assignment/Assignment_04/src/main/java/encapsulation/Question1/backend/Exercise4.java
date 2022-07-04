package encapsulation.Question1.backend;

import encapsulation.Question1.entity.Student;

public class Exercise4 {
    public void printStudent(){
        Student student1 = new Student("Duc", "Ha Noi");
        student1.setScore(5.0f);
        student1.showInfo();
        student1.plusScore(3.5f);
        student1.showInfo();
    }
}
