package flowControl;

import entity.Account;
import entity.Group;
import entity.Position;

import java.time.LocalDate;

public class SwichCaseAnswer {
    public static void main(String[] args) {

        Account account1 = new Account();
        account1.accountId = 1;
        account1.fullName = "Nguyen Van A";
        account1.email = "Nguyenvana@gmail.com";
        account1.createDate = LocalDate.of(2020, 10, 15);

        Account account2 = new Account();
        account2.accountId = 2;
        account2.fullName = "Nguyen Van B";
        account2.email = "Nguyenvanb@gmail.com";
        account2.userName = "nguyenvanb";
        account2.createDate = LocalDate.of(2020, 10, 16);

        Group group1 = new Group();
        group1.groupId = 1;
        group1.groupName = "Group1";
        group1.createId = account1;
        group1.createDate = LocalDate.now();
        group1.accounts = new Account[]{account1, account2};

        Group group2 = new Group();
        group1.groupId = 2;
        group1.groupName = "Group2";
        group1.createId = account1;
        group1.createDate = LocalDate.now();
        account1.groups = new Group[]{group1, group2};

        // Question 5
        if (group1.accounts == null) {
            System.out.println("Group chưa có thành viên nào tham gia");
        } else {
            int countAccGroup = group1.accounts.length;
            switch (countAccGroup) {
                case 1:
                    System.out.println("Nhóm có một thành viên");
                    break;
                case 2:
                    System.out.println("Nhóm có 2 thành viên");
                    break;
                case 3:
                    System.out.println("Nhóm có 3 thành viên");
                    break;
                default:
                    System.out.println("Nhóm có nhieu thành viên");
                    break;
            }
        }
        // Question 6
        System.out.println("-----------Question_6-------------");
        if (account1.groups == null) {
            System.out.println("Nhân viên này chưa có group");
        } else {
            int countGroupInAcc = account1.groups.length;
            switch (countGroupInAcc) {
                case 1:
                    System.out.println("Group của nhân viên này là Java \n" +
                            "Fresher, C# Fresher");
                    break;
                case 2:
                    System.out.println("Group của nhân viên này là Java \n" +
                            "Fresher, C# Fresher");
                    break;
                case 3:
                    System.out.println("Nhân viên này là người quan trọng, tham gia nhiều group");
                    break;
                case 4:
                    System.out.println("Nhân viên này là người hóng chuyện, tham gia tất cả các group");
                    break;
            }
        }
        System.out.println("-----------Question_7-------------");
        Position position1 = new Position();
        position1.positionId= 1;
        position1.positionName = Position.PositionName.DEV;
        account1.position = position1;

        //String posiName = account1.position.positionName.toString();
        switch (account1.position.positionName) {
            case DEV:
                System.out.println("Đây là Developer");
                break;
            default:
                System.out.println("Người này không phải là Developer");
                break;
        }
    }
}
