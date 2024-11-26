/** @type {import('tailwindcss').Config} */
const config = {
  content: ['./src/**/*.{html,js,svelte,ts}'],
  theme: {
    extend: {
      colors: {
        maat: {
          gold: '#FFB74D',
          sand: '#F5E6D3',
          stone: '#2C2C2C'
        }
      }
    }
  },
  plugins: []
};

export default config;
