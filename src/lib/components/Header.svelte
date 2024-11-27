<script lang="ts">
  const navItems = [
    { href: '/', label: 'Principles' },
    { href: '/forum', label: 'Forum' }
  ];
</script>

<header class="bg-stone-800 border-b border-amber-900/30">
  <nav class="container mx-auto px-4 py-4 flex items-center justify-between">
    <a href="/" class="font-hieroglyphs text-2xl text-amber-500">𓃭 𓆣</a>
    <ul class="flex gap-6">
      {#each navItems as {href, label}}
        <li>
          <a 
            {href} 
            class="font-maat text-stone-300 hover:text-amber-500 transition-colors"
          >
            {label}
          </a>
        </li>
      {/each}
    </ul>
  </nav>
</header> 