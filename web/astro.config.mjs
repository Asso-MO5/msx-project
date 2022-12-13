import { defineConfig } from 'astro/config'
// https://astro.build/config
import svelte from '@astrojs/svelte'

// https://astro.build/config
export default defineConfig({
  site: 'https://Asso-MO5.github.io',
  base: '/msx-project',
  integrations: [svelte()],
})
