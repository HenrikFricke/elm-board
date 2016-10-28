'use strict';

require('./index.html');
require('../styles/main.css');

var Elm = require('./Main.elm');
Elm.Main.embed(document.getElementById('main'));
