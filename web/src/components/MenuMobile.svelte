<script lang="ts">
  import type { MenuLink } from '../types/menu-links'
  import Hamburger from './Hamburger.svelte'
  import Logo from './Logo.svelte'
  import MenuLinks from './MenuLinks.svelte'

  export let menuLinks: MenuLink[]
  let isOpen = false

  const setIsOpen = () => (isOpen = !isOpen)
</script>

<Hamburger on:open={setIsOpen} {isOpen} />

<div class="menu" data-isopen={isOpen}>
  <Logo />
  <div class="links" on:click={() => (isOpen = false)} role="presentation">
    <MenuLinks {menuLinks} />
  </div>
</div>

<style>
  .menu {
    background: black;
    bottom: 0;
    display: grid;
    gap: 15px;
    grid-template-rows: auto 1fr;
    justify-items: end;
    padding: 60px 20px 20px;
    position: fixed;
    right: 0;
    top: 0;
    transition: 0.3s ease-in-out;
    width: 100vw;
    z-index: 20;
  }

  .menu[data-isopen='false'] {
    right: -110vw;
    z-index: 50;
  }

  .links {
    display: flex;
    flex-direction: column;
    gap: 15px;
    height: 100%;
    font-size: 1.5em;
    text-align: right;
    overflow-y: auto;
    padding: 20px;
  }
</style>
