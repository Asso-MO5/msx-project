<script lang="ts">
  import type { Link } from '../types/menu-links'
  import { BASE_PATH } from '../utils/constant'

  export let links: Link[]
</script>

<ul>
  {#each links.sort((a, b) => a.title.localeCompare(b.title)) as cat}
    <li class="title"><a href={`${BASE_PATH}${cat.title}`}>{cat.title}</a></li>
    <ul class="links">
      {#each cat.posts as link}
        <li>
          <a href={`${BASE_PATH}${link.category}/${link.slug}`}>{link.title}</a>
        </li>
      {/each}
    </ul>
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

  .title {
    color: white;
    text-transform: uppercase;
    font-weight: bold;
    border-bottom: 1px solid rgba(255, 255, 255, 0.3);
    padding: 10px 5px 0;
  }

  .links {
    padding-left: 15px;
    overflow-y: auto;
  }
</style>
