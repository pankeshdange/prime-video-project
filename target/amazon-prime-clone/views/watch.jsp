<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${video.title} - Prime Video</title>
    <link rel="stylesheet" href="assets/css/prime.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <%@ include file="/partials/header.jsp" %>
    
    <main class="main-content">
        <div class="watch-container">
            <!-- Video Player -->
            <div class="video-player-container">
                <video id="main-video-player" class="video-player" controls autoplay>
                    <source src="https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4" type="video/mp4">
                    Your browser does not support the video tag.
                </video>
                <div class="player-controls">
                    <div class="progress-container">
                        <div class="progress-bar"></div>
                    </div>
                    <div class="control-buttons">
                        <button class="control-btn play-btn">
                            <i class="fas fa-play"></i>
                        </button>
                        <button class="control-btn pause-btn" style="display: none;">
                            <i class="fas fa-pause"></i>
                        </button>
                        <div class="volume-control">
                            <button class="control-btn volume-btn">
                                <i class="fas fa-volume-up"></i>
                            </button>
                            <input type="range" class="volume-slider" min="0" max="1" step="0.1" value="1">
                        </div>
                        <div class="time-display">
                            <span class="current-time">0:00</span> / <span class="duration">0:00</span>
                        </div>
                        <button class="control-btn fullscreen-btn">
                            <i class="fas fa-expand"></i>
                        </button>
                    </div>
                </div>
            </div>

            <!-- Video Info -->
            <div class="video-info">
                <h1 class="video-title">${video.title}</h1>
                <div class="video-meta">
                    <span>Season ${video.season}</span>
                    <span>Episode ${video.episode}</span>
                    <span>${video.duration}</span>
                    <span class="content-rating">
                        <i class="fas fa-star"></i>
                        8.5
                    </span>
                </div>
                <p class="video-description">${video.description}</p>
                <div class="video-actions">
                    <button class="btn btn-primary">
                        <i class="fas fa-play"></i>
                        Continue Watching
                    </button>
                    <button class="btn btn-secondary watchlist-btn" data-id="${video.id}">
                        <i class="far fa-bookmark"></i>
                        Add to Watchlist
                    </button>
                    <button class="btn btn-outline">
                        <i class="fas fa-download"></i>
                        Download
                    </button>
                </div>
            </div>

            <!-- Episodes List -->
            <div class="episodes-section">
                <h2 class="section-title">Episodes</h2>
                <div class="episodes-grid">
                    <c:forEach var="episode" items="${episodes}">
                        <div class="episode-card ${episode.number == video.episode ? 'active' : ''}" 
                             onclick="loadEpisode(${episode.number})">
                            <div class="episode-number">Episode ${episode.number}</div>
                            <div class="episode-title">${episode.title}</div>
                            <div class="episode-description">${episode.description}</div>
                            <div class="episode-meta">
                                <span>${episode.duration}</span>
                                <c:if test="${episode.number == video.episode}">
                                    <div class="watching-badge">
                                        <i class="fas fa-play-circle"></i>
                                        Now Playing
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <!-- Next Episode -->
            <c:if test="${not empty video.nextEpisode}">
                <div class="next-episode">
                    <h3>Next Episode</h3>
                    <div class="next-episode-card">
                        <div class="next-episode-info">
                            <h4>${video.nextEpisode}: Episode Title</h4>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                            <a href="watch?id=${video.nextEpisodeId}" class="btn btn-primary">
                                <i class="fas fa-play"></i>
                                Play Next Episode
                            </a>
                        </div>
                    </div>
                </div>
            </c:if>

            <!-- Related Content -->
            <div class="related-content">
                <h2 class="section-title">You Might Also Like</h2>
                <div class="carousel">
                    <div class="carousel-container">
                        <!-- Related content items -->
                        <div class="carousel-item">
                            <div class="content-card">
                                <img src="https://images.unsplash.com/photo-1536440136628-849c177e76a1?w=400&auto=format&fit=crop" 
                                     alt="The Boys" class="content-image">
                                <div class="content-info">
                                    <h3 class="content-title">The Boys</h3>
                                    <div class="content-meta">
                                        <span>TV-MA • 2019</span>
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
            </div>
        </div>
    </main>

    <%@ include file="/partials/footer.jsp" %>
    
    <script src="assets/js/prime.js"></script>
    <script>
        function loadEpisode(episodeNumber) {
            // Update URL and video
            const newUrl = `watch?id=\${episodeNumber}`;
            window.history.pushState({}, '', newUrl);
            
            // Update page title
            document.title = `Episode \${episodeNumber} - Prime Video`;
            
            // Update active episode
            document.querySelectorAll('.episode-card').forEach(card => {
                card.classList.remove('active');
            });
            event.currentTarget.classList.add('active');
            
            // Show loading state
            const videoPlayer = document.getElementById('main-video-player');
            videoPlayer.style.opacity = '0.5';
            
            // Simulate loading new video
            setTimeout(() => {
                videoPlayer.style.opacity = '1';
                videoPlayer.play();
            }, 1000);
        }
        
        // Update video time display
        const videoPlayer = document.getElementById('main-video-player');
        const currentTimeEl = document.querySelector('.current-time');
        const durationEl = document.querySelector('.duration');
        
        videoPlayer.addEventListener('loadedmetadata', () => {
            const duration = formatTime(videoPlayer.duration);
            durationEl.textContent = duration;
        });
        
        videoPlayer.addEventListener('timeupdate', () => {
            const currentTime = formatTime(videoPlayer.currentTime);
            currentTimeEl.textContent = currentTime;
        });
        
        function formatTime(seconds) {
            const minutes = Math.floor(seconds / 60);
            const secs = Math.floor(seconds % 60);
            return `${minutes}:${secs.toString().padStart(2, '0')}`;
        }
    </script>
    <style>
        .player-controls {
            background: rgba(0, 0, 0, 0.8);
            padding: 1rem;
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            opacity: 0;
            transition: opacity 0.3s ease;
        }
        
        .video-player-container:hover .player-controls {
            opacity: 1;
        }
        
        .progress-container {
            width: 100%;
            height: 4px;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 2px;
            margin-bottom: 1rem;
            cursor: pointer;
        }
        
        .progress-container .progress-bar {
            height: 100%;
            background: var(--prime-blue);
            border-radius: 2px;
            width: 0%;
        }
        
        .control-buttons {
            display: flex;
            align-items: center;
            gap: 1rem;
        }
        
        .control-btn {
            background: transparent;
            border: none;
            color: white;
            font-size: 1.2rem;
            cursor: pointer;
            padding: 0.5rem;
        }
        
        .volume-control {
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .volume-slider {
            width: 80px;
            height: 4px;
            -webkit-appearance: none;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 2px;
        }
        
        .volume-slider::-webkit-slider-thumb {
            -webkit-appearance: none;
            width: 12px;
            height: 12px;
            border-radius: 50%;
            background: var(--prime-blue);
            cursor: pointer;
        }
        
        .time-display {
            margin-left: auto;
            font-size: 0.9rem;
            color: rgba(255, 255, 255, 0.8);
        }
        
        .video-actions {
            display: flex;
            gap: 1rem;
            margin-top: 1.5rem;
            flex-wrap: wrap;
        }
        
        .watching-badge {
            background: var(--prime-blue);
            color: white;
            padding: 0.25rem 0.5rem;
            border-radius: 4px;
            font-size: 0.8rem;
            display: inline-flex;
            align-items: center;
            gap: 0.25rem;
        }
        
        .next-episode {
            margin-top: 3rem;
            padding: 2rem;
            background: var(--prime-dark-secondary);
            border-radius: 8px;
        }
        
        .next-episode h3 {
            margin-bottom: 1rem;
            color: var(--prime-blue);
        }
        
        .next-episode-card {
            display: flex;
            align-items: center;
            gap: 2rem;
        }
        
        .next-episode-info h4 {
            font-size: 1.5rem;
            margin-bottom: 0.5rem;
        }
        
        .related-content {
            margin-top: 3rem;
        }
    </style>
</body>
</html>