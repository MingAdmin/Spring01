<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Arial', sans-serif;
    }

    a {
        text-decoration: none;
        color: inherit;
    }

    header {
        width: 100%;
        height: 80px;
        background-color: #FFE5CC;
        padding: 0 5%;
        display: flex;
        align-items: center;
        justify-content: space-between;
    }

    #logo h1 {
        font-weight: bold;
        font-size: 1.5em;
        color: #333;
    }

    nav {
        display: flex;
    }

    #topMenu {
        display: flex;
        list-style: none;
    }

    #topMenu > li {
        position: relative;
        margin-left: 150px;
    }

    #topMenu > li > a {
        padding: 10px 15px;
        color: #333;
        font-weight: bold;
        transition: color 0.3s;
    }

    #topMenu > li > a:hover {
        color: #007BFF;
    }

    #topMenu > li > ul {
        position: absolute;
        top: 100%;
        left: -45px;
        list-style: none;
        background-color: #fff;
        border: 1px solid #ddd;
        box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
        display: none;
        width: 200px;  
        padding: 5px 0;
    }

    #topMenu > li:hover > ul {
        display: block;
    }

    #topMenu > li > ul > li > a {
        padding: 10px 20px;
        display: block;
        color: #666;
        transition: background-color 0.3s;
    }

    #topMenu > li > ul > li > a:hover {
        background-color: #f5f5f5;
    }
    #topMenu > li > ul > li {
    border-bottom: 1px solid #d1d1d1;
	}

	#topMenu > li > ul > li:last-child {
	    border-bottom: none;
	}
</style>

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
                    <li><a href="/customer/joinexplanation.do">회사위치</a></li>
                </ul>
            </li>
            <li><a href="#">수강신청</a>
                <ul>
                    <li><a href="/course/courseUserList.do">수강신청</a></li>
                    <li><a href="/course/courseList.do">강좌등록</a></li>
                </ul>
            </li>
            <li><a href="#">이용안내</a>
                <ul>
                    <li><a href="#">신청가이드</a></li>
                    <li><a href="/qna/qnaList.do">자주하는질문</a></li>
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
