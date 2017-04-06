package com.java.test;


import com.java.bean.Member;
import com.java.dao.DaoImpl;
import com.java.dao.IDao;
import com.sun.xml.internal.bind.v2.runtime.output.SAXOutput;

import java.util.List;

public class test {

    public static void main(String[] args) {

		/*
         * Member member = new Member();
		 * 
		 * member.setName("csc"); DateFormat df = new
		 * SimpleDateFormat("yyyy-MM-dd"); Date date = new Date(); try { date =
		 * (Date) df.parse(df.format(date)); } catch (ParseException e1) {
		 * e1.printStackTrace(); } // member.setDate(date); //
		 * member.setDepartment("��ͨ��Ա"); IDao<Member> dao = new
		 * DaoImpl<Member>(); // dao.add(member); // dao.memberPresent(79);
		 * 
		 * Member m = new Member(); for (int i = 139; i < 150; i++) { m =
		 * dao.query(Member.class, i); m.setName(m.getName().trim());
		 * m.setPhone(m.getPhone().trim()); m.setCampus(m.getCampus().trim());
		 * m.setCollege(m.getCollege().trim());
		 * m.setDepartment(m.getDepartment().trim());
		 * m.setDormitory(m.getDormitory().trim());
		 * m.setGrade(m.getGrade().trim()); m.setMajor(m.getMajor().trim());
		 * m.setQq(m.getQq().trim()); m.setDate(date); dao.updateById(m); }
		 */

        IDao<Member> dao = new DaoImpl<Member>();
        List<Member> list= dao.queryDepartment("2");
        for(Member m:list){
            System.out.println(m.getName()+" QQ:"+m.getQq());
        }


		/*int i=1;
        for(Member m:list){
			if(m.getCampus().equals("东校区")){
				//System.out.println(i++ +" "+m.getId());
			//	System.out.print(m.getQq()+"@qq.com;");
			}

			if(m.getCampus().equals("中心校区")){
				///System.out.println(i++);
				System.out.println(m.getGrade()+";");
			}
		}
*/


    }
}



