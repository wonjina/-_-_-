import java.util.ArrayList;

public class Board {
	private ArrayList<Integer> numList = new ArrayList<Integer>();
	private ArrayList<String> nameList = new ArrayList<String>();
	private ArrayList<String> contentList = new ArrayList<String>();
	private ArrayList<String> openList = new ArrayList<String>();
	private ArrayList<String> writerList = new ArrayList<String>();
	private ArrayList<String> answerList = new ArrayList<String>();
	private ArrayList<String> dateList = new ArrayList<String>();
	
	private boolean lastPage = false;
	private int maxPage = 0;
	
	public Board()	{
	}
	
	public void setNum (int index, Integer num) {
		this.numList.add(index, num);
	}
	public void setName (int index, String name) {
		this.nameList.add(index, name);
	}
	public void setContent (int index, String content) {
		this.contentList.add(index, content);
	}
	public void setOpen (int index, String open) {
		this.openList.add(index, open);
	}	
	public void setWriter (int index, String writer) {
		this.writerList.add(index, writer);
	}
	public void setAnswer (int index, String answer) {
		this.answerList.add(index, answer);
	}
	public void setDate (int index, String date) {
		this.dateList.add(index, date);
	}
	
	public void setLastPage (boolean lastPage) {
		this.lastPage = lastPage;
	}
	public void setMaxPage (int maxPage) {
		this.maxPage = maxPage;
	}
	
	public Integer[] getNum() {
		return numList.toArray(new Integer[numList.size()]);
	}
	public String[] getName() {
		return nameList.toArray(new String[nameList.size()]);
	}
	public String[] getContent() {
		return contentList.toArray(new String[contentList.size()]);
	}
	public String[] getOpen() {
		return openList.toArray(new String[openList.size()]);
	}
	public String[] getWriter() {
		return writerList.toArray(new String[writerList.size()]);
	}
	public String[] getAnswer() {
		return answerList.toArray(new String[answerList.size()]);
	}
	public String[] getDate() {
		return dateList.toArray(new String[dateList.size()]);
	}
	public boolean isLastPage() {
		return lastPage;
	}
	public int getMaxPage() {
		return maxPage;
	}
	public int getListSize()	{
		return nameList.size();
	}
}
