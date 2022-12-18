<script lang="ts">
  import MenuMobile from './MenuMobile.svelte'
  import MenuDesktop from './MenuDesktop.svelte'
  import { onMount } from 'svelte'
  import type { Link } from '../types/menu-links'

  export let links: Link[] = []

  let isMobile: boolean

  function handleResize() {
    isMobile = window.innerWidth <= 600
  }

  onMount(() => {
    handleResize()
    window.addEventListener('resize', handleResize)
  })
</script>

{#if isMobile}
  <MenuMobile {links} />
{:else}
  <MenuDesktop {links} />
{/if}
