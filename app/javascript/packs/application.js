import "bootstrap";

require("chartkick")
require("chart.js")

import TypeIt from 'typeit';

(function() {
  new TypeIt('#type', {
    strings: ["buy 2 Malaria nets.", "buy whole meal for 5 Tsunami victim.", "adopt an elephant in Africa.", "build a household rainwater collection system"],
    speed: 50,
    breakLines: false,
    waitUntilVisible: true,
    loop: true,
    loopDelay: 2000
  }).go();
})();
