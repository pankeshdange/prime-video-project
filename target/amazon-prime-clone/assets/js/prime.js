// Prime Video Clone - Main JavaScript

document.addEventListener('DOMContentLoaded', function() {
    // Initialize components
    initHeaderScroll();
    initMobileMenu();
    initCarousels();
    initVideoPlayer();
    initSearch();
    initTooltips();
    
    // Add fade-in animation to all cards
    animateCards();
    
    // Update copyright year
    updateCopyrightYear();
});

// Header scroll effect
function initHeaderScroll() {
    const header = document.querySelector('.prime-header');
    let lastScroll = 0;
    
    window.addEventListener('scroll', () => {
        const currentScroll = window.pageYOffset;
        
        if (currentScroll > 50) {
            header.classList.add('scrolled');
            
            if (currentScroll > lastScroll && currentScroll > 100) {
                header.style.transform = 'translateY(-100%)';
            } else {
                header.style.transform = 'translateY(0)';
            }
        } else {
            header.classList.remove('scrolled');
            header.style.transform = 'translateY(0)';
        }
        
        lastScroll = currentScroll;
    });
}

// Mobile menu functionality
function initMobileMenu() {
    const mobileMenuBtn = document.querySelector('.mobile-menu-btn');
    const closeMenuBtn = document.querySelector('.close-menu');
    const mobileMenu = document.querySelector('.mobile-menu');
    const mobileLinks = document.querySelectorAll('.mobile-link');
    
    if (mobileMenuBtn) {
        mobileMenuBtn.addEventListener('click', () => {
            mobileMenu.classList.add('active');
            document.body.style.overflow = 'hidden';
        });
    }
    
    if (closeMenuBtn) {
        closeMenuBtn.addEventListener('click', () => {
            mobileMenu.classList.remove('active');
            document.body.style.overflow = '';
        });
    }
    
    // Close menu when clicking on links
    mobileLinks.forEach(link => {
        link.addEventListener('click', () => {
            mobileMenu.classList.remove('active');
            document.body.style.overflow = '';
        });
    });
    
    // Close menu when clicking outside
    document.addEventListener('click', (e) => {
        if (!mobileMenu.contains(e.target) && !mobileMenuBtn.contains(e.target)) {
            mobileMenu.classList.remove('active');
            document.body.style.overflow = '';
        }
    });
}

// Carousel functionality
function initCarousels() {
    const carousels = document.querySelectorAll('.carousel');
    
    carousels.forEach(carousel => {
        const container = carousel.querySelector('.carousel-container');
        const prevBtn = carousel.querySelector('.carousel-prev');
        const nextBtn = carousel.querySelector('.carousel-next');
        
        if (prevBtn && nextBtn) {
            prevBtn.addEventListener('click', () => {
                container.scrollBy({
                    left: -container.clientWidth * 0.8,
                    behavior: 'smooth'
                });
            });
            
            nextBtn.addEventListener('click', () => {
                container.scrollBy({
                    left: container.clientWidth * 0.8,
                    behavior: 'smooth'
                });
            });
        }
        
        // Auto-scroll for hero carousel
        if (carousel.classList.contains('hero-carousel')) {
            setInterval(() => {
                if (container.scrollLeft + container.clientWidth >= container.scrollWidth) {
                    container.scrollTo({ left: 0, behavior: 'smooth' });
                } else {
                    container.scrollBy({ left: container.clientWidth, behavior: 'smooth' });
                }
            }, 5000);
        }
    });
}

