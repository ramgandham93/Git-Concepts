public  class CynoAddress {
    public String firstLineOfAddress;
    public String secondLineOfAddress;
    public String city;
    public String postCode;
    public String state;
    public String country;
    public CynoAddress(String fLine,String sLine, String city, String postCode, String state, String country) {
        this.firstLineOfAddress = fLine;
        this.secondLineOfAddress = sLine;
        this.city = city;
        this.postCode = postCode;
        this.state = state;
        this.country = country;
    }
}