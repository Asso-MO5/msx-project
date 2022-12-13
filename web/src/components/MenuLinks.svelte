<script lang="ts">
  import type { MenuLink } from '../types/menu-links'
  import { BASE_PATH } from '../utils/constant'

  export let menuLinks: MenuLink[]
</script>

<ul>
  {#each menuLinks as link}
    <li><a href={BASE_PATH + link.slug}>{link.title}</a></li>
  {/each}
</ul>

<style>
  ul {
    display: flex;
    flex-direction: column;
    gap: 6px;
    list-style-type: none;
    padding: 0;
  }

  a {
    text-decoration: none;
    color: white;
    cursor: pointer;
  }
</style>
