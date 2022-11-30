package main.java.dto;

public class NThing {
    private Integer NThingId;
    private String NThingName;//제품명
    private Integer unitPrice;//가격
    private String writer; //작성자
    private String description;//설명
    private String siteName;//판매처
    private String category;//카테고리
    private Integer Nthinger;//공구인원수
    private String writeDate;//작성일자
    private long totalSalePercent;//할인률
    private String filename;//파일명
    private int quantity;//갯수
    private long unitsInStock;//재고


    public NThing(){
        super();
    }
    public NThing(Integer NThingId, String NThingName, Integer unitPrice){
        this.NThingId = NThingId;
        this.NThingName = NThingName;
        this.unitPrice = unitPrice;
    }

    public long getUnitsInStock() {
        return unitsInStock;
    }

    public void setUnitInStock(long unitInStock) {
        this.unitsInStock = unitInStock;
    }

    public Integer getNThingId() {
        return NThingId;
    }

    public void setNThingId(Integer NThingId) {
        this.NThingId = NThingId;
    }

    public String getNThingName() {
        return NThingName;
    }

    public void setNThingName(String NThingName) {
        this.NThingName = NThingName;
    }

    public Integer getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(Integer unitPrice) {
        this.unitPrice = unitPrice;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getSiteName() {
        return siteName;
    }

    public void setSiteName(String siteName) {
        this.siteName = siteName;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public Integer getNthinger() {
        return Nthinger;
    }

    public void setNthinger(Integer nthinger) {
        Nthinger = nthinger;
    }

    public String getWriteDate() {
        return writeDate;
    }

    public void setWriteDate(String writeDate) {
        this.writeDate = writeDate;
    }

    public long getTotalSalePercent() {
        return totalSalePercent;
    }

    public void setTotalSalePercent(long totalSalePercent) {
        this.totalSalePercent = totalSalePercent;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
