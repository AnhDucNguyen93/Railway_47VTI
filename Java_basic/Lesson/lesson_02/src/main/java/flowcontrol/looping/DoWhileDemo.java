package flowcontrol.looping;

public class DoWhileDemo {
    public static void main(String[] args) {
        for (int i = 0; i <10; i++) {
            System.out.println(i);
        }


        // Do While chạy ít nhất   1 lần
        System.out.println("=====Do while=======");
        int i1 = 0;
        do{
            System.out.println(i1);
            i1++;
        } while(i1<4);
    }
}
