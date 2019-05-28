var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res, next) {
  console.log("Hit the user route!");
  res.send('<h2>Correctsss this is a backend</h2>');
});

module.exports = router;
