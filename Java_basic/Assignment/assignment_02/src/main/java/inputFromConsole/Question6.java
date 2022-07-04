package inputFromConsole;

import entity.Department;

import java.util.Scanner;

public class Question6 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        Department department = new Department();
        System.out.println("Nhập thông tin Department mới:  ");
        System.out.println("Nhập Department ID:  ");
        if (scanner.hasNextInt()){
            department.departmentId = scanner.nextInt();
            //scanner.nextInt();
            //return; //1
        } else {
            System.out.println("Sai định dạng nhé!");
            return;  // return 2
        }
        System.out.println("Nhập Department Name:  ");
        scanner.nextLine();
        department.departmentName = scanner.nextLine();
        System.out.println("Thông tin Department New");
        System.out.println("Department Id" + department.departmentId);
        System.out.println("Department Name: " + department.departmentName);

        // Cách 2
//        Scanner scanner = new Scanner(System.in);
//        Department department = new Department();
//            while (true) {
//                System.out.println("Nhập thông tin Department mới:  ");
//                System.out.println("Nhập Department ID:  ");
//                if (scanner.hasNextInt()) {
//                    department.departmentId = scanner.nextInt();
//                    System.out.println("Nhập Department Name:  ");
//                    scanner.nextLine();
//                    department.departmentName = scanner.nextLine();
//                    System.out.println("Thông tin Department New");
//                    System.out.println("Department Id" + department.departmentId);
//                    System.out.println("Department Name: " + department.departmentName);
//                    break;
//                } else {
//                    System.out.println("Sai định dạng nhé!");
//                    scanner.nextLine();
//                    // return 2
//                }
//        }
    }
}
