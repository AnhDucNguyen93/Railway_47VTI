package constructor.question1;

import java.util.Arrays;

public class Position {
    public int positionId;
    public PositionName positionName;
    public enum PositionName{
            DEV, TEST, SCRUM_MASTER, PM
    }
    public Account[] accounts;

    @Override
    public String toString() {
        return "Position{" +
                "positionId=" + positionId +
                ", positionName=" + positionName +
                ", accounts=" + Arrays.toString(accounts) +
                '}';
    }
}
