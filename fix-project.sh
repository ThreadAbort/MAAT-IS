#!/bin/bash

# Create base directories
mkdir -p src/lib/components/{3d,forum,principles}
mkdir -p src/lib/services
mkdir -p src/lib/stores
mkdir -p static

# Create basic components
cat > src/lib/components/EgyptianBackground.svelte << 'EOL'
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
EOL

# Create basic layout
cat > src/routes/+layout.svelte << 'EOL'
<script lang="ts">
  import '../app.css';
  import EgyptianBackground from '$lib/components/EgyptianBackground.svelte';
</script>

<svelte:head>
  <title>MAAT.is - Ancient Wisdom for Modern Ethics</title>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+Egyptian+Hieroglyphs&display=swap" rel="stylesheet">
</svelte:head>

<EgyptianBackground />

<div class="app">
  <header>
    <nav>
      <a href="/" class="logo">MAAT.is</a>
      <div class="nav-links">
        <a href="/principles">Principles</a>
        <a href="/forum">Forum</a>
        <a href="/playground">Playground</a>
        <a href="/ethics">Ethics</a>
      </div>
    </nav>
  </header>

  <main>
    <slot />
  </main>
</div>

<style lang="postcss">
  .app {
    @apply min-h-screen;
    background: rgba(28, 25, 23, 0.5);
    backdrop-filter: blur(2px);
  }

  header {
    @apply bg-stone-800/80 text-amber-100 p-4 backdrop-blur-sm border-b border-amber-900/20;
  }

  nav {
    @apply container mx-auto flex justify-between items-center;
  }

  .logo {
    @apply text-3xl font-bold text-amber-400;
    text-shadow: 0 0 10px rgba(245, 158, 11, 0.3);
  }

  .nav-links {
    @apply flex space-x-6;
  }

  main {
    @apply container mx-auto p-4;
  }
</style>
EOL

# Create app.css
cat > src/app.css << 'EOL'
@tailwind base;
@tailwind components;
@tailwind utilities;

:root {
  --primary: theme('colors.amber.600');
  --secondary: theme('colors.stone.800');
}

body {
  @apply bg-stone-900 text-stone-100;
  font-family: system-ui, -apple-system, sans-serif;
}

a {
  @apply text-amber-400 hover:text-amber-300 transition-colors;
}
EOL

# Create favicon
cp maat.is/static/favicon.png static/favicon.png 2>/dev/null || echo "No favicon found"

# Create basic types
cat > src/lib/types.ts << 'EOL'
export type ContentType = 'markdown' | 'text' | 'code';

export interface Post {
  id: string;
  content: string;
  author: {
    name: string;
    avatar: string;
  };
  timestamp: number;
}
EOL

# Update package.json scripts
cat > package.json << 'EOL'
{
  "name": "maat.is",
  "version": "0.0.1",
  "type": "module",
  "scripts": {
    "dev": "vite dev",
    "build": "vite build",
    "preview": "vite preview",
    "check": "svelte-kit sync && svelte-check --tsconfig ./tsconfig.json",
    "lint": "eslint ."
  },
  "dependencies": {
    "@sveltejs/kit": "^2.0.0",
    "@tiptap/core": "^2.10.2",
    "@tiptap/extension-collaboration": "^2.10.2",
    "@tiptap/extension-collaboration-cursor": "^2.10.2",
    "force-graph": "^1.46.0",
    "highlight.js": "^11.10.0",
    "katex": "^0.16.11",
    "marked": "^15.0.2",
    "mermaid": "^11.4.0",
    "svelte": "^4.0.0",
    "three": "^0.170.0",
    "y-indexeddb": "^9.0.12",
    "y-webrtc": "^10.3.0",
    "yjs": "^13.6.20"
  },
  "devDependencies": {
    "@sveltejs/adapter-node": "^2.0.0",
    "@sveltejs/vite-plugin-svelte": "^3.0.0",
    "@typescript-eslint/eslint-plugin": "^6.0.0",
    "@typescript-eslint/parser": "^6.0.0",
    "autoprefixer": "^10.4.14",
    "eslint": "^8.0.0",
    "eslint-plugin-svelte": "^2.0.0",
    "postcss": "^8.4.24",
    "svelte-check": "^3.0.0",
    "tailwindcss": "^3.3.2",
    "typescript": "^5.0.0",
    "vite": "^5.0.0"
  }
}
EOL

echo "Project structure fixed! Running npm install..."
npm install

echo "Done! Try running 'npm run dev' now." 