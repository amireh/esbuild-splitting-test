export default {
  mode: 'development',
  target: 'node',
  devtool: false,
  optimization: {
    concatenateModules: false,
    splitChunks: {
      chunks: 'all',
      cacheGroups: {
        esbuildLike: {
          test: (module) => /(b\.js|core\.js)$/.test(module.resource),
          name: 'b+core',
          minChunks: 1,
          minSize: 1,
          reuseExistingChunk: false,
        }
      },
    }
  }
}