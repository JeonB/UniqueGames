<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Unique Games</title>
    <link rel="stylesheet" type="text/css" href="http://localhost:9000/uniquegames/css/unigames.css">
	<style>
		#btn-hearder-search {
			border:none;
			background-color: rgba( 255, 255, 255, 0 );
			width: 40px;
		    padding: 4px 6px 4px 6px;
		    
		}
		#input-search {
	        background-image: url('http://localhost:9000/uniquegames/images/icon_search_header.png');
	        background-repeat: no-repeat;
	        background-position: 15px center; 
	        background-size: 16px; 
	        width: 360px;
	        height: 46px;
	        padding: 2px 2px 2px 40px;
	        position: relative;
	        z-index: 2;
	        border-radius: 40px;
	        border: 1px solid #707070;
	    }
	
	    .search-menu {
	        position: absolute;
	        float: right;
	        top: 60px;
	        right: 170px;
   		}

	</style>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body>
    <header>
        <div id="header-top-menu">
            <nav id="nav1">
                <ul>
                    <li><a href="/uniquegames/login.do">Login</a></li>
                    <li><a href="/uniquegames/join.do">Join</a></li>
                    <li><a href="/uniquegames/myPage.do"><img src="/uniquegames/images/img_icon_mypage.png"></a></li>
                    <li><a href="/uniquegames/cart.do"><img src="/uniquegames/images/img_icon_cart.png"></a></li>
                    <li><button type="button" id="btn-hearder-search" onclick="toggleSearch()"><img src="/uniquegames/images/img_icon_search.png"></button></li>
                </ul>
            </nav>
            <div class="search-menu" id="search-container">
    			<input type="text" id="input-search" placeholder="검색하실 게임 이름을 입력해주세요.">
    		</div>
        </div>
        <div id="hearder-logo">
            <a href="/uniquegames/index.do" target="_parent">
                <img src="/uniquegames/images/img_title_logo.png">
            </a>
        </div>
        <div id="header-bottom-menu">
            <nav id="nav2">
                <ul>
                    <li><a href="/uniquegames/topgame.do">Top Game</a></li>
                    <li><a href="/uniquegames/alllist.do">All List</a></li>
                    <li><a href="/uniquegames/index.do#menu-main1">Recommendations</a></li>
                    <li><a href="/uniquegames/notice_list.do">Notice</a></li>
                </ul>
            </nav>
        </div>
    </header>
    <script>
        // 검색창 토글 함수
        function toggleSearch() {
            var searchContainer = $('#search-container');
            searchContainer.toggle();
        }

        // 엔터 키 이벤트 핸들러
        $(document).on('keydown', '#input-search', function(event) {
            if (event.which === 13) {
                var inputText = $(this).val();
                console.log('입력한 텍스트:', inputText);
                // 입력한 텍스트를 원하는 방식으로 처리할 수 있습니다.
                // 예: 서버로 전송, 검색 실행 등
            }
        });

        // 페이지 로드 시 검색창 초기화
        $(document).ready(function() {
            $('#search-container').hide();
        });
    </script>
</body>
</html>