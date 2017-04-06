package com.java.strutsaction;

import com.java.bean.CompetitionTeam;
import com.java.dao.DaoImpl;
import com.java.dao.IDao;
import com.opensymphony.xwork2.Action;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by CSC on 2016/10/18.
 */
public class competitionTeam implements Action {
    public CompetitionTeam getTeam() {
        return team;
    }

    public void setTeam(CompetitionTeam team) {
        this.team = team;
    }

    CompetitionTeam team;

    @Override
    public String execute() throws Exception {

        IDao<CompetitionTeam> dao = new DaoImpl<CompetitionTeam>();
        team.setLikeCount(";");
        dao.add(team);
        HttpServletResponse response = ServletActionContext.getResponse();
        Cookie id = new Cookie("id", team.getLeaderId() + "");
        id.setMaxAge(31536000);
        id.setPath("/");
        response.addCookie(id);

        return SUCCESS;
    }
}
