package com.java.strutsaction;

import com.java.bean.CompetitionScore;
import com.java.dao.DaoImpl;
import com.java.dao.IDao;
import com.opensymphony.xwork2.Action;
import com.sun.deploy.security.DeployManifestChecker;

/**
 * Created by CSC on 2016/10/29.
 */
public class competitionScore implements Action {
    CompetitionScore score = new CompetitionScore();

    public CompetitionScore getScore() {
        return score;
    }

    public void setScore(CompetitionScore score) {
        this.score = score;
    }

    @Override
    public String execute() throws Exception {
        IDao<CompetitionScore> dao = new DaoImpl<CompetitionScore>();
        dao.updateScore(score);
        return SUCCESS;
    }
}
