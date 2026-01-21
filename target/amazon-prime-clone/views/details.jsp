<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${movie.title} - Prime Video</title>
    <link rel="stylesheet" href="assets/css/prime.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <%@ include file="/partials/header.jsp" %>
    
    <main class="main-content">
        <!-- Movie Details Hero -->
        <section class="details-hero">
            <div class="details-content">
                <h1 class="details-title">${movie.title}</h1>
                <div class="details-meta">
                    <span class="meta-badge">Prime Original</span>
                    <span class="meta-item">
                        <i class="fas fa-star"></i>
                        ${movie.rating}
                    </span>
                    <span class="meta-item">
                        <i class="fas fa-calendar"></i>
                        ${movie.year}
                    </span>
                    <span class="meta-item">
                        <i class="fas fa-clock"></i>
                        ${movie.duration}
                    </span>
                    <span class="meta-item">
                        <i class="fas fa-tv"></i>
                        ${movie.seasons}
                    </span>
                    <span class="meta-item">
                        <i class="fas fa-closed-captioning"></i>
                        ${movie.maturityRating}
                    </span>
                </div>
                <p class="details-description">${movie.description}</p>
                <div class="details-actions">
                    <a href="watch?id=${movie.id}" class="btn btn-primary">
                        <i class="fas fa-play"></i>
                        <span>Watch Now</span>
                    </a>
                    <button class="btn btn-secondary watchlist-btn" data-id="${movie.id}">
                        <i class="far fa-bookmark"></i>
                        <span>Add to Watchlist</span>
                    </button>
                    <button class="btn btn-outline">
                        <i class="far fa-heart"></i>
                        <span>Like</span>
                    </button>
                    <button class="btn btn-outline">
                        <i class="fas fa-share"></i>
                        <span>Share</span>
                    </button>
                </div>
                <div class="details-info mt-3">
                    <p><strong>Director:</strong> ${movie.director}</p>
                    <p><strong>Cast:</strong> ${movie.cast}</p>
                    <p><strong>Genre:</strong> ${movie.genre}</p>
                    <p><strong>Languages:</strong> ${movie.languages}</p>
                </div>
            </div>
        </section>

        <!-- Cast Section -->
        <section class="content-section">
            <div class="section-header">
                <h2 class="section-title">Cast</h2>
            </div>
            <div class="cast-section">
                <div class="cast-grid">
                    <c:forEach var="actor" items="${movie.cast.split(', ')}">
                        <div class="cast-item">
                            <div class="cast-avatar">
                                <i class="fas fa-user"></i>
                            </div>
                            <div class="cast-name">${actor}</div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </section>

        <!-- Episodes (for TV Shows) -->
        <c:if test="${not empty movie.seasons}">
            <section class="content-section">
                <div class="section-header">
                    <h2 class="section-title">Episodes</h2>
                    <a href="#" class="see-all">All Episodes <i class="fas fa-chevron-right"></i></a>
                </div>
                <div class="episodes-section">
                    <div class="episodes-grid">
                        <c:forEach begin="1" end="8" varStatus="loop">
                            <div class="episode-card ${loop.index == 1 ? 'active' : ''}" data-episode="${loop.index}">
                                <div class="episode-number">Episode ${loop.index}</div>
                                <div class="episode-title">Episode Title ${loop.index}</div>
                                <div class="episode-description">
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                                </div>
                                <div class="episode-meta">
                                    <span>${45 + loop.index * 5} min</span>
                                    <button class="btn btn-primary btn-small mt-2">
                                        <i class="fas fa-play"></i>
                                        Play
                                    </button>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </section>
        </c:if>

        <!-- Similar Content -->
        <section class="content-section">
            <div class="section-header">
                <h2 class="section-title">More Like This</h2>
                <a href="#" class="see-all">See All <i class="fas fa-chevron-right"></i></a>
            </div>
            <div class="carousel">
                <div class="carousel-container">
                    <c:forEach var="similar" items="${similarContent}">
                        <div class="carousel-item">
                            <div class="content-card">
                                <img src="https://images.unsplash.com/photo-${similar.id == 2 ? '1536440136628' : '1595769812725'}-849c177e76a1?w=400&auto=format&fit=crop" 
                                     alt="${similar.title}" class="content-image">
                                <div class="content-overlay">
                                    <button class="btn btn-primary btn-small">
                                        <i class="fas fa-play"></i>
                                        Play
                                    </button>
                                </div>
                                <div class="content-info">
                                    <h3 class="content-title">${similar.title}</h3>
                                    <div class="content-meta">
                                        <span>${similar.year}</span>
                                        <span class="content-rating">
                                            <i class="fas fa-star"></i>
                                            ${similar.rating}
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </section>

        <!-- Reviews Section -->
        <section class="content-section">
            <div class="section-header">
                <h2 class="section-title">Reviews & Ratings</h2>
            </div>
            <div class="reviews-container">
                <div class="overall-rating">
                    <div class="rating-score">
                        <span class="score">${movie.rating.split('/')[0]}</span>
                        <span class="out-of">/10</span>
                    </div>
                    <div class="rating-stars">
                        <c:forEach begin="1" end="10" varStatus="loop">
                            <i class="fas fa-star ${loop.index <= movie.rating.split('/')[0] ? 'active' : ''}"></i>
                        </c:forEach>
                    </div>
                    <p class="rating-count">Based on 1,234 reviews</p>
                </div>
                <div class="review-form">
                    <h3>Rate this title</h3>
                    <div class="rating-input">
                        <c:forEach begin="1" end="10" varStatus="loop">
                            <i class="fas fa-star rating-star" data-rating="${loop.index}"></i>
                        </c:forEach>
                    </div>
                    <textarea class="review-textarea" placeholder="Write your review..."></textarea>
                    <button class="btn btn-primary">Submit Review</button>
                </div>
            </div>
        </section>
    </main>

    <%@ include file="/partials/footer.jsp" %>
    
    <script src="assets/js/prime.js"></script>
    <style>
        .details-actions {
            display: flex;
            gap: 1rem;
            margin-top: 2rem;
            flex-wrap: wrap;
        }
        
        .details-info {
            background: rgba(255,255,255,0.05);
            padding: 1.5rem;
            border-radius: 8px;
            margin-top: 2rem;
        }
        
        .details-info p {
            margin-bottom: 0.5rem;
        }
        
        .reviews-container {
            background: var(--prime-dark-secondary);
            border-radius: 8px;
            padding: 2rem;
        }
        
        .overall-rating {
            text-align: center;
            margin-bottom: 2rem;
        }
        
        .rating-score {
            font-size: 3rem;
            font-weight: bold;
            color: var(--prime-yellow);
        }
        
        .rating-score .out-of {
            font-size: 1.5rem;
            color: var(--prime-gray);
        }
        
        .rating-stars {
            color: var(--prime-yellow);
            font-size: 1.5rem;
            margin: 0.5rem 0;
        }
        
        .rating-count {
            color: var(--prime-gray);
        }
        
        .rating-input {
            color: var(--prime-yellow);
            font-size: 1.5rem;
            margin: 1rem 0;
            cursor: pointer;
        }
        
        .rating-star:hover,
        .rating-star.active {
            color: var(--prime-yellow);
        }
        
        .review-textarea {
            width: 100%;
            min-height: 100px;
            background: var(--prime-dark);
            border: 1px solid var(--prime-gray-dark);
            border-radius: 4px;
            color: var(--prime-light);
            padding: 1rem;
            margin-bottom: 1rem;
            resize: vertical;
        }
        
        .review-textarea:focus {
            outline: none;
            border-color: var(--prime-blue);
        }
    </style>
</body>
</html>