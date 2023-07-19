<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!--     Offcanvas Menu Begin -->
<div class="offcanvas-menu-overlay"></div>
<div class="offcanvas-menu-wrapper">
	<div class="offcanvas__option">
		<div class="offcanvas__links">
			<c:choose>
				<c:when test="${currentuser.name!= null }">
					<a href="#" style="cursor: default; pointer-events: none">Hi,${currentuser.name}</a>
				</c:when>
				<c:otherwise>
					<a href="/account/login">Sign in</a>
				</c:otherwise>
			</c:choose>
			<a href="#">FAQs</a>
		</div>
		<div class="offcanvas__top__hover">
			<span>Usd <i class="arrow_carrot-down"></i></span>
			<ul>
				<li>USD</li>
				<li>EUR</li>
				<li>USD</li>
			</ul>
		</div>
	</div>
	<div class="offcanvas__nav__option">
		<a href="#" class="search-switch"><img src="img/icon/search.png"
			alt=""></a> <a href="#"><img src="img/icon/heart.png" alt=""></a>
		<a href="/cart/view"><img src="/img/icon/cart.png" alt=""></a>
		<!-- 		<div class="price">$0.00</div> -->
	</div>
	<div id="mobile-menu-wrap"></div>
	<div class="offcanvas__text">
		<p>Free shipping, 30-day return or refund guarantee.</p>
	</div>
</div>
<!--     Offcanvas Menu End -->

<header class="header">
	<div class="header__top">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-7">
					<div class="header__top__left">
						<p>Free shipping, 30-day return or refund guarantee.</p>
					</div>
				</div>
				<div class="col-lg-6 col-md-5">
					<nav class="header__menu mobile-menu"
						style="padding: 0; text-align: right;">
						<ul>
							<c:choose>
								<c:when test="${currentuser.name!= null }">
									<li style="margin-right: 15px;"><a href=""
										style="cursor: default; pointer-events: none; color: white; font-size: 16px; font-weight: 300">Hi,${currentuser.name}</a>
										<ul class="dropdown">
											<c:choose>
												<c:when test="${currentuser.role =='1' }">
													<li><a href="/admin/dashboard">Dashboard</a></li>
													<li><a href="/account/logout">Logout</a></li>
												</c:when>
												<c:otherwise>
													<li><a>Information</a></li>
													<li><a href="/cart/order-history">Orders History</a></li>
													<li><a href="/account/logout">Logout</a></li>
												</c:otherwise>
											</c:choose>

										</ul></li>
								</c:when>
								<c:otherwise>
									<li style="margin-right: 15px;"><a href="/account/login" style="color: white;color: white; font-size: 16px; font-weight: 300"">Sign in</a></li>
								</c:otherwise>
							</c:choose>

							<div class="header__top__hover">
								<span>Language <i class="arrow_carrot-down"></i></span>
								<ul style="text-align: center;">
									<li style="width: 100%">ENG</li>
									<li>VN</li>
								</ul>
							</div>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-lg-3 col-md-3">
				<div class="header__logo">
					<a href="/index"><img src="img/logo.png" alt=""></a>
				</div>
			</div>
			<div class="col-lg-6 col-md-6">
				<nav class="header__menu mobile-menu">
					<ul>
						<c:if test="${pathInfo =='/shop'}"></c:if>
						<c:choose>
							<c:when test="${pathInfo =='index'}">
								<li class="active"><a href="/index">Home</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="/index">Home</a></li>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${pathInfo =='shop'}">
								<li class="active"><a href="/shop?page=0">Shop</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="/shop?page=0">Shop</a></li>
							</c:otherwise>
						</c:choose>
						<li><a href="#">Pages</a>
							<ul class="dropdown">
								<li><a href="./about.html">About Us</a></li>
								<li><a href="./shop-details.html">Shop Details</a></li>
								<li><a href="./shopping-cart.html">Shopping Cart</a></li>
								<li><a href="./checkout.html">Check Out</a></li>
								<li><a href="./blog-details.html">Blog Details</a></li>
							</ul></li>
						<li><a href="./blog.html">Blog</a></li>
						<li><a href="./contact.html">Contacts</a></li>
					</ul>
				</nav>
			</div>
			<div class="col-lg-3 col-md-3">
				<div class="header__nav__option">
					<a href="#" class="search-switch"><img
						src="/img/icon/search.png" alt=""></a>
					<!--                         <a href="#"><img src="img/icon/heart.png" alt=""></a> -->
					<a href="/cart/view"><img src="/img/icon/cart.png" alt=""></a>
					<!-- 					<div class="price">$0.00</div> -->
				</div>
			</div>
		</div>
		<div class="canvas__open">
			<i class="fa fa-bars"></i>
		</div>
	</div>
</header>
<!-- Header Section End -->
