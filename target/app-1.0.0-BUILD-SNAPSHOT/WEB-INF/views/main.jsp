<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false" %>
<c:set var="logInOutLink" value="${ pageContext.request.getSession(false).getAttribute('member_id')==null ? '/login/login':'/login/logout' }" />
<c:set var="logInOutTxt" value="${ pageContext.request.getSession(false).getAttribute('member_id')==null ? 'LOGIN':'LOGOUT' }" />
<c:set var="memberId" value="${ pageContext.request.getSession(false).getAttribute('member_id')==null ? '' : pageContext.request.getSession(false).getAttribute('member_id') }" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메인페이지</title>
    <script src="<c:url value='https://code.jquery.com/jquery-1.12.4.js'/>"></script>
<%--    <script src="<c:url value='/js/header.js'/>"></script>--%>
    <script src="<c:url value='/js/main.js'/>"></script>
    <script src="<c:url value='/js/main_cart.js'/>"></script>
<%--    <link rel="stylesheet" href="<c:url value='/css/common.css'/>">--%>
    <link rel="stylesheet" href="<c:url value='/css/main.css'/>">
<%--    <link rel="stylesheet" href="<c:url value='/css/header.css'/>">--%>
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/header.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="js/header.js"></script>
    <script>
        let logoWhite = "<c:url value='/img/headerImg/logo_white.png'/>"
        let logoBlack = "<c:url value='/img/headerImg/logo_black.png'/>"
    </script>
</head>
<body>
<div id="wrap">

<%--    ////////////////////////////////////장바구니//////////////////////////////////////////--%>
    <div class="basket_box">
<%--        장바구니 간소화--%>
        <div class="basket_min">
            <div class="basket_icon"><img src="./img/main/cart_img.png" class="cart_img" alt=""></div>
            <div class="basket_total_quentity"></div>
        </div>

        <form class="basket_pan">
            <input type="hidden" name="cmd" value="order">
<%--            <!-- 장바구니 카테고리  -->--%>
            <div class="basket_title">
                <div class="row bkt_check">선택</div>
                <div class="row bkt_img">이미지</div>
                <div class="row bkt_product_name">상품명</div>
                <div class="row bkt_product_size">사이즈</div>
                <div class="row bkt_product_color">색상</div>
                <div class="row bkt_product_price">가격</div>
                <div class="row bkt_product_quentity">수량</div>
                <div class="row bkt_product_delete">삭제</div>
            </div>
            <!-- 장바구니 상품 -->
            <div class="basket_items">
                <div class="basket_item_data">
                    <div class="row basket_item_check">
                        <input type="checkbox" name="item_check" value="260" checked="" onclick="javascript:basket.checkItem();">
                    </div>

                    <!-- 상품 상세 페이지 이동 생각 할것(img 테이블 > image_number(PK)) -->
                    <div class="row basket_product_img">
                        <a href="#"><img src="" alt=""></a>
                    </div>
                    <!-- 상품 상세 페이지 이동 생각 할것(product 테이블 > product_name(image_numberPK)) -->
                    <div class="row basket_product_name"><a href="">상품명</a></div>

                    <div class="row basket_product_size"><a href="">사이즈</a></div>

                    <div class="row basket_product_color"><a href="">색상</a></div>

                    <div class="row basket_product_price"><a href="">100.000원</a></div>

                    <div class="row basket_product_quentity">1</div>

                    <div class="row basket_product_delete"><a href="javascript:void(0)" class="abutton" onclick="javascript:basket.delItem();">삭제</a></div>
                </div>
            </div>
        </form>
    </div>




