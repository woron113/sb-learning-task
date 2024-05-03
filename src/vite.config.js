import { defineConfig } from 'vite';
import laravel from 'laravel-vite-plugin';
import { globSync }  from 'glob';
import stylelint from 'vite-plugin-stylelint';

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
        stylelint({
            emitWarningAsError: true,
            include: ['resources/**/*.scss'],
            exclude: ['resources/scss/third-party/**/*.scss'],
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
