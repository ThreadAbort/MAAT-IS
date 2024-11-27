<script lang="ts">
  import { principles } from '$lib/stores/principles';
  import type { PrincipleCategory } from '$lib/types/principles';
  
  let categories: PrincipleCategory[];
  
  principles.subscribe(value => {
    categories = value;
  });
</script>

<div class="grid gap-8 p-6">
  {#each categories as category}
    <section class="space-y-4">
      <h2 class="text-2xl font-bold text-maat-gold">{category.title}</h2>
      <p class="text-stone-300">{category.description}</p>
      
      <div class="grid gap-6 md:grid-cols-2 lg:grid-cols-3">
        {#each category.principles as principle}
          <article class="bg-stone-800 rounded-lg p-6 space-y-4">
            <div class="flex items-center gap-4">
              <span class="text-4xl font-egyptian">{principle.hieroglyph}</span>
              <h3 class="text-xl font-semibold text-maat-gold">{principle.title}</h3>
            </div>
            
            <p class="text-stone-300">{principle.description}</p>
            
            <div class="pt-4 border-t border-stone-700">
              <h4 class="font-semibold text-maat-sand">Modern Context</h4>
              <p class="text-stone-300">{principle.modernContext}</p>
            </div>
          </article>
        {/each}
      </div>
    </section>
  {/each}
</div> 