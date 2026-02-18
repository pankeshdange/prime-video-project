<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Prime Video - Home</title>
    <link rel="stylesheet" href="assets/css/prime.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="icon" type="image/x-icon" href="https://www.primevideo.com/favicon.ico">
</head>
<body>
    <%@ include file="/partials/header.jsp" %>
    
    <main class="main-content">
        <!-- Hero Section -->
        <section class="hero-section">
            <div class="hero-content">
                <h1>${featuredTitle}</h1>
                <div class="meta-info">
                    <span class="meta-badge">Amazon Prime Original</span>
                    <span>${featuredYear}</span>
                    <span>${featuredRating}</span>
                    <span>${featuredGenre}</span>
                </div>
                <p class="description">${featuredDescription}</p>
                <div class="hero-buttons">
                    <a href="watch?id=1" class="btn btn-primary">
                        <i class="fas fa-play"></i>
                        <span>Watch Now</span>
                    </a>
                    <a href="details?id=1" class="btn btn-secondary">
                        <i class="fas fa-info-circle"></i>
                        <span>Details</span>
                    </a>
                    <button class="btn btn-outline watchlist-btn" data-id="1">
                        <i class="far fa-bookmark"></i>
                        <span>Watchlist</span>
                    </button>
                </div>
            </div>
        </section>

        <!-- Continue Watching -->
        <section class="content-section">
            <div class="section-header">
                <h2 class="section-title">Continue Watching</h2>
                <a href="#" class="see-all">See All <i class="fas fa-chevron-right"></i></a>
            </div>
            <div class="carousel">
                <div class="carousel-container">
                    <div class="carousel-item">
                        <div class="content-card">
                            <div class="content-badge">Continue</div>
                            <img src="https://images.unsplash.com/photo-1594909122845-11baa439b7bf?w=400&auto=format&fit=crop" 
                                 alt="The Rings of Power" class="content-image">
                            <div class="content-overlay">
                                <div class="progress-container">
                                    <div class="progress-bar" style="width: 68%"></div>
                                </div>
                            </div>
                            <div class="content-info">
                                <h3 class="content-title">The Rings of Power</h3>
                                <div class="content-meta">
                                    <span>S1 • E5</span>
                                    <span class="content-rating">
                                        <i class="fas fa-star"></i>
                                        8.5
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- More continue watching items -->
                </div>
            </div>
        </section>

        <!-- Prime Originals -->
        <section class="content-section">
            <div class="section-header">
                <h2 class="section-title">Prime Original</h2>
                <a href="browse" class="see-all">Browse All <i class="fas fa-chevron-right"></i></a>
            </div>
            <div class="carousel">
                <div class="carousel-container">
                    <!-- Originals will be loaded here -->
                    <div class="carousel-item">
                        <div class="content-card">
                            <div class="content-badge">New</div>
                            <img src="https://images.unsplash.com/photo-1536440136628-849c177e76a1?w=400&auto=format&fit=crop" 
                                 alt="The Boys" class="content-image">
                            <div class="content-info">
                                <h3 class="content-title">The Boys</h3>
                                <div class="content-meta">
                                    <span>2019 • 3 Seasons</span>
                                    <span class="content-rating">
                                        <i class="fas fa-star"></i>
                                        8.7
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Movies Section -->
        <section class="content-section">
            <div class="section-header">
                <h2 class="section-title">Movies</h2>
                <a href="#" class="see-all">See All <i class="fas fa-chevron-right"></i></a>
            </div>
            <div class="carousel">
                <div class="carousel-container">
                    <!-- Movie items -->
                </div>
            </div>
        </section>

        <!-- TV Shows -->
        <section class="content-section">
            <div class="section-header">
                <h2 class="section-title">TV Shows</h2>
                <a href="#" class="see-all">See All <i class="fas fa-chevron-right"></i></a>
            </div>
            <div class="carousel">
                <div class="carousel-container">
                    <!-- TV Show items -->
                </div>
            </div>
        </section>
    </main>

    <%@ include file="/partials/footer.jsp" %>
    
    <script src="assets/js/prime.js"></script>
    <script>
        // Initialize carousels
        document.addEventListener('DOMContentLoaded', function() {
            const carousels = document.querySelectorAll('.carousel-container');
            carousels.forEach(container => {
                container.addEventListener('wheel', function(e) {
                    if (e.deltaY !== 0) {
                        e.preventDefault();
                        this.scrollLeft += e.deltaY;
                    }
                });
            });
        });
    </script>
</body>
</html>
