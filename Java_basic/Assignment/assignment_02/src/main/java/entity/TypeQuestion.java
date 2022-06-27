package entity;

import java.util.Arrays;

public class TypeQuestion {
    public int typeId;
    public TypeName typeName;
    public enum TypeName{
        ESSAY, MULTIPLE_CHOICE
    }
    public Question[] questions;

    @Override
    public String toString() {
        return "TypeQuestion{" +
                "typeId=" + typeId +
                ", typeName=" + typeName +
                ", questions=" + Arrays.toString(questions) +
                '}';
    }
}
