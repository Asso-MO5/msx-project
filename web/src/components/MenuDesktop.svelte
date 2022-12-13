<script lang="ts">
  import type { MenuLink } from '../types/menu-links'
  import Logo from './Logo.svelte'
  import MenuLinks from './MenuLinks.svelte'

  export let menuLinks: MenuLink[]
</script>

<div class="container">
  <Logo />
  <MenuLinks {menuLinks} />
</div>

<style>
  .container {
    background: black;
    padding: 20px;
  }
</style>
