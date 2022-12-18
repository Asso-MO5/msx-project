import { defineConfig } from 'astro/config';
// https://astro.build/config
import svelte from '@astrojs/svelte';
import mdx from '@astrojs/mdx';

// https://astro.build/config

// https://astro.build/config
export default defineConfig({
  site: 'https://Asso-MO5.github.io',
  base: '/msx-project',
  integrations: [mdx(), svelte()]
});