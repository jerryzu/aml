package lab.crazyspark.utils;

public class NewException extends Exception {
    private int value;
    private static final long serialVersionUID = 1L;

    public NewException() {
        super();
    }

    public NewException(String msg) {
        super(msg);
    }

    public NewException(String msg, int value) {
        super(msg);
        this.value = value;
    }

    public int getValue() {
        return value;
    }
}