package uk.ac.dundee.computing.aec.instagrim.models;

/*
 * Expects a cassandra columnfamily defined as
 * use keyspace2;
 CREATE TABLE Tweets (
 user varchar,
 interaction_time timeuuid,
 tweet varchar,
 PRIMARY KEY (user,interaction_time)
 ) WITH CLUSTERING ORDER BY (interaction_time DESC);
 * To manually generate a UUID use:
 * http://www.famkruithof.net/uuid/uuidgen
 */
import com.datastax.driver.core.BoundStatement;
import com.datastax.driver.core.Cluster;
import com.datastax.driver.core.PreparedStatement;
import com.datastax.driver.core.ResultSet;
import com.datastax.driver.core.Row;
import com.datastax.driver.core.Session;
import java.util.Date;

import uk.ac.dundee.computing.aec.instagrim.lib.*;
import uk.ac.dundee.computing.aec.instagrim.stores.Cmts;
//import uk.ac.dundee.computing.aec.stores.TweetStore;

public class CommentModel {

    Cluster cluster;

    public void CommentModel() {

    }

    public void setCluster(Cluster cluster) {
        this.cluster = cluster;
    }

    public void insertComment(String comment, String picUUID, String user) {
        Session session = cluster.connect("instagrim");
        Convertors convertor = new Convertors();
        PreparedStatement psInsertComment = session.prepare("insert into comments (commentuuid, commenttext, picuuid, login) values(?,?,?,?)");

        java.util.UUID commentID = convertor.getTimeUUID();
        BoundStatement bsInsertComment = new BoundStatement(psInsertComment);
        session.execute(bsInsertComment.bind(commentID, comment, picUUID, user));
        session.close();

    }

    public java.util.LinkedList<Cmts> getPicComments(String picID) {
        java.util.LinkedList<Cmts> comments = new java.util.LinkedList<>();

        Session session = cluster.connect("instagrim");
        try {
            ResultSet rs = null;
            PreparedStatement ps = null;
            ps = session.prepare("select login, commenttext, commentadded from comments where picuuid =? ALLOW FILTERING");
            BoundStatement boundStatement = new BoundStatement(ps);
            rs = session.execute(boundStatement.bind(picID));
            if (rs.isExhausted()) {
                System.out.println("No Comments returned");
                return null;
            } else {
                for (Row row : rs) {
                    Cmts cmt = new Cmts();
                    cmt.setLogin(row.getString("login"));
                    cmt.setCommentText(row.getString("commentText"));
                    comments.add(cmt);
                }
            }
        } catch (Exception et) {
            System.out.println("Can't get Comments" + et);
            return null;
        }
        session.close();

        return comments;

    }

}
