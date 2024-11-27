<script lang="ts">
  import { onMount, onDestroy } from 'svelte';
  
  // Ancient Egyptian symbols (Unicode hieroglyphs)
  const symbols = [
    '𓀀', '𓀁', '𓀂', '𓀃', '𓀄', '𓀅', '𓀆', '𓀇', '𓀈', '𓀉',
    '𓀊', '𓀋', '𓀌', '𓀍', '𓀎', '𓀏', '𓀐', '𓀑', '𓀒', '𓀓',
    '𓂋', '𓂌', '𓃭', '𓃮', '𓃯', '𓃰', '𓃱', '𓃲', '𓃳', '𓃴',
    '𓃵', '𓃶', '𓃷', '𓃸', '𓃹', '𓃺', '𓃻', '𓃼', '𓃽', '𓃾',
    '𓄇', '𓄈', '𓄉', '𓄊', '𓄋', '𓄌', '𓄍', '𓄎', '𓄏', '𓄐',
    // Symbols specifically related to Maat
    '𓂋𓏺', '𓁹', '𓂝', '𓃂', '𓆄'
  ];
  
  let container: HTMLDivElement;
  let animationFrame: number;
  let symbols_array: {
    x: number;
    targetX: number;
    y: number;
    symbol: string;
    opacity: number;
    speed: number;
    isRadioactive?: boolean;
    brightness: number;
    rotationSpeed: number;
  }[] = [];
  
  let startTime: number;
  let isInitialPhase = true;
  
  function createSymbol() {
    const isRadioactive = Math.random() < (isInitialPhase ? 0.2 : 0.1);
    return {
      x: Math.random() * 90 + 5,
      targetX: Math.random() * 90 + 5,
      y: Math.random() * -100,
      symbol: symbols[Math.floor(Math.random() * symbols.length)],
      opacity: isInitialPhase ? 
        Math.random() * 0.2 + 0.4 : 
        Math.random() * 0.1 + 0.3,
      speed: Math.random() * 0.05 + 0.02,
      isRadioactive,
      brightness: isInitialPhase ?
        (isRadioactive ? 2.0 : 1.5) :
        (isRadioactive ? 1.5 : 1.2),
      rotationSpeed: isInitialPhase ?
        (isRadioactive ? Math.random() * 3 + 2 : Math.random() * 6 + 4) :
        (isRadioactive ? Math.random() * 2 + 1 : Math.random() * 3 + 2)
    };
  }
  function updateSymbol(symbol: typeof symbols_array[0]) {
    if (symbol.y > 100) {
      symbol.y = -10;
      symbol.targetX = Math.random() * 90 + 5;
      symbol.x = symbol.x + (symbol.targetX - symbol.x) * 0.1;
    } else {
      symbol.y += symbol.speed;
      if (Math.abs(symbol.targetX - symbol.x) > 0.1) {
        symbol.x = symbol.x + (symbol.targetX - symbol.x) * 0.02;
      }
    }
    return symbol;  // Add this line
  }

  function animate(timestamp: number) {
    if (!startTime) startTime = timestamp;
    const elapsedTime = timestamp - startTime;

    // After 10 seconds, transition to calm phase
    if (elapsedTime > 10000 && isInitialPhase) {
      isInitialPhase = false;
      symbols_array = symbols_array.map(symbol => ({
        ...symbol,
        brightness: symbol.isRadioactive ? 1.5 : 1.2,
        rotationSpeed: symbol.rotationSpeed * 0.5,
        opacity: Math.min(symbol.opacity, 0.4)
      }));
    }

    // Update positions
    symbols_array = symbols_array.map(updateSymbol);

    // Add new symbols with different frequencies based on phase
    const spawnRate = isInitialPhase ? 0.05 : 0.02;
    const maxSymbols = isInitialPhase ? 50 : 30;
    
    if (Math.random() < spawnRate && symbols_array.length < maxSymbols) {
      symbols_array = [...symbols_array, createSymbol()];
    }

    // Remove excess symbols in calm phase
    if (!isInitialPhase && symbols_array.length > maxSymbols) {
      symbols_array = symbols_array.slice(0, maxSymbols);
    }

    animationFrame = requestAnimationFrame(animate);
  }

  onMount(() => {
    symbols_array = Array(20).fill(null).map(() => ({
      ...createSymbol(),
      y: Math.random() * 100
    }));
    
    requestAnimationFrame(animate);
  });

  onDestroy(() => {
    if (animationFrame) {
      cancelAnimationFrame(animationFrame);
    }
  });
