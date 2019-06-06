import "bootstrap";

require("chartkick")
require("chart.js")

import TypeIt from 'typeit';

(function() {
  new TypeIt('#type', {
    strings: ["buy 2 malaria nets.", "buy meals for 5 tsunami victims.", "help adopt an elephant in Africa.", "help build a household rainwater collection system"],
    speed: 75,
    breakLines: false,
    waitUntilVisible: true,
    loop: true,
    loopDelay: 2000
  }).go();
})();

