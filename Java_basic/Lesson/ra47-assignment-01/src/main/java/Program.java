import com.vti.entity.Account;
import com.vti.entity.Department;
import com.vti.entity.Position;

import java.time.LocalDate;

public class Program {
    public static void main(String[] args) {
        Department department1 = new Department();
        department1.departmentId = 1;
        department1.departmentName = "Sales";
        department1.hienThi();

        Department department2 = new Department();
        department2.departmentId = 2;
        department2.departmentName = "Marketing";
        department2.hienThi();

        Department department3 = new Department();
        department3.departmentId = 3;
        department3.departmentName = "Dev";
        System.out.println(department3);

        //Position
        System.out.println("--------Position----------------");
        Position position1 = new Position();
        position1.positionId = 1;
        position1.positionName = position1.positionName.DEV;

        position1.hienThi();

        //Account
        System.out.println("----------Account-----------------");
        Account account1 = new Account();
        account1.accountId = 1;
        account1.fullName = "Dinh Khac Son";
        account1.email = "sondinhkhac1998@gmail.com";
        account1.userName = "son";
        account1.department = department1;
        account1.position = position1;
        account1.createDate = LocalDate.now();
    }
}
