<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Blood Bank - Home - Save Lives, Donate Blood</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        /* Custom styles for enhancements */
        .hero-bg { background: linear-gradient(to right, #ff0000, #ffffff); color: white; }
        .fade-in { opacity: 0; transform: translateY(20px); transition: opacity 1s ease, transform 1s ease; }
        .fade-in.visible { opacity: 1; transform: translateY(0); }
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
    <section id="home" class="hero-bg py-20 text-center">
        <div class="container mx-auto px-4 flex flex-col md:flex-row items-center">
            <div class="mb-10 md:mb-0 md:mr-10 md:w-1/2">
                <h1 class="text-4xl md:text-6xl font-bold mb-4">Give the Gift of Life</h1>
                <p class="text-lg md:text-xl mb-6 max-w-lg mx-auto">Every drop counts. Join our community of donors and help save lives today. Blood donation is safe, simple, and vital for patients in need.</p>
                <a href="donate.jsp" class="bg-white text-red-600 px-8 py-3 rounded-lg font-semibold hover:bg-red-100 transition duration-300">Donate Now</a>
            </div>
            <div class="md:w-1/2">
                <img src="https://storage.googleapis.com/workspace-0f70711f-8b4e-4d94-86f1-2a93ccde5887/image/99172b0f-ebe6-4ee9-a6d6-694fca05d577.png" alt="Group of diverse volunteers in medical attire displaying blood donation equipment in a brightly lit hospital room with red crosses and plasma bags, warm and inviting atmosphere, high detail, realistic style" class="w-full h-auto rounded-lg shadow-lg" onerror="this.style.display='none';" />
            </div>
        </div>
    </section>

    <!-- Why Donate Section -->
    <section class="py-16 bg-white">
        <div class="container mx-auto px-4">
            <h2 class="text-3xl font-bold text-center mb-8 text-red-600">Why Donate Blood?</h2>
            <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
                <div class="text-center fade-in">
                    <div class="mb-4">
                        <img src="https://storage.googleapis.com/workspace-0f70711f-8b4e-4d94-86f1-2a93ccde5887/image/f9fdb797-6e7e-400e-bf01-d8632539b207.png" alt="Heart icon illustration representing health and care, red color, simple vector style, centered on white background" class="mx-auto w-20 h-20 rounded-full" onerror="this.style.display='none';" />
                    </div>
                    <h3 class="text-xl font-semibold mb-2">Helps Save Lives</h3>
                    <p class="text-gray-600">Blood donations are crucial for surgeries, accidents, and treatments for conditions like anemia and cancer.</p>
                </div>
                <div class="text-center fade-in">
                    <div class="mb-4">
                        <img src="https://storage.googleapis.com/workspace-0f70711f-8b4e-4d94-86f1-2a93ccde5887/image/ea0f0a54-828f-4c63-938e-5ac5aa5dc742.png" alt="Community people holding hands, diverse group smiling, unity symbol, warm colors, illustration style" class="mx-auto w-20 h-20 rounded-full" onerror="this.style.display='none';" />
                    </div>
                    <h3 class="text-xl font-semibold mb-2">Builds Community</h3>
                    <p class="text-gray-600">Be part of a network of lifesavers. Your donation connects you to heroes and patients alike.</p>
                </div>
                <div class="text-center fade-in">
                    <div class="mb-4">
                        <img src="https://storage.googleapis.com/workspace-0f70711f-8b4e-4d94-86f1-2a93ccde5887/image/21fe99f5-b109-41be-9be5-dab2b5161b5a.png" alt="Clock showing quick process, stopwatch icon, green and white, minimalistic design" class="mx-auto w-20 h-20 rounded-full" onerror="this.style.display='none';" />
                    </div>
                    <h3 class="text-xl font-semibold mb-2">Quick and Safe Process</h3>
                    <p class="text-gray-600">The donation takes about 10-15 minutes. Rest assured, our trained staff ensures safety and comfort.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Statistics Section -->
    <section class="py-16 bg-red-50">
        <div class="container mx-auto px-4 text-center">
            <h2 class="text-3xl font-bold mb-8 text-red-600">Our Impact</h2>
            <p class="text-lg mb-10">Together, we've made a real difference. Here are some quick stats from our blood bank community.</p>
            <div class="grid grid-cols-1 md:grid-cols-4 gap-6">
                <div class="bg-white p-6 rounded-lg shadow-md fade-in">
                    <h3 class="text-2xl font-bold text-red-600">50,000+</h3>
                    <p class="text-gray-600">Lives Saved</p>
                </div>
                <div class="bg-white p-6 rounded-lg shadow-md fade-in">
                    <h3 class="text-2xl font-bold text-red-600">12,500</h3>
                    <p class="text-gray-600">Total Donors</p>
                </div>
                <div class="bg-white p-6 rounded-lg shadow-md fade-in">
                    <h3 class="text-2xl font-bold text-red-600">500</h3>
                    <p class="text-gray-600">Blood Drives Hosted</p>
                </div>
                <div class="bg-white p-6 rounded-lg shadow-md fade-in">
                    <h3 class="text-2xl font-bold text-red-600">24/7</h3>
                    <p class="text-gray-600">Emergency Response</p>
                </div>
            </div>
        </div>
    </section>

    <!-- How to Donate Section -->
    <section id="donate" class="py-16 bg-white">
        <div class="container mx-auto px-4">
            <h2 class="text-3xl font-bold text-center mb-8 text-red-600">How to Donate</h2>
            <ol class="list-decimal list-inside space-y-4 text-lg max-w-2xl mx-auto">
                <li>Register online or visit one of our centers.</li>
                <li>Answer a quick health questionnaire.</li>
                <li>Relax during a 10-15 minute donation process with our team's support.</li>
                <li>Enjoy refreshments and a thank-you kit!</li>
                <li>Track your donation history for future contributions.</li>
            </ol>
            <div class="text-center mt-8">
                <img src="https://storage.googleapis.com/workspace-0f70711f-8b4e-4d94-86f1-2a93ccde5887/image/8d113450-efa7-49fc-966f-1961ab9f0568.png" alt="Step-by-step illustration of the donation process with numbered icons for each step, showing people and medical equipment in a clean clinic setting, vibrant colors, detailed and educational style" class="w-full max-w-4xl mx-auto rounded-lg shadow-lg" onerror="this.style.display='none';" />
            </div>
        </div>
    </section>

    <!-- Testimonials Section -->
    <section class="py-16 bg-red-50">
        <div class="container mx-auto px-4">
            <h2 class="text-3xl font-bold text-center mb-8 text-red-600">What Donors Say</h2>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
                <blockquote class="bg-white p-6 rounded-lg shadow-md fade-in">
                    <p class="text-gray-600 italic mb-4">"Donating blood has been one of the most rewarding experiences. Knowing you're helping someone out there – it's priceless!"</p>
                    <cite class="font-semibold">- Sarah Johnson, Repeat Donor</cite>
                </blockquote>
                <blockquote class="bg-white p-6 rounded-lg shadow-md fade-in">
                    <p class="text-gray-600 italic mb-4">"The staff made me feel so comfortable. I'll definitely be back to save more lives."</p>
                    <cite class="font-semibold">- Michael Lee, First-Time Donor</cite>
                </blockquote>
            </div>
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
                    <li><a href="index.jsp" class="hover:text-red-200">Home</a></li>
                    <li><a href="aboutus.jsp" class="hover:text-red-200">About</a></li>
                    <li><a href="donate.jsp" class="hover:text-red-200">Donate Blood</a></li>
                </ul>
            </div>
            <div class="text-center">
                <h3 class="text-xl font-bold mb-4">Stay Connected</h3>
                <p>Follow us for updates on blood drives and success stories.</p>
            </div>
        </div>
        <div class="text-center mt-8 border-t border-red-500 pt-4">
            <p>© 2025 Life Flow Blood Bank. All rights reserved. | Designed with care for humanity.</p>
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
                target.scrollIntoView({ behavior: 'smooth' });
            });
        });
    </script>
</body>
</html>
</content>
</create_file>