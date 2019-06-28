package lab.crazyspark.aml.heaven;

import javax.persistence.Column;
import javax.persistence.Entity;
@Entity
public class SamplePojo {
	@Column(name="User_Id")
	private int id;
	@Column(name="User_Name")
	private String name;
	@Column(name="Address")
	private String address;
	@Column(name="Gender")
	private boolean gender;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public boolean isGender() {
		return gender;
	}
	public void setGender(boolean gender) {
		this.gender = gender;
	}
	
	@Override
	public String toString() {
		return 	"id: " + id + "\n" + 
				"name: " + name + "\n"+
				"address: " + address + "\n" +
				"gender: " + (gender ? "Male" : "Female") + "\n\n";
	}
}