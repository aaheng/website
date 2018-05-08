package cn.website.page.pojo;

public class Message {
    private Integer id;
    private Integer from_id;
    private Integer to_id;
    private String content;
    private String create_time;
    private Integer has_read;//0代表未读.1代表已读
    private String conversation_id;
    private Integer is_delete;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getFrom_id() {
        return from_id;
    }

    public void setFrom_id(Integer from_id) {
        this.from_id = from_id;
    }

    public Integer getTo_id() {
        return to_id;
    }

    public void setTo_id(Integer to_id) {
        this.to_id = to_id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCreate_time() {
        return create_time;
    }

    public void setCreate_time(String create_time) {
        this.create_time = create_time;
    }

    public Integer getHas_read() {
        return has_read;
    }

    public void setHas_read(Integer has_read) {
        this.has_read = has_read;
    }

    public String getConversationId() {
        if (from_id > to_id) {
            return String.format("%d_%d", to_id, from_id);
        } else {
            return String.format("%d_%d", from_id, to_id);
        }
    }

    public void setConversation_id(String conversation_id) {
        this.conversation_id = conversation_id;
    }

    public Integer getIs_delete() {
        return is_delete;
    }

    public void setIs_delete(Integer is_delete) {
        this.is_delete = is_delete;
    }
}
