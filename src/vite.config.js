import { defineConfig } from 'vite';
import laravel from 'laravel-vite-plugin';
import { globSync }  from 'glob';

export default defineConfig({
    server: {
        host: '0.0.0.0',
    },
    plugins: [
        laravel({
            input: globSync('resources/{scss,js}/**/*.{scss,js}', {
                ignore: '**/*.test.js',
            }),
            refresh: true,
        }),
        {
            name: 'blade',
            handleHotUpdate({ file, server }) {
                if (file.endsWith('.blade.php')) {
                    server.ws.send({
                        type: 'full-reload',
                        path: '*',
                    });
                }
            },
        },
    ],
});
