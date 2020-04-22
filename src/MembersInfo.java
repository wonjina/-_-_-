import java.io.*;
import java.sql.*;
import java.util.ArrayList;

public class MembersInfo {
	private ArrayList<String> idList = new ArrayList<String> ();
	private ArrayList<String> nameList = new ArrayList<String> ();
	private ArrayList<String> phoneList = new ArrayList<String> ();
	private int maxPage = 0;
	private boolean lastPage = false;

	public MembersInfo () {
	}
	public void setId (int index, String id) {
		this.idList.add(index, id);
	}
	public void setName (int index, String name) {
		this.nameList.add(index, name);
	}
	public void setPhone (int index, String phone) {
		this.phoneList.add(index, phone);
	}	
	public void setLastPage (boolean lastPage) {
		this.lastPage = lastPage;
	}
	public void setMaxPage (int maxPage) {
		this.maxPage = maxPage;
	}
	public String[] getId() {
		return idList.toArray(new String[idList.size()]);
	}
	public String[] getName() {
		return nameList.toArray(new String[nameList.size()]);
	}
	public String[] getPhone() {
		return phoneList.toArray(new String[phoneList.size()]);
	}
	public boolean isLastPage() {
		return lastPage;
	}
	public int getMaxPage() {
		return maxPage;
	}
	public int getSize() {
		return nameList.size();
	}
}
