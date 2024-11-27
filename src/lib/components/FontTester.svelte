<script lang="ts">
  // Import the fonts using @font-face
  const testText = "MAAT Intelligence System 2025";
  const sampleTexts = [
    "The quick brown fox jumps over the lazy dog",
    "1234567890",
    "!@#$%^&*()_+-=[]{}|;:,.<>?",
    "EGYPTIAN HIEROGLYPHS IN SPACE",
    "artificial intelligence"
  ];
</script>

<style>
  @font-face {
    font-family: 'Peralta';
    src: url('/fonts/Peralta-o014.ttf') format('truetype');
    font-weight: normal;
    font-style: normal;
  }

  @font-face {
    font-family: 'MarianaSlabserif';
    src: url('/fonts/MarianaSlabserif-8j5A.ttf') format('truetype');
    font-weight: normal;
    font-style: normal;
  }

  .font-tester {
    padding: 2rem;
    background: #1a1a1a;
    color: #fff;
    border-radius: 8px;
    margin: 1rem;
  }

  .font-section {
    margin-bottom: 2rem;
  }

  .peralta {
    font-family: 'Peralta', sans-serif;
  }

  .mariana {
    font-family: 'MarianaSlabserif', serif;
  }

  .size-variant {
    margin: 1rem 0;
  }

  .title {
    color: #66ff99;
    margin-bottom: 1rem;
  }

  .sample-text {
    margin: 0.5rem 0;
    line-height: 1.4;
  }
</style>

<div class="font-tester">
  {#each sampleTexts as text}
    <div class="sample-text peralta">{text}</div>
    <div class="sample-text font-computer-robot">{text}</div>
    <div class="sample-text font-maat">{text}</div>
  {/each}
</div> 