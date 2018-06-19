<%@ page contentType="text/html;charset=GB2312"%>
<html>
<head><title>database</title>
<body>
<!--首先导入一些必要的packages-->
<%@ page info="database handler"%>
<%@ page import="java.io.*"%>
<%@ page import="java.lang.*"%>
<%@ page import="java.util.*"%>
<!--告诉编译器使用SQL包--> 
<%@ page import="java.sql.*"%>
<%     
        String url="jdbc:odbc:majiaxie";
        //////////////////////////////////////////////////////////////////////////////////////////////
        String user ="";//数据库用户名
        String password = "";//数据库用户密码
        String sqlquery = "select * from orderform";
        /////////////////////////////////////////////////////////////////////////////////////////////
        // String sname=new String(request.getParameter("name")).trim(); 
        // String num=new String(request.getParameter("num")).trim(); 
        // String dept=new String(request.getParameter("dept")).trim(); 
        // String major=new String(request.getParameter("major")).trim(); 
        // String email=new String(request.getParameter("email")).trim(); 
        // String score=new String(request.getParameter("score")).trim(); 
        // out.println("<tr><td>"+sname+"</td><td></br>"+num+"</td><td></br>"+dept+"</td><td></br>"+major+"</td><td></br>"+email+"</td></tr></br>"+score+"</td><td>");
        ///////////////////////////////////主要sql语句//////////////////////////////////////////////
        String sqlinsert="insert into student_info(sname,num,dept,major,email,score) values(\'"+sname+"\',\'"+num+"\',\'"+dept+"\',\'"+major+"\',\'"+email+"\',\'"+score+"\')";
        try{    //这里的异常处理语句是必需的.否则不能通过编译!  
           //Class.forName("com.microsoft.jdbc.sqlserver.SQLServerDriver");
             Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            ///////////////////////////////////////////////////////////////////////////////////////////////
            out.println( "类实例化成功!" );
            Connection con = DriverManager.getConnection( url, user, password );
            out.println( "创建连接对像成功!" );
            Statement st = con.createStatement();
            out.println( "创建Statement成功!" );
            st.executeUpdate(sqlinsert);//插入数据
            out.println( "操作数据表，数据插入成功!" );
            out.println(sqlinsert);
            ResultSet rs = st.executeQuery( sqlquery );
            out.println( "操作数据表，查询成功!" );
            out.println( "----------------!" );
            out.println("<table border=1 width=600>");
            while (rs.next()){
            String col1 = rs.getString("sname");
            String col2 = rs.getString("num");
            String col3 = rs.getString("dept");
            String col4 = rs.getString("major");
            String col5 = rs.getString("score");
            //打印所显示的数据
            out.println("<tr><td>"+col1+"</td><td>"+col2+"</td><td>"+col3+"</td><td>"+col4+"</td><td>"+col5+"</td></tr>");
          }
          out.println("</table>");
          rs.close();
          st.close();
          con.close();
        }
        catch(Exception err){
            err.printStackTrace();
        }
%>
</body>
</html>