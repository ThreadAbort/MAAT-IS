#!/bin/bash

cat > package.json << 'EOL'
{
  "name": "maat.is",
  "version": "0.0.1",
  "private": true,
  "type": "module",
  "scripts": {
    "dev": "vite dev",
    "build": "vite build",
    "preview": "vite preview"
  }
}
EOL

# Install core dependencies
pnpm add -D vite @sveltejs/kit svelte
pnpm add -D typescript @types/node
pnpm add -D tailwindcss postcss autoprefixer
pnpm add -D @sveltejs/adapter-node 