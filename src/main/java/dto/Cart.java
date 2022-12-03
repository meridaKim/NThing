package main.java.dto;

public class Cart {
    private int cart_id;

    private String user_id;

    private int cartNThingId;

    private int NThingCount;

    //book

    private String NThingName;

    private int NThingPrice;


    // 추가

    private int totalPrice;

    public int getCart_id() {
        return cart_id;
    }

    public void setCart_id(int cart_id) {
        this.cart_id = cart_id;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public int getCartNThingId() {
        return cartNThingId;
    }

    public void setCartNThingId(int cartNThingId) {
        this.cartNThingId = cartNThingId;
    }

    public int getNThingCount() {
        return NThingCount;
    }

    public void setNThingCount(int NThingCount) {
        this.NThingCount = NThingCount;
    }

    public String getNThingName() {
        return NThingName;
    }

    public void setNThingName(String NThingName) {
        this.NThingName = NThingName;
    }

    public int getNThingPrice() {
        return NThingPrice;
    }

    public void setNThingPrice(int NThingPrice) {
        this.NThingPrice = NThingPrice;
    }

    public int getTotalPrice() {
        return totalPrice;
    }
    public void total(){
        this.totalPrice=this.NThingPrice * this.NThingCount;
    }

}
