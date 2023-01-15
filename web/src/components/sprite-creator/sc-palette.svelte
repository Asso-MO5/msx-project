<script lang="ts">
  import { palette } from './utils/palette'
  import { currentColor } from './stores/color.store'
</script>

<div class="palette">
  {#each palette as color}
    <!-- svelte-ignore a11y-click-events-have-key-events -->
    <div
      class="color"
      style="background-color: {color.hex}"
      aria-selected={$currentColor.hex === color.hex}
      on:click={() => currentColor.changeColor(color)}
    />
  {/each}
</div>

<style scoped>
  .palette {
    display: grid;
    --palette-size: 40px;
    grid-template-columns: repeat(2, auto);
    gap: 6px;
    padding: 5px;
  }

  .color {
    width: 100%;
    height: 100%;
    width: var(--palette-size);
    height: var(--palette-size);
    border: 1px solid #000;
    cursor: pointer;
    cursor: pointer;
    transition: 200ms ease-in-out;
    position: relative;
  }

  .color::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: rgba(255, 255, 255, 0);
    clip-path: polygon(100% 93%, 95% 100%, 100% 100%);
    transition: 200ms ease-in-out;
  }

  .color[aria-selected='true'] {
    box-shadow: -2px -2px 0px 0px #fff, 2px 2px 0px 0px #fff,
      -2px 2px 0px 0px #fff, 2px -2px 0px 0px #fff, 0px 0px 0px 2px #fff,
      -2px -2px 0px 0px #fff, 2px 2px 0px 0px #fff, -2px 2px 0px 0px #fff,
      -4px -4px 0px 0px #000, 4px 4px 0px 0px #000, -4px 4px 0px 0px #000,
      4px -4px 0px 0px #000, 0px 0px 0px 4px #000;
  }

  .color[aria-selected='true']::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: rgba(223, 240, 246, 0.3);
    clip-path: polygon(100% 0, 0% 100%, 100% 100%);
  }
</style>
