
const path = require('path');

module.exports = {
  context: __dirname,
  entry: "./widgets.jsx",
  output: {
    path: path.resolve(__dirname),
    filename: "bundle.js"
  },
  module: {
    loaders: [
      {
        test: [/\.jsx?$/, /\.js?$/],
        // exclude: /(node_modules)/,
        loader: 'babel-loader',
        // babelrc: true,
        query: {
          presets: ['es2015', 'react'],
          plugins: ["transform-class-properties"]
        }
      }
    ]
  },
  devtool: 'source-map',
  resolve: {
    extensions: [".js", ".jsx", "*"]
  }
};