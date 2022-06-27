package DateFormat;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.FormatStyle;
import java.util.Locale;

public class SystemControl {
    public static void main(String[] args) {
        System.out.println("-------------Question 1----------   ");
        int a = 5;
        System.out.printf("%d   ", a);
        System.out.printf("%d   \n", a);

        System.out.println("-------------Question 2---------   ");
        int a2 = 100000000;
        System.out.printf("%,d", a2);

        System.out.println("-------------Question 3---------   ");
        float a3 = 5.567098f;
        System.out.printf("%5.4f", a3);

        System.out.println("-------------Question 4---------   ");
        String a4 = "Nguyễn Văn A";
        System.out.printf("Tên tôi là \"%s\" và tôi đang độc thân.\n", a4);

        System.out.println("-------------Question 5---------   ");
//        LocalDateTime a5 = LocalDateTime.now();
//        DateTimeFormatter dateTimeFormatter = DateTimeFormatter
//                .ofLocalizedDateTime(FormatStyle.FULL)
//                .withLocale(new Locale("vi"));
//        String DateTime = a5.format(dateTimeFormatter);
//        System.out.println(DateTime);
        LocalDateTime a6 = LocalDateTime.now();
        DateTimeFormatter dateFormat = DateTimeFormatter
                .ofLocalizedDate(FormatStyle.FULL)
                .withLocale(new Locale("vi"));
        String fomaterDate = a6.format(dateFormat);
        System.out.println(fomaterDate);

        System.out.println("\n");
        DateTimeFormatter dateFormat1 = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
        String fomaterDate1 = a6.format(dateFormat1);
        System.out.println(fomaterDate1);

        System.out.println("-------------Question 6---------   ");


    }
}
