<script lang="ts">
  import ForumPost from './forum/ForumPost.svelte';
  import type { Post } from '$lib/types';

  const samplePosts: Post[] = [
    {
      id: '1',
      content: 'Welcome to the Ma\'at Principles Forum!',
      author: {
        name: 'Moderator',
        avatar: '' // Will use default avatar
      },
      timestamp: Date.now()
    }
  ];
</script>

<section class="py-8">
  <h2 class="font-peralta text-2xl text-amber-600 mb-6">Community Discussion</h2>
  <div class="space-y-4">
    {#each samplePosts as post (post.id)}
      <ForumPost {...post} />
    {/each}
  </div>
</section>
