package constructor.question1;

import java.time.LocalDate;

public class program {
    public static void main(String[] args) {
        Department dep = new Department();
        Department dep1 = new Department("hyena");
        System.out.println("gia tri: "+ dep1);
        System.out.println("gia tri: "+ dep);
        // Question 3
        System.out.println("-------------Question 3");
        String[] userName = {"Khoa", "Hung", "Nam"};
        Group groupC = new Group("Java Basic", new Account(), userName, LocalDate.now());
        System.out.println("GroupC = " + groupC);
    }

}
