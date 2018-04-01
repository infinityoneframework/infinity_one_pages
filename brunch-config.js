exports.config = {
  sourceMaps: false,
  production: true,

  modules: {
    definition: false,
    autoRequire: {
      "dist/js/infinity_one_pages.js": [
        "js/infinity_one_pages",
     ]
    }
  },
  npm: {
    enabled: true
  },
  files: {
    javascripts: {
      joinTo: {
        "js/infinity_one_pages.js": /^(assets\/js|node_modules)/,
        "js/vendor.js": /^(assets\/vendor)/
      },
      stylesheets: {
        joinTo: {
          "css/infinity_one_pages.css": [
            /^assets\/(css|scss)/
          ]
        }
      }
    }
  },

  conventions: {
    assets: /^(assets\/static)/
  },

  // Phoenix paths configuration
  paths: {
    // Which directories to watch
    watched: [
      "assets/static",
      "assets/third",
      "assets/css",
      "assets/scss",
      "assets/js",
      "assets/vendor"
    ],

    // Where to compile files to
    public: "priv/dist"
  },

  // Configure your plugins
  plugins: {
    babel: {
      // Do not use ES6 compiler in vendor code
      ignore: [/^(assets\/vendor)/]
    },
    postcss: {
      processors: [
        require("autoprefixer")
      ]
    },
    sass: {
      mode: "native", // This is the important part!
      options: {
        // includePaths: [ 'node_modules' ]
      }
    }
  }
};
