<script lang="ts">
  import { fade } from 'svelte/transition';

    const principles = [
      {
        icon: "🌟",
        title: "Truth",
        description: "Always seek and speak the truth, even when it is difficult. Honesty builds trust and lays the foundation for harmony."
      },
      {
        icon: "⚖️",
        title: "Justice",
        description: "Treat others fairly and without prejudice. Justice is not just about law but about equity in all interactions."
      },
      // Add remaining principles...
    ];
  </script>

<div class="max-w-4xl mx-auto px-4 py-8" in:fade={{duration: 1000}}>
  <header class="text-center mb-12">
    <h1 class="font-peralta text-4xl text-amber-500 mb-4">🌟 Understanding Ma'at 🌟</h1>
    <p class="text-xl text-stone-300 font-maat">
      The ancient Egyptian principle of <span class="text-amber-500">truth</span>, 
      <span class="text-amber-500">justice</span>, and 
      <span class="text-amber-500">balance</span>
    </p>
  </header>

  <div class="prose prose-invert prose-amber max-w-none">
    <div class="bg-stone-800/50 p-6 rounded-lg mb-8 backdrop-blur-sm">
      <p class="text-lg">
        <span class="font-hieroglyphs text-2xl mr-2">𓂋𓏺</span>
        <strong class="text-amber-500">Ma'at</strong> is the ancient Egyptian principle of 
        <strong>truth</strong>, <strong>justice</strong>, and <strong>balance</strong> that 
        guided both personal and societal ethics.
      </p>
    </div>

    <h2 class="font-peralta text-2xl text-amber-500 mb-6">
      📜 Core Principles of Ma'at
    </h2>
    
    <!-- Core principles list -->
    <div class="grid md:grid-cols-2 gap-6">
      {#each principles as principle}
        <div class="bg-stone-800/30 p-6 rounded-lg hover:bg-stone-800/50 transition-colors">
          <h3 class="font-maat text-xl text-amber-500 mb-2">
            {principle.icon} {principle.title}
          </h3>
          <p class="text-stone-300">{principle.description}</p>
        </div>
      {/each}
    </div>

    <!-- Rest of the content... -->
  </div>
</div>



<style lang="postcss">
  :global(.prose) {
    @apply text-stone-300;
  }
  
  :global(.prose strong) {
    @apply text-amber-500;
  }
  
  :global(.prose blockquote) {
    @apply border-l-amber-500/50 bg-stone-800/30 py-2 px-4;
  }
</style> 