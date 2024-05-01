package freshies.model;

public class Order {

    private int orderId;
    private String name;
    private String address;
    private String contactNumber;
    private String totalPrice;
    private String paymentMethod;
    private String items;

    public Order(String name, String address, String contactNumber, String totalPrice, String paymentMethod, String items) {
        this.name = name;
        this.address = address;
        this.contactNumber = contactNumber;
        this.totalPrice = totalPrice;
        this.paymentMethod = paymentMethod;
        this.items = items;
    }

    public Order() {

    }

    // Getter and setter methods
    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getContactNumber() {
        return contactNumber;
    }

    public void setContactNumber(String contactNumber) {
        this.contactNumber = contactNumber;
    }

    public String getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(String totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public String getItems() {
        return items;
    }

    public void setItems(String items) {
        this.items = items;
    }
}
