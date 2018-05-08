package cn.website.common.async;

import java.util.HashMap;
import java.util.Map;

//事件的载体,表示当时事件发生的现场
public class EventModel {
    private EventType type;
    private Integer actorId;
    private Integer entityType;
    private Integer entityId;
    private Integer entityOwnerId;

    //保存事件发生时的信息,扩展字段
    private Map<String,String> exts = new HashMap<String, String>();
    //扩展字段传入的时候有时候只是一个简单的字段,无需让外部直接访问map
    public EventModel setExt(String key,String value){
        exts.put(key, value);
        return this;
    }
    public String getExt(String key){
        return exts.get(key);
    }

    public EventType getType() {
        return type;
    }

    public EventModel setType(EventType type) {
        this.type = type;
        return this;
    }

    public Integer getActorId() {
        return actorId;
    }

    public EventModel setActorId(Integer actorId) {
        this.actorId = actorId;
        return this;
    }

    public Integer getEntityType() {
        return entityType;
    }

    public EventModel setEntityType(Integer entityType) {
        this.entityType = entityType;
        return this;
    }

    public Integer getEntityId() {
        return entityId;
    }

    public EventModel setEntityId(Integer entityId) {
        this.entityId = entityId;
        return this;
    }

    public Integer getEntityOwnerId() {
        return entityOwnerId;
    }

    public EventModel setEntityOwnerId(Integer entityOwnerId) {
        this.entityOwnerId = entityOwnerId;
        return this;
    }

    public Map<String, String> getExts() {
        return exts;
    }

    public EventModel setExts(Map<String, String> exts) {
        this.exts = exts;
        return this;
    }
}
