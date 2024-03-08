function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);

  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
    myVarName: 'someValue',
    name: "Divahar",
    baseURL: 'https://reqres.in/api'
  }
  if (env == 'dev') {
    config.baseURL = 'https://reqres.in/api/dev'
  } else if (env == qa) {
    config.baseURL = 'https://reqres.in/api/qa'
    // customize
    // e.g. config.foo = 'bar';
  } else if (env == 'e2e') {
    // customize
  }
  else {
    config.baseURL = 'https://reqres.in/api/default'

  }

  karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 5000);

  return config;
}