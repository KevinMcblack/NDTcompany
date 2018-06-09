package JavaBean;

import java.util.Date;

public class EvaluationBean {
    private int evaluationId, userId, companyId, orderId;
    private String title,content;
    private Date time;
    private String photo1;

    public int getEvaluationId() {
        return evaluationId;
    }

    public void setEvaluationId(int evaluationId) {
        this.evaluationId = evaluationId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getCompanyId() {
        return companyId;
    }

    public void setCompanyId(int companyId) {
        this.companyId = companyId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getTime() { return time; }

    public void setTime(Date time) { this.time = time; }

    public String getPhoto1() { return photo1; }

    public void setPhoto1(String photo1) { this.photo1 = photo1; }
}
