<script lang="ts">
  import '../app.css';
</script>

<div class="min-h-screen">
  <header class="border-b border-stone-800">
    <nav class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 h-16 flex items-center justify-between">
      <a href="/" class="text-2xl font-bold text-maat-gold">MAAT.is</a>
      <div class="space-x-8">
        <a href="/principles" class="link">Principles</a>
        <a href="/forum" class="link">Forum</a>
        <a href="/playground" class="link">Playground</a>
      </div>
    </nav>
  </header>

  <main>
    <slot />
  </main>
</div>
