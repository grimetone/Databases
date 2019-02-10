const Tweet = require('./tweet');

//Simple version, without validation or sanitation
exports.test = function (req, res) {
    res.send('Welcome from the tweet controller!');
};
