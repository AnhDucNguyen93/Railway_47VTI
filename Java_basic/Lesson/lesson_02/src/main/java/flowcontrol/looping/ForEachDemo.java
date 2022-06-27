package flowcontrol.looping;

public class ForEachDemo {
    public static void main(String[] args) {
        int[] diems = {9,10,7,8};
        // For each
        System.out.println("--------For each--------");
        for (int diem : diems) {
            System.out.println(diem);
        }
        // For
        System.out.println("--------For--------");
        for (int i = 0; i < diems.length; i++){
            System.out.println("Hoc sinh so:"+ (i+1) +  " có điểm = "+ diems[i]);
        }
    }
}
