var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res, next) {
  console.log("Hit the user route!");
  res.send('Hello React, It is I your Backend');
});

module.exports = router;
