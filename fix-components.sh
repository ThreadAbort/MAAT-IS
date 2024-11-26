#!/bin/bash

# Create necessary component directories
mkdir -p src/lib/components/{3d,forum,principles}

# Create EgyptianBackground.svelte
cat > src/lib/components/EgyptianBackground.svelte << 'EOL'
<script lang="ts">
  let symbols = Array(50).fill('').map(() => ({
    x: Math.random() * 100,
    y: Math.random() * 100,
    symbol: '𓂀𓃭𓆣𓇯𓈖𓉔'[Math.floor(Math.random() * 6)]
  }));
</script>

<div class="background">
  {#each symbols as { x, y, symbol }}
    <span 
      class="symbol" 
      style="left: {x}%; top: {y}%;"
    >
      {symbol}
    </span>
  {/each}
</div>

<style lang="postcss">
  .background {
    @apply fixed inset-0 overflow-hidden -z-10;
  }
  .symbol {
    @apply absolute text-4xl text-amber-900/10;
    font-family: 'Noto Sans Egyptian Hieroglyphs', sans-serif;
  }
</style>
EOL

# Create Hero.svelte
cat > src/lib/components/Hero.svelte << 'EOL'
<script lang="ts">
  export let title: string;
  export let subtitle: string;
</script>

<div class="hero">
  <h1>{title}</h1>
  <p>{subtitle}</p>
</div>

<style lang="postcss">
  .hero {
    @apply text-center py-20;
  }
  h1 {
    @apply text-6xl font-bold text-amber-600 mb-4;
  }
  p {
    @apply text-xl text-stone-600;
  }
</style>
EOL

# Create EthicalAI.svelte
cat > src/lib/components/EthicalAI.svelte << 'EOL'
<script lang="ts">
  export let license: string;
</script>

<section class="ethical-ai">
  <h2>Ethical AI Framework</h2>
  <p>Licensed under {license}</p>
</section>

<style lang="postcss">
  .ethical-ai {
    @apply bg-stone-800 text-amber-50 p-8 rounded-lg;
  }
</style>
EOL

# Create Forum.svelte
cat > src/lib/components/Forum.svelte << 'EOL'
<script lang="ts">
  import ForumPost from './forum/ForumPost.svelte';
</script>

<section class="forum">
  <h2>Community Forum</h2>
  <div class="posts">
    <!-- Forum posts will go here -->
  </div>
</section>

<style lang="postcss">
  .forum {
    @apply max-w-4xl mx-auto py-8;
  }
</style>
EOL

# Create ContentBlock.svelte
cat > src/lib/components/ContentBlock.svelte << 'EOL'
<script lang="ts">
  export let content: string;
  export let type: 'markdown' | 'text' = 'text';
</script>

<div class="content-block">
  {#if type === 'markdown'}
    {@html content}
  {:else}
    {content}
  {/if}
</div>

<style lang="postcss">
  .content-block {
    @apply prose prose-amber max-w-none;
  }
</style>
EOL

echo "Components created successfully!" 