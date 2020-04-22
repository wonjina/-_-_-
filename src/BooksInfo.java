import java.io.*;
import java.sql.*;
import java.util.ArrayList;

public class BooksInfo {
	private ArrayList<String> codeList = new ArrayList<String> ();
	private ArrayList<String> nameList = new ArrayList<String> ();
	private ArrayList<String> writerList = new ArrayList<String> ();
	private ArrayList<String> publisherList = new ArrayList<String> ();
	private ArrayList<String> locationList = new ArrayList<String> ();
	private boolean lastPage = false;
	private int maxPage = 0;

	public BooksInfo () {
	}
	public void setCode (int index, String code) {
		this.codeList.add(index, code);
	}
	public void setName (int index, String name) {
		this.nameList.add(index, name);
	}
	public void setWriter (int index, String writer) {
		this.writerList.add(index, writer);
	}
	public void setPublisher (int index, String publisher) {
		this.publisherList.add(index, publisher);
	}
	public void setLocation (int index, String location) {
		this.locationList.add(index, location);
	}	
	public void setLastPage (boolean lastPage) {
		this.lastPage = lastPage;
	}
	public void setMaxPage (int maxPage) {
		this.maxPage = maxPage;
	}
	public String[] getCode() {
		return codeList.toArray(new String[codeList.size()]);
	}
	public String[] getName() {
		return nameList.toArray(new String[nameList.size()]);
	}
	public String[] getWriter() {
		return writerList.toArray(new String[writerList.size()]);
	}

	public String[] getPublisher() {
		return publisherList.toArray(new String[publisherList.size()]);
	}

	public String[] getLocation() {
		return locationList.toArray(new String[locationList.size()]);
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