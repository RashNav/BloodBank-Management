package bean;

public class Requester {
    protected String requesterName;
    protected String mobileNumber;
    protected String email;
    protected String bloodGroup;
    protected String status;

    public Requester(String requesterName, String mobileNumber, String email, String bloodGroup, String status) {
        this.requesterName = requesterName;
        this.mobileNumber = mobileNumber;
        this.email = email;
        this.bloodGroup = bloodGroup;
        this.status = status;
    }

    public String getRequesterName() {
        return requesterName;
    }

    public void setRequesterName(String requesterName) {
        this.requesterName = requesterName;
    }

    public String getMobileNumber() {
        return mobileNumber;
    }

    public void setMobileNumber(String mobileNumber) {
        this.mobileNumber = mobileNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getBloodGroup() {
        return bloodGroup;
    }

    public void setBloodGroup(String bloodGroup) {
        this.bloodGroup = bloodGroup;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
