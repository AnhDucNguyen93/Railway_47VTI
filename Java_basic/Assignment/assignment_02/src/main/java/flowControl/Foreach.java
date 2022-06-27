package flowControl;

import entity.Account;
import entity.Department;
import entity.Position;

import java.time.LocalDate;

public class Foreach {
    public static void main(String[] args) {
        // Department
        Department department1 = getDepartment1(1, "Sale");
        Department department2 = getDepartment1(2, "Marketing");
        Department department3 = getDepartment1(3, "Ky Thuat");

        // Position
        Position position1 = getPosition1();

        // Account
        Account account1 = getAccount1(1, "Nguyen Van A", "Nguyenvana@gmail.com", "nguyenvana", department1, position1, 10, 15);
        Account account2 = getAccount1(2, "Nguyen Van B", "Nguyenvanb@gmail.com", "nguyenvanb", department2, position1, 10, 16);
        Account account3 = getAccount1(3, "Nguyen Van C", "Nguyenvanc@gmail.com", "nguyenvanc", department2, position1, 11, 15);

        //  Question 8
        System.out.println("========Question 8========");
        Account[] accArray = {account1,account2,account3};
        for (Account account : accArray) {
            System.out.println(account);
        }
        System.out.println("========Question 9========");
        Department[] depArray = {department1,department2, department3};
        for (Department DS_id_name : depArray){
            System.out.println(DS_id_name.hienthi());
        }
    }

    private static Account getAccount1(int accountId, String fullName, String email, String nguyenvana, Department department1, Position position1, int month, int dayOfMonth) {
        Account account1 = new Account();
        account1.accountId = accountId;
        account1.fullName = fullName;
        account1.email = email;
        account1.userName = nguyenvana;
        account1.department = department1;
        account1.position = position1;
        account1.createDate = LocalDate.of(2020, month, dayOfMonth);
        return account1;
    }

    private static Position getPosition1() {
        Position position1 = new Position();
        position1.positionId = 1;
        position1.positionName = Position.PositionName.DEV;

        Position position2 = new Position();
        position2.positionId = 2;
        position2.positionName = Position.PositionName.DEV;

        Position position3 = new Position();
        position3.positionId = 3;
        position3.positionName = Position.PositionName.PM;
        return position1;
    }

    private static Department getDepartment1(int departmentId, String Sale) {
        Department department1 = new Department();
        department1.departmentId = departmentId;
        department1.departmentName = Sale;
        return department1;
    }
}
