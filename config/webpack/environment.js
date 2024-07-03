const { environment } = require('@rails/webpacker')
const webpack = require('webpack')

environment.plugins.append(
  'Provide',
  new webpack.DefinePlugin({
    'process.env.NODE_OPTIONS': JSON.stringify('--openssl-legacy-provider')
  })
)

module.exports = environment
