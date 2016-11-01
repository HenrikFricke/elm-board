const GhPagesWebpackPlugin = require('gh-pages-webpack-plugin');
const merge = require('webpack-merge');
const smartImport = require('postcss-smart-import');
const cssNext = require('postcss-cssnext')

const commonConfig = {
  entry: './src/index.js',

  output: {
    path: './dist',
    filename: 'index.js'
  },

  resolve: {
    modulesDirectories: ['node_modules'],
    extensions: ['', '.js', '.elm']
  },

  module: {
    loaders: [
      {
        test: /\.html$/,
        exclude: /node_modules/,
        loader: 'file?name=[name].[ext]'
      },
      {
        test: /\.elm$/,
        exclude: [/elm-stuff/, /node_modules/],
        loader: 'elm-webpack'
      },
      {
        test: /\.css$/,
        exclude: [/elm-stuff/, /node_modules/],
        loader: 'style!css!postcss'
      }
    ]
  },

  postcss: [
    smartImport(),
    cssNext()
  ]
};

// DEVELOPMENT
if (process.env.NODE_ENV == "development") {
  module.exports = merge(commonConfig, {});
}

// PRODUCTION
if (process.env.NODE_ENV == "production") {
  module.exports = merge(commonConfig, {
    plugins: [
      new GhPagesWebpackPlugin({
          path: './dist'
      })
    ],
  });
}

// DEFAULT
if (process.env.NODE_ENV === undefined) {
  module.exports = commonConfig;
}
