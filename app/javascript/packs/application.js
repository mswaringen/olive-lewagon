import "bootstrap";
import TypeIt from 'typeit';

require("chartkick")
require("chart.js")

new TypeIt('#heroImpact', {
  strings: ["This is a great string.", "But here is a better one."],
  speed: 50,
  breakLines: false,
  waitUntilVisible: true
}).go();
