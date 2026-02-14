<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>For My Vennela ❤️</title>
    <style>
        /* General Reset & Vital Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background: linear-gradient(135deg, #ff9a9e 0%, #fecfef 99%, #fecfef 100%);
            height: 100vh;
            overflow: hidden;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #fff;
            position: relative;
        }

        /* Loading Screen */
        #loader {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: #ff758c;
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 9999;
            flex-direction: column;
            transition: opacity 1s ease-out;
        }

        .heart-pulse {
            font-size: 80px;
            color: #fff;
            animation: pulse 1.2s infinite;
        }

        @keyframes pulse {
            0% {
                transform: scale(1);
            }

            50% {
                transform: scale(1.2);
            }

            100% {
                transform: scale(1);
            }
        }

        /* Main Container for Game & Message */
        #app-container {
            width: 100%;
            max-width: 500px;
            /* Mobile Friendly */
            height: 100%;
            position: relative;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border: 2px solid rgba(255, 255, 255, 0.2);
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
            border-radius: 20px;
            display: none;
            /* Hidden until loaded */
            flex-direction: column;
            overflow: hidden;
        }

        /* Screens */
        .screen {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 20px;
            text-align: center;
            transition: opacity 0.5s ease-in-out;
            opacity: 0;
            pointer-events: none;
            z-index: 1;
        }

        .screen.active {
            opacity: 1;
            pointer-events: all;
            z-index: 10;
        }

        /* Typography */
        h1 {
            font-size: 2.5rem;
            margin-bottom: 20px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
            color: #d63384;
            font-family: 'Brush Script MT', cursive;
        }

        p {
            font-size: 1.2rem;
            margin-bottom: 20px;
            color: #333;
            line-height: 1.6;
            background: rgba(255, 255, 255, 0.6);
            padding: 15px;
            border-radius: 10px;
        }

        /* Buttons */
        .btn {
            padding: 15px 40px;
            font-size: 1.2rem;
            background: #ff4757;
            color: white;
            border: none;
            border-radius: 50px;
            cursor: pointer;
            box-shadow: 0 4px 15px rgba(255, 71, 87, 0.4);
            transition: transform 0.2s, background 0.2s;
            text-transform: uppercase;
            letter-spacing: 1px;
            font-weight: bold;
            margin-top: 10px;
        }

        .btn:hover {
            transform: scale(1.05);
            background: #ff6b81;
        }

        .btn:active {
            transform: scale(0.95);
        }

        /* Game Canvas */
        #gameCanvas {
            max-width: 100%;
            height: 60vh;
            border-radius: 10px;
            border: 2px solid #fff;
            background: rgba(0, 0, 0, 0.05);
            /* Slightly transparent */
            touch-action: none;
        }

        /* Animations */
        @keyframes float {
            0% {
                transform: translateY(0px);
            }

            50% {
                transform: translateY(-20px);
            }

            100% {
                transform: translateY(0px);
            }
        }

        .floating {
            animation: float 3s ease-in-out infinite;
        }

        /* Success Message Styles */
        .success-content {
            background: white;
            color: #d63384;
            padding: 30px;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            max-height: 90%;
            overflow-y: auto;
            width: 90%;
        }

        .romantic-text {
            color: #c9184a;
            font-weight: bold;
            display: block;
            margin-top: 10px;
            font-size: 1.4rem;
        }

        .small-text {
            font-size: 0.9rem;
            color: #666;
            margin-top: 5px;
            display: block;
        }

        /* Mobile specific adjustments */
        @media (max-width: 600px) {
            #app-container {
                width: 100%;
                height: 100%;
                border-radius: 0;
                border: none;
            }

            h1 {
                font-size: 2rem;
            }
        }
    </style>
</head>

