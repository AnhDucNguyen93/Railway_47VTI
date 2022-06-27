package flowcontrol.decision;

public class TernaryDemo {
    public static void main(String[] args) {
        int x = 100, y = 100;

        // Ternary
        // Nên
        String text = (y>x) ?  "y lon hon x": "x lon hon bang y";
        System.out.println(text);
        // Không nên
        String text1 = (y>x)? "y lon hon x": (x>y ? "x lon hon y": "x bang y");
        System.out.println(text1);
        // If else
        if (y > x) {
            System.out.println("y lon hon x");
        } else {
            System.out.println("x lon hon bang y");
        }
    }
}
