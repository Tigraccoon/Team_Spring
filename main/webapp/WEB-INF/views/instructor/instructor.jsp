<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>강사소개 페이지</title>
<%@ include file="../include/header.jsp" %>
<style type="text/css">
.row{width: 99%; text-align: center; padding-top: 30px; padding-bottom: 30px;}
.log{text-align: center; padding-top: 110px;}
font{color: red;}
</style>
</head>
<div style="margin-top: 80px;"></div>
<body id="page-top">
  <%@ include file="../include/menu.jsp" %>
   <div class="log">
    <img src="${path }/img/log.jpg">
     </div>   
      <h1 class="page-section-heading text-center text-uppercase text-secondary mb-0">강사 소개</h1>    
      <br><p style="text-align: center;"> 강사님들의 사진을 <font>클릭</font>하시면 더 자세한 정보 확인이 가능하십니다. </p>      
      <br>
      <!-- 강사이미지 -->
      <div class="row">
        
        <div class="col-md-6 col-lg-4">
          <div class="portfolio-item mx-auto" data-toggle="modal" data-target="#portfolioModal1">
            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
              <div class="portfolio-item-caption-content text-center text-white">
                <i class="fas fa-plus fa-3x"></i>
              </div>
            </div>
            <img class="img-fluid" src="${path }/img/ins1.jpg" alt="">
          </div>
        </div>

        <div class="col-md-6 col-lg-4">
          <div class="portfolio-item mx-auto" data-toggle="modal" data-target="#portfolioModal2">
            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
              <div class="portfolio-item-caption-content text-center text-white">
                <i class="fas fa-plus fa-3x"></i>
              </div>
            </div>
            <img class="img-fluid" src="${path }/img/ins2.jpg" alt="">
          </div>
        </div>

        <div class="col-md-6 col-lg-4">
          <div class="portfolio-item mx-auto" data-toggle="modal" data-target="#portfolioModal3">
            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
              <div class="portfolio-item-caption-content text-center text-white">
                <i class="fas fa-plus fa-3x"></i>
              </div>
            </div>
            <img class="img-fluid" src="${path }/img/ins3.jpg" alt="">
          </div>
        </div>
      </div>

  <!-- About Section -->
  <section class="page-section bg-primary text-white mb-0" id="about">
    <div class="container">
     <h2 class="page-section-heading text-center text-uppercase text-white">SKY Aducation</h2>
     
      <div class="divider-custom divider-light">
        <div class="divider-custom-line"></div>
        <div class="divider-custom-icon">
          <i class="fas fa-star"></i>
        </div>
        <div class="divider-custom-line"></div>
      </div>

      <div class="row">
        <div class="col-lg-4 ml-auto">
        <img src="${path }/img/sky_w.png">
          </div>
        <div class="col-lg-4 mr-auto">
          <p class="lead"> 정보처리기사, 정보처리산업기사 100% 합격률을 위해 노력하겠습니다.
          <br>-스카이학원 일동- </div>
      </div>

      <div class="text-center mt-4">
        <a class="btn btn-xl btn-outline-light" href="${path}/subject/list.do">
          <i class="fas fa-download mr-2"></i>
                     수강신청하기!
        </a>
      </div>

    </div>
  </section>


  <!-- 강사 상세페이지 -->
  <div class="portfolio-modal modal fade" id="portfolioModal1" tabindex="-1" role="dialog" aria-labelledby="portfolioModal1Label" aria-hidden="true">
    <div class="modal-dialog modal-xl" role="document">
      <div class="modal-content">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">
            <i class="fas fa-times"></i>
          </span>
        </button>
        <div class="modal-body text-center">
          <div class="container">
            <div class="row justify-content-center">
              <div class="col-lg-8">
                <!-- Portfolio Modal - Title -->
                <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">서인국</h2>
                <!-- Icon Divider -->
                <div class="divider-custom">
                  <div class="divider-custom-line"></div>
                  <div class="divider-custom-icon">
                    <i class="fas fa-star"></i>
                  </div>
                  <div class="divider-custom-line"></div>
                </div>
                <!-- Portfolio Modal - Image -->
                <img class="img-fluid rounded mb-5" src="${path }/img/ins1.jpg" 
                style="width: 330px; height: auto;">
                <!-- Portfolio Modal - Text -->
                <h5>웹프로그래밍의 절대강자</h5>
                <p class="mb-5">서인국 강사와 함께 웹프로그래밍의 초급부터 
                <br>고급까지 원하는 유형으로 선택해서 학습하자!</p>
                <button class="btn btn-primary" data-dismiss="modal">
                  <i class="fas fa-times fa-fw"></i>
                  Close Window
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="portfolio-modal modal fade" id="portfolioModal2" tabindex="-1" role="dialog" aria-labelledby="portfolioModal2Label" aria-hidden="true">
    <div class="modal-dialog modal-xl" role="document">
      <div class="modal-content">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">
            <i class="fas fa-times"></i>
          </span>
        </button>
        <div class="modal-body text-center">
          <div class="container">
            <div class="row justify-content-center">
              <div class="col-lg-8">
                <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">김연아</h2>
                <!-- Icon Divider -->
                <div class="divider-custom">
                  <div class="divider-custom-line"></div>
                  <div class="divider-custom-icon">
                    <i class="fas fa-star"></i>
                  </div>
                  <div class="divider-custom-line"></div>
                </div>
                <img class="img-fluid rounded mb-5" src="${path }/img/ins2.jpg" 
                style="width: 330px; height: auto;">
                <!-- Portfolio Modal - Text -->
                <h5>정보처리기사 실기 족보</h5>
                <p class="mb-5">김연아 강사와 함께 정보처리기사 실기
                <br>직접 코딩해보고 이해하고 한번에 붙자!</p>
                <button class="btn btn-primary" data-dismiss="modal">
                  <i class="fas fa-times fa-fw"></i>
                  Close Window
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="portfolio-modal modal fade" id="portfolioModal3" tabindex="-1" role="dialog" aria-labelledby="portfolioModal3Label" aria-hidden="true">
    <div class="modal-dialog modal-xl" role="document">
      <div class="modal-content">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">
            <i class="fas fa-times"></i>
          </span>
        </button>
        <div class="modal-body text-center">
          <div class="container">
            <div class="row justify-content-center">
              <div class="col-lg-8">
                <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">이동휘</h2>
                <div class="divider-custom">
                  <div class="divider-custom-line"></div>
                  <div class="divider-custom-icon">
                    <i class="fas fa-star"></i>
                  </div>
                  <div class="divider-custom-line"></div>
                </div>
                <img class="img-fluid rounded mb-5" src="${path }/img/ins3.jpg" 
                style="width: 330px; height: auto;">
                <h5>정보처리기사 필기 합격</h5>
                <p class="mb-5">이동휘 강사와 함께 정보처리기사 필기
                <br>자주 나오는 기출문제 위주로 공부하고 붙자!</p>
                <button class="btn btn-primary" data-dismiss="modal">
                  <i class="fas fa-times fa-fw"></i>
                  Close Window
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <%@ include file="../include/footer.jsp" %>

</body>

</html>
    