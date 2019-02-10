const express = require('express');
const router = express.Router();

const tweet_controller = require('./tweet.controller');

router.get('/test', tweet_controller.test);
router.get('/count', tweet_controller.count);
router.get('/:id', tweet_controller.tweet);
// router.get('/grumpiest', tweet_controller.grumpiest);
// router.get('/happiest', tweet_controller.happiest);

module.exports = router;