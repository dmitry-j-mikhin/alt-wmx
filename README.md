# alt-wmx

This is example [docker image](https://hub.docker.com/r/dmikhin/alt-wmx) based on official
[alt:p10](https://hub.docker.com/layers/library/alt/p10/images/sha256-eb4b440ce0cb34be2b6166bfce0bb082cadc690142df47d8988ab4561da0b452?context=explore)
stable image with nginx and [WMX module](https://webmonitorx.ru/) integrated for WAF protection.
For more details check:
* [Dockerfile](Dockerfile)
* [scripts/build.sh](scripts/build.sh)

Image can be executed with [run.sh](run.sh) script:
```Shell
$ NODE_TOKEN='<Your WMX Node Token>' ./run.sh
```
Send an example of a non-malicious request:
```Shell
$ curl --cacert /certs/ca.cer -u "administrator:защищенный" https://localhost/
<html><body><h1>It works!</h1></body></html>
```
The request will be processed normally.
Send an example of a malicious request:
```Shell
$ curl --cacert /certs/ca.cer -u "administrator:защищенный" https://localhost/etc/passwd
<html>
<head><title>403 Forbidden</title></head>
<body>
<center><h1>403 Forbidden</h1></center>
<hr><center>nginx/1.22.1</center>
</body>
</html>
```
The request will be blocked. And displayed in the web interface: ![web ui](../media/web.png?raw=true)
Additional documentation can be found at [https://docs.webmonitorx.ru](https://docs.webmonitorx.ru).
