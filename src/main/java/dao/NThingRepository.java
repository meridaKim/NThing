package main.java.dao;

import main.java.dto.NThing;

import java.util.ArrayList;

public class NThingRepository {
ArrayList<NThing> listOfNThings = new ArrayList<NThing>();
private static NThingRepository instance = new NThingRepository();

public static NThingRepository getInstance(){
    return instance;
}
    public NThingRepository(){
        NThing nthing1 = new NThing("ISBN5", "쿠팡베이직 네추럴 3겹 천연펄프 롤화장지 30m 3팩", 37490);
        nthing1.setDescription(
                "여긱 롤화장지 1팩씩 구매하실 2명 구합니다!");
        nthing1.setWriter("겸둥이");
        nthing1.setCategory("생활용품");
        nthing1.setTotalSalePercent(29);
        nthing1.setWriteDate("2022/11/28");
        nthing1.setFilename("NThing1.png");
        nthing1.setNthinger(2);
        nthing1.setSiteName("https://www.coupang.com/vp/products/328677319?itemId=7859148203&vendorItemId=83067892661&sourceType=CAMPAIGN&campaignId=82&categoryId=115573&isAddedCart=");
        nthing1.setUnitInStock(2);
        listOfNThings.add(nthing1);
    }
    public ArrayList<NThing> getAllNThing() {
        return listOfNThings;
    }
    public NThing getNThingById(String NThingId) {
        NThing nThingById = null;

        for (int i = 0; i < listOfNThings.size(); i++) {
            NThing nThing = listOfNThings.get(i);
            if (nThing != null && nThing.getNThingId() != null && nThing.getNThingId().equals(NThingId)) {
                nThingById = nThing;
                break;
            }
        }
        return nThingById;
    }

    public void addNThing(NThing nThing) {
        listOfNThings.add(nThing);
    }

}
