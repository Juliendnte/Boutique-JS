const rateLimit = require("express-rate-limit");

function rateLimitHandler(req, res) {
    res.status(429).json({
        error: "Too many requests"
    });
}

const limiter = rateLimit({
    windowMs: 15 * 60 * 1000, // 15 minutes
    max: 1000,
    handler: rateLimitHandler
});

module.exports = limiter;