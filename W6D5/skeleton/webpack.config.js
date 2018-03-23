module.exports = {
  entry: "./app.jsx",
  output: {
    filename: './bundle.js',
  },
  devtool: "source-map",
  resolve: {
    extensions: ['.js', '.jsx', '*']
  },
  module: {
    rules: [
      {
        test: [/\.jsx?$/],
        exclude: /(node_modules)/,
        loader: 'babel-loader',
        query: {
          presets: ['env', 'react']
        }
      }
    ]
  },
};
