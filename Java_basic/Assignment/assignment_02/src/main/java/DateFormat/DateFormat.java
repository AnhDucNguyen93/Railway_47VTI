package DateFormat;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.FormatStyle;
import java.util.Locale;

public class DateFormat {
    public static void main(String[] args) {
        // Question 1
        System.out.println("---------------Question 1------------");
        LocalDate localDate = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter
                .ofLocalizedDate(FormatStyle.FULL)
                .withLocale(new Locale("vi"));
        System.out.println("localDate.format(formatter) = " + localDate.format(formatter));
        // Question 2
        System.out.println("---------------Question 2------------");
        DateTimeFormatter formatter1 = DateTimeFormatter
                .ofPattern("yyyy-MM-dd-HH-mm-ss");
        System.out.println("LocalDate.now().format(formatter1) = " + LocalDateTime.now().format(formatter1));
        // question 3
        System.out.println("---------------Question 3------------");
        DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("yyyy");
        System.out.println("localDate.format(formatter2) = " + localDate.format(formatter2));

        // Question 4
        System.out.println("---------------Question 4------------");
        DateTimeFormatter formatter3 = DateTimeFormatter.ofPattern("MM/yyyy");
        System.out.println("localDate.format(formatter3) = " + localDate.format(formatter3));

        //Question 5
        System.out.println("---------------Question 5------------");
        DateTimeFormatter formatter4 = DateTimeFormatter.ofPattern("MM-dd");
        String DateFomater = localDate.format(formatter4);
        System.out.println("DateFomater = " + DateFomater);

    }
}
