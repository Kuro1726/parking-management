<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <title>GreenGate Park</title>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="static/css/style.css" />
    </head>
    <body>
        <jsp:include page="views/includes/navbar_mainpage.jsp"/>

        <div class="hero-image">
            <div class="hero-overlay"></div>
            <div class="hero-text-box">
                <h1 class="hero-title">Welcome to GreenGate Park</h1>
                <p class="hero-description">
                    Welcome to our GreenGate Park, a modern platform designed to make
                    visiting and managing parks easier and more enjoyable.
                </p>
                <p class="hero-description hero-description-spaced">
                    Our website allows visitors to explore park information, check
                    available facilities, view events, and make reservations in a simple
                    and convenient way. For park administrators, the system helps manage
                    park services, track visitors, and organize activities efficiently.
                </p>
                <p class="hero-description hero-description-spaced">
                    Our goal is to improve the park experience for everyone by combining
                    nature with smart technology, making it easier for people to relax,
                    explore, and connect with the outdoors.
                </p>

                <div class="contact-container hero-contact-container">
                    <h2 class="contact-title hero-contact-title">Contact Us</h2>
                    <div class="contact-info hero-contact-info">
                        <p><strong>Email:</strong> support@greengatepark.com</p>
                        <p><strong>Phone:</strong> +84 888 191 868</p>
                        <p><strong>Address:</strong> Little Saint James Island, US Virgin Islands</p>
                    </div>
                </div>
            </div>
        </div>

        <footer class="footer">
            <p>&copy; 2026 GreenGate Park</p>
        </footer>
    </body>
</html>
