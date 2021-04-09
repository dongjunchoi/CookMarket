package middle.market.vo;

public class ShopBagVO {
    private String basket_cod  ;
    private String id          ;
    private String pr_price    ;
    private String item        ;
    private String grocery_cod ;
    public String getBasket_cod() {
       return basket_cod;
    }
    public void setBasket_cod(String basket_cod) {
       this.basket_cod = basket_cod;
    }
    public String getId() {
       return id;
    }
    public void setId(String id) {
       this.id = id;
    }
    public String getPr_price() {
       return pr_price;
    }
    public void setPr_price(String pr_price) {
       this.pr_price = pr_price;
    }
    public String getItem() {
       return item;
    }
    public void setItem(String item) {
       this.item = item;
    }
    public String getGrocery_cod() {
       return grocery_cod;
    }
    public void setGrocery_cod(String grocery_cod) {
       this.grocery_cod = grocery_cod;
    }
}