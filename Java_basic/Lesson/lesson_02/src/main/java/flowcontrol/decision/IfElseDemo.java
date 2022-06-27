package flowcontrol.decision;

public class IfElseDemo {
    public static void main(String[] args) {
        int x = 100, y = 100;
        if (y>x){
            System.out.println("y lon hon x");
        } else if (x>y){
            System.out.println("x lon hon y");
        } else {
            System.out.println("x bang y");
        }
    }
}
