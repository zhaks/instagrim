package uk.ac.dundee.computing.aec.instagrim.stores;

import java.util.UUID;

public class Cmts {

    String login;
    String picUUID;
    java.util.UUID commentUUID = null;
    String commentText;
    String dateAdded;

    public void Cmts() {

    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPicUUID() {
        return picUUID;
    }

    public void setPicUUID(String picUUID) {
        this.picUUID = picUUID;
    }

    public UUID getCommentUUID() {
        return commentUUID;
    }

    public void setCommentUUID(UUID commentUUID) {
        this.commentUUID = commentUUID;
    }

    public String getCommentText() {
        return commentText;
    }

    public void setCommentText(String commentText) {
        this.commentText = commentText;
    }

    public String getDateAdded() {
        return dateAdded;
    }

    public void setDateAdded(String dateAdded) {
        this.dateAdded = dateAdded;
    }

    public void setCmt(String login, String commentText, String dateAdded) {
        this.commentText = commentText;
        this.login = login;
        this.dateAdded = dateAdded;
    }
}
