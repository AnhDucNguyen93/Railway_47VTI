package entity;

import java.time.LocalDate;
import java.util.Arrays;

public class Group {
    public int groupId;
    public String groupName;
    public Account createId;
    public LocalDate createDate;
    public Account[] accounts;

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
