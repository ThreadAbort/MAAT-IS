import preprocess from 'svelte-preprocess';

const config = {
  preprocess: preprocess(),
  kit: {
    files: {
      assets: 'static'
    }
  }
};

export default config;