<body>

    <!-- Loader -->
    <div id="loader">
        <div class="heart-pulse">❤️</div>
        <p style="color: white; background: none; margin-top: 20px;">Fetching Kittu's Heart...</p>
    </div>

    <!-- Main App Container -->
    <div id="app-container">

        <!-- Screen 1: Welcome -->
        <div id="screen-welcome" class="screen active">
            <h1 class="floating">Hello Vennela!</h1>
            <p>
                To my beautiful wife,<br>
                For our first Valentine's Day,<br>
                I have a challenge and a surprise.<br>
                <br>
                Catch my love to unlock the message! ❤️<br>
                (Bonus: Catch 🤴 for extra points!)
            </p>
            <button class="btn" onclick="startGame()">Start Game</button>
        </div>

        <!-- Screen 2: Game -->
        <div id="screen-game" class="screen">
            <h2 style="color: #d63384; margin-bottom: 10px;">Goal: 50 Points</h2>
            <div style="display: flex; gap: 10px; margin-bottom: 5px;">
                <span id="score-display" style="font-weight: bold; color: #ff4757; font-size: 1.2rem;">Score: 0 /
                    50</span>
            </div>
            <canvas id="gameCanvas" width="320" height="400"></canvas>
            <p style="font-size: 0.9rem; margin-top: 10px; background: none; padding: 5px;">
                Drag the Basket 🧺 to catch Hearts ❤️ & Kittu 🤴<br>
                Avoid the Broken Hearts 💔!
            </p>
        </div>

        <!-- Screen 3: Victory / Reveal -->
        <div id="screen-reveal" class="screen">
            <div class="success-content">
                <h1>Happy Valentine's Day!</h1>
                <p>
                    My Dearest Vennela,<br><br>
                    You caught all my love! ❤️<br>
                    Just like you caught my heart on May 23, 2025.<br><br>
                    Being married to you is the best adventure of my life.<br>
                    I promise to always make you smile and fill your life with love & joy.<br><br>
                    <span class="romantic-text">I Love You!</span>
                </p>
                <button class="btn" onclick="showSurprise()">One More Surprise</button>
            </div>
        </div>

        <!-- Screen 4: Final Message -->
        <div id="screen-final" class="screen">
            <h1 style="font-size: 1.8rem;">Forever Yours, Kittu</h1>
            <div class="floating" style="font-size: 60px; margin: 20px 0;">💏</div>
            <p>
                <b>Days we've been married:</b><br>
                <span id="days-counter" style="font-size: 1.5rem; color: #ff4757; font-weight: bold;">...</span><br>
                <br>
                Every second counts.<br>
                Let's make today special!
            </p>
            <button class="btn" onclick="restartGame()">Play Again</button>
        </div>

    </div>

    <!-- Confetti Logic -->
    <script>
        // --- Game Logic ---
        const canvas = document.getElementById('gameCanvas');
        const ctx = canvas.getContext('2d');
        let gameInterval;
        let score = 0;
        const targetScore = 50;
        let hearts = [];
        let basket = { x: 135, y: 350, width: 60, height: 50 }; // Basket size
        let isGameRunning = false;

        // Draw Basket with Emoji
        function drawBasket() {
            ctx.font = "50px Arial";
            ctx.fillText("🧺", basket.x, basket.y + 40);
        }

        // Animated Background on Canvas
        function drawBackground() {
            // Optional: Draw faint hearts in background
        }

        // Falling Item Object
        class Item {
            constructor() {
                this.x = Math.random() * (canvas.width - 40);
                this.y = -50;
                this.speed = 3 + Math.random() * 3;
                this.type = Math.random(); // Determine type
                // 70% Heart, 20% Obstacle, 10% Bonus
            }

            draw() {
                if (this.type < 0.7) {
                    // Heart
                    ctx.font = "30px Arial";
                    ctx.fillText("❤️", this.x, this.y);
                    this.value = 5;
                    this.isBad = false;
                } else if (this.type < 0.9) {
                    // Obstacle
                    ctx.font = "30px Arial";
                    ctx.fillText("💔", this.x, this.y);
                    this.value = -10;
                    this.isBad = true;
                } else {
                    // Bonus (Kittu)
                    ctx.font = "35px Arial";
                    ctx.fillText("🤴", this.x, this.y);
                    this.value = 15;
                    this.isBad = false;
                }
            }

            update() {
                this.y += this.speed;
            }
        }

        // Input Handling
        function moveBasket(e) {
            e.preventDefault();
            const rect = canvas.getBoundingClientRect();
            let clientX;

            if (e.type === 'touchmove') {
                clientX = e.touches[0].clientX;
            } else {
                clientX = e.clientX;
            }

            // scaling factor
            const scaleX = canvas.width / rect.width;
            let relativeX = (clientX - rect.left) * scaleX;

            // Keep basket within bounds
            if (relativeX > 0 && relativeX < canvas.width) {
                basket.x = relativeX - basket.width / 2;
            }
        }

        // Game Loop
        function updateGame() {
            if (!isGameRunning) return;

            ctx.clearRect(0, 0, canvas.width, canvas.height); // Clear canvas

            // Spawn items
            if (Math.random() < 0.04) { // Spawn rate
                hearts.push(new Item());
            }

            // Draw Basket
            drawBasket();

            // Update & Draw Items
            for (let i = 0; i < hearts.length; i++) {
                hearts[i].update();
                hearts[i].draw();

                // Simple Box Collision Detection
                if (
                    hearts[i].y > basket.y &&
                    hearts[i].y < basket.y + basket.height &&
                    hearts[i].x > basket.x - 20 &&
                    hearts[i].x < basket.x + basket.width
                ) {
                    // Catch!
                    score += hearts[i].value;

                    // Prevent negative score
                    if (score < 0) score = 0;

                    // Visual Feedback (Flash background if bad)
                    if (hearts[i].isBad) {
                        canvas.style.backgroundColor = 'rgba(255, 0, 0, 0.2)';
                        setTimeout(() => canvas.style.backgroundColor = 'rgba(0,0,0,0.05)', 200);
                    }

                    hearts.splice(i, 1);
                    i--;
                    updateScore();
                }
                // Remove if out of bounds
                else if (hearts[i].y > canvas.height) {
                    hearts.splice(i, 1);
                    i--;
                }
            }

            requestAnimationFrame(updateGame);
        }

        function updateScore() {
            document.getElementById('score-display').innerText = `Score: ${score} / ${targetScore}`;
            if (score >= targetScore) {
                endGame();
            }
        }

        function startGame() {
            switchScreen('screen-game');
            basket.x = canvas.width / 2 - basket.width / 2; // Center basket
            score = 0;
            hearts = [];
            isGameRunning = true;
            updateScore();

            // Events
            canvas.addEventListener('mousemove', moveBasket);
            canvas.addEventListener('touchmove', moveBasket, { passive: false });

            updateGame();
        }

        function endGame() {
            isGameRunning = false;
            // Confetti or visual effect
            setTimeout(() => {
                switchScreen('screen-reveal');
                createConfetti();
            }, 500);
        }

        function restartGame() {
            switchScreen('screen-welcome');
        }

        function showSurprise() {
            switchScreen('screen-final');
            calculateDays();
            createConfetti();
        }

        function calculateDays() {
            const start = new Date("2025-05-23");
            const now = new Date();
            const diff = now - start;
            const days = Math.floor(diff / (1000 * 60 * 60 * 24));
            document.getElementById('days-counter').innerText = `${days} Days`;
        }

        // --- Navigation ---
        function switchScreen(screenId) {
            document.querySelectorAll('.screen').forEach(s => s.classList.remove('active'));
            document.getElementById(screenId).classList.add('active');
        }

        // --- Utilities ---
        window.onload = function () {
            setTimeout(() => {
                document.getElementById('loader').style.opacity = '0';
                setTimeout(() => {
                    document.getElementById('loader').style.display = 'none';
                    document.getElementById('app-container').style.display = 'flex';
                }, 1000);
            }, 2000);
        };

        // Simple Confetti
        function createConfetti() {
            const colors = ['#ff0000', '#00ff00', '#0000ff', '#ffff00', '#ff00ff'];
            for (let i = 0; i < 50; i++) {
                const confetti = document.createElement('div');
                confetti.innerText = Math.random() > 0.5 ? '❤️' : '🎉';
                confetti.style.position = 'absolute';
                confetti.style.fontSize = Math.random() * 20 + 10 + 'px';
                confetti.style.left = Math.random() * 100 + '%';
                confetti.style.top = '-10px';
                confetti.style.zIndex = '1000';
                confetti.style.animation = `fall ${Math.random() * 3 + 2}s linear forwards`;
                document.body.appendChild(confetti);

                setTimeout(() => confetti.remove(), 5000);
            }
        }

        // Add keyframes for confetti in JS to avoid CSS clutter
        const styleSheet = document.createElement("style");
        styleSheet.innerText = `
            @keyframes fall {
                to {
                    transform: translateY(100vh) rotate(720deg);
                }
            }
        `;
        document.head.appendChild(styleSheet);

        // Prevent default touch behavior (scrolling)
        document.body.addEventListener('touchmove', function (e) { e.preventDefault(); }, { passive: false });

    </script>
</body>

</html>
