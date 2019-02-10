const express = require('express');
const router = express.Router();

const tweet_controller = require('./tweet.controller');
router.get('/test', tweet_controller.test);

module.exports = router;