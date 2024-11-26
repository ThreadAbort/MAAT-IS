<script lang="ts">
  import ContentBlock from '$lib/components/ContentBlock.svelte';
  
  export let principle = {
    id: 'balance',
    content: `
# Balance in MAAT Philosophy

Balance is a core principle that governs both cosmic and personal harmony.

\`\`\`mermaid
graph TD
    A[Universal Balance] --> B[Cosmic Order]
    A --> C[Personal Balance]
    B --> D[Natural Laws]
    C --> E[Ethical Living]
    C --> F[Social Harmony]
\`\`\`

## Key Aspects
1. Cosmic Balance
2. Personal Ethics
3. Social Harmony

\`\`\`mermaid
pie title "Balance Components"
    "Internal" : 33.3
    "External" : 33.3
    "Cosmic" : 33.3
\`\`\`
    `
  };
</script>

<div class="principle-content">
  <ContentBlock 
    content={principle.content} 
    type="markdown"
  />
</div> 