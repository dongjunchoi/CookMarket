package middle.market.vo;

public class OrderVO {
	
	private String order_cod;
	private String pay_date;
	private String order_status;
	private String id;
	private String pr_cod;
	private int order_price;
	private String pr_name;
	private int pr_count;
	
	
	public int getPr_count() {
		return pr_count;
	}
	public void setPr_count(int pr_count) {
		this.pr_count = pr_count;
	}
	public String getOrder_cod() {
		return order_cod;
	}
	public void setOrder_cod(String order_cod) {
		this.order_cod = order_cod;
	}
	public String getPay_date() {
		return pay_date;
	}
	public void setPay_date(String pay_date) {
		this.pay_date = pay_date;
	}
	public String getOrder_status() {
		return order_status;
	}
	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPr_cod() {
		return pr_cod;
	}
	public void setPr_cod(String pr_cod) {
		this.pr_cod = pr_cod;
	}
	public int getOrder_price() {
		return order_price;
	}
	public void setOrder_price(int order_price) {
		this.order_price = order_price;
	}
	public String getPr_name() {
		return pr_name;
	}
	public void setPr_name(String pr_name) {
		this.pr_name = pr_name;
	}

}
