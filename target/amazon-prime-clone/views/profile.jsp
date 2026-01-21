<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${user.name}'s Profile - Prime Video</title>
    <link rel="stylesheet" href="assets/css/prime.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <%@ include file="/partials/header.jsp" %>
    
    <main class="main-content">
        <div class="profile-container">
            <!-- Profile Header -->
            <div class="profile-header">
                <div class="profile-avatar-large">
                    <i class="fas fa-user"></i>
                </div>
                <div class="profile-info">
                    <h1>${user.name}</h1>
                    <p>Prime Member since 2022</p>
                    <div class="profile-stats">
                        <div class="stat-item">
                            <div class="stat-value">${user.watchlistItems}</div>
                            <div class="stat-label">Watchlist</div>
                        </div>
                        <div class="stat-item">
                            <div class="stat-value">${user.profiles}</div>
                            <div class="stat-label">Profiles</div>
                        </div>
                        <div class="stat-item">
                            <div class="stat-value">${user.continueWatching}</div>
                            <div class="stat-label">Watching</div>
                        </div>
                    </div>
                </div>
                <div class="profile-actions">
                    <input type="file" id="profile-image-input" accept="image/*" style="display: none;">
                    <button class="btn btn-outline" onclick="document.getElementById('profile-image-input').click()">
                        <i class="fas fa-camera"></i>
                        Change Photo
                    </button>
                    <a href="#" class="btn btn-secondary">
                        <i class="fas fa-cog"></i>
                        Settings
                    </a>
                </div>
            </div>

            <!-- Profile Sections -->
            <div class="profile-sections">
                <!-- Account Info -->
                <div class="section-card">
                    <h3><i class="fas fa-user-circle"></i> Account Information</h3>
                    <div class="account-info">
                        <div class="info-item">
                            <span class="info-label">Name:</span>
                            <span class="info-value">${user.name}</span>
                        </div>
                        <div class="info-item">
                            <span class="info-label">Email:</span>
                            <span class="info-value">${user.email}</span>
                        </div>
                        <div class="info-item">
                            <span class="info-label">Plan:</span>
                            <span class="info-value">${user.plan} (${user.planType})</span>
                        </div>
                        <div class="info-item">
                            <span class="info-label">Next Billing:</span>
                            <span class="info-value">${user.nextBilling}</span>
                        </div>
                    </div>
                    <div class="section-actions">
                        <a href="#" class="btn btn-primary">
                            <i class="fas fa-edit"></i>
                            Edit Profile
                        </a>
                        <a href="#" class="btn btn-outline">
                            <i class="fas fa-credit-card"></i>
                            Manage Subscription
                        </a>
                    </div>
                </div>

                <!-- Watch History -->
                <div class="section-card">
                    <h3><i class="fas fa-history"></i> Watch History</h3>
                    <ul class="history-list">
                        <c:forEach var="item" items="${watchHistory}">
                            <li class="history-item">
                                <div class="history-info">
                                    <div class="history-title">${item.title}</div>
                                    <div class="history-episode">${item.episode}</div>
                                    <div class="history-time">${item.time}</div>
                                </div>
                                <div class="history-progress">
                                    <div class="progress-bar" style="width: ${item.progress}"></div>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                    <div class="section-actions">
                        <a href="#" class="btn btn-outline">
                            <i class="fas fa-eye"></i>
                            View All History
                        </a>
                        <a href="#" class="btn btn-outline">
                            <i class="fas fa-trash"></i>
                            Clear History
                        </a>
                    </div>
                </div>

                <!-- Watchlist -->
                <div class="section-card">
                    <h3><i class="fas fa-bookmark"></i> My Watchlist</h3>
                    <div class="watchlist-grid">
                        <c:forEach var="item" items="${watchlist}">
                            <div class="watchlist-item">
                                <img src="https://images.unsplash.com/photo-${item.id == 1 ? '1594909122845' : item.id == 2 ? '1517602302552' : '1536440136628'}-11baa439b7bf?w=300&auto=format&fit=crop" 
                                     alt="${item.title}" class="watchlist-image">
                                <div class="watchlist-info">
                                    <div class="watchlist-title">${item.title}</div>
                                    <div class="watchlist-meta">${item.year} • ${item.genre}</div>
                                    <div class="watchlist-actions">
                                        <button class="btn btn-primary btn-small">
                                            <i class="fas fa-play"></i>
                                        </button>
                                        <button class="btn btn-outline btn-small">
                                            <i class="fas fa-times"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="section-actions">
                        <a href="#" class="btn btn-outline">
                            <i class="fas fa-plus"></i>
                            Add More
                        </a>
                    </div>
                </div>

                <!-- Preferences -->
                <div class="section-card">
                    <h3><i class="fas fa-sliders-h"></i> Preferences</h3>
                    <div class="preferences-list">
                        <div class="preference-item">
                            <span>Autoplay Next Episode</span>
                            <label class="switch">
                                <input type="checkbox" checked>
                                <span class="slider"></span>
                            </label>
                        </div>
                        <div class="preference-item">
                            <span>Download Quality</span>
                            <select class="preference-select">
                                <option>Best Quality</option>
                                <option>Good Quality</option>
                                <option>Data Saver</option>
                            </select>
                        </div>
                        <div class="preference-item">
                            <span>Subtitles</span>
                            <select class="preference-select">
                                <option>English</option>
                                <option>Spanish</option>
                                <option>French</option>
                            </select>
                        </div>
                        <div class="preference-item">
                            <span>Parental Controls</span>
                            <a href="#" class="btn btn-outline btn-small">Configure</a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Devices Section -->
            <div class="section-card mt-4">
                <h3><i class="fas fa-tv"></i> Active Devices</h3>
                <div class="devices-list">
                    <div class="device-item">
                        <i class="fas fa-desktop"></i>
                        <div class="device-info">
                            <div class="device-name">Chrome on Windows</div>
                            <div class="device-status">Active now</div>
                        </div>
                        <button class="btn btn-outline btn-small">Sign Out</button>
                    </div>
                    <div class="device-item">
                        <i class="fas fa-mobile-alt"></i>
                        <div class="device-info">
                            <div class="device-name">iPhone 14 Pro</div>
                            <div class="device-status">Last used 2 days ago</div>
                        </div>
                        <button class="btn btn-outline btn-small">Sign Out</button>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <%@ include file="/partials/footer.jsp" %>
    
    <script src="assets/js/prime.js"></script>
    <style>
        .profile-actions {
            margin-left: auto;
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
        }
        
        .account-info {
            margin-bottom: 1.5rem;
        }
        
        .info-item {
            display: flex;
            justify-content: space-between;
            padding: 0.5rem 0;
            border-bottom: 1px solid var(--prime-gray-dark);
        }
        
        .info-item:last-child {
            border-bottom: none;
        }
        
        .info-label {
            color: var(--prime-gray);
        }
        
        .info-value {
            font-weight: 500;
        }
        
        .section-actions {
            display: flex;
            gap: 0.5rem;
            margin-top: 1rem;
            flex-wrap: wrap;
        }
        
        .watchlist-actions {
            display: flex;
            gap: 0.25rem;
            margin-top: 0.5rem;
        }
        
        .preferences-list {
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }
        
        .preference-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .switch {
            position: relative;
            display: inline-block;
            width: 50px;
            height: 24px;
        }
        
        .switch input {
            opacity: 0;
            width: 0;
            height: 0;
        }
        
        .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: var(--prime-gray-dark);
            transition: .4s;
            border-radius: 24px;
        }
        
        .slider:before {
            position: absolute;
            content: "";
            height: 16px;
            width: 16px;
            left: 4px;
            bottom: 4px;
            background-color: white;
            transition: .4s;
            border-radius: 50%;
        }
        
        input:checked + .slider {
            background-color: var(--prime-blue);
        }
        
        input:checked + .slider:before {
            transform: translateX(26px);
        }
        
        .preference-select {
            background: var(--prime-dark);
            border: 1px solid var(--prime-gray-dark);
            color: var(--prime-light);
            padding: 0.25rem 0.5rem;
            border-radius: 4px;
            min-width: 120px;
        }
        
        .devices-list {
            display: flex;
            flex-direction: column;
            gap: 1rem;
            margin-top: 1rem;
        }
        
        .device-item {
            display: flex;
            align-items: center;
            gap: 1rem;
            padding: 1rem;
            background: var(--prime-dark);
            border-radius: 8px;
        }
        
        .device-item i {
            font-size: 1.5rem;
            color: var(--prime-blue);
        }
        
        .device-info {
            flex: 1;
        }
        
        .device-name {
            font-weight: bold;
        }
        
        .device-status {
            font-size: 0.9rem;
            color: var(--prime-gray);
        }
    </style>
</body>
</html>