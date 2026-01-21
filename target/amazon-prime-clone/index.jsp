<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Prime Video - Welcome</title>
    <link rel="stylesheet" href="assets/css/prime.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="icon" type="image/x-icon" href="https://www.primevideo.com/favicon.ico">
</head>
<body>
    <div class="loading-screen">
        <div class="loading-content">
            <i class="fas fa-play-circle"></i>
            <h1>Prime Video</h1>
            <p>Loading your entertainment...</p>
        </div>
    </div>
    
    <script>
        setTimeout(() => {
            window.location.href = 'home';
        }, 1500);
    </script>
</body>
</html>