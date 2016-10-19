/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uk.ac.dundee.computing.aec.instagrim.models;

import com.datastax.driver.core.BoundStatement;
import com.datastax.driver.core.Cluster;
import com.datastax.driver.core.PreparedStatement;
import com.datastax.driver.core.ResultSet;
import com.datastax.driver.core.Row;
import com.datastax.driver.core.Session;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import uk.ac.dundee.computing.aec.instagrim.lib.AeSimpleSHA1;
import uk.ac.dundee.computing.aec.instagrim.stores.Pic;
import java.util.Random;
import java.security.SecureRandom;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Administrator
 */
public class User {

    Cluster cluster;

    public User() {

    }

    public boolean RegisterUser(String username, String Password) {
        if (checkUsername(username)) {
            String saltStr = null;
            AeSimpleSHA1 sha1handler = new AeSimpleSHA1();
            String EncodedPassword = null;
            Random sr = new SecureRandom();
            byte[] saltLi = new byte[8];
            sr.nextBytes(saltLi);
            String s = "";

            for (int i = 1; i < 8; i++) {
                s = s + saltLi[i];
            }
            saltStr = s;
            try {
                EncodedPassword = sha1handler.SHA1(Password + saltStr);
            } catch (UnsupportedEncodingException | NoSuchAlgorithmException et) {
                System.out.println("Can't check your password");
                return false;
            }

            Session session = cluster.connect("instagrim");
            PreparedStatement ps = session.prepare("insert into userprofiles (login,password,salt) Values(?,?,?)");

            BoundStatement boundStatement = new BoundStatement(ps);
            session.execute(boundStatement.bind(username, EncodedPassword, saltStr));
            //We are assuming this always works.  Also a transaction would be good here !

            return true;
        } else {
            return false;
        }
    }

    public boolean checkUsername(String name) {
        Session session = cluster.connect("instagrim");
        PreparedStatement ps = session.prepare("select login from userprofiles where login =?");
        ResultSet rs = null;
        BoundStatement boundStatement = new BoundStatement(ps);
        rs = session.execute(boundStatement.bind(name));
        if (rs.isExhausted()) {
            return false;
        } else {
            return true;
        }

    }

    public boolean IsValidUser(String username, String Password) {
        AeSimpleSHA1 sha1handler = new AeSimpleSHA1();
        String EncodedPassword = null;

        Session session = cluster.connect("instagrim");
        PreparedStatement ps = session.prepare("select * from userprofiles where login =?");
        ResultSet rs = null;
        BoundStatement boundStatement = new BoundStatement(ps);
        rs = session.execute(boundStatement.bind(username));
        if (rs.isExhausted()) {
            return false;
        } else {
            for (Row row : rs) {

                String StoredPass = row.getString("password");
                String saltedPass = row.getString("salt");
                try {
                    EncodedPassword = sha1handler.SHA1(Password + saltedPass);
                } catch (UnsupportedEncodingException | NoSuchAlgorithmException et) {
                    System.out.println("Can't check your password");
                    return false;
                }
                if (StoredPass.compareTo(EncodedPassword) == 0) {
                    return true;
                }
            }
        }

        return false;
    }

    public void setCluster(Cluster cluster) {
        this.cluster = cluster;
    }

}
