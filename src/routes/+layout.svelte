<script lang="ts">
  import '../app.css';
  import Header from '$lib/components/Header.svelte';
  import EgyptianBackground from '$lib/components/EgyptianBackground.svelte';
</script>

<div class="min-h-screen bg-stone-900 bg-opacity-95 relative">
  <EgyptianBackground />
  
  <Header />
  
  <main class="relative">
    <slot />
  </main>
</div>
