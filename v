<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="mobile-web-app-capable" content="yes">
    <title>For My Beautiful Vennela ❤️</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
        }

        html {
            scroll-behavior: smooth;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            overflow-x: hidden;
            -webkit-tap-highlight-color: transparent;
            touch-action: manipulation;
        }

        .hearts-bg {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: 0;
        }

        .heart {
            position: absolute;
            font-size: 20px;
            animation: float 15s infinite;
            opacity: 0.6;
        }

        @keyframes float {
            0% {
                transform: translateY(100vh) rotate(0deg);
                opacity: 0;
            }
            10% {
                opacity: 0.6;
            }
            90% {
                opacity: 0.6;
            }
            100% {
                transform: translateY(-100px) rotate(360deg);
                opacity: 0;
            }
        }

        .container {
            position: relative;
            z-index: 1;
            max-width: 900px;
            margin: 0 auto;
            padding: 20px;
        }

        .screen {
            display: none;
            animation: fadeIn 0.8s ease-in;
        }

        .screen.active {
            display: block;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Welcome Screen */
        .welcome-screen {
            text-align: center;
            padding: 50px 20px;
        }

        .welcome-title {
            font-size: 3em;
            color: white;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
            margin-bottom: 20px;
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0%, 100% {
                transform: scale(1);
            }
            50% {
                transform: scale(1.05);
            }
        }

        .welcome-subtitle {
            font-size: 1.5em;
            color: #fff;
            margin-bottom: 40px;
            text-shadow: 1px 1px 2px rgba(0,0,0,0.2);
        }

        .envelope {
            width: 200px;
            height: 140px;
            margin: 40px auto;
            position: relative;
            cursor: pointer;
            transition: transform 0.3s;
        }

        .envelope:hover {
            transform: scale(1.1);
        }

        .envelope-body {
            width: 200px;
            height: 120px;
            background: #fff;
            position: relative;
            border-radius: 5px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
        }

        .envelope-flap {
            width: 0;
            height: 0;
            border-left: 100px solid transparent;
            border-right: 100px solid transparent;
            border-top: 80px solid #ff6b9d;
            position: absolute;
            top: 0;
            left: 0;
            transform-origin: top;
            transition: transform 0.5s;
        }

        .envelope:hover .envelope-flap {
            transform: rotateX(180deg);
        }

        .start-btn {
            background: linear-gradient(45deg, #ff6b9d, #feca57);
            color: white;
            border: none;
            padding: 20px 50px;
            font-size: 1.3em;
            border-radius: 50px;
            cursor: pointer;
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
            transition: all 0.3s;
            margin-top: 30px;
            min-height: 60px;
            -webkit-tap-highlight-color: transparent;
        }

        .start-btn:hover, .start-btn:active {
            transform: translateY(-5px);
            box-shadow: 0 15px 40px rgba(0,0,0,0.4);
        }

        /* Game Hub */
        .game-hub {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.3);
        }

        .game-hub h2 {
            color: #667eea;
            text-align: center;
            font-size: 2em;
            margin-bottom: 30px;
        }

        .progress-bar {
            background: #e0e0e0;
            height: 30px;
            border-radius: 15px;
            margin-bottom: 30px;
            overflow: hidden;
        }

        .progress-fill {
            background: linear-gradient(90deg, #667eea, #764ba2);
            height: 100%;
            width: 0%;
            transition: width 0.5s;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: bold;
        }

        .game-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }

        .game-card {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 30px;
            border-radius: 15px;
            cursor: pointer;
            transition: all 0.3s;
            text-align: center;
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
            min-height: 200px;
            -webkit-tap-highlight-color: transparent;
        }

        .game-card:hover:not(.completed):not(.locked),
        .game-card:active:not(.completed):not(.locked) {
            transform: translateY(-10px);
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
        }

        .game-card.completed {
            background: linear-gradient(135deg, #11998e 0%, #38ef7d 100%);
        }

        .game-card.locked {
            background: #999;
            cursor: not-allowed;
            opacity: 0.6;
        }

        .game-card h3 {
            font-size: 1.5em;
            margin-bottom: 10px;
        }

        .game-card .icon {
            font-size: 3em;
            margin-bottom: 15px;
        }

        /* Game Screens */
        .game-screen {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.3);
            min-height: 500px;
        }

        .game-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }

        .game-header h2 {
            color: #667eea;
            font-size: 2em;
        }

        .back-btn {
            background: #999;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 25px;
            cursor: pointer;
            transition: all 0.3s;
        }

        .back-btn:hover {
            background: #777;
        }

        /* Memory Game */
        .memory-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 15px;
            max-width: 500px;
            margin: 0 auto;
        }

        .memory-card {
            aspect-ratio: 1;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border-radius: 10px;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 3em;
            transition: all 0.3s;
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
            -webkit-tap-highlight-color: transparent;
            user-select: none;
        }

        .memory-card:hover,
        .memory-card:active {
            transform: scale(1.05);
        }

        .memory-card.flipped {
            background: white;
            border: 3px solid #667eea;
        }

        .memory-card.matched {
            background: linear-gradient(135deg, #11998e 0%, #38ef7d 100%);
            cursor: default;
        }

        .memory-card .back {
            display: none;
        }

        .memory-card.flipped .back,
        .memory-card.matched .back {
            display: block;
        }

        .memory-card.flipped .front,
        .memory-card.matched .front {
            display: none;
        }

        /* Quiz Game */
        .quiz-container {
            text-align: center;
        }

        .question {
            font-size: 1.5em;
            color: #333;
            margin-bottom: 30px;
            padding: 20px;
            background: #f8f8f8;
            border-radius: 10px;
        }

        .options {
            display: grid;
            gap: 15px;
            max-width: 500px;
            margin: 0 auto;
        }

        .option-btn {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            padding: 20px;
            border-radius: 10px;
            cursor: pointer;
            font-size: 1.1em;
            transition: all 0.3s;
            min-height: 60px;
            -webkit-tap-highlight-color: transparent;
        }

        .option-btn:hover,
        .option-btn:active {
            transform: scale(1.05);
        }

        .option-btn.correct {
            background: linear-gradient(135deg, #11998e 0%, #38ef7d 100%);
        }

        .option-btn.wrong {
            background: linear-gradient(135deg, #e74c3c 0%, #c0392b 100%);
        }

        /* Puzzle Game */
        .puzzle-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 10px;
            max-width: 400px;
            margin: 0 auto 30px;
        }

        .puzzle-piece {
            aspect-ratio: 1;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border-radius: 10px;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2em;
            font-weight: bold;
            color: white;
            transition: all 0.3s;
        }

        .puzzle-piece:hover {
            transform: scale(1.05);
        }

        .puzzle-piece.empty {
            background: rgba(255, 255, 255, 0.3);
        }

        /* Reaction Game */
        .reaction-game {
            text-align: center;
        }

        .reaction-box {
            width: 300px;
            height: 300px;
            margin: 30px auto;
            border-radius: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5em;
            cursor: pointer;
            transition: all 0.3s;
        }

        .reaction-box.waiting {
            background: linear-gradient(135deg, #e74c3c 0%, #c0392b 100%);
            color: white;
        }

        .reaction-box.ready {
            background: linear-gradient(135deg, #11998e 0%, #38ef7d 100%);
            color: white;
        }

        .reaction-box.playing {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }

        /* Final Reveal */
        .final-reveal {
            text-align: center;
            padding: 40px;
        }

        .final-reveal h1 {
            font-size: 3em;
            color: white;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
            margin-bottom: 30px;
            animation: rainbow 3s infinite;
        }

        @keyframes rainbow {
            0%, 100% { color: #ff6b9d; }
            25% { color: #feca57; }
            50% { color: #48dbfb; }
            75% { color: #ff9ff3; }
        }

        .anniversary-badge {
            background: linear-gradient(135deg, #ffd700, #ffed4e);
            color: #333;
            padding: 20px 30px;
            border-radius: 15px;
            margin: 20px auto 30px;
            max-width: 500px;
            box-shadow: 0 10px 30px rgba(255, 215, 0, 0.4);
            text-align: center;
            font-size: 1.2em;
            font-weight: bold;
            animation: glow 2s infinite;
        }

        @keyframes glow {
            0%, 100% {
                box-shadow: 0 10px 30px rgba(255, 215, 0, 0.4);
            }
            50% {
                box-shadow: 0 10px 40px rgba(255, 215, 0, 0.7);
            }
        }

        .days-counter {
            font-size: 2em;
            color: #667eea;
            margin: 10px 0;
        }

        .sparkle {
            position: absolute;
            width: 10px;
            height: 10px;
            background: white;
            border-radius: 50%;
            animation: sparkleAnim 1.5s ease-in-out infinite;
            pointer-events: none;
        }

        @keyframes sparkleAnim {
            0%, 100% {
                transform: scale(0);
                opacity: 0;
            }
            50% {
                transform: scale(1);
                opacity: 1;
            }
        }

        .photo-gallery {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
            gap: 15px;
            margin: 30px 0;
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
        }

        .photo-frame {
            aspect-ratio: 1;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border-radius: 15px;
            padding: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 3em;
            position: relative;
            overflow: hidden;
        }

        .photo-frame::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: linear-gradient(45deg, transparent, rgba(255,255,255,0.3), transparent);
            animation: shine 3s infinite;
        }

        @keyframes shine {
            0% {
                transform: translateX(-100%) translateY(-100%) rotate(45deg);
            }
            100% {
                transform: translateX(100%) translateY(100%) rotate(45deg);
            }
        }

        .confetti {
            position: fixed;
            width: 10px;
            height: 10px;
            background: #f0f;
            position: absolute;
            animation: confettiFall 3s linear;
        }

        @keyframes confettiFall {
            to {
                transform: translateY(100vh) rotate(360deg);
            }
        }

        .music-notes {
            position: fixed;
            font-size: 24px;
            opacity: 0;
            animation: floatMusic 4s ease-in-out infinite;
            pointer-events: none;
        }

        @keyframes floatMusic {
            0% {
                transform: translateY(0) translateX(0) rotate(0deg);
                opacity: 0;
            }
            10% {
                opacity: 1;
            }
            90% {
                opacity: 1;
            }
            100% {
                transform: translateY(-100px) translateX(50px) rotate(20deg);
                opacity: 0;
            }
        }

        .love-button {
            background: linear-gradient(45deg, #ff6b9d, #feca57);
            color: white;
            border: none;
            padding: 15px 40px;
            font-size: 1.2em;
            border-radius: 50px;
            cursor: pointer;
            margin: 10px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
            transition: all 0.3s;
            min-height: 55px;
            -webkit-tap-highlight-color: transparent;
        }

        .love-button:hover,
        .love-button:active {
            transform: translateY(-5px) scale(1.05);
            box-shadow: 0 15px 40px rgba(0,0,0,0.4);
        }

        .pulsing-heart {
            display: inline-block;
            animation: heartBeat 1.5s infinite;
        }

        @keyframes heartBeat {
            0%, 100% {
                transform: scale(1);
            }
            10%, 30% {
                transform: scale(1.2);
            }
            20%, 40% {
                transform: scale(1.1);
            }
        }

        .love-letter {
            background: white;
            padding: 40px;
            border-radius: 20px;
            max-width: 600px;
            margin: 0 auto 30px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.3);
            text-align: left;
            line-height: 1.8;
            color: #333;
        }

        .love-letter p {
            margin-bottom: 15px;
        }

        .signature {
            text-align: right;
            font-style: italic;
            font-size: 1.2em;
            color: #667eea;
            margin-top: 30px;
        }

        .fireworks {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
        }

        .firework {
            position: absolute;
            width: 5px;
            height: 5px;
            border-radius: 50%;
            animation: explode 1s ease-out;
        }

        @keyframes explode {
            0% {
                transform: translate(0, 0) scale(1);
                opacity: 1;
            }
            100% {
                transform: translate(var(--x), var(--y)) scale(0);
                opacity: 0;
            }
        }

        .game-stats {
            background: #f8f8f8;
            padding: 20px;
            border-radius: 10px;
            margin-top: 20px;
            text-align: center;
        }

        .stat-item {
            display: inline-block;
            margin: 0 20px;
            font-size: 1.2em;
        }

        .stat-value {
            color: #667eea;
            font-weight: bold;
            font-size: 1.5em;
        }

        .message-box {
            background: linear-gradient(135deg, #ff6b9d, #feca57);
            color: white;
            padding: 20px;
            border-radius: 10px;
            margin: 20px 0;
            text-align: center;
            font-size: 1.2em;
            animation: slideIn 0.5s;
        }

        @keyframes slideIn {
            from {
                transform: translateY(-20px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        /* Word Unscramble */
        .word-display {
            font-size: 3em;
            color: #667eea;
            margin: 30px 0;
            letter-spacing: 10px;
            font-weight: bold;
        }

        .word-input {
            font-size: 16px;
            padding: 15px;
            border: 3px solid #667eea;
            border-radius: 10px;
            text-align: center;
            width: 100%;
            max-width: 400px;
            margin: 20px auto;
            display: block;
            -webkit-appearance: none;
            appearance: none;
        }

        .submit-btn {
            background: linear-gradient(45deg, #667eea, #764ba2);
            color: white;
            border: none;
            padding: 15px 40px;
            font-size: 1.2em;
            border-radius: 25px;
            cursor: pointer;
            transition: all 0.3s;
            min-height: 55px;
            -webkit-tap-highlight-color: transparent;
        }

        .submit-btn:hover,
        .submit-btn:active {
            transform: translateY(-3px);
            box-shadow: 0 10px 25px rgba(0,0,0,0.3);
        }

        .hint-btn {
            background: #feca57;
            color: #333;
            border: none;
            padding: 10px 25px;
            border-radius: 20px;
            cursor: pointer;
            margin-top: 15px;
            transition: all 0.3s;
        }

        .hint-btn:hover {
            background: #feb101;
        }

        @media (max-width: 768px) {
            .welcome-title {
                font-size: 2em;
            }
            
            .welcome-subtitle {
                font-size: 1.2em;
            }
            
            .game-grid {
                grid-template-columns: 1fr;
            }
            
            .memory-grid {
                grid-template-columns: repeat(4, 1fr);
                gap: 10px;
            }
            
            .game-screen {
                padding: 20px;
            }
            
            .love-letter {
                padding: 25px;
                font-size: 0.95em;
            }
            
            .final-reveal h1 {
                font-size: 2em;
            }
            
            .puzzle-grid {
                max-width: 300px;
            }
            
            .reaction-box {
                width: 250px;
                height: 250px;
                font-size: 1.2em;
            }
            
            .word-display {
                font-size: 2em;
                letter-spacing: 5px;
            }
            
            .word-input {
                font-size: 1.2em;
                max-width: 90%;
            }
            
            .game-card {
                padding: 25px;
            }
            
            .game-card .icon {
                font-size: 2.5em;
            }
            
            .photo-gallery {
                grid-template-columns: repeat(2, 1fr);
            }
            
            .anniversary-badge {
                font-size: 1em;
                padding: 15px 20px;
            }
            
            .days-counter {
                font-size: 1.5em;
            }
            
            .stat-item {
                display: block;
                margin: 10px 0;
            }
            
            .option-btn {
                padding: 15px;
                font-size: 1em;
            }
            
            .start-btn, .love-button {
                padding: 15px 30px;
                font-size: 1.1em;
            }
            
            .envelope {
                width: 150px;
                height: 105px;
            }
            
            .envelope-body {
                width: 150px;
                height: 90px;
            }
            
            .envelope-flap {
                border-left: 75px solid transparent;
                border-right: 75px solid transparent;
                border-top: 60px solid #ff6b9d;
            }
        }

        @media (max-width: 480px) {
            .container {
                padding: 10px;
            }
            
            .welcome-title {
                font-size: 1.5em;
                margin-bottom: 15px;
            }
            
            .welcome-subtitle {
                font-size: 1em;
                margin-bottom: 30px;
            }
            
            .game-hub {
                padding: 20px;
            }
            
            .game-hub h2 {
                font-size: 1.5em;
            }
            
            .game-header h2 {
                font-size: 1.5em;
            }
            
            .memory-grid {
                grid-template-columns: repeat(4, 1fr);
                gap: 8px;
            }
            
            .memory-card {
                font-size: 2em;
            }
            
            .final-reveal h1 {
                font-size: 1.8em;
            }
            
            .love-letter {
                padding: 20px;
                font-size: 0.9em;
            }
            
            .love-letter p {
                margin-bottom: 12px;
            }
            
            .question {
                font-size: 1.2em;
                padding: 15px;
            }
            
            .reaction-box {
                width: 200px;
                height: 200px;
                font-size: 1em;
            }
            
            .word-display {
                font-size: 1.5em;
                letter-spacing: 3px;
            }
            
            .puzzle-grid {
                max-width: 250px;
                gap: 8px;
            }
            
            .puzzle-piece {
                font-size: 1.5em;
            }
            
            .start-btn, .love-button {
                padding: 12px 25px;
                font-size: 1em;
            }
            
            .message-box {
                font-size: 1em;
                padding: 15px;
            }
            
            .anniversary-badge {
                font-size: 0.9em;
                padding: 12px 15px;
            }
            
            .days-counter {
                font-size: 1.3em;
            }
        }
    </style>
</head>
<body>
    <!-- Floating Hearts Background -->
    <div class="hearts-bg" id="heartsBackground"></div>

    <div class="container">
        <!-- Welcome Screen -->
        <div class="screen active" id="welcomeScreen">
            <div class="welcome-screen">
                <h1 class="welcome-title">💕 For My Beautiful Vennela 💕</h1>
                <p class="welcome-subtitle">Our First Valentine's Day Together as Husband & Wife!</p>
                <div class="envelope" id="envelope">
                    <div class="envelope-flap"></div>
                    <div class="envelope-body"></div>
                </div>
                <p style="color: white; font-size: 1.2em; margin-top: 20px;">Click to Open Your Surprise!</p>
                <button class="start-btn" onclick="startJourney()">Begin Your Adventure</button>
            </div>
        </div>

        <!-- Game Hub -->
        <div class="screen" id="gameHub">
            <div class="game-hub">
                <h2>🎮 Unlock My Love Messages 🎮</h2>
                <p style="text-align: center; color: #666; margin-bottom: 20px;">Complete each game to reveal a special message!</p>
                
                <div class="progress-bar">
                    <div class="progress-fill" id="progressFill">0%</div>
                </div>

                <div class="game-grid">
                    <div class="game-card" id="game1Card" onclick="startGame(1)">
                        <div class="icon">💝</div>
                        <h3>Memory of Us</h3>
                        <p>Match the hearts!</p>
                    </div>

                    <div class="game-card locked" id="game2Card">
                        <div class="icon">🧩</div>
                        <h3>Love Quiz</h3>
                        <p>How well do you know us?</p>
                    </div>

                    <div class="game-card locked" id="game3Card">
                        <div class="icon">🎯</div>
                        <h3>Reaction Challenge</h3>
                        <p>Quick as my heartbeat!</p>
                    </div>

                    <div class="game-card locked" id="game4Card">
                        <div class="icon">🔤</div>
                        <h3>Love Words</h3>
                        <p>Unscramble my feelings!</p>
                    </div>
                </div>

                <div id="messageDisplay"></div>
            </div>
        </div>

        <!-- Memory Game -->
        <div class="screen" id="memoryGame">
            <div class="game-screen">
                <div class="game-header">
                    <h2>💝 Memory of Us</h2>
                    <button class="back-btn" onclick="backToHub()">← Back</button>
                </div>
                <div class="game-stats">
                    <div class="stat-item">Moves: <span class="stat-value" id="memoryMoves">0</span></div>
                    <div class="stat-item">Matches: <span class="stat-value" id="memoryMatches">0</span></div>
                </div>
                <div class="memory-grid" id="memoryGrid"></div>
            </div>
        </div>

        <!-- Quiz Game -->
        <div class="screen" id="quizGame">
            <div class="game-screen">
                <div class="game-header">
                    <h2>🧩 Love Quiz</h2>
                    <button class="back-btn" onclick="backToHub()">← Back</button>
                </div>
                <div class="quiz-container" id="quizContainer"></div>
            </div>
        </div>

        <!-- Reaction Game -->
        <div class="screen" id="reactionGame">
            <div class="game-screen">
                <div class="game-header">
                    <h2>🎯 Reaction Challenge</h2>
                    <button class="back-btn" onclick="backToHub()">← Back</button>
                </div>
                <div class="reaction-game">
                    <p style="font-size: 1.2em; margin-bottom: 20px;">Click as fast as you can when the box turns GREEN!</p>
                    <div class="reaction-box playing" id="reactionBox" onclick="reactionClick()">
                        Click to Start!
                    </div>
                    <div id="reactionResult"></div>
                </div>
            </div>
        </div>

        <!-- Word Unscramble Game -->
        <div class="screen" id="wordGame">
            <div class="game-screen">
                <div class="game-header">
                    <h2>🔤 Love Words</h2>
                    <button class="back-btn" onclick="backToHub()">← Back</button>
                </div>
                <div style="text-align: center;">
                    <p style="font-size: 1.2em; margin-bottom: 20px;">Unscramble the word!</p>
                    <div class="word-display" id="scrambledWord"></div>
                    <input type="text" class="word-input" id="wordInput" placeholder="Type your answer...">
                    <br>
                    <button class="submit-btn" onclick="checkWord()">Submit</button>
                    <button class="hint-btn" onclick="showHint()">💡 Hint</button>
                    <div id="wordResult"></div>
                    <div id="wordHint" style="margin-top: 20px; color: #666; font-style: italic;"></div>
                </div>
            </div>
        </div>

        <!-- Final Reveal -->
        <div class="screen" id="finalReveal">
            <div class="final-reveal">
                <h1>🎉 You Did It, Vennela! 🎉</h1>
                
                <div class="anniversary-badge">
                    💑 Married Since May 23, 2025 💑
                    <div class="days-counter" id="daysCounter">Loading...</div>
                    <div style="font-size: 0.8em; color: #666;">Days of Being the Happiest Husband!</div>
                </div>

                <div class="photo-gallery">
                    <div class="photo-frame" onclick="showPhotoMessage(0)" style="cursor: pointer;" title="Click me!">💕</div>
                    <div class="photo-frame" onclick="showPhotoMessage(1)" style="cursor: pointer;" title="Click me!">🥰</div>
                    <div class="photo-frame" onclick="showPhotoMessage(2)" style="cursor: pointer;" title="Click me!">💑</div>
                    <div class="photo-frame" onclick="showPhotoMessage(3)" style="cursor: pointer;" title="Click me!">💖</div>
                </div>
                <div id="photoMessage" style="margin: 20px 0;"></div>
                
                <div class="love-letter">
                    <p>My Dearest Vennela,</p>
                    
                    <p>This is our FIRST Valentine's Day as husband and wife, and I couldn't be more excited to celebrate it with you! Since May 23rd, 2025, every single day has been an adventure, a new level unlocked in the game of life – and you're the best co-player I could ever ask for! 🎮❤️</p>
                    
                    <p>Every game you just played was a journey through my heart. Just like in these challenges, you've won every level of my life from the moment you said "I do." You bring colors to my world that I never knew existed – colors brighter than any game graphics, more beautiful than any sunset.</p>
                    
                    <p>These past few months of marriage have been the happiest of my life. Waking up next to you, sharing silly moments, going on little adventures together, and even just watching you play your favorite games – these are my new favorite memories. You're not just my wife; you're my best friend, my gaming partner, my adventure buddy, and the one who makes even the most ordinary Tuesday feel like a celebration.</p>
                    
                    <p>Your smile is my favorite notification, your laugh is my favorite sound, and your happiness is my ultimate achievement – better than any trophy or high score. Just like you love games, I love every single moment we spend together. Each day with you is a new level of joy, a new high score in happiness that I never knew was possible.</p>
                    
                    <p>We're just at the beginning of our journey together, and I'm so thrilled about every level we'll conquer together – the adventures we'll have, the dreams we'll chase, the home we'll build, and all the beautiful moments in between. You've already won the most important game of all: you won my heart completely and forever.</p>
                    
                    <p style="font-size: 1.3em; color: #ff6b9d; font-weight: bold; text-align: center; margin: 30px 0;">I LOVE YOU MORE THAN WORDS CAN SAY! ❤️</p>
                    
                    <p>Happy First Valentine's Day as my wife, Vennela! Here's to infinite levels of happiness, countless boss battles we'll defeat together, and a lifetime of love that only gets stronger with each passing day!</p>
                    
                    <p style="text-align: center; font-style: italic; color: #764ba2; margin: 20px 0;">P.S. - Being married to you is better than any game I've ever played, and I can't wait for all our future adventures together! 🎮💑</p>
                    
                    <p class="signature">Forever and Always Yours,<br>Your Kittu 💕<br><small style="color: #999;">Player 2 for Life</small></p>
                </div>
                
                <div style="margin-top: 30px;">
                    <button class="love-button" onclick="sendLoveBack()">Send Love Back <span class="pulsing-heart">❤️</span></button>
                    <button class="start-btn" onclick="playAgain()">Play Again 🎮</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Fireworks Container -->
    <div class="fireworks" id="fireworks"></div>

    <script>
        // Game State
        let gameState = {
            completedGames: 0,
            currentGame: null,
            memoryFlipped: [],
            memoryMatched: [],
            memoryMoves: 0,
            quizCurrentQuestion: 0,
            reactionStartTime: null,
            reactionTimeout: null,
            wordCurrentIndex: 0
        };

        // Create floating hearts background
        function createHearts() {
            const heartsContainer = document.getElementById('heartsBackground');
            const heartSymbols = ['❤️', '💕', '💖', '💗', '💝', '💞'];
            
            for (let i = 0; i < 20; i++) {
                const heart = document.createElement('div');
                heart.className = 'heart';
                heart.textContent = heartSymbols[Math.floor(Math.random() * heartSymbols.length)];
                heart.style.left = Math.random() * 100 + '%';
                heart.style.animationDelay = Math.random() * 15 + 's';
                heart.style.fontSize = (Math.random() * 20 + 15) + 'px';
                heartsContainer.appendChild(heart);
            }
        }

        // Switch screens
        function switchScreen(screenId) {
            document.querySelectorAll('.screen').forEach(screen => {
                screen.classList.remove('active');
            });
            document.getElementById(screenId).classList.add('active');
        }

        // Start journey
        function startJourney() {
            switchScreen('gameHub');
            updateProgress();
        }

        // Update progress bar
        function updateProgress() {
            const progress = (gameState.completedGames / 4) * 100;
            const progressFill = document.getElementById('progressFill');
            progressFill.style.width = progress + '%';
            progressFill.textContent = Math.round(progress) + '%';
        }

        // Start a specific game
        function startGame(gameNum) {
            gameState.currentGame = gameNum;
            
            switch(gameNum) {
                case 1:
                    switchScreen('memoryGame');
                    initMemoryGame();
                    break;
                case 2:
                    switchScreen('quizGame');
                    initQuizGame();
                    break;
                case 3:
                    switchScreen('reactionGame');
                    initReactionGame();
                    break;
                case 4:
                    switchScreen('wordGame');
                    initWordGame();
                    break;
            }
        }

        // Back to hub
        function backToHub() {
            switchScreen('gameHub');
        }

        // Complete a game
        function completeGame(gameNum, message) {
            const card = document.getElementById(`game${gameNum}Card`);
            card.classList.add('completed');
            
            gameState.completedGames++;
            updateProgress();
            
            // Unlock next game
            if (gameNum < 4) {
                const nextCard = document.getElementById(`game${gameNum + 1}Card`);
                nextCard.classList.remove('locked');
                nextCard.onclick = () => startGame(gameNum + 1);
            }
            
            // Show message
            showLoveMessage(message);
            
            // Check if all games completed
            if (gameState.completedGames === 4) {
                setTimeout(() => {
                    switchScreen('finalReveal');
                    createFireworks();
                    playWeddingBells();
                }, 3000);
            } else {
                setTimeout(() => {
                    switchScreen('gameHub');
                }, 3000);
            }
        }

        // Show love message
        function showLoveMessage(message) {
            const messageDisplay = document.getElementById('messageDisplay');
            messageDisplay.innerHTML = `<div class="message-box">${message}</div>`;
        }

        // MEMORY GAME
        const memoryEmojis = ['💕', '💖', '💗', '💝', '💞', '❤️', '🌹', '💐'];
        
        function initMemoryGame() {
            gameState.memoryFlipped = [];
            gameState.memoryMatched = [];
            gameState.memoryMoves = 0;
            document.getElementById('memoryMoves').textContent = '0';
            document.getElementById('memoryMatches').textContent = '0';
            
            const cards = [...memoryEmojis, ...memoryEmojis];
            cards.sort(() => Math.random() - 0.5);
            
            const grid = document.getElementById('memoryGrid');
            grid.innerHTML = '';
            
            cards.forEach((emoji, index) => {
                const card = document.createElement('div');
                card.className = 'memory-card';
                card.dataset.index = index;
                card.dataset.emoji = emoji;
                card.innerHTML = `
                    <div class="front">💝</div>
                    <div class="back">${emoji}</div>
                `;
                card.onclick = () => flipCard(index);
                grid.appendChild(card);
            });
        }

        function flipCard(index) {
            if (gameState.memoryFlipped.length >= 2) return;
            if (gameState.memoryFlipped.includes(index)) return;
            if (gameState.memoryMatched.includes(index)) return;
            
            const cards = document.querySelectorAll('.memory-card');
            cards[index].classList.add('flipped');
            gameState.memoryFlipped.push(index);
            
            if (gameState.memoryFlipped.length === 2) {
                gameState.memoryMoves++;
                document.getElementById('memoryMoves').textContent = gameState.memoryMoves;
                
                setTimeout(checkMemoryMatch, 800);
            }
        }

        function checkMemoryMatch() {
            const cards = document.querySelectorAll('.memory-card');
            const [index1, index2] = gameState.memoryFlipped;
            const emoji1 = cards[index1].dataset.emoji;
            const emoji2 = cards[index2].dataset.emoji;
            
            if (emoji1 === emoji2) {
                cards[index1].classList.add('matched');
                cards[index2].classList.add('matched');
                gameState.memoryMatched.push(index1, index2);
                document.getElementById('memoryMatches').textContent = gameState.memoryMatched.length / 2;
                
                if (gameState.memoryMatched.length === 16) {
                    setTimeout(() => {
                        completeGame(1, "💕 Perfect match! Just like we are, Vennela! From May 23rd to forever, every moment with you is a precious memory I'll treasure! 💕");
                    }, 500);
                }
            } else {
                cards[index1].classList.remove('flipped');
                cards[index2].classList.remove('flipped');
            }
            
            gameState.memoryFlipped = [];
        }

        // QUIZ GAME
        const quizQuestions = [
            {
                question: "What's the best part about our first few months of marriage?",
                options: [
                    "Every morning waking up together",
                    "Learning new things about each other",
                    "Building our life as a team",
                    "All of these and so much more! ❤️"
                ],
                correct: 3,
                message: "Exactly! Every moment since May 23rd has been pure magic!"
            },
            {
                question: "What do I love most about being your husband?",
                options: [
                    "Seeing your beautiful smile every day",
                    "Being your gaming partner in life",
                    "Making you laugh and happy",
                    "Everything - you're my dream come true! 💕"
                ],
                correct: 3,
                message: "Yes! You're everything I ever wished for and more, Vennela!"
            },
            {
                question: "What am I looking forward to in our future together?",
                options: [
                    "Growing old with you",
                    "All our adventures ahead",
                    "Building beautiful memories",
                    "Every single day with you! 💖"
                ],
                correct: 3,
                message: "Forever and always! Our journey has just begun and it's already perfect!"
            }
        ];

        function initQuizGame() {
            gameState.quizCurrentQuestion = 0;
            showQuizQuestion();
        }

        function showQuizQuestion() {
            const container = document.getElementById('quizContainer');
            const q = quizQuestions[gameState.quizCurrentQuestion];
            
            let html = `
                <div class="question">${q.question}</div>
                <div class="options">
            `;
            
            q.options.forEach((option, index) => {
                html += `<button class="option-btn" onclick="answerQuiz(${index})">${option}</button>`;
            });
            
            html += '</div>';
            container.innerHTML = html;
        }

        function answerQuiz(selected) {
            const q = quizQuestions[gameState.quizCurrentQuestion];
            const buttons = document.querySelectorAll('.option-btn');
            
            buttons.forEach((btn, index) => {
                btn.disabled = true;
                if (index === q.correct) {
                    btn.classList.add('correct');
                } else if (index === selected && selected !== q.correct) {
                    btn.classList.add('wrong');
                }
            });
            
            setTimeout(() => {
                gameState.quizCurrentQuestion++;
                if (gameState.quizCurrentQuestion < quizQuestions.length) {
                    showQuizQuestion();
                } else {
                    completeGame(2, "🧩 You know us so well! These few months of marriage have been magical, and I can't wait to learn and grow with you for a lifetime, Vennela! 🧩");
                }
            }, 1500);
        }

        // REACTION GAME
        let reactionAttempts = 0;
        let reactionBestTime = Infinity;

        function initReactionGame() {
            reactionAttempts = 0;
            reactionBestTime = Infinity;
            const box = document.getElementById('reactionBox');
            box.className = 'reaction-box playing';
            box.textContent = 'Click to Start!';
            document.getElementById('reactionResult').innerHTML = '';
        }

        function reactionClick() {
            const box = document.getElementById('reactionBox');
            
            if (box.classList.contains('playing')) {
                startReaction();
            } else if (box.classList.contains('ready')) {
                recordReaction();
            } else if (box.classList.contains('waiting')) {
                box.textContent = 'Too early! Wait for GREEN...';
                clearTimeout(gameState.reactionTimeout);
                setTimeout(startReaction, 1000);
            }
        }

        function startReaction() {
            const box = document.getElementById('reactionBox');
            box.className = 'reaction-box waiting';
            box.textContent = 'Wait for it...';
            
            const delay = Math.random() * 3000 + 2000;
            gameState.reactionTimeout = setTimeout(() => {
                box.className = 'reaction-box ready';
                box.textContent = 'CLICK NOW!';
                gameState.reactionStartTime = Date.now();
            }, delay);
        }

        function recordReaction() {
            const reactionTime = Date.now() - gameState.reactionStartTime;
            reactionAttempts++;
            
            if (reactionTime < reactionBestTime) {
                reactionBestTime = reactionTime;
            }
            
            const box = document.getElementById('reactionBox');
            const result = document.getElementById('reactionResult');
            
            result.innerHTML = `
                <div class="game-stats" style="margin-top: 20px;">
                    <div class="stat-item">Reaction Time: <span class="stat-value">${reactionTime}ms</span></div>
                    <div class="stat-item">Best: <span class="stat-value">${reactionBestTime}ms</span></div>
                    <div class="stat-item">Attempts: <span class="stat-value">${reactionAttempts}</span></div>
                </div>
            `;
            
            if (reactionAttempts >= 3) {
                box.className = 'reaction-box playing';
                box.textContent = `Great job! Best time: ${reactionBestTime}ms`;
                box.onclick = null;
                
                setTimeout(() => {
                    completeGame(3, "🎯 Lightning fast! That's how quickly I fell for you, Vennela! And marrying you was the best decision I ever made! 🎯");
                }, 1500);
            } else {
                box.className = 'reaction-box playing';
                box.textContent = `${reactionTime}ms! Try Again?`;
            }
        }

        // WORD UNSCRAMBLE GAME
        const wordPuzzles = [
            { word: 'FOREVER', scrambled: 'REVFORE', hint: 'How long we\'ll be together...' },
            { word: 'NEWLYWEDS', scrambled: 'WEDNESLYW', hint: 'What we are...' },
            { word: 'ADVENTURE', scrambled: 'DAVEENTRU', hint: 'What our marriage is...' },
            { word: 'SOULMATE', scrambled: 'METASOUL', hint: 'What you are to me...' }
        ];

        function initWordGame() {
            gameState.wordCurrentIndex = 0;
            showWordPuzzle();
        }

        function showWordPuzzle() {
            const puzzle = wordPuzzles[gameState.wordCurrentIndex];
            document.getElementById('scrambledWord').textContent = puzzle.scrambled;
            document.getElementById('wordInput').value = '';
            document.getElementById('wordResult').innerHTML = '';
            document.getElementById('wordHint').innerHTML = '';
        }

        function checkWord() {
            const input = document.getElementById('wordInput').value.toUpperCase();
            const puzzle = wordPuzzles[gameState.wordCurrentIndex];
            const result = document.getElementById('wordResult');
            
            if (input === puzzle.word) {
                result.innerHTML = '<div class="message-box">✨ Correct! ✨</div>';
                
                setTimeout(() => {
                    gameState.wordCurrentIndex++;
                    if (gameState.wordCurrentIndex < wordPuzzles.length) {
                        showWordPuzzle();
                    } else {
                        completeGame(4, "🔤 You solved them all! Just like how you solved the puzzle of my heart! Being your husband is my greatest adventure, Vennela! 🔤");
                    }
                }, 1500);
            } else {
                result.innerHTML = '<div style="color: #e74c3c; margin-top: 20px;">Try again! You can do it! 💪</div>';
            }
        }

        function showHint() {
            const puzzle = wordPuzzles[gameState.wordCurrentIndex];
            document.getElementById('wordHint').textContent = `💡 Hint: ${puzzle.hint}`;
        }

        // Fireworks
        function createFireworks() {
            const container = document.getElementById('fireworks');
            const colors = ['#ff6b9d', '#feca57', '#48dbfb', '#ff9ff3', '#1dd1a1'];
            
            setInterval(() => {
                const x = Math.random() * window.innerWidth;
                const y = Math.random() * window.innerHeight * 0.5;
                
                for (let i = 0; i < 30; i++) {
                    const firework = document.createElement('div');
                    firework.className = 'firework';
                    firework.style.left = x + 'px';
                    firework.style.top = y + 'px';
                    firework.style.background = colors[Math.floor(Math.random() * colors.length)];
                    
                    const angle = (Math.PI * 2 * i) / 30;
                    const velocity = 100 + Math.random() * 100;
                    firework.style.setProperty('--x', Math.cos(angle) * velocity + 'px');
                    firework.style.setProperty('--y', Math.sin(angle) * velocity + 'px');
                    
                    container.appendChild(firework);
                    
                    setTimeout(() => firework.remove(), 1000);
                }
            }, 1000);
        }

        function playWeddingBells() {
            // Calculate days since marriage
            const marriageDate = new Date('2025-05-23');
            const today = new Date();
            const diffTime = Math.abs(today - marriageDate);
            const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
            
            const counterElement = document.getElementById('daysCounter');
            if (counterElement) {
                counterElement.textContent = diffDays + ' Days';
            }
            
            // Create confetti
            createConfetti();
        }

        function createConfetti() {
            const colors = ['#ff6b9d', '#feca57', '#48dbfb', '#ff9ff3', '#1dd1a1', '#ffd700'];
            for (let i = 0; i < 50; i++) {
                setTimeout(() => {
                    const confetti = document.createElement('div');
                    confetti.className = 'confetti';
                    confetti.style.left = Math.random() * 100 + '%';
                    confetti.style.top = '-10px';
                    confetti.style.background = colors[Math.floor(Math.random() * colors.length)];
                    confetti.style.transform = `rotate(${Math.random() * 360}deg)`;
                    document.body.appendChild(confetti);
                    
                    setTimeout(() => confetti.remove(), 3000);
                }, i * 50);
            }
        }

        function addSparkles(element) {
            setInterval(() => {
                const sparkle = document.createElement('div');
                sparkle.className = 'sparkle';
                sparkle.style.left = Math.random() * 100 + '%';
                sparkle.style.top = Math.random() * 100 + '%';
                element.appendChild(sparkle);
                
                setTimeout(() => sparkle.remove(), 1500);
            }, 200);
        }

        function showPhotoMessage(index) {
            const messages = [
                "💕 Our wedding day - May 23, 2025 - the best day of my life!",
                "🥰 Every day with you feels like a dream come true!",
                "💑 You and me against the world, forever and always!",
                "💖 My favorite player 2, my best friend, my everything!"
            ];
            
            const photoMessage = document.getElementById('photoMessage');
            photoMessage.innerHTML = `<div class="message-box">${messages[index]}</div>`;
            
            setTimeout(() => {
                photoMessage.innerHTML = '';
            }, 3000);
        }

        function sendLoveBack() {
            // Create floating hearts effect
            for (let i = 0; i < 20; i++) {
                setTimeout(() => {
                    const heart = document.createElement('div');
                    heart.textContent = '❤️';
                    heart.style.position = 'fixed';
                    heart.style.left = Math.random() * window.innerWidth + 'px';
                    heart.style.top = window.innerHeight + 'px';
                    heart.style.fontSize = (Math.random() * 30 + 20) + 'px';
                    heart.style.zIndex = '9999';
                    heart.style.transition = 'all 2s ease-out';
                    heart.style.pointerEvents = 'none';
                    document.body.appendChild(heart);
                    
                    setTimeout(() => {
                        heart.style.top = '-100px';
                        heart.style.transform = 'rotate(360deg)';
                        heart.style.opacity = '0';
                    }, 50);
                    
                    setTimeout(() => heart.remove(), 2100);
                }, i * 100);
            }
            
            // Create music notes
            createMusicNotes();
            
            // Show sweet message
            alert("💕 Vennela, your Kittu loves you so much! Thank you for being the most amazing wife! 💕");
        }

        function createMusicNotes() {
            const notes = ['🎵', '🎶', '♪', '♫'];
            for (let i = 0; i < 10; i++) {
                setTimeout(() => {
                    const note = document.createElement('div');
                    note.className = 'music-notes';
                    note.textContent = notes[Math.floor(Math.random() * notes.length)];
                    note.style.left = Math.random() * 100 + '%';
                    note.style.bottom = '0';
                    note.style.animationDelay = Math.random() + 's';
                    document.body.appendChild(note);
                    
                    setTimeout(() => note.remove(), 4000);
                }, i * 300);
            }
        }

        function playAgain() {
            gameState = {
                completedGames: 0,
                currentGame: null,
                memoryFlipped: [],
                memoryMatched: [],
                memoryMoves: 0,
                quizCurrentQuestion: 0,
                reactionStartTime: null,
                reactionTimeout: null,
                wordCurrentIndex: 0
            };
            
            // Reset cards
            document.getElementById('game1Card').classList.remove('completed');
            document.getElementById('game2Card').classList.remove('completed');
            document.getElementById('game3Card').classList.remove('completed');
            document.getElementById('game4Card').classList.remove('completed');
            
            document.getElementById('game2Card').classList.add('locked');
            document.getElementById('game3Card').classList.add('locked');
            document.getElementById('game4Card').classList.add('locked');
            
            document.getElementById('game2Card').onclick = null;
            document.getElementById('game3Card').onclick = null;
            document.getElementById('game4Card').onclick = null;
            
            switchScreen('gameHub');
            updateProgress();
        }

        // Initialize on load
        window.onload = function() {
            createHearts();
            const envelope = document.querySelector('.envelope');
            if (envelope) {
                envelope.style.position = 'relative';
                addSparkles(envelope);
            }
        };
    </script>
</body>
</html>
