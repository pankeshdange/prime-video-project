<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<header class="prime-header">
    <nav class="navbar">
        <div class="nav-left">
            <a href="${pageContext.request.contextPath}/home" class="logo">
                <i class="fab fa-amazon"></i>
                <span class="logo-text">prime video</span>
            </a>

            <div class="nav-links">
                <a href="${pageContext.request.contextPath}/home" class="nav-link">
                    <i class="fas fa-home"></i>
                    <span>Home</span>
                </a>

                <a href="${pageContext.request.contextPath}/browse" class="nav-link">
                    <i class="fas fa-compass"></i>
                    <span>Browse</span>
                </a>

                <a href="#" class="nav-link">
                    <i class="fas fa-tv"></i>
                    <span>Live TV</span>
                </a>

                <a href="#" class="nav-link">
                    <i class="fas fa-store"></i>
                    <span>Store</span>
                </a>
            </div>
        </div>

        <div class="nav-right">
            <form action="${pageContext.request.contextPath}/search" method="get" class="search-form">
                <div class="search-container">
                    <input type="text"
                           name="q"
                           placeholder="Search Prime Video"
                           class="search-input"
                           value="${param.q != null ? param.q : ''}">
                    <button type="submit" class="search-button">
                        <i class="fas fa-search"></i>
                    </button>
                </div>
            </form>

            <div class="nav-icons">
                <a href="#" class="nav-icon"><i class="fas fa-bell"></i></a>
                <a href="#" class="nav-icon"><i class="fas fa-gift"></i></a>

                <div class="profile-dropdown">
                    <button class="profile-btn">
                        <div class="profile-avatar">
                            <i class="fas fa-user"></i>
                        </div>
                        <span>Kastro</span>
                        <i class="fas fa-chevron-down"></i>
                    </button>

                    <div class="dropdown-menu">
                        <a href="${pageContext.request.contextPath}/profile" class="dropdown-item">
                            <i class="fas fa-user-circle"></i>
                            <span>Your Profile</span>
                        </a>

                        <a href="#" class="dropdown-item">
                            <i class="fas fa-cog"></i>
                            <span>Settings</span>
                        </a>

                        <a href="#" class="dropdown-item">
                            <i class="fas fa-question-circle"></i>
                            <span>Help</span>
                        </a>

                        <div class="dropdown-divider"></div>

                        <a href="#" class="dropdown-item">
                            <i class="fas fa-sign-out-alt"></i>
                            <span>Sign Out</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <button class="mobile-menu-btn">
            <i class="fas fa-bars"></i>
        </button>
    </nav>

    <div class="mobile-menu">
        <div class="mobile-menu-header">
            <h3>Menu</h3>
            <button class="close-menu">
                <i class="fas fa-times"></i>
            </button>
        </div>

        <div class="mobile-menu-links">
            <a href="${pageContext.request.contextPath}/home" class="mobile-link">
                <i class="fas fa-home"></i>
                <span>Home</span>
            </a>

            <a href="${pageContext.request.contextPath}/browse" class="mobile-link">
                <i class="fas fa-compass"></i>
                <span>Browse</span>
            </a>

            <a href="${pageContext.request.contextPath}/search" class="mobile-link">
                <i class="fas fa-search"></i>
                <span>Search</span>
            </a>

            <a href="${pageContext.request.contextPath}/profile" class="mobile-link">
                <i class="fas fa-user"></i>
                <span>Profile</span>
            </a>
        </div>
    </div>
</header>
