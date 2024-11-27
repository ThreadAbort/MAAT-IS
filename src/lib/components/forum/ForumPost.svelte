<script lang="ts">
  import type { Post } from '$lib/types';
  
  export let content: string;
  export let author: { name: string; avatar: string };
  export let timestamp: number;
  
  // Default avatar as data URL (temporary solution)
  const defaultAvatar = "data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='40' height='40' viewBox='0 0 40 40'%3E%3Crect width='40' height='40' fill='%23475569'/%3E%3Ctext x='50%25' y='50%25' font-size='20' text-anchor='middle' dy='.3em' fill='%23CBD5E1'%3E👤%3C/text%3E%3C/svg%3E";
</script>

<article class="bg-stone-800 rounded-lg p-4 mb-4">
  <header class="flex items-center gap-3 mb-2">
    <img 
      src={author.avatar || defaultAvatar} 
      alt={author.name} 
      class="w-10 h-10 rounded-full bg-stone-700"
    />
    <div>
      <h3 class="font-maat text-amber-500">{author.name}</h3>
      <time class="text-sm text-stone-400">
        {new Date(timestamp).toLocaleDateString()}
      </time>
    </div>
  </header>
  <p class="text-stone-200">{content}</p>
</article> 