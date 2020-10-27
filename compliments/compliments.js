function compliment(name, message) {
    return `Hey ${name}, you're ${message}!`;
}

function getSuperCompliment(name) {
    return compliment(name, "super");
}

function getNeatoCompliment(name) {
    return compliment(name, "neato");
}

function Dance(name) {
    this.name = name;
}

module.exports.getSuperCompliment = getSuperCompliment;
module.exports.getNeatoCompliment = getNeatoCompliment;
module.exports.Dance = Dance;

module.exports.neato = getNeatoCompliment;

module.exports.getTheBestCompliment = function (name) {
    return compliment(name, "the BEST")
};

module.exports = {
    makeSuper: getSuperCompliment,
    makeNeat: getNeatoCompliment,
    makeTheBest: function (name) {
        return compliment(name, "the BEST")
    }
};

module.exports = function () {
    console.log("I'm all that's left of exports.")
};