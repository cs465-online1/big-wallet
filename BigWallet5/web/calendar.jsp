<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.GregorianCalendar" %>

<%
    Calendar ca = new GregorianCalendar();
    int iYear=ca.get(Calendar.YEAR);
    int iMonth=ca.get(Calendar.MONTH);

    GregorianCalendar cal = new GregorianCalendar (iYear, iMonth, 1);

    int days=cal.getActualMaximum(Calendar.DAY_OF_MONTH);
    int weekStartDay=cal.get(Calendar.DAY_OF_WEEK);

    cal = new GregorianCalendar (iYear, iMonth, days);
    int iTotalweeks=cal.get(Calendar.WEEK_OF_MONTH);

%>
<html>
<head>
    <title>BigWallet Payments</title>
    <script>
        function goTo()
        {
            document.frm.submit()
        }
    </script>
</head>

<body>
<form name="frm" method="post">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td width="25%">&nbsp;</td>
            <td width="45%">&nbsp;</td>
            <td width="30%">&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="6%">Year</td>
                            <td width="7%">
                                <select name="iYear" onChange="goTo()">
                                    <%
                                        // Range of the calendar - current year +/- 50
                                        for(int iy=iYear-50;iy<=iYear+50;iy++)
                                        {
                                            if(iy==iYear)
                                            {
                                    %>
                                    <option value="<%=iy%>" selected="selected"><%=iy%></option>
                                    <%
                                    }
                                    else
                                    {
                                    %>
                                    <option value="<%=iy%>"><%=iy%></option>
                                    <%
                                            }
                                        }
                                    %>
                                </select></td>
                            <td width="73%" align="center" style="color:#4E96DE"><h3><%=new SimpleDateFormat("MMMM").format(new Date(2008,iMonth,01))%> <%=iYear%></h3></td>
                            <td width="6%">Month</td>
                            <td width="8%">
                                <select name="iMonth" onChange="goTo()">
                                    <%
                                        // print month in combo box to change month in calendar
                                        for(int im=0;im<=11;im++)
                                        {
                                            if(im==iMonth)
                                            {
                                    %>
                                    <option value="<%=im%>" selected="selected"><%=new SimpleDateFormat("MMMM").format(new Date(2008,im,01))%></option>
                                    <%
                                    }
                                    else
                                    {
                                    %>
                                    <option value="<%=im%>"><%=new SimpleDateFormat("MMMM").format(new Date(2008,im,01))%></option>
                                    <%
                                            }
                                        }
                                    %>
                                </select></td>
                        </tr>
                    </table></td>
                </tr>
                <tr>
                    <td><table align="center" border="1" cellpadding="3" cellspacing="0" width="100%">
                        <tbody>
                        <tr>
                            <th>Sun</th>
                            <th>Mon</th>
                            <th>Tue</th>
                            <th>Wed</th>
                            <th>Thu</th>
                            <th>Fri</th>
                            <th>Sat</th>
                        </tr>
                        <%
                            int cnt =1;
                            for(int i=1;i<=iTotalweeks;i++)
                            {
                        %>
                        <tr>
                            <%
                                for(int j=1;j<=7;j++)
                                {
                                    if(cnt<weekStartDay || (cnt-weekStartDay+1)>days)
                                    {
                            %>
                            <td align="center" height="35">&nbsp;</td>
                            <%
                            }
                            else
                            {
                            %>
                            <td align="center" height="35" id="day_<%=(cnt-weekStartDay+1)%>"><span><%=(cnt-weekStartDay+1)%></span></td>
                            <%
                                    }
                                    cnt++;
                                }
                            %>
                        </tr>
                        <%
                            }
                        %>
                        </tbody>
                    </table></td>
                </tr>
            </table></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</form>
</body>
</html>