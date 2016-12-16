<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>


<html lang="ko">
   <head>
      <meta charset="utf-8"/>
      <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
      <meta name="viewport" content="width=device-width, initial-scale=1"/>
      <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->

      <link rel="icon" href="resources/image/favicon.ico" />
      <title>빵셔틀</title>
      <!-- 부트스트랩 -->
      <!-- 합쳐지고 최소화된 최신 CSS -->
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"/>
      <!-- 부가적인 테마 -->
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"/>
      <!-- Custom styles for this template -->
      <link href="resources/css/cover.css" rel="stylesheet"/>

      <!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
      <!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
      <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
      <![endif]-->
   </head>
   <body>
      <div class="site-wrapper">

         <div class="site-wrapper-inner">

            <div class="cover-container">

               <div class="masthead clearfix">
                  <div class="inner">
                     <a href="/BreadShuttle">
                        <h2 class="masthead-brand">빵셔틀</h2>
                     </a>
                     <nav class="nav nav-masthead">
                        <div class="col-md-9">
                           <a class="nav-link active" href="#">Home</a>
                           <a class="nav-link" href="breadrequest">빵신청</a>

                           <% if (session.getAttribute("auth") == null) { %>
                           <a class="nav-link" href="" data-toggle="modal" data-target=".signup-modal">회원가입</a>
                           <% } else { %>
                           <a class="nav-link" href="mypage">마이 페이지</a>
                           <% } %>
                        </div>
                        <div class="col-md-3">
                           <% if (session.getAttribute("auth") == null) { %>
                           <button class="btn btn-primary" href="" data-toggle="modal" data-target=".login-modal">로그인</button>
                           <% } else { %>
                           <button class="btn btn-primary" href="" onclick="logOut()">로그아웃</button>
                           <% } %>
                        </div>
                     </nav>
                  </div>
               </div>

               <div class="inner cover">
                  <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                     <!-- Indicators -->
                     <ol class="carousel-indicators">
                        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                     </ol>

                     <!-- Wrapper for slides -->
                     <div class="carousel-inner" role="listbox">
                        <div class="item active">
                           <img src="resources/image/bread1.jpg" alt="First slide" />
                           <div class="carousel-caption">
                              ...
                           </div>
                        </div>
                        <div class="item">
                           <img src="resources/image/bread1.jpg" alt="Second slide" />
                           <div class="carousel-caption">
                              ...
                           </div>
                        </div>
                        <div class="item">
                           <img src="resources/image/bread1.jpg" alt="Third slide" />
                           <div class="carousel-caption">
                              ...
                           </div>
                        </div>
                     </div>

                     <!-- Controls -->
                     <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                     </a>
                     <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                     </a>
                  </div>
               </div>

               <div class="mastfoot">
                  <div class="inner">
                     <p>2016 Database Project <a href="/BreadShuttle">빵셔틀</a></p>
                     <p>by <a href="#">이종현 이현석 이우진 정상현 이정한</a>.</p>
                  </div>
               </div>
            </div>

         </div>
      </div>

      <!-- login modal -->
      <div class="modal fade login-modal" id="loingModal" tabindex="-1" role="dialog" aria-labelledby="loingModalLabel" aria-hidden="true">
         <div class="modal-dialog">
            <div class="modal-content">
               <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                  <h4 class="modal-title" id="loingModalLabel">로그인 해주세요.</h4>
               </div>
               <form action="/BreadShuttle/login" class="form-signin" method="post">
                  <div class="modal-body">
                     <label for="inputEmail">이메일</label>
                     <input type="email" name="email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus />
                     <label for="inputPassword" class="">비밀번호</label>
                     <input type="password" name="pwd" id="inputPassword" class="form-control" placeholder="Password" required />
                  </div>
                  <div class="modal-footer">
                     <button id="btnSignIn" class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
                  </div>
               </form>
            </div>
         </div>
      </div>
      <%-- /login modal --%>

      <%-- sing up modal --%>
      <div class="modal fade signup-modal" id="signupModal" tabindex="-1" role="dialog" aria-labelledby="signupModalLabel" aria-hidden="true">
         <div class="modal-dialog">
            <div class="modal-content">
               <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                  <h4 class="modal-title" id="signupModalLabel">회원가입</h4>
               </div>
               <form action="/BreadShuttle/signup" id="signupForm" class="form-horizontal" method="post">
                  <div class="modal-body">
                     <div class="form-group">
                        <div class="radio col-md-3 col-md-offset-2">
                           <label class="radio-inline" id="st">
                              <input type="radio" name="stORba" id="stORba1" value="student" checked>
                              학생
                           </label>
                           <label class="radio-inline" id="ba">
                              <input type="radio" name="stORba" id="stORba2" value="bakery">
                              빵집
                           </label>
                        </div>
                     </div>

                     <div class="form-group">
                        <label class="col-md-2 col-md-offset-2" for="inputEmail">이메일</label>
                        <div class="col-md-5">
                           <input type="email" name="email" id="inputEmail" class="form-control" placeholder="breadshuttle@example.com" required autofocus="true" />
                        </div>
                     </div>

                     <div class="form-group">
                        <label for="inputPassword" class="col-md-2 col-md-offset-2" for="inputPassword">비밀번호</label>
                        <div class="col-md-5">
                           <input type="password" name="password" id="inputPassword" class="form-control" placeholder="비밀번호" required />
                        </div>
                     </div>

                     <div class="form-group">
                        <label for="inputPasswordConfirm" class="col-md-2 col-md-offset-2" for="inputPasswordConfirm">비밀번호 확인</label>
                        <div class="col-md-5">
                           <input type="password"
                              name="password" id="inputPasswordConfirm" class="form-control"
                              placeholder="비밀번호를 한번 더 입력 해주세요."
                              data-toggle="popover" data-placement="left" data-content="비밀번호를 확인해주세요." required />
                        </div>
                     </div>

                     <div class="form-group" id="fgName">
                        <label class="col-md-2 col-md-offset-2" for="inputName" id="inputNameLabel">이름</label>
                        <div class="col-md-5">
                           <input type="text" name="name" id="inputName" class="form-control" placeholder="이름" required/>
                        </div>
                     </div>

                     <div class="collapse in" id="arcodianStudent">
                        <div class="form-group">
                           <label class="col-md-2 col-md-offset-2" for="selectGrade">학년</label>
                           <div class="col-md-5">
                              <select class="form-control" id="selectGrade" name="grade">
                                 <option value="1">1</option>
                                 <option value="2">2</option>
                                 <option value="3">3</option>
                              </select>
                           </div>
                        </div>

                        <div class="form-group">
                           <label class="col-md-2 col-md-offset-2" for="inputClassNum">반</label>
                           <div class="col-md-5">
                              <input type="number" name="class" id="inputClassNum" class="form-control" placeholder="1" required />
                           </div>
                        </div>

                        <div class="form-group">
                           <label class="col-md-2 col-md-offset-2" for="inputStnum">번호</label>
                           <div class="col-md-5">
                              <input type="number" name="stnum" id="inputStnum" class="form-control" placeholder="1" required />
                           </div>
                        </div>
                     </div>

                     <div class="form-group">
                        <label class="col-md-2 col-md-offset-2" for="inputTel">전화번호</label>
                        <div class="col-md-5">
                           <input type="tel" name="tel" id="inputTel" class="form-control" placeholder="010-1234-5678" required />
                        </div>
                     </div>

                     <div class="collapse" id="arcodianAddress">
                        <div class="form-group">
                           <label class="col-md-2 col-md-offset-2" for="inputTel">주소</label>
                           <div class="col-md-5">
                              <input type="text" name="address" id="inputAddress" class="form-control" placeholder="전북 전주시 덕진구 백제대로 567" />
                           </div>
                        </div>
                     </div>

                     <div class="form-group row">
                        <label for="inputPassword" class="col-md-2 col-md-offset-2" for="inputBankName">은행</label>
                        <div class="col-md-5">
                           <input type="text" name="bankName" id="inputBankName" class="form-control" placeholder="은행" required />
                        </div>
                     </div>

                     <div class="form-group row">
                        <label for="inputPassword" class="col-md-2 col-md-offset-2" for="inputAccount">계좌번호</label>
                        <div class="col-md-5">
                           <input type="text" name="account" id="inputAccount" class="form-control" placeholder="계좌번호" required />
                        </div>
                     </div>

                  </div>

                  <div class="modal-footer">
                     <button type="submit" name="submit" class="btn btn-primary">회원 가입</button>
                  </div>
               </form>
            </div>
         </div>
      </div>
      <%-- / sign up modal --%>


      <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
      <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
      <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
      <!-- Custom java script -->
      <script src="resources/js/main.js"></script>
   </body>
</html>