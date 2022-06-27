import vti.com.entity.Account;
import vti.com.entity.Department;
import vti.com.entity.Group;
import vti.com.entity.Position;

import java.time.LocalDate;

public class Program {
    public static void main(String[] args) {
        // Department
        System.out.println("----------Department----------");
        Department department1 = new Department();
        department1.departmentId = 1;
        department1.departmentName = "Sale";
        System.out.println(department1);

        Department department2 = new Department();
        department2.departmentId = 2;
        department2.departmentName = "Marketing";
        System.out.println(department2);

        Department department3 = new Department();
        department3.departmentId = 3;
        department3.departmentName = "Ky Thuat";
        System.out.println(department3);

        // Position
        System.out.println("----------Position----------");
        Position position1 = new Position();
        position1.positionId = 1;
        position1.positionName = Position.PositionName.DEV;
        System.out.println(position1);

        Position position2 = new Position();
        position2.positionId = 2;
        position2.positionName = Position.PositionName.DEV;
        System.out.println(position2);

        Position position3 = new Position();
        position3.positionId = 3;
        position3.positionName = Position.PositionName.PM;
        System.out.println(position3);

        // Account
        System.out.println("----------Account----------");
        Account account1 = new Account();
        account1.accountId = 1;
        account1.fullName = "Nguyen Van A";
        account1.email = "Nguyenvana@gmail.com";
        account1.userName = "nguyenvana";
        account1.department = department1;
        account1.position = position1;
        account1.createDate = LocalDate.of(2020, 10, 15);
        System.out.println(account1);

        Account account2 = new Account();
        account2.accountId = 2;
        account2.fullName = "Nguyen Van B";
        account2.email = "Nguyenvanb@gmail.com";
        account2.userName = "nguyenvanb";
        account2.department = department2;
        account2.position = position1;
        account2.createDate = LocalDate.of(2020, 10, 16);
        System.out.println(account2);

        Account account3 = new Account();
        account3.accountId = 3;
        account3.fullName = "Nguyen Van C";
        account3.email = "Nguyenvanc@gmail.com";
        account3.userName = "nguyenvanc";
        account3.department = department2;
        account3.position = position1;
        account3.createDate = LocalDate.of(2020, 11, 15);
        System.out.println(account3);

        // Group
        System.out.println("----------Group----------");
        Group group1 = new Group();
        group1.groupId = 1;
        group1.groupName = "Group1";
        group1.createId = account1;
        group1.createDate = LocalDate.now();
        group1.accounts = new Account[]{account1, account2};
        System.out.println(group1);

        Group group2 = new Group();
        group2.groupId = 2;
        group2.groupName = "Group2";
        group2.createId = account2;
        group2.createDate = LocalDate.now();
        group2.accounts = new Account[]{account3, account2};
        System.out.println(group2);

        Group group3 = new Group();
        group3.groupId = 3;
        group3.groupName = "Group2";
        group3.createId = account2;
        group3.createDate = LocalDate.now();
        group3.accounts = new Account[]{account3, account1};
        System.out.println(group3);
    }
}
