package flowControl;

import entity.Account;
import entity.Department;
import entity.Position;

public class IfAnswer {
    public static void main(String[] args) {
        // Question 1:
        Account account1 = new Account();
        Department department1 = new Department();
        department1.departmentId = 1;
        department1.departmentName = "Sale";
        account1.department = department1;
        Position position1 = new Position();
        position1.positionId= 1;
        position1.positionName = Position.PositionName.DEV;
        account1.position = position1;

        if (account1.department == null) {
            System.out.println("Nhân viên này chưa có phòng ban");
        } else {
            System.out.println("Phòng ban của nhân viên này là …" + account1.department);
        }
        // Question 3
        String text1 = (account1.department == null) ? "Nhân viên này chưa có phòng ban" :
                "Phòng ban của nhân viên này là …" + account1.department;
        System.out.println(text1);

        // Question 4

        String text2 = (account1.position.positionName.toString() == "DEV") ? "Đây là Developer" :
                "Người này không phải là Developer" + account1.position;
        System.out.println(text2);
    }
}
