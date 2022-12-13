<script lang="ts">
  import { createEventDispatcher } from 'svelte'

  export let isOpen: boolean
  const dispatch = createEventDispatcher()
  const bars = [1, 2, 3]
</script>

<div
  class="hamburger"
  on:click={() => dispatch('open')}
  role="presentation"
  data-isopen={isOpen}
>
  {#each bars as _bar}
    <div class="bar" />
  {/each}
</div>

<style>
  .hamburger {
    cursor: pointer;
    height: 30px;
    position: fixed;
    right: 10px;
    top: 10px;
    width: 35px;
    z-index: 30;
  }

  .bar {
    background: black;
    border-radius: 50px;
    height: 4px;
    position: absolute;
    right: 0;
  }

  .hamburger[data-isopen='true'] .bar {
    background: white;
  }

  .bar:nth-child(1) {
    left: 0;
    top: 0;
  }

  .bar:nth-child(2) {
    left: 25%;
    top: 10px;
  }

  .bar:nth-child(3) {
    left: 40%;
    top: 20px;
  }
</style>
