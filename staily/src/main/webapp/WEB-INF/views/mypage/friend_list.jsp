<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/tags.jspf" %>
<%@ include file="/WEB-INF/views/mypage/include/include_top.jsp" %>
<script type="text/javascript">
	$(function(){
		$('#deleteFriendBtn').click(function(e){
			var size = document.getElementsByName("friend_check").length;
			for (var i = 0; i < size; i++) {
				if(document.getElementsByName("friend_check")[i].checked == true){
					var fPk = document.getElementsByName("friend_check")[i].value;
					friend_delete_function(fPk);
				}
			}
			
		});
		function friend_delete_function(fPk){
			$.ajax({
				url : "friend_delete",
				method : "GET",
				data : "fPk="+fPk,
				dataType : "text",
				success : function(result){
					location.reload();
				}
			})
		};
		
		$(".dropdown-item").click(function(e){
			window.open("message2", "_blank","width=800, height=700, left=1000, toolbar=no, menubar=no, scrollbars=no, resizable=yes"

					);
		});
		
		$('#searchword').focus(function(e){
			this.value="";
			$(".add").remove();
			//$(".dropdown-menu").hide();
			
		});

		
		$('#searchword').on({
			keyup : function(e){
				if(e.keyCode == 13){
					var mId = $('#searchword').val();
					alert(mId);
					if(mId != ""){
						$.ajax({
							url : "friend_find",
							method : "GET",
							data : "mId="+mId,
							dataType : "text",
							success : function(result){
								if(result==""){
									$('#results').prepend("<span class='add'>"+"없는 회원입니다"+"</span>");
									return;
								}else{
									$('#results').prepend("<span data-toggle='dropdown' class='add'>"+result+"</span>");
								}
							},
							error : function(result){
								$('#results').prepend("<span>"+"다시 입력해주세요"+"</span>");
							}
							
						})
					}else{
						$('#results').prepend("<span class='add'>"+"없는 회원입니다"+"</span>");
					}
				}
			}
		});
		/*
		$('#results').focusout(function() {
			  $('.dropdown-menu').addClass('hidden');
			});
*/
		
		
	})
</script>

        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <!-- 친구찾기 -->
          <h1 class="h3 mb-2 text-gray-800">친구찾기</h1>
          <!--  
		  	<form>
  				<div class="form-group">
			    <label for="exampleInputEmail1">친구검색</label>
			    <input type="text" class="form-control" id="exampleInputEmail1" placeholder="아이디를 입력하세요">
			  </div>
			   <button type="submit" class="btn btn-default">제출</button>
			</form>
			-->
			<!--  
			<div class="btn-group">
			  아이디<input id="searchinput" type="search" class="form-control">
			 	 <span id="searchclear" class="glyphicon glyphicon-remove-circle"></span>
			</div>
			<div id="results"></div>
			-->
			<div id="search" class="tab_content">
				<input type="text" id="searchword" style="width:300px;" value="아이디를 입력하세요" >
			</div>
			<div class="dropdown" id="results">
				<div class="dropdown-menu">
				  	<a class="dropdown-item" href="#">친구추가</a>
				  	<a class="dropdown-item" href="#">쪽지보내기</a>
				</div>
			</div>
			<!--
			<div class="dropdown" id="results">
			  <button class="dropbtn"></button>
			  <div class="dropdown-content">
			    <a href="#">홈</a>
			    <a href="#">회사소개</a>
			    <a href="#">제품소개</a>
			    <a href="#">오시는길</a>
			  </div>
			</div>
			-->
			<br>
			<br>	          
          <!-- 친구찾기 -->
          <h1 class="h3 mb-2 text-gray-800">친구리스트페이지</h1>
          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">친구리스트</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th></th>
                      <th>친구</th>
                    </tr>
                  </thead>
                  <tbody>
                  	<c:forEach var="friend" items="${data}">
                  	 <tr>
                  	  <td><input type="checkbox" name="friend_check" value="${friend.fPk}"></td>
                      <td >
                      <div class="dropdown">
							<buttion class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
							 	${friend.mName}
							 </button>
							 <div class="dropdown-menu">
							  	<a class="dropdown-item" href="#">쪽지보내기</a>
							</div>
					  </div>
	
                    </td>
                      
                    </tr>
                  	</c:forEach>
                  </tbody>
                </table>
                <input type="button" class="btn btn-outline btn-primary pull-right" value="삭제" id="deleteFriendBtn">
              </div>
            </div>
          </div>

        </div>
        <!-- /.container-fluid -->

      </div>
      
      <!-- End of Main Content -->

      <!-- Footer -->
      <%@ include file="/WEB-INF/views/mypage/include/include_footer.jsp" %>
