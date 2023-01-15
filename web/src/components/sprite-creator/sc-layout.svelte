<script lang="ts">
  import ScFrame from '../sc-frame.svelte'
  import ScPalette from './sc-palette.svelte'
  import { currentColor } from './stores/color.store'
</script>

<main>
  <div class="menuLeft">
    <ScPalette />
  </div>
  <div class="editor"><ScFrame /></div>
  <div class="menuRight">
    {$currentColor.name}
  </div>
</main>

<style scoped>
  main {
    display: grid;
    grid-template-columns: auto 5fr 1fr;
    height: 100%;
    gap: 10px;
  }

  .editor {
    display: flex;
    align-items: center;
    justify-content: center;
  }
</style>
