<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Life Flow Blood Bank</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        /* Custom styles for enhancements */
        .hero-bg { background: linear-gradient(to right, #ff0000, #ffffff); color: white; }
        .fade-in { opacity: 0; transform: translateY(20px); transition: opacity 1s ease, transform 1s ease; }
        .fade-in.visible { opacity: 1; transform: translateY(0); }
        .timeline-item { border-left: 4px solid #dc2626; padding-left: 20px; margin-left: 10px; }
        body { font-family: 'Courier New', Courier, monospace; }
    </style>
</head>
<body class="bg-gray-50 text-gray-900">
    <!-- Header Section -->
     <header class="bg-red-600 shadow-lg sticky top-0 z-50">
    <div class="container mx-auto px-4 py-4 flex justify-between items-center">
        <div class="text-white text-2xl font-bold">Life Flow Blood Bank</div>
        <nav class="hidden md:flex space-x-6 items-center">
            <a href="index.jsp" class="text-white hover:text-red-200 transition duration-300">Home</a>
            <a href="aboutus.jsp" class="text-white hover:text-red-200 transition duration-300">About Us</a>
            <a href="donate.jsp" class="text-white hover:text-red-200 transition duration-300">Donate Blood</a>
            <a href="findDonor.jsp" class="text-white hover:text-red-200 transition duration-300">Find Donor</a>
            <a href="#contact" class="text-white hover:text-red-200 transition duration-300">Contact</a>

            <!-- Admin Login Icon -->
            <a href="login.jsp" title="Admin Login" class="text-white hover:text-red-200 transition duration-300 flex items-center space-x-1 ml-4">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M5.121 17.804A9 9 0 1118.88 6.196M15 11a3 3 0 11-6 0 3 3 0 016 0z" />
                </svg>
                <span class="hidden sm:inline">Login</span>
            </a>

            <!-- Admin Register Icon -->
            <a href="register.jsp" title="Admin Register" class="text-white hover:text-red-200 transition duration-300 flex items-center space-x-1 ml-2">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M12 4v16m8-8H4" />
                </svg>
                <span class="hidden sm:inline">Sign Up</span>
            </a>
        </nav>
        <button id="mobile-menu-btn" class="md:hidden text-white focus:outline-none">
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-8 h-8">
                <path stroke-linecap="round" stroke-linejoin="round" d="M3.75 6.75h16.5M3.75 12h16.5M3.75 17.25h16.5" />
            </svg>
        </button>
    </div>
    <div id="mobile-menu" class="hidden md:hidden bg-red-700 px-4 py-2 space-y-2">
        <a href="index.jsp" class="block text-white py-2">Home</a>
        <a href="aboutus.jsp" class="block text-white py-2">About</a>
        <a href="donate.jsp" class="block text-white py-2">Donate Blood</a>
        <a href="findDonor.jsp" class="block text-white py-2">Find Donor</a>
        <a href="#contact" class="block text-white py-2">Contact</a>
        <a href="login.jsp" class="block text-white py-2 flex items-center space-x-2">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 inline" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                <path stroke-linecap="round" stroke-linejoin="round" d="M5.121 17.804A9 9 0 1118.88 6.196M15 11a3 3 0 11-6 0 3 3 0 016 0z" />
            </svg>
            <span>Login</span>
        </a>
        <a href="register.jsp" class="block text-white py-2 flex items-center space-x-2">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 inline" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                <path stroke-linecap="round" stroke-linejoin="round" d="M12 4v16m8-8H4" />
            </svg>
            <span>Sign Up</span>
        </a>
    </div>
</header>


    <!-- Hero Section -->
    <section id="hero" class="hero-bg py-20 text-center">
        <div class="container mx-auto px-4">
            <h1 class="text-4xl md:text-6xl font-bold mb-4">About Life Flow Blood Bank</h2>
            <p class="text-lg md:text-xl mb-6 max-w-2xl mx-auto">Committed to saving lives through safe blood donation since 2005. Learn more about our mission, our dedicated team, and the impact we've made on communities worldwide.</p>
            <img src="https://storage.googleapis.com/workspace-0f70711f-8b4e-4d94-86f1-2a93ccde5887/image/04789aa7-05ea-4111-895f-afe5853d1331.png" alt="Professional team of medical staff and volunteers in a modern blood bank facility, working together with equipment and computer systems in a clean, organized environment, daytime lighting, realistic photograph" class="w-full max-w-4xl mx-auto rounded-lg shadow-lg mt-8" onerror="this.style.display='none';" />
        </div>
    </section>

    <!-- Mission and Vision Section -->
    <section id="mission-vision" class="py-16 bg-white">
        <div class="container mx-auto px-4">
            <div class="grid grid-cols-1 md:grid-cols-2 gap-12">
                <div class="text-center fade-in">
                    <h2 class="text-3xl font-bold mb-4 text-red-600">Our Mission</h2>
                    <p class="text-lg text-gray-600">To provide a safe, accessible, and efficient blood donation service that ensures every patient in need has access to quality blood products, while educating and empowering our community to become regular donors.</p>
                </div>
                <div class="text-center fade-in">
                    <h2 class="text-3xl font-bold mb-4 text-red-600">Our Vision</h2>
                    <p class="text-lg text-gray-600">A world where no life is lost due to lack of blood. We envision a global network of donors and advanced facilities that make blood donation a standard act of kindness, transforming healthcare outcomes everywhere.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Our History Section -->
    <section id="history" class="py-16 bg-red-50">
        <div class="container mx-auto px-4">
            <h2 class="text-3xl font-bold text-center mb-8 text-red-600">Our History</h2>
            <div class="max-w-4xl mx-auto">
                <div class="timeline-item mb-8">
                    <h3 class="text-xl font-semibold">2005: The Beginning</h3>
                    <p class="text-gray-600">Founded by a group of passionate doctors and volunteers in a small clinic, we started with just 50 donors to address local blood shortages.</p>
                </div>
                <div class="timeline-item mb-8">
                    <h3 class="text-xl font-semibold">2010: First Expansion</h3>
                    <p class="text-gray-600">Opened our first state-of-the-art facility, increasing donations by 300% and partnering with hospitals across the region.</p>
                </div>
                <div class="timeline-item mb-8">
                    <h3 class="text-xl font-semibold">2015: Digital Revolution</h3>
                    <p class="text-gray-600">Launched our online donor registry and mobile app, making it easier for people to connect with donation drives and find nearby centers.</p>
                </div>
                <div class="timeline-item mb-8">
                    <h3 class="text-xl font-semibold">2020: Pandemic Response</h3>
                    <p class="text-gray-600">Adapted to global challenges by implementing strict safety protocols and virtual campaigns, ensuring blood supply remained steady during emergencies.</p>
                </div>
                <div class="timeline-item">
                    <h3 class="text-xl font-semibold">2023: Today and Beyond</h3>
                    <p class="text-gray-600">Now serving over 12,500 donors annually, hosting 500+ drives, and pioneering research in blood preservation and rapid testing.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Meet the Team Section -->
    <section id="team" class="py-16 bg-white">
        <div class="container mx-auto px-4">
            <h2 class="text-3xl font-bold text-center mb-8 text-red-600">Meet Our Team</h2>
            <p class="text-lg text-center mb-10 text-gray-600">Our dedicated professionals and volunteers work tirelessly to make a difference every day.</p>
            <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
                <div class="text-center bg-gray-100 p-6 rounded-lg shadow-md fade-in">
                    <img src="https://storage.googleapis.com/workspace-0f70711f-8b4e-4d94-86f1-2a93ccde5887/image/3aa66ee8-bf15-4e06-9a5e-3ab1e5afaa1d.png" alt="Portrait of Dr. Emily Chen, female doctor with short hair, wearing a white lab coat and stethoscope, smiling confidently in a medical office setting, professional lighting, headshot style" class="mx-auto w-24 h-24 rounded-full mb-4" onerror="this.style.display='none';" />
                    <h3 class="text-xl font-semibold">Dr. Emily Chen</h3>
                    <p class="text-gray-600">Chief Medical Officer</p>
                    <p class="text-sm text-gray-500 mt-2">Over 15 years in hematology and transfusion medicine.</p>
                </div>
                <div class="text-center bg-gray-100 p-6 rounded-lg shadow-md fade-in">
                    <img src="https://storage.googleapis.com/workspace-0f70711f-8b4e-4d94-86f1-2a93ccde5887/image/48622ac5-a71f-4a8a-88f5-cce743a1d0dd.png" alt="Portrait of John Smith, male volunteer coordinator with glasses and a warm smile, dressed in business casual attire, standing in a community event setting with people in the background" class="mx-auto w-24 h-24 rounded-full mb-4" onerror="this.style.display='none';" />
                    <h3 class="text-xl font-semibold">John Smith</h3>
                    <p class="text-gray-600">Volunteer Coordinator</p>
                    <p class="text-sm text-gray-500 mt-2">Leading community engagement and donor outreach programs.</p>
                </div>
                <div class="text-center bg-gray-100 p-6 rounded-lg shadow-md fade-in">
                    <img src="https://storage.googleapis.com/workspace-0f70711f-8b4e-4d94-86f1-2a93ccde5887/image/674f268e-42cd-424b-b910-79b705d1fc5b.png" alt="Portrait of Sarah Patel, female logistics manager with ponytail and professional expression, wearing a uniform in a warehouse-like facility with supply boxes and medical equipment" class="mx-auto w-24 h-24 rounded-full mb-4" onerror="this.style.display='none';" />
                    <h3 class="text-xl font-semibold">Sarah Patel</h3>
                    <p class="text-gray-600">Operations Manager</p>
                    <p class="text-sm text-gray-500 mt-2">Ensuring efficient supply chain and inventory management.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Core Values Section -->
    <section id="values" class="py-16 bg-red-50">
        <div class="container mx-auto px-4">
            <h2 class="text-3xl font-bold text-center mb-8 text-red-600">Our Core Values</h2>
            <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
                <div class="text-center fade-in">
                    <div class="mb-4">
                        <img src="https://storage.googleapis.com/workspace-0f70711f-8b4e-4d94-86f1-2a93ccde5887/image/54917e7f-165a-428a-ba4a-db8df6eb92c2.png" alt="Icon of hands holding a heart, representing compassion and care in blood donation, red and white colors, symbolic illustration style" class="w-20 h-20 mx-auto" onerror="this.style.display='none';" />
                    </div>
                    <h3 class="text-xl font-semibold mb-2">Compassion</h3>
                    <p class="text-gray-600">We treat every donor and recipient with kindness and respect, recognizing the invaluable gift of life.</p>
                </div>
                <div class="text-center fade-in">
                    <div class="mb-4">
                        <img src="https://storage.googleapis.com/workspace-0f70711f-8b4e-4d94-86f1-2a93ccde5887/image/9a08d306-9ae3-4c3b-b80b-8e8b75a6a65c.png" alt="Icon of a shield emblem signifying safety and protection, blue shield on white background, minimalistic vector design" class="w-20 h-20 mx-auto" onerror="this.style.display='none';" />
                    </div>
                    <h3 class="text-xl font-semibold mb-2">Safety First</h3>
                    <p class="text-gray-600">Rigorous screening and sterilization processes ensure all donated blood is safe and ready for use.</p>
                </div>
                <div class="text-center fade-in">
                    <div class="mb-4">
                        <img src="https://storage.googleapis.com/workspace-0f70711f-8b4e-4d94-86f1-2a93ccde5887/image/27e04134-e599-49cb-8488-ee07cc740247.png" alt="Icon of interconnected hands forming a circle, representing community and teamwork, diverse skin tones, collaborative illustration" class="w-20 h-20 mx-auto" onerror="this.style.display='none';" />
                    </div>
                    <h3 class="text-xl font-semibold mb-2">Community Focused</h3>
                    <p class="text-gray-600">Building strong partnerships with hospitals, schools, and local organizations for sustainable impact.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Future Goals Section -->
    <section id="goals" class="py-16 bg-white">
        <div class="container mx-auto px-4 text-center">
            <h2 class="text-3xl font-bold mb-8 text-red-600">Looking Ahead</h2>
            <p class="text-lg mb-6 max-w-2xl mx-auto text-gray-600">We're constantly innovating to meet growing demands and ensure we can serve even more communities.</p>
            <ul class="text-left max-w-2xl mx-auto space-y-4">
                <li class="flex items-center"><span class="text-red-600 mr-3">•</span> Expanding to rural areas with mobile donation units.</li>
                <li class="flex items-center"><span class="text-red-600 mr-3">•</span> Developing AI-driven donor matching for faster emergency responses.</li>
                <li class="flex items-center"><span class="text-red-600 mr-3">•</span> Launching educational programs to combat myths about blood donation.</li>
            </ul>
        </div>
    </section>

    <!-- Footer Section -->
    <footer id="contact" class="bg-red-600 text-white py-10">
        <div class="container mx-auto px-4 grid grid-cols-1 md:grid-cols-3 gap-8">
            <div>
                <h3 class="text-xl font-bold mb-4">Contact Us</h3>
                <p>Email: info@lifeflowbloodbank.com</p>
                <p>Phone: (123) 456-7890</p>
                <p>Address: 123 Blood Lane, Life City, 00000</p>
            </div>
            <div>
                <h3 class="text-xl font-bold mb-4">Quick Links</h3>
                <ul class="space-y-2">
                    <li><a href="index.html" class="hover:text-red-200">Home</a></li>
                    <li><a href="aboutus.jsp" class="hover:text-red-200">About Us</a></li>
                    <li><a href="donate.jsp" class="hover:text-red-200">Donate Blood</a></li>
                </ul>
            </div>
            <div class="text-center">
                <h3 class="text-xl font-bold mb-4">Stay Connected</h3>
                <p>Follow us for updates on blood drives and success stories.</p>
            </div>
        </div>
        <div class="text-center mt-8 border-t border-red-500 pt-4">
            <p>©2025 Life Flow Blood Bank. All rights reserved. | Designed with care for humanity.</p>
        </div>
    </footer>

    <!-- JavaScript for Interactions -->
    <script>
        // Mobile menu toggle
        const btn = document.getElementById('mobile-menu-btn');
        const menu = document.getElementById('mobile-menu');
        btn.addEventListener('click', () => {
            menu.classList.toggle('hidden');
        });

        // Fade-in animation on scroll
        const faders = document.querySelectorAll('.fade-in');
        const appearOptions = { threshold: 0.6, rootMargin: '0px 0px -100px 0px' };
        const appearOnScroll = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('visible');
                }
            });
        }, appearOptions);
        faders.forEach(fader => appearOnScroll.observe(fader));

        // Smooth scrolling for nav links
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();
                const target = document.querySelector(this.getAttribute('href'));
                if (target) {
                    target.scrollIntoView({ behavior: 'smooth' });
                }
            });
        });
    </script>
</body>
</html>
</content>
</create_file>
    