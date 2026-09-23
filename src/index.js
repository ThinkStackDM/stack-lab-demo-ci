const leftPad = require("left-pad");

function run() {
  const line = leftPad("stack-lab-demo-ci", 32, "*");
  console.log(line);
  console.log(`built_at_layer=source runtime=node${process.version}`);
  return line;
}

if (require.main === module) {
  run();
}

module.exports = { run };
