/**
 * Very simple Lambda which just returns a string on invocation.
 */
exports.handler = function(event, context) {
    context.succeed('Hello, World!');    
};
