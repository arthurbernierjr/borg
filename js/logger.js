// Generated by CoffeeScript 1.4.0
var Color, Logger, RainbowIndex;

module.exports = Logger = (function() {

  function Logger() {}

  Logger.started = new Date;

  Logger.out = function() {
    var o, s;
    o = {};
    switch (arguments.length) {
      case 2:
        o = arguments[0], s = arguments[1];
        break;
      case 1:
        s = arguments[0];
    }
    o.type || (o.type = 'info');
    o.type_color = {
      info: 'yellow',
      out: 'reset',
      err: 'red'
    };
    return process.stdout.write(("" + Color.bright_white + (new Date - this.started) + "ms" + Color.reset + " ") + ("" + (o.host ? "" + (RainbowIndex(o.host)) + o.host + Color.reset + " " : "")) + ("" + Color[o.type_color[o.type]] + (o.type !== 'out' ? "[" + o.type + "]" : "|") + Color.reset + " ") + ("" + s) + ("" + (o.type === 'out' ? "" : "\n")));
  };

  return Logger;

})();

RainbowIndex = (function() {

  RainbowIndex.id = 0;

  RainbowIndex.hash = {};

  RainbowIndex.rainbow = ('blue magenta cyan red green yellow' + 'bright_yellow bright_blue bright_magenta ' + 'bright_cyan bright_red bright_green').split(' ');

  function RainbowIndex(s) {
    var _base;
    return Color[(_base = RainbowIndex.hash)[s] || (_base[s] = RainbowIndex.rainbow[RainbowIndex.id++ % RainbowIndex.rainbow.length])];
  }

  return RainbowIndex;

})();

Color = (function() {

  function Color() {}

  Color.reset = '\u001b[0m';

  Color.black = '\u001b[30m';

  Color.red = '\u001b[31m';

  Color.green = '\u001b[32m';

  Color.yellow = '\u001b[33m';

  Color.blue = '\u001b[34m';

  Color.magenta = '\u001b[35m';

  Color.cyan = '\u001b[36m';

  Color.white = '\u001b[37m';

  Color.grey = '\u001b[1m\u001b[30m';

  Color.bright_red = '\u001b[1m\u001b[31m';

  Color.bright_green = '\u001b[1m\u001b[32m';

  Color.bright_yellow = '\u001b[1m\u001b[33m';

  Color.bright_blue = '\u001b[1m\u001b[34m';

  Color.bright_magenta = '\u001b[1m\u001b[35m';

  Color.bright_cyan = '\u001b[1m\u001b[36m';

  Color.bright_white = '\u001b[1m\u001b[37m';

  return Color;

})();