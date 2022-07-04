package DateFormat;

import java.time.LocalDate;
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
        int minDay = (int) LocalDate.of(1993, 07, 24).toEpochDay();
        int maxDay = (int) LocalDate.of(1993,12,20).toEpochDay();
        int randomDay = random.nextInt(maxDay-minDay)+ minDay;
        System.out.println("randomday = " + randomDay);
        LocalDate randomDate = LocalDate.ofEpochDay(randomDay);
        System.out.println("randomDate = " + randomDate);

        // Question 5
        System.out.println("------------Question 5-------");
        int now = (int) LocalDate.now().toEpochDay();
        int dayNow = now - random.nextInt(365);
        LocalDate randomNow = LocalDate.ofEpochDay(dayNow);
        System.out.println("randomNow = " + randomNow);

        // Question 6
        System.out.println("------------Question 6-------");
        System.out.println("Lấy ngẫu nhiên 1 ngày trong quá khứ = " + LocalDate.ofEpochDay(now));
        // question 7
        System.out.println("------------Question 6-------");
        int day = random.nextInt(1000-99)+99;
        System.out.println(day);
    }
}
