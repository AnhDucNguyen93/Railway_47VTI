package constructor.question1;

import java.time.LocalDate;
import java.util.Arrays;

public class Group {
    public int groupId;
    public String groupName;
    public Account createId;
    public LocalDate createDate;
    public Account[] accounts;

    public Group(){}

    public Group(String groupName, Account createId, LocalDate createDate, Account[] accounts) {
        this.groupName = groupName;
        this.createId = createId;
        this.createDate = createDate;
        this.accounts = accounts;
    }

    public Group(String groupName, Account createId, String[] userNames ,LocalDate createDate) {
        this.groupName = groupName;
        this.createId = createId;
        this.createDate = createDate;
        Account[] accounts = new Account[userNames.length];
        for (int i = 0; i < userNames.length; i++) {
         this.accounts[i] = new Account(i,null, userNames[i], null, null) ;
        }
    }

    @Override
    public String toString() {
        return "Group{" +
                "groupId=" + groupId +
                ", groupName='" + groupName + '\'' +
                ", createId=" + createId +
                ", createDate=" + createDate +
                ", accounts=" + Arrays.toString(accounts) +
                '}';
    }
}