<%--    <!-- 팝업배너 -->--%>
    <input type="checkbox" value="close" id="close">
    <div class="event_banner">
        <a href="specialPrice"><img src="./img/main/event_banner.png " alt="" id="event_img"></a>
        <label for="close" class="close_img"><img src="./img/main/X.png"  alt=""></label>
    </div>


    <jsp:include page="header.jsp" />


    <div class="main_banner">
        <a href="#" class="banner"><img src="<c:url value='/img/main/mainbanner_1.png'/>" alt=""></a>
        <a href="#" class="banner"><img src="<c:url value='/img/main/mainbanner_2.png'/>" alt=""></a>
        <a href="#" class="banner"><img src="<c:url value='/img/main/mainbanner_3.png'/>" alt=""></a>


        <input type="button" class="btn_slide" id="btn_slide_L">
        <input type="button" class="btn_slide" id="btn_slide_R">


        <div class="circle_indicator">

        </div>
    </div>




    <div class="main_sec main_sec_new">
        <div class="sec_title">
            <div class="main_title">NEW ARRIVALS</div>
            <br>
            <h4 class="sub_title">한샘의 새로운 상품을 구경하세요.</h4>
            <a href="#_new"><div class="more new">More</div></a>
        </div>

        <div class="items_area">

            <div class="item">
                <div class="img_box">
                    <c:forEach items="${imgList}" var="img">
                        <div class="new_img">

                            <img src="<c:url value='${img.imageDto.image_path}'/>">

                        </div>
                    </c:forEach>
                </div>
                <div class="item_txt">
                    <h4>${pInfo.product_name}</h4>
                    <h5>${pInfo.product_content}</h5>
                    <h5><del>${pInfo.product_price}</del></h5>
                    <h4>${pInfo.product_status==2 && SpeDiscount.special_product_end_date>now()
                            ?pInfo.product_price*(SpeDiscount.special_product_discount / 100):pInfo.product_price}</h4>
                </div>
            </div>

            <div class="item">
                <div class="img_box"><img src="./img/main/new2.png" alt="" id="new_img2" ></div>
                <div class="item_txt">
                    <h4>SAMPLE</h4>
                    <h5>상품요약 설명</h5>
                    <h5><del>000,000원</del></h5>
                    <h4>000,000원</h4>
                </div>
            </div>

            <div class="item">
                <div class="img_box"><img src="./img/main/new3.png" alt="" id="new_img3" ></div>
                <div class="item_txt">
                    <h4>SAMPLE</h4>
                    <h5>상품요약 설명</h5>
                    <h5><del>000,000원</del></h5>
                    <h4>000,000원</h4>
                </div>
            </div>

            <div class="item">
                <div class="img_box"><img src="./img/main/new4.png" alt="" id="new_img4" ></div>
                <div class="item_txt">
                    <a href="#">
                        <h4>SAMPLE</h4>
                        <h5>상품요약 설명</h5>
                        <h5><del>000,000원</del></h5>
                        <h4>000,000원</h4>
                    </a>
                </div>
            </div>

        </div>


        <div class="main_sec main_sec_best">
            <div class="sec_title">
                <div class="main_title">BEST PRODUCTS</div>
                <br>
                <h4 class="sub_title">한샘의 인기 상품을 구경하세요.</h4>
                <a href="#_best"><div class="more best">More</div></a>

            </div>

            <div class="items_area">
                <div class="item">
                    <div class="img_box"><img src="./img/main/best1.png" alt="" id="best3_img1" ></div>
                    <div class="item_txt">
                        <h4>SAMPLE</h4>
                        <h5>상품요약 설명</h5>
                        <h5><del>000,000원</del></h5>
                        <h4>000,000원</h4>
                    </div>
                </div>

                <div class="item">
                    <div class="img_box"><img src="./img/main/best2.png" alt="" id="best_img2" ></div>
                    <div class="item_txt">
                        <h4>SAMPLE</h4>
                        <h5>상품요약 설명</h5>
                        <h5><del>000,000원</del></h5>
                        <h4>000,000원</h4>
                    </div>
                </div>

                <div class="item">
                    <div class="img_box"><img src="./img/main/best3.png" alt="" id="best_img3" ></div>
                    <div class="item_txt">
                        <h4>SAMPLE</h4>
                        <h5>상품요약 설명</h5>
                        <h5><del>000,000원</del></h5>
                        <h4>000,000원</h4>
                    </div>
                </div>

                <div class="item">
                    <div class="img_box"><img src="./img/main/best4.png" alt="" id="best_img4" ></div>
                    <div class="item_txt">
                        <a href="#">
                            <h4>SAMPLE</h4>
                            <h5>상품요약 설명</h5>
                            <h5><del>000,000원</del></h5>
                            <h4>000,000원</h4>
                        </a>
                    </div>
                </div>

            </div>

            <div class="main_sec">
                <div class="sec_title">
                    <div class="main_title">HANSAM INTERIORS</div>
                    <br>
                    <h4 class="sub_title">한샘제품으로 꾸민 인테리어를 구경하세요.</h4>
                    <a href="<c:url value='/Interior'/>"><div class="more interior">More</div></a>
                </div>

                <div class="items_area">
                    <c:forEach items="${list}" var="li">
                    <div class="item">
                        <a href="<c:url value='/Interior_detail'/>">
                        <div class="img_box"><img src=${li.interior_image_path} alt="" ></div>
                        <div class="item_txt">
                            <h4>${li.interior_name}</h4>
                            <h5>${li.interior_content}</h5>
                        </div>
                        </a>
                    </div>
                    </c:forEach>

                    <div class="item">
                        <div class="img_box"><img src="./img/main/interior2.png" alt="" id="interior_img2" ></div>
                        <div class="item_txt">
                            <h4>SAMPLE</h4>
                            <h5>24평형 인테리어</h5>

                        </div>
                    </div>

                    <div class="item">
                        <div class="img_box"><img src="./img/main/interior3.png" alt="" id="interior_img3" ></div>
                        <div class="item_txt">
                            <h4>SAMPLE</h4>
                            <h5>24평형 인테리어</h5>

                        </div>
                    </div>

                    <div class="item">
                        <div class="img_box"><img src="./img/main/interior4.png" alt="" id="interior_img4" ></div>
                        <div class="item_txt">
                            <a href="#">
                                <h4>SAMPLE</h4>
                                <h5>24평형 인테리어</h5>
                            </a>
                        </div>
                    </div>

                </div>
            </div>



        </div>
    </div>
    <footer class="footer"></footer>

</div>

</body>
</html>