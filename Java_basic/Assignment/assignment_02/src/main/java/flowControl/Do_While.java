package flowControl;

import entity.Account;
import entity.Department;

public class Do_While {
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

        System.out.println("------------Question 10----------");
        Account[] accArray = {account1, account2, account3};
        int i = 0;
        do {
            System.out.println("Thông tin account thứ " + (i + 1) + "  là: ");
            System.out.println("Email: " + accArray[i].email);
            System.out.println("Full name: " + accArray[i].fullName);
            System.out.println("Phòng ban: " +
                    accArray[i].department.departmentName);
            i++;
        } while (i<accArray.length);
        System.out.println("\n");
        System.out.println("------------Question 11----------");
        Department[] depArray = {department1,department2,department3};
        int j=0;
        do {
            System.out.println("Thông tin department thứ " + (j + 1) + " là: ");
            System.out.println("Id: " + depArray[j].departmentId);
            System.out.println("Name: " + depArray[j].departmentName);
            j++;
        } while (j<depArray.length);
        System.out.println("\n");
        System.out.println("------------Question 12----------");
        int j1=0;
        do {
            System.out.println("Thông tin department thứ " + (j1 + 1) + " là: ");
            System.out.println("Id: " + depArray[j1].departmentId);
            System.out.println("Name: " + depArray[j1].departmentName);
            j1++;
        } while (j1<2);
        System.out.println("\n");
        System.out.println("------------Question 13----------");
        int i1=0;
        do {
            if (i1!=1){
            System.out.println("Thông tin account thứ " + (i1 + 1) + "  là: ");
            System.out.println("Email: " + accArray[i1].email);
            System.out.println("Full name: " + accArray[i1].fullName);
            System.out.println("Phòng ban: " +
                    accArray[i1].department.departmentName);
            }
            i1++;
        } while (i1<accArray.length);
        System.out.println("\n");
        System.out.println("------------Question 14----------");
        int i2 = 0;
        do {
            if (accArray[i2].accountId<4){
                System.out.println("Thông tin account thứ " + (i2 + 1) + "  là: ");
                System.out.println("Email: " + accArray[i2].email);
                System.out.println("Full name: " + accArray[i2].fullName);
                System.out.println("Phòng ban: " +
                        accArray[i2].department.departmentName);
            }
            i2++;
        }while (i2<accArray.length);


    }
}
