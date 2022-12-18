<script lang="ts">
  import type { Link } from '../types/menu-links'
  import Logo from './Logo.svelte'
  import MenuLinks from './MenuLinks.svelte'

  export let links: Link[]
</script>

<div class="container">
  <Logo />
  <div class="box">
    <div class="content">
      <MenuLinks {links} />
    </div>
  </div>
</div>

<style>
  .container {
    background: black;
    padding: 20px;
    display: grid;
    grid-template-rows: auto 1fr;
  }

  .box {
    position: relative;
  }

  .content {
    position: absolute;
    top: 0;
    right: 0;
    left: 0;
    bottom: 0;
    overflow-y: auto;
    scrollbar-color: rgba(255, 255, 255, 0.3) black;
    scrollbar-width: thin;
    padding-right: 10px;
  }

  .content::-webkit-scrollbar {
    width: 3px;
  }

  .content::-webkit-scrollbar-track {
    background: black;
  }

  .content::-webkit-scrollbar-thumb {
    background: rgba(255, 255, 255, 0.3);
    transition: 200ms ease-in-out;
  }
</style>
