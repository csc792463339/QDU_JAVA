package com.java.strutsaction;

import com.java.bean.CompetitionTeam;
import com.java.dao.DaoImpl;
import com.java.dao.IDao;
import com.opensymphony.xwork2.Action;

/**
 * Created by CSC on 2016/10/25.
 */
public class likeTeam implements Action {

    String mid;

    public String getMid() {
        return mid;
    }

    public void setMid(String mid) {
        this.mid = mid;
    }

    @Override
    public String execute() throws Exception {
        IDao dao = new DaoImpl();
        CompetitionTeam t = dao.getCurrentTeam();
        String like = t.getLikeCount().trim();
        mid = mid.trim();
        int i = Integer.parseInt(mid);
        if ((i == t.getLeaderId()) || (i == t.getMember1Id()) || (i == t.getMember2Id()) || (i == t.getMember3Id()) || (i == t.getMember4Id())) {
            return SUCCESS;
        } else {
            if (like.equals(";")) {
                like = mid + ";";
                t.setLikeCount(like);
                dao.update(t);
            } else {
                String[] likes = like.split(";");
                for (String id : likes) {
                    if (mid.equals(id)) {
                        return SUCCESS;
                    }
                }
                like = like + mid + ";";
                t.setLikeCount(like);
                dao.update(t);
            }
            return SUCCESS;
        }
    }
}
