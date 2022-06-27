package flowControl;

import entity.Account;
import entity.Department;

public class For {
    public static void main(String[] args) {

        Department department1 = new Department();
        department1.departmentId = 1;
        department1.departmentName = "Sale";

        Department department2 = new Department();
        department2.departmentId = 2;
        department2.departmentName = "Marketing";

        Department department3 = new Department();
        department3.departmentId = 3;
        department3.departmentName = "Ky Thuat";

        Account account1 = new Account();
        account1.accountId = 1;
        account1.fullName = "Nguyen Van A";
        account1.email = "Nguyenvana@gmail.com";
        account1.userName = "nguyenvana";
        account1.department = department1;

        Account account2 = new Account();
        account2.accountId = 2;
        account2.fullName = "Nguyen Van B";
        account2.email = "Nguyenvanb@gmail.com";
        account2.userName = "nguyenvanb";
        account2.department = department2;

        Account account3 = new Account();
        account3.accountId = 3;
        account3.fullName = "Nguyen Van C";
        account3.email = "Nguyenvanc@gmail.com";
        account3.userName = "nguyenvanc";
        account3.department = department2;
        // Question 10
        System.out.println("------------Question10-----------");
        Account[] accArray = {account1, account2, account3};
        for (int i = 0; i < 3; i++) {
            System.out.println("Thông tin account thứ " + (i + 1) + "  là: ");
            System.out.println("Email: " + accArray[i].email);
            System.out.println("Full name: " + accArray[i].fullName);
            System.out.println("Phòng ban: " +
                    accArray[i].department.departmentName);
        }
        System.out.println("------------Question11-----------");
        Department[] depArray = {department1, department2};
        for (int i = 0; i < depArray.length; i++) {
            System.out.println("Thông tin department thứ " + (i + 1) + " là: ");
            System.out.println("Id: " + depArray[i].departmentId);
            System.out.println("Name: " + depArray[i].departmentName);
        }
        System.out.println("------------Question12-----------");
        Department[] depArray1 = {department1, department2, department3};
        for (int i = 0; i < 2; i++) {
            System.out.println("Thông tin department thứ " + (i + 1) + " là: ");
            System.out.println("Id: " + depArray1[i].departmentId);
            System.out.println("Name: " + depArray1[i].departmentName);
        }
        System.out.println("------------Question13-----------");
        // Sử dụng accArray ở question 10
        //  Account[] accArray = {account1, account2, account3};
        for (int i = 0; i < accArray.length; i++) {
            if (i != 1) {
                System.out.println("Thông tin account thứ " + (i + 1) + "  là: ");
                System.out.println("Email: " + accArray[i].email);
                System.out.println("Full name: " + accArray[i].fullName);
                System.out.println("Phòng ban: " +
                        accArray[i].department.departmentName);
            }
        }
        System.out.println("------------Question14-----------");
        for (int i = 0; i < accArray.length; i++) {
            if (accArray[i].accountId < 4){
                System.out.println("Thông tin account thứ " + (i + 1) + "  là: ");
                System.out.println("Email: " + accArray[i].email);
                System.out.println("Full name: " + accArray[i].fullName);
                System.out.println("Phòng ban: " +
                        accArray[i].department.departmentName);
            }
        }
        System.out.println("------------Question15-----------");
        for (int i = 0; i <= 20; i++) {
            if (i%2 ==0) {
                System.out.print(i+"  ");
            }
        }
    }
}
