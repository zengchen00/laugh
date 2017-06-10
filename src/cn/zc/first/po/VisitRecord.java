package cn.zc.first.po;

import java.io.Serializable;
import java.util.Date;

public class VisitRecord implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private int id;
	private String ip;
	private String province;
	private String city;
	private String area;
	private Date visitDate;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public Date getVisitDate() {
		return visitDate;
	}
	public void setVisitDate(Date visitDate) {
		this.visitDate = visitDate;
	}
	
	@Override
	public String toString() {
		return "VisitRecord [id=" + id + ", ip=" + ip + ", province=" + province + ", city=" + city + ", area=" + area
				+ ", visitDate=" + visitDate + "]";
	}
	
}
