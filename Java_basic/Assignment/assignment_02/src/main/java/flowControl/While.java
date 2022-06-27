package flowControl;

import entity.Account;
import entity.Department;

public class While {
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

        System.out.println("------------Question10-----------");
        //Question 16:
        //Làm lại các Question ở phần FOR bằng cách sử dụng WHILE kết hợp với
        //lệnh break, continue;
        Account[] accArray = {account1, account2, account3};
        int i = 0;
        while (i < accArray.length) {
            System.out.println("Thông tin account thứ " + (i + 1) + "  là: ");
            System.out.println("Email: " + accArray[i].email);
            System.out.println("Full name: " + accArray[i].fullName);
            System.out.println("Phòng ban: " +
                    accArray[i].department.departmentName);
            i++;
        }
        System.out.println("------------Question11-----------");
        Department[] depArray = {department1, department2, department3};
        int j = 0;
        while (j < 2) {
            System.out.println("Thông tin department thứ " + (j + 1) + " là: ");
            System.out.println("Id: " + depArray[j].departmentId);
            System.out.println("Name: " + depArray[j].departmentName);
            j++;
        }
        System.out.println("\n");
        System.out.println("------------Question13-----------");
        int a = 0;
        while (a < depArray.length) {
            if (a != 1) {
                System.out.println("Thông tin department thứ " + (a + 1) + " là: ");
                System.out.println("Id: " + depArray[a].departmentId);
                System.out.println("Name: " + depArray[a].departmentName);
            }
            a++;
        }
        System.out.println("\n");
        System.out.println("------------Question14-----------");
        int b = 0;
        while (b < accArray.length) {
            if (accArray[b].accountId < 4) {
                System.out.println("Thông tin account thứ " + (b + 1) + "  là: ");
                System.out.println("Email: " + accArray[b].email);
                System.out.println("Full name: " + accArray[b].fullName);
                System.out.println("Phòng ban: " +
                        accArray[b].department.departmentName);
            }
            b++;
        }
        System.out.println("\n");
        System.out.println("------------Question15-----------");
        int c = 0;
        while (c <= 20) {
            if (c % 2 == 0) {
                System.out.println(c + "    ");
            }
            c++;
        }
    }
}
