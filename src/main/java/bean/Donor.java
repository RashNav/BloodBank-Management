package bean;

public class Donor {
    protected String donorId;
    protected String donorName;
    protected String father;
    protected String mother;
    protected String mobileNumber;
    protected String gender;
    protected String email;
    protected String bloodGroup;
    protected String address;

    public Donor() {
    }

    public Donor(String donorName, String father, String mother, String mobileNumber, String gender, String email, String bloodGroup, String address) {
        this.donorName = donorName;
        this.father = father;
        this.mother = mother;
        this.mobileNumber = mobileNumber;
        this.gender = gender;
        this.email = email;
        this.bloodGroup = bloodGroup;
        this.address = address;
    }

    public Donor(String donorId, String donorName, String father, String mother, String mobileNumber, String gender, String email, String bloodGroup, String address) {
        this.donorId = donorId;
        this.donorName = donorName;
        this.father = father;
        this.mother = mother;
        this.mobileNumber = mobileNumber;
        this.gender = gender;
        this.email = email;
        this.bloodGroup = bloodGroup;
        this.address = address;
    }

    public Donor(String donorName, String father, String mother, String mobileNumber, String email, String address, String donorId) {
        this.donorName = donorName;
        this.father = father;
        this.mother = mother;
        this.mobileNumber = mobileNumber;
        this.email = email;
        this.address = address;
        this.donorId = donorId;
    }

    public String getDonorId() {
        return donorId;
    }

    public void setDonorId(String donorId) {
        this.donorId = donorId;
    }

    public String getDonorName() {
        return donorName;
    }

    public void setDonorName(String donorName) {
        this.donorName = donorName;
    }

    public String getFather() {
        return father;
    }

    public void setFather(String father) {
        this.father = father;
    }

    public String getMother() {
        return mother;
    }

    public void setMother(String mother) {
        this.mother = mother;
    }

    public String getMobileNumber() {
        return mobileNumber;
    }

    public void setMobileNumber(String mobileNumber) {
        this.mobileNumber = mobileNumber;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