// Video player functionality
function initVideoPlayer() {
    const videoPlayer = document.getElementById('main-video-player');
    const playBtn = document.querySelector('.play-btn');
    const pauseBtn = document.querySelector('.pause-btn');
    const volumeSlider = document.querySelector('.volume-slider');
    const progressBar = document.querySelector('.progress-bar');
    const fullscreenBtn = document.querySelector('.fullscreen-btn');
    
    if (videoPlayer) {
        // Play/Pause
        if (playBtn) {
            playBtn.addEventListener('click', () => {
                videoPlayer.play();
                playBtn.style.display = 'none';
                if (pauseBtn) pauseBtn.style.display = 'block';
            });
        }
        
        if (pauseBtn) {
            pauseBtn.addEventListener('click', () => {
                videoPlayer.pause();
                pauseBtn.style.display = 'none';
                if (playBtn) playBtn.style.display = 'block';
            });
        }
        
        // Volume control
        if (volumeSlider) {
            volumeSlider.addEventListener('input', (e) => {
                videoPlayer.volume = e.target.value;
            });
        }
        
        // Progress bar
        if (progressBar) {
            videoPlayer.addEventListener('timeupdate', () => {
                const progress = (videoPlayer.currentTime / videoPlayer.duration) * 100;
                progressBar.style.width = `${progress}%`;
            });
        }
        
        // Fullscreen
        if (fullscreenBtn) {
            fullscreenBtn.addEventListener('click', () => {
                if (!document.fullscreenElement) {
                    videoPlayer.requestFullscreen().catch(err => {
                        console.log(`Error attempting to enable fullscreen: ${err.message}`);
                    });
                } else {
                    document.exitFullscreen();
                }
            });
        }
        
        // Keyboard controls
        document.addEventListener('keydown', (e) => {
            switch(e.key.toLowerCase()) {
                case ' ':
                case 'k':
                    e.preventDefault();
                    if (videoPlayer.paused) {
                        videoPlayer.play();
                    } else {
                        videoPlayer.pause();
                    }
                    break;
                case 'f':
                    e.preventDefault();
                    if (!document.fullscreenElement) {
                        videoPlayer.requestFullscreen();
                    } else {
                        document.exitFullscreen();
                    }
                    break;
                case 'm':
                    e.preventDefault();
                    videoPlayer.muted = !videoPlayer.muted;
                    break;
                case 'arrowleft':
                    e.preventDefault();
                    videoPlayer.currentTime -= 10;
                    break;
                case 'arrowright':
                    e.preventDefault();
                    videoPlayer.currentTime += 10;
                    break;
            }
        });
    }
    
    // Episode selection
    const episodeCards = document.querySelectorAll('.episode-card');
    episodeCards.forEach(card => {
        card.addEventListener('click', () => {
            episodeCards.forEach(c => c.classList.remove('active'));
            card.classList.add('active');
            
            const episodeNumber = card.querySelector('.episode-number').textContent;
            const episodeTitle = card.querySelector('.episode-title').textContent;
            
            // In a real app, you would load the video for this episode
            console.log(`Loading episode ${episodeNumber}: ${episodeTitle}`);
            
            // Update video info
            if (document.querySelector('.video-title')) {
                document.querySelector('.video-title').textContent = episodeTitle;
            }
        });
    });
}

// Search functionality
function initSearch() {
    const searchInput = document.querySelector('.search-input');
    const searchForm = document.querySelector('.search-form');
    const searchTags = document.querySelectorAll('.search-tag');
    
    if (searchInput) {
        // Focus search input on '/' key press
        document.addEventListener('keydown', (e) => {
            if (e.key === '/' && !e.target.matches('input, textarea')) {
                e.preventDefault();
                searchInput.focus();
            }
        });
        
        // Clear button
        const clearBtn = document.createElement('button');
        clearBtn.type = 'button';
        clearBtn.className = 'search-clear';
        clearBtn.innerHTML = '<i class="fas fa-times"></i>';
        clearBtn.style.display = 'none';
        
        searchInput.parentNode.appendChild(clearBtn);
        
        searchInput.addEventListener('input', () => {
            clearBtn.style.display = searchInput.value ? 'block' : 'none';
        });
        
        clearBtn.addEventListener('click', () => {
            searchInput.value = '';
            clearBtn.style.display = 'none';
            searchInput.focus();
        });
    }
    
    // Search tag clicks
    searchTags.forEach(tag => {
        tag.addEventListener('click', () => {
            if (searchInput) {
                searchInput.value = tag.textContent.trim();
                if (searchForm) searchForm.submit();
            }
        });
    });
}

// Tooltips
function initTooltips() {
    const tooltipElements = document.querySelectorAll('[data-tooltip]');
    
    tooltipElements.forEach(element => {
        element.addEventListener('mouseenter', (e) => {
            const tooltip = document.createElement('div');
            tooltip.className = 'tooltip';
            tooltip.textContent = e.target.dataset.tooltip;
            document.body.appendChild(tooltip);
            
            const rect = e.target.getBoundingClientRect();
            tooltip.style.left = `${rect.left + rect.width / 2 - tooltip.offsetWidth / 2}px`;
            tooltip.style.top = `${rect.top - tooltip.offsetHeight - 10}px`;
            
            e.target._tooltip = tooltip;
        });
        
        element.addEventListener('mouseleave', (e) => {
            if (e.target._tooltip) {
                e.target._tooltip.remove();
                delete e.target._tooltip;
            }
        });
    });
}

// Animate cards on scroll
function animateCards() {
    const cards = document.querySelectorAll('.content-card, .search-result-card, .watchlist-item');
    
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('fade-in');
            }
        });
    }, {
        threshold: 0.1
    });
    
    cards.forEach(card => {
        observer.observe(card);
    });
}

// Update copyright year
function updateCopyrightYear() {
    const yearElements = document.querySelectorAll('.copyright-year');
    const currentYear = new Date().getFullYear();
    
    yearElements.forEach(element => {
        element.textContent = currentYear;
    });
}

// Watchlist functionality
function initWatchlist() {
    const watchlistButtons = document.querySelectorAll('.watchlist-btn');
    
    watchlistButtons.forEach(button => {
        button.addEventListener('click', function() {
            const contentId = this.dataset.id;
            const isInWatchlist = this.classList.contains('added');
            
            // Toggle watchlist state
            this.classList.toggle('added');
            
            if (isInWatchlist) {
                this.innerHTML = '<i class="far fa-bookmark"></i> Add to Watchlist';
                showNotification('Removed from Watchlist');
            } else {
                this.innerHTML = '<i class="fas fa-bookmark"></i> Added to Watchlist';
                showNotification('Added to Watchlist');
            }
            
            // In a real app, you would make an API call here
            console.log(`${isInWatchlist ? 'Removed from' : 'Added to'} watchlist: ${contentId}`);
        });
    });
}

