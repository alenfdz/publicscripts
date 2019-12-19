const config = {};

config.host = "https://mytestskariff.documents.azure.com:443/";
config.authKey = "WrPwj7WM9gX4RCHW7GaivOOb49pvToEtOOkSfgMxCMzPm0JxqWbOAgAiIw3413caBHN50bMbqpSeVuSo63NMtQ=="
config.databaseId = "thingsdatabase";
config.containerId = "nodeitems";

if(config.host.includes("https://localhost:")){
  console.log("Local environment detected");
  console.log("WARNING: Disabled checking of self-signed certs. Do not have this code in production.");
  process.env.NODE_TLS_REJECT_UNAUTHORIZED = "0";
  console.log("Go to http://localhost:${process.env.PORT || '3000'} to try the sample.");
}

module.exports = config;