package learn.pets.domain;

import java.util.ArrayList;

public class Result<T> {

    private ResultType type = ResultType.SUCCESS;
    private T payload;
    private ArrayList<String> messages = new ArrayList<>();

    public ResultType getType() {
        return type;
    }

    public T getPayload() {
        return payload;
    }

    public void setPayload(T payload) {
        this.payload = payload;
    }

    public ArrayList<String> getMessages() {
        return new ArrayList<>(messages);
    }

    public void addMessage(String message, ResultType type) {
        messages.add(message);
        this.type = type;
    }
}