// Show notification
function showNotification(message, type = 'success') {
    const notification = document.createElement('div');
    notification.className = `notification notification-${type}`;
    notification.textContent = message;
    
    document.body.appendChild(notification);
    
    // Animate in
    setTimeout(() => {
        notification.classList.add('show');
    }, 10);
    
    // Remove after 3 seconds
    setTimeout(() => {
        notification.classList.remove('show');
        setTimeout(() => {
            notification.remove();
        }, 300);
    }, 3000);
}

// Rating functionality
function initRatings() {
    const ratingStars = document.querySelectorAll('.rating-star');
    
    ratingStars.forEach(star => {
        star.addEventListener('click', function() {
            const rating = this.dataset.rating;
            const contentId = this.closest('[data-content-id]')?.dataset.contentId;
            
            // Set active state
            ratingStars.forEach(s => {
                if (parseInt(s.dataset.rating) <= parseInt(rating)) {
                    s.classList.add('active');
                } else {
                    s.classList.remove('active');
                }
            });
            
            showNotification(`Rated ${rating} out of 5 stars`);
            console.log(`Rated content ${contentId}: ${rating} stars`);
        });
        
        star.addEventListener('mouseenter', function() {
            const rating = this.dataset.rating;
            
            ratingStars.forEach(s => {
                if (parseInt(s.dataset.rating) <= parseInt(rating)) {
                    s.classList.add('hover');
                } else {
                    s.classList.remove('hover');
                }
            });
        });
        
        star.addEventListener('mouseleave', function() {
            ratingStars.forEach(s => {
                s.classList.remove('hover');
            });
        });
    });
}

// Profile image upload
function initProfileImageUpload() {
    const profileImageInput = document.getElementById('profile-image-input');
    const profileAvatar = document.querySelector('.profile-avatar-large');
    
    if (profileImageInput && profileAvatar) {
        profileImageInput.addEventListener('change', function(e) {
            const file = e.target.files[0];
            if (file) {
                const reader = new FileReader();
                
                reader.onload = function(event) {
                    // Create image element to check dimensions
                    const img = new Image();
                    img.onload = function() {
                        // Create canvas for circular crop
                        const canvas = document.createElement('canvas');
                        const ctx = canvas.getContext('2d');
                        
                        const size = Math.min(img.width, img.height);
                        canvas.width = size;
                        canvas.height = size;
                        
                        // Draw circular image
                        ctx.beginPath();
                        ctx.arc(size/2, size/2, size/2, 0, Math.PI * 2);
                        ctx.closePath();
                        ctx.clip();
                        
                        ctx.drawImage(img, (img.width - size)/2, (img.height - size)/2, size, size, 0, 0, size, size);
                        
                        // Update profile avatar
                        profileAvatar.innerHTML = '';
                        const newImage = document.createElement('img');
                        newImage.src = canvas.toDataURL('image/jpeg');
                        newImage.style.width = '100%';
                        newImage.style.height = '100%';
                        newImage.style.borderRadius = '50%';
                        newImage.style.objectFit = 'cover';
                        
                        profileAvatar.appendChild(newImage);
                        showNotification('Profile image updated successfully');
                    };
                    
                    img.src = event.target.result;
                };
                
                reader.readAsDataURL(file);
            }
        });
    }
}

// Content filtering
function initContentFilter() {
    const filterButtons = document.querySelectorAll('.filter-btn');
    const contentItems = document.querySelectorAll('.content-item');
    
    filterButtons.forEach(button => {
        button.addEventListener('click', function() {
            // Update active filter
            filterButtons.forEach(btn => btn.classList.remove('active'));
            this.classList.add('active');
            
            const filter = this.dataset.filter;
            
            // Filter content
            contentItems.forEach(item => {
                if (filter === 'all' || item.dataset.category === filter) {
                    item.style.display = 'block';
                    setTimeout(() => {
                        item.classList.add('fade-in');
                    }, 10);
                } else {
                    item.classList.remove('fade-in');
                    item.style.display = 'none';
                }
            });
        });
    });
}

// Initialize all functionality when page loads
window.addEventListener('load', function() {
    // Additional initialization that requires everything to be loaded
    initWatchlist();
    initRatings();
    initProfileImageUpload();
    initContentFilter();
    
    // Remove loading screen
    const loadingScreen = document.querySelector('.loading-screen');
    if (loadingScreen) {
        setTimeout(() => {
            loadingScreen.style.opacity = '0';
            setTimeout(() => {
                loadingScreen.style.display = 'none';
            }, 500);
        }, 1000);
    }
});

// Export for module usage
if (typeof module !== 'undefined' && module.exports) {
    module.exports = {
        initHeaderScroll,
        initMobileMenu,
        initCarousels,
        initVideoPlayer,
        initSearch,
        initTooltips,
        animateCards,
        updateCopyrightYear
    };
}