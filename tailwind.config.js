/** @type {import('tailwindcss').Config} */
export default {
    content: ['./src/**/*.{html,js,svelte,ts}'],
    theme: {
      extend: {
        fontFamily: {
          'peralta': ['Peralta-o014', 'sans-serif'],
          'computer-robot': ['COMPUTERRobot', 'monospace'],
          'computer': ['Computer Regular', 'monospace'],
          'lazenby-liquid': ['LazenbyCompLiquid', 'sans-serif'],
          'lazenby-smooth': ['LazenbyCompSmooth', 'sans-serif'],
          'mariana': ['MarianaSlabserif-8j5A', 'serif'],
          'meslo': ['MesloLGS NF Regular', 'monospace'],
          'hieroglyphs': ['NotoSansEgyptianHieroglyphs-Regular', 'sans-serif'],
          'amazgoda': ['amazgoda', 'sans-serif'],
          'maat': ['maat', 'system-ui', 'sans-serif'],
        },
        colors: {
          'maat-gold': '#FFD700',
        },
      },
    },
    plugins: [],
  }