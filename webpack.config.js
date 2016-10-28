const GhPagesWebpackPlugin = require('gh-pages-webpack-plugin');
const merge = require('webpack-merge');
const autoprefixer = require('autoprefixer');

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
        exclude: [/elm-stuff/, /node_modules/, /Stylesheets\.elm/],
        loader: 'elm-webpack'
      },
      {
        test: /Stylesheets\.elm$/,
        loader: "style!css!postcss!elm-css-webpack"
      }
    ]
  },

  postcss: [ autoprefixer({ browsers: ['last 3 versions'] }) ]
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
