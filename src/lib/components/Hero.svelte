<script lang="ts">
  export let title: string;
  export let subtitle: string;
  
  // Debug font loading
  import { onMount } from 'svelte';
  
  onMount(() => {
    console.log('Font loading status:', {
      peralta: document.fonts.check("12px 'Peralta-o014'"),
      fontFamilies: Array.from(document.fonts).map(f => f.family)
    });
  });
</script>

<div class="hero">
  <h1 class="font-peralta">{title}</h1>
  <p>{subtitle}</p>
</div>

<style lang="postcss">
  .hero {
    @apply text-center py-20;
  }
  h1 {
    @apply text-6xl font-bold text-amber-600 mb-4 font-peralta;
  }
  p {
    @apply text-xl text-stone-300;
  }
</style>
