<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Results - Prime Video</title>
    <link rel="stylesheet" href="assets/css/prime.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <%@ include file="/partials/header.jsp" %>
    
    <main class="main-content">
        <div class="search-container">
            <!-- Search Header -->
            <div class="search-header">
                <h1>
                    <c:choose>
                        <c:when test="${empty query}">
                            Search Prime Video
                        </c:when>
                        <c:otherwise>
                            Search Results for "${query}"
                        </c:otherwise>
                    </c:choose>
                </h1>
                <p class="search-results-count">
                    <c:choose>
                        <c:when test="${empty results}">
                            Enter a search term to find movies and TV shows
                        </c:when>
                        <c:otherwise>
                            Found ${results.size()} results
                        </c:otherwise>
                    </c:choose>
                </p>
            </div>

            <!-- Search Results -->
            <c:if test="${not empty results}">
                <div class="search-results">
                    <c:forEach var="result" items="${results}">
                        <div class="search-result-card">
                            <img src="https://images.unsplash.com/photo-${result.id == 1 ? '1594909122845' : result.id == 2 ? '1536440136628' : '1595769812725'}-11baa439b7bf?w=400&auto=format&fit=crop" 
                                 alt="${result.title}" class="search-result-image">
                            <div class="search-result-info">
                                <h3 class="search-result-title">${result.title}</h3>
                                <div class="search-result-meta">
                                    <span>${result.year} • ${result.type}</span>
                                    <span class="search-result-rating">
                                        <i class="fas fa-star"></i>
                                        ${result.rating}
                                    </span>
                                </div>
                                <div class="search-result-actions">
                                    <a href="details?id=${result.id}" class="btn btn-primary btn-small">
                                        <i class="fas fa-play"></i>
                                        Play
                                    </a>
                                    <button class="btn btn-outline btn-small watchlist-btn" data-id="${result.id}">
                                        <i class="far fa-bookmark"></i>
                                        Watchlist
                                    </button>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:if>

            <!-- Popular Searches -->
            <div class="popular-searches">
                <h3>Popular Searches</h3>
                <div class="search-tags">
                    <c:forEach var="search" items="${popularSearches}">
                        <a href="search?q=${search}" class="search-tag">${search}</a>
                    </c:forEach>
                </div>
            </div>

            <!-- Search Filters -->
            <div class="search-filters">
                <h3>Filter Results</h3>
                <div class="filter-options">
                    <div class="filter-group">
                        <h4>Type</h4>
                        <div class="filter-checkboxes">
                            <label class="filter-checkbox">
                                <input type="checkbox" checked>
                                <span>Movies</span>
                            </label>
                            <label class="filter-checkbox">
                                <input type="checkbox" checked>
                                <span>TV Shows</span>
                            </label>
                            <label class="filter-checkbox">
                                <input type="checkbox">
                                <span>Originals</span>
                            </label>
                        </div>
                    </div>
                    
                    <div class="filter-group">
                        <h4>Genre</h4>
                        <div class="filter-checkboxes">
                            <label class="filter-checkbox">
                                <input type="checkbox">
                                <span>Action</span>
                            </label>
                            <label class="filter-checkbox">
                                <input type="checkbox">
                                <span>Comedy</span>
                            </label>
                            <label class="filter-checkbox">
                                <input type="checkbox">
                                <span>Drama</span>
                            </label>
                            <label class="filter-checkbox">
                                <input type="checkbox">
                                <span>Fantasy</span>
                            </label>
                        </div>
                    </div>
                    
                    <div class="filter-group">
                        <h4>Year</h4>
                        <div class="year-range">
                            <input type="range" min="2000" max="2024" value="2020" class="year-slider">
                            <div class="year-labels">
                                <span>2000</span>
                                <span>2024</span>
                            </div>
                        </div>
                    </div>
                </div>
                <button class="btn btn-primary">Apply Filters</button>
            </div>
        </div>
    </main>

    <%@ include file="/partials/footer.jsp" %>
    
    <script src="assets/js/prime.js"></script>
    <style>
        .search-filters {
            background: var(--prime-dark-secondary);
            border-radius: 8px;
            padding: 2rem;
            margin-top: 3rem;
        }
        
        .filter-options {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 2rem;
            margin-bottom: 2rem;
        }
        
        .filter-group h4 {
            margin-bottom: 1rem;
            color: var(--prime-blue);
        }
        
        .filter-checkboxes {
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
        }
        
        .filter-checkbox {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            cursor: pointer;
        }
        
        .filter-checkbox input[type="checkbox"] {
            width: 18px;
            height: 18px;
            accent-color: var(--prime-blue);
        }
        
        .year-range {
            margin-top: 1rem;
        }
        
        .year-slider {
            width: 100%;
            height: 4px;
            -webkit-appearance: none;
            background: var(--prime-gray-dark);
            border-radius: 2px;
        }
        
        .year-slider::-webkit-slider-thumb {
            -webkit-appearance: none;
            width: 16px;
            height: 16px;
            border-radius: 50%;
            background: var(--prime-blue);
            cursor: pointer;
        }
        
        .year-labels {
            display: flex;
            justify-content: space-between;
            margin-top: 0.5rem;
            color: var(--prime-gray);
            font-size: 0.9rem;
        }
        
        .search-result-actions {
            display: flex;
            gap: 0.5rem;
            margin-top: 0.75rem;
        }
    </style>
</body>
</html>