package constructor.question1;

import java.time.LocalDate;

public class Account {
    public int accountId;
    public String email;
    public String userName;
    public String fullName;
    public Department department;
    public Position position;
    public LocalDate createDate;

    public Account() {
    }

    public Account(int accountId, String email, String userName, String firsName, String lastName) {
        this.accountId = accountId;
        this.email = email;
        this.userName = userName;
        this.fullName = firsName+ lastName;
    }

    public Account(int accountId, String email, String userName, Position position, String firsName, String lastName) {
        this.accountId = accountId;
        this.email = email;
        this.userName = userName;
        this.position = position;
        this.fullName = firsName + lastName;
        this.createDate = LocalDate.now();
    }

    public Account(int accountId, String email, String userName, Position position, String firsName, String lastName, LocalDate createDate) {
        this.accountId = accountId;
        this.email = email;
        this.userName = userName;
        this.position = position;
        this.fullName = firsName + lastName;
        this.createDate = createDate;
    }

    @Override
    public String toString() {
        return "Account{" +
                "accountId=" + accountId +
                ", email='" + email + '\'' +
                ", userName='" + userName + '\'' +
                ", fullName='" + fullName + '\'' +
                ", department=" + department +
                ", position=" + position +
                ", createDate=" + createDate +
                '}';
    }
}
