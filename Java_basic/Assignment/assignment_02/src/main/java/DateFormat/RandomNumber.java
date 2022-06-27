package DateFormat;

import java.util.Random;

public class RandomNumber {
    public static void main(String[] args) {
        // Question 1
        System.out.println("------------Question 1-------");
        Random random = new Random();
        int a = random.nextInt();
        System.out.println("a = " + a);
        //Question 2
        System.out.println("------------Question 2-------");
        float b = random.nextFloat();
        System.out.println("b = " + b);

        // Quétion 3
        System.out.println("------------Question 3-------");
        String[] student = {"An", "Bình", "Trung", "Năm"};
        int d = random.nextInt(student.length);
        System.out.println("student[d] = " + student[d]);

        //Question 4
        System.out.println("------------Question 4-------");
        

    }
}
