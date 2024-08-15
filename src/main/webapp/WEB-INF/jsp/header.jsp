<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>
<style>
#topHeader {
    background-color: #ffffff;
    padding: 5px 0;
    font-size: 0.9em;
    border-bottom: 1px solid #e0e0e0;
}

#topRightButtons {
    list-style-type: none;
    display: flex;
    justify-content: flex-end;
    padding-right: 5%;
}

#topRightButtons li {
    padding: 0 10px;
}

#topRightButtons li a {
    color: #333; 
    transition: color 0.3s; 
    padding: 5px 10px; 
    border: 1px solid #e0e0e0; 
    border-radius: 5px;
}

#topRightButtons li a:hover {
    color: #007BFF;
    border-color: #007BFF;
}
</style>
	<div id="topHeader">
        <ul id="topRightButtons">
            <li>
                <%
                String m_id = (String) session.getAttribute("m_id");
                if(m_id != null) {
                %>
                <a href="/login/login.do"><%= m_id %>님이 접속하셨습니다.</a>
                <% 
                } else {
                %>
                <a href="/login/login.do">로그인해주세요.</a>
                <% 
                }
                %>
            </li>
        </ul>
    </div>
    <div id="logo">
        <a href="/board/index.do">
            <h1>인제문화센터</h1>
        </a>
    </div>
    <nav>
        <ul id="topMenu">
        	<li><a href="#">사업소개</a>
                <ul>
                    <li><a href="/board/introduce.do">회사소개</a></li>
                    <li><a href="/board/map.do">회사위치</a></li>
                </ul>
            </li>
            <li><a href="/course/courseUserList.do">수강신청</a>
            </li>
            <li><a href="#">이용안내</a>
                <ul>
                    <li><a href="/qna/qnaList.do">Qna게시판</a></li>
                </ul>
            </li>
            <li><a href="#">커뮤니티</a>
                <ul>
                    <li><a href="/board/openBoardList.do">공지사항</a></li>
                    <li><a href="/event/eventList.do">이벤트</a></li>
                    <li><a href="/review/reviewList.do">수강후기</a></li>
                </ul>
            </li>
        </ul>
    </nav>
</header>
