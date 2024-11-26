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
