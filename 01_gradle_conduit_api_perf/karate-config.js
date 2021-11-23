function fn() {
    /* Setting System Properties :
    *  Intellij : Edfit Run Configureatiions > VM Options
    *           -Dproperty=value
    *           ( e.g. -Dkarate.env=dev )
    *   gradle.properties:
    *       systemProp.property=value
    *       ( e.g. systemProp.karate.env=dev )
    *
    *   All system properties can be accessed via
    *       karate.properties['']
    *       ( e.g. karate.properties['java.runtime.version'] )
    */

      if (!env) {
        env = 'test';
      }

      var config = {
        env: env,
        myGlobalVarName: 'someValue',
        sslConfig: true,

//            proxy:
//                    {
//                        uri: 'http://approxy.jpmchase.net:8443',
//                        nonProxyHosts:
//                        [
//                            'my-e2e-api.com',
//                            'localhost'
//                        ]
//                    }

            }

          if (env == 'test') {
            // customize
            // e.g. config.foo = 'bar';
            config.userEmail = 'testuser1@karate.com';
            config.userPassword = 'test123';
            config.extraString = ' for user1',
            config.apiUrl = 'https://conduit.productionready.io/api';
          };

          if (env == 'dev') {
            // customize
            config.userEmail = 'testuser10@karate.com';
            config.userPassword = 'test123';
            config.extraString = ' for user10',
            //config.apiUrl = 'https://api.realworld.io/api';
            config.apiUrl = 'https://conduit.productionready.io/api';
          };
        //karate.configure('proxy',  { uri: 'http://xx.xx.xxx.xx:8080', username: 'myuserid', password: 'xxxxxx' });

          // don't wait more than 5 seconds for a connection or response
            karate.configure('connectTimeout'   , 10000);
            karate.configure('readTimeout'      , 10000);
            //To call previously set proxy from karate.configuration
        /*  karate.configure('proxy',config.proxy);
            karate.log('Present proxy being used is :', config.proxy.uri );  */

            //Best way to setup accessToken using karate.callSingle. Here passing parameter is authToken.
            var accessToken = karate.callSingle('classpath:resources/helpers/CreateToken.feature', config).authToken
            //In the step below, we are setting the authToken in Headers
            karate.configure('headers', {Authorization: 'Token '+accessToken})

        var env = karate.env; // get system property 'karate.env'
        karate.log('karate.env system property was:', env);
        karate.log('api URL used :',config.apiUrl );


        return config;
    }