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
