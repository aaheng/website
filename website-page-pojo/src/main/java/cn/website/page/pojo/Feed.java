package cn.website.page.pojo;
import com.alibaba.fastjson.JSONObject;

public class Feed {
    private int id;
    private int type;
    private int userId;
    private String create_time;
    private String data;
    private JSONObject dataJSON = null;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getData() {
        return data;
    }

    public String getCreate_time() {
        return create_time;
    }

    public void setCreate_time(String create_time) {
        this.create_time = create_time;
    }

    public JSONObject getDataJSON() {
        return dataJSON;
    }

    public void setDataJSON(JSONObject dataJSON) {
        this.dataJSON = dataJSON;
    }

    public void setData(String data) {
        this.data = data;
        dataJSON = JSONObject.parseObject(data);
    }
    public String get(String key) {
        return dataJSON == null ? null : dataJSON.getString(key);
    }
}
