module.exports = {
  // Where your source asset files live
  paths: {
    watched: ['source/assets']
  },
  conventions: {
    assets() { return false; }
  },
  files: {
    stylesheets: {
      joinTo: 'assets/stylesheets/site.css'
    },
    javascripts: {
      joinTo: {
        'assets/javascripts/site.js': 'source/assets/javascripts/site.js',
        // bundle all JS files from Bower packages into `vendor.js`
        'assets/javascripts/vendor.js': [
          /^(bower_components|vendor)/
        ]
      }
    }
  },
  modules: {
    wrapper: false
  },
  plugins: {
    babel: { presets: ['es2015'] },
    sass: {
      mode: 'native',
      options: {
        // include any Sass files from outside of the `source` folder, such as from Bower packages
        includePaths: [
          'bower_components/bootstrap/scss',
          'vendor/sass'
        ]
      }
    }
  },
  postcss: {
    processors: [
      require('autoprefixer')(['last 8 versions'])
    ]
  }
};
