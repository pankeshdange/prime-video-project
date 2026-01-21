<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Prime Video - Browse</title>
    <link rel="stylesheet" href="assets/css/prime.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <%@ include file="/partials/header.jsp" %>
    
    <main class="main-content">
        <!-- Browse Header -->
        <div class="hero-section" style="height: 40vh; background-image: linear-gradient(rgba(0,0,0,0.7), rgba(0,0,0,0.9)), url('https://images.unsplash.com/photo-1517602302552-471fe67acf66?w=1600&auto=format&fit=crop');">
            <div class="hero-content">
                <h1>Browse All Content</h1>
                <p>Discover movies, TV shows, originals, and more</p>
                <div class="filter-buttons mt-3">
                    <button class="filter-btn active" data-filter="all">All</button>
                    <button class="filter-btn" data-filter="movies">Movies</button>
                    <button class="filter-btn" data-filter="tv">TV Shows</button>
                    <button class="filter-btn" data-filter="originals">Originals</button>
                </div>
            </div>
        </div>

        <!-- Categories Grid -->
        <div class="content-section">
            <c:forEach var="category" items="${categories}">
                <section class="category-section">
                    <div class="section-header">
                        <h2 class="section-title">${category}</h2>
                        <a href="#" class="see-all">View All <i class="fas fa-chevron-right"></i></a>
                    </div>
                    <div class="carousel">
                        <div class="carousel-container">
                            <c:forEach var="movie" items="${moviesByCategory[category]}">
                                <div class="carousel-item">
                                    <div class="content-card" data-category="${category.toLowerCase()}">
                                        <img src="https://images.unsplash.com/photo-${category == 'Action & Adventure' ? '1517602302552' : '1489599849927'}-471fe67acf66?w=400&auto=format&fit=crop" 
                                             alt="${movie.title}" class="content-image">
                                        <div class="content-overlay">
                                            <button class="btn btn-primary btn-small">
                                                <i class="fas fa-play"></i>
                                                Play
                                            </button>
                                            <button class="btn btn-secondary btn-small">
                                                <i class="far fa-bookmark"></i>
                                                Watchlist
                                            </button>
                                        </div>
                                        <div class="content-info">
                                            <h3 class="content-title">${movie.title}</h3>
                                            <div class="content-meta">
                                                <span>${movie.year}</span>
                                                <span>${movie.duration}</span>
                                                <span class="content-rating">
                                                    <i class="fas fa-star"></i>
                                                    ${movie.rating}
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </section>
            </c:forEach>
        </div>

        <!-- Browse by Genre -->
        <section class="content-section">
            <div class="section-header">
                <h2 class="section-title">Browse by Genre</h2>
            </div>
            <div class="genre-grid">
                <a href="#" class="genre-card" style="background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);">
                    <i class="fas fa-fire"></i>
                    <span>Action</span>
                </a>
                <a href="#" class="genre-card" style="background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);">
                    <i class="fas fa-heart"></i>
                    <span>Romance</span>
                </a>
                <a href="#" class="genre-card" style="background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);">
                    <i class="fas fa-laugh"></i>
                    <span>Comedy</span>
                </a>
                <a href="#" class="genre-card" style="background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%);">
                    <i class="fas fa-ghost"></i>
                    <span>Horror</span>
                </a>
                <a href="#" class="genre-card" style="background: linear-gradient(135deg, #fa709a 0%, #fee140 100%);">
                    <i class="fas fa-rocket"></i>
                    <span>Sci-Fi</span>
                </a>
                <a href="#" class="genre-card" style="background: linear-gradient(135deg, #a8edea 0%, #fed6e3 100%);">
                    <i class="fas fa-graduation-cap"></i>
                    <span>Documentary</span>
                </a>
            </div>
        </section>
    </main>

    <%@ include file="/partials/footer.jsp" %>
    
    <script src="assets/js/prime.js"></script>
    <style>
        .genre-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(150px, 1fr));
            gap: 1rem;
            margin-top: 1rem;
        }
        
        .genre-card {
            height: 120px;
            border-radius: 8px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: white;
            text-decoration: none;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        
        .genre-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.3);
        }
        
        .genre-card i {
            font-size: 2rem;
            margin-bottom: 0.5rem;
        }
        
        .genre-card span {
            font-weight: bold;
            font-size: 1.1rem;
        }
        
        .filter-buttons {
            display: flex;
            gap: 0.5rem;
            flex-wrap: wrap;
        }
        
        .filter-btn {
            background: rgba(255,255,255,0.1);
            border: 1px solid rgba(255,255,255,0.2);
            color: white;
            padding: 0.5rem 1.5rem;
            border-radius: 20px;
            cursor: pointer;
            transition: all 0.3s ease;
            backdrop-filter: blur(10px);
        }
        
        .filter-btn:hover,
        .filter-btn.active {
            background: var(--prime-blue);
            border-color: var(--prime-blue);
        }
        
        .btn-small {
            padding: 0.5rem 1rem;
            font-size: 0.9rem;
        }
    </style>
</body>
</html>