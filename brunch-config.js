exports.config = {
  production: true,

  modules: {
    definition: false,
    autoRequire: {
      "dist/js/infinity_one_pages.js": [
        "js/infinity_one_pages",
        // "js/help",
        // "node_modules/perfect-scollbar"
     ]
    }
  },
  npm: {
    enabled: true
  },
  files: {
    javascripts: {
      joinTo: {
        // "js/infinity_one_pages.js": /^(assets)/,
        "js/infinity_one_pages.js": "assets/js/infinity_one_pages.js",
        // "js/help.js": "assets/js/help.js",
        // "js/infinity_one_pages.js": /^(assets\/js|node_modules)/,
        "js/infinity_one_pages_vendor.js": /^(assets\/vendor|node_modules)/
      }
    },
    stylesheets: {
      joinTo: {
        "css/infinity_one_pages.css": /^(assets\/?css|node_modules\/perfect-scrollbar\/css)/
        // "css/infinity_one_pages.css": ['assets/**/*.?css']
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
      "assets/css",
      "assets/scss",
      "assets/js",
      "assets/vendor",
      // "node_modules/perfect-scrollbar"
    ],

    // Where to compile files to
    public: "priv/dist"
  },

  // Configure your plugins
  plugins: {
    babel: {
      // Do not use ES6 compiler in vendor code
      ignore: [/^(assets\/vendor)/],
      presets: ["env"]
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
