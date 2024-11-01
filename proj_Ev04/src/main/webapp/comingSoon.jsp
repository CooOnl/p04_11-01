<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Coming Soon</title>
    <link rel="stylesheet" href="./style/style.css?v">
</head>
<body>
    <div id="wrap">

        <%
            String selectedDate = request.getParameter("selectD");
            String openYear = "";
            String openMonth = "";
            String openDay = "";
            String daysLeft = "";

            
            java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
            java.util.Calendar todayCal = java.util.Calendar.getInstance();
            
            
            todayCal.set(java.util.Calendar.HOUR_OF_DAY, 0);   
            todayCal.set(java.util.Calendar.MINUTE, 0);        
            todayCal.set(java.util.Calendar.SECOND, 0);        
            todayCal.set(java.util.Calendar.MILLISECOND, 0);   
            
            java.util.Date today = todayCal.getTime(); 

            int todayYear = todayCal.get(java.util.Calendar.YEAR);
            int todayMonth = todayCal.get(java.util.Calendar.MONTH) + 1; 
            int todayDay = todayCal.get(java.util.Calendar.DAY_OF_MONTH);

            
                java.util.Date openDate = sdf.parse(selectedDate);
                long diff = openDate.getTime() - today.getTime();
                long leftDays = diff / (1000 * 60 * 60 * 24);

                java.util.Calendar cal = java.util.Calendar.getInstance();
                cal.setTime(openDate);
                openYear = String.valueOf(cal.get(java.util.Calendar.YEAR));
                openMonth = String.valueOf(cal.get(java.util.Calendar.MONTH) + 1); 
                openDay = String.valueOf(cal.get(java.util.Calendar.DAY_OF_MONTH));
                daysLeft = String.valueOf(leftDays);
            
        %>

        <p class="heig">Today
            <input type="text" class="year" id="todayYear" value="<%= todayYear %>" readonly>년 
            <input type="text" class="mon" id="todayMon" value="<%= todayMonth %>" readonly>월 
            <input type="text" class="day" id="todayDay" value="<%= todayDay %>" readonly>일
        </p>
        <p class="heig">Open 
            <input type="text" class="year" id="openYear" value="<%= openYear %>" readonly>년 
            <input type="text" class="mon" id="openMon" value="<%= openMonth %>" readonly>월 
            <input type="text" class="day" id="openDay" value="<%= openDay %>" readonly>일
        </p>
        <h1 class="ft2">COMING SOON</h1>
        <h3>오픈 <%= daysLeft %>일전</h3>
    </div>
</body>
</html>
