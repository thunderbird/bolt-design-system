import { defineConfig } from '@terrazzo/cli';
import css from "@terrazzo/plugin-css";

export default defineConfig({
  tokens: ['tokens/bolt-example.json'],
  plugins: [
    css({
      filename: "tokens.css",
    }),
  ],
  outDir: './dist/',
  lint: {
    /** @see https://terrazzo.app/docs/linting */
    build: {
      enabled: true,
    },
    rules: {
      'core/valid-color': 'warn', /* Example tokens use legacy format */
      'core/valid-dimension': 'error',
      'core/valid-font-family': 'error',
      'core/valid-font-weight': 'error',
      'core/valid-duration': 'error',
      'core/valid-cubic-bezier': 'error',
      'core/valid-number': 'error',
      'core/valid-link': 'error',
      'core/valid-boolean': 'error',
      'core/valid-string': 'error',
      'core/valid-stroke-style': 'error',
      'core/valid-border': 'error',
      'core/valid-transition': 'error',
      'core/valid-shadow': 'error',
      'core/valid-gradient': 'error',
      'core/valid-typography': 'error',
      'core/consistent-naming': 'warn',
    },
  },
});
