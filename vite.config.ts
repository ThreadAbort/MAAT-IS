import { sveltekit } from '@sveltejs/kit/vite';
import { defineConfig } from 'vite';
import { fileURLToPath, URL } from 'url';

export default defineConfig({
	plugins: [sveltekit()],
	server: {
		fs: {
			allow: [
				// Allow serving files from project root
				'.',
				// Allow serving files from node_modules
				'../../node_modules',
				// Specifically allow @sveltejs/kit runtime files
				fileURLToPath(new URL('../../node_modules/@sveltejs/kit', import.meta.url)),
				'static'
			]
		}
	}
});