</script>

<div class="container" bind:this={container}>
  {#each symbols_array as symbol}
    <div
      class="hieroglyph {symbol.isRadioactive ? 'radioactive' : 'bright'}"
      style="
        left: {symbol.x}%; 
        top: {symbol.y}%; 
        opacity: {symbol.opacity};
        --rotation-duration: {symbol.rotationSpeed}s;
      "
    >
      {symbol.symbol}
    </div>
  {/each}
</div>

<style>
  @font-face {
    font-family: 'Noto Sans Egyptian Hieroglyphs';
    src: url('/fonts/woff2/NotoSansEgyptianHieroglyphs-Regular.woff2') format('woff2'),
         url('/fonts/NotoSansEgyptianHieroglyphs-Regular.ttf') format('truetype');
    font-weight: normal;
    font-style: normal;
    font-display: swap;
  }

  .hieroglyph {
    position: absolute;
    font-family: 'Noto Sans Egyptian Hieroglyphs', sans-serif;
    font-size: clamp(24px, 4vw, 48px);
    transform-origin: center;
    transition: left 0.5s ease-out, top 0.1s linear;
    will-change: transform, left, top;
  }

  .container {
    position: fixed;
    top: 0;
    left: 0;
    width: 100vw;
    height: 100vh;
    overflow: hidden;
    pointer-events: none;
  }

  .radioactive {
    filter: drop-shadow(0 0 10px #FFD700) 
            drop-shadow(0 0 20px #FFA500) 
            drop-shadow(0 0 30px #FF8C00) 
            brightness(2);
    animation: nuclearpulse 3s infinite,
              crazySpinAndBounce var(--rotation-duration) cubic-bezier(0.45, 0, 0.55, 1) infinite;
  }

  .bright {
    animation: gentleSpin var(--rotation-duration) cubic-bezier(0.4, 0, 0.2, 1) infinite;
  }

  @keyframes crazySpinAndBounce {
    0% {
      transform: rotate(0deg) scale(1);
    }
    100% {
      transform: rotate(360deg) scale(1);
    }
  }

  @keyframes gentleSpin {
    0% { 
      transform: rotate(0deg); 
    }
    100% { 
      transform: rotate(360deg); 
    }
  }

  @keyframes nuclearpulse {
    0% { 
      filter: drop-shadow(0 0 10px #FFD700) 
              drop-shadow(0 0 20px #FFA500) 
              brightness(1.5);
    }
    50% { 
      filter: drop-shadow(0 0 25px #FFD700) 
              drop-shadow(0 0 35px #FFA500) 
              drop-shadow(0 0 45px #FF8C00) 
              brightness(2.5);
    }
    100% { 
      filter: drop-shadow(0 0 10px #FFD700) 
              drop-shadow(0 0 20px #FFA500) 
              brightness(1.5);
    }
  }

  /* Add sparkle effect */
  .radioactive::before {
    content: '';
    position: absolute;
    inset: -20%;
    background: radial-gradient(circle at 50% 50%, 
                              rgba(255, 215, 0, 0.8) 0%, 
                              transparent 60%);
    animation: sparkle 2s infinite;
    pointer-events: none;
  }

  @keyframes sparkle {
    0%, 100% { opacity: 0.3; }
    50% { opacity: 0.8; }
  }

  .bright {
    filter: brightness(2);
  }
</style>
