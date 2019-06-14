package lab.crazyspark.validator.constraint;

public enum BordFlag {
    inner(10, "境内"), outer(11, "境外");
    private int code;
    private String desc;

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    BordFlag(int code, String desc) {
        this.code = code;
        this.desc = desc;
    }

    public static BordFlag getValue(int code) {
        for (BordFlag bordFlag : values()) {
            if (bordFlag.getCode() == code) {
                return bordFlag;
            }
        }
        return null;
    }
}