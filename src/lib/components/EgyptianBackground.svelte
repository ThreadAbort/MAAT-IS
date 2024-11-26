<script lang="ts">
  import { onMount } from 'svelte';
  
  let container: HTMLDivElement;
  let symbols = '𓂀𓃭𓆣𓇯𓈖𓉔'.split('');
  
  onMount(() => {
    addSymbols();
  });

  function addSymbols() {
    for (let i = 0; i < 50; i++) {
      const symbol = document.createElement('span');
      symbol.textContent = symbols[Math.floor(Math.random() * symbols.length)];
      symbol.style.left = `${Math.random() * 100}%`;
      symbol.style.top = `${Math.random() * 100}%`;
      symbol.classList.add('symbol');
      container.appendChild(symbol);
    }
  }
</script>

<div class="background" bind:this={container}>
</div>

<style lang="postcss">
  .background {
    @apply fixed inset-0 -z-10 overflow-hidden;
  }
  
  :global(.symbol) {
    @apply absolute text-4xl text-amber-900/10;
    font-family: 'Noto Sans Egyptian Hieroglyphs', sans-serif;
    animation: float 20s infinite ease-in-out;
  }
  
  @keyframes float {
    0%, 100% { transform: translateY(0); }
    50% { transform: translateY(-20px); }
  }
</style>
