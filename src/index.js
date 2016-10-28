'use strict';

require('./index.html');
require('./Stylesheets.elm');

var Elm = require('./Main.elm');
Elm.Main.embed(document.getElementById('main'));
