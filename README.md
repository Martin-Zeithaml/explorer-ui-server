# explorer-ui-server

[![Code Quality](https://jayne.zowe.org:9000/api/project_badges/measure?project=zowe%3Aexplorer-ui-server&metric=alert_status)](https://jayne.zowe.org:9000/dashboard/index/zowe:explorer-ui-server)

Provide simple HTTPS server to server Zowe Desktop Explorer plugins.

## Start Dev Server

```
npm start
```

Then visit `https://localhost:8080` to access the test server. The default config file is `configs/config-default.json`.

## CLI Options

```
$ node src/index.js -h
Usage: explorer-ui-server [options]

Options:
  --version      Show version number                                   [boolean]
  -C, --config   config JSON file               [default: "config-default.json"]
  -v, --verbose  show request logs                    [boolean] [default: false]
  -h, --help     Show help                                             [boolean]
```

## Run Tests

```
npm test
```

Test reports are saved in `reports` folder, including (JUnit)[https://wiki.jenkins.io/display/JENKINS/JUnit+Plugin] result, (Mochawesome)[https://www.npmjs.com/package/mochawesome] report, (Istanbul Coverage)[https://www.npmjs.com/package/nyc] report, (Cobertura)[http://cobertura.github.io/cobertura/] report etc.

## Run SonarQube Code Analysis

Install [SonarQube Scanner](https://docs.sonarqube.org/display/SCAN/Analyzing+with+SonarQube+Scanner).

If you are using Mac, try install with [HomeBrew sonar-scanner formula](https://formulae.brew.sh/formula/sonar-scanner), then update the configuration of SonarQube server at `/usr/local/Cellar/sonar-scanner/<version>/libexec/conf/sonar-scanner.properties`.

Example scanner configurations:

```
sonar.host.url=https://jayne.zowe.org:9000
sonar.login=<hash>
```

Then you can run `sonar-scanner` to start code analysis.

Build pipeline has embedded the SonarQube code analysis stage.
