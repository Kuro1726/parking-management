<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!doctype html>
    <html lang="en">

    <head>
        <title>GreenGate Parking Management</title>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="static/css/style.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    </head>

    <body>
        <jsp:include page="views/includes/navbar_mainpage.jsp" />

        <div class="hero-image">
            <div class="hero-overlay"></div>
            <div class="hero-text-box">
                <h1 class="hero-title">Welcome to GreenGate Parking
                    Management</h1>
                <p class="hero-description">
                    Welcome to GreenGate Parking Management, a modern platform designed to make
                    finding and managing parking spaces easier, safer, and more efficient.
                </p>
                <p class="hero-description hero-description-spaced">
                    Our website allows customers to check available parking slots, view pricing,
                    and explore their parking history in a simple and convenient way. For parking
                    administrators and staff, the system helps manage zones, track vehicle check-ins
                    and check-outs, and organize revenue reports efficiently.
                </p>
                <p class="hero-description hero-description-spaced">
                    Our goal is to improve the parking experience for everyone by utilizing
                    smart technology, making it easier for people to park securely and connect
                    seamlessly with our services.
                </p>

                <div class="contact-container hero-contact-container">
                    <h2 class="contact-title hero-contact-title"><i class="fa-solid fa-envelope-open-text"></i> Contact
                        Us</h2>
                    <div class="contact-info hero-contact-info">
                        <p><i class="fa-solid fa-envelope"></i> <strong>Email:</strong> support@greengateparking.com</p>
                        <p><i class="fa-solid fa-phone"></i> <strong>Phone:</strong> +84 888 191 868</p>
                        <p><i class="fa-solid fa-location-dot"></i> <strong>Address:</strong> Little Saint James Island,
                            US Virgin Islands</p>
                    </div>
                </div>
            </div>
        </div>

        <footer class="footer">
            <p>&copy; 2026 GreenGate Parking Management</p>
        </footer>
    </body>

    </html>