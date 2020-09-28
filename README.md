# scala-play-app
Containerized Scala Play app with the New Relic Java agent installed.

This Play project includes all Play components and an Akka HTTP server. The project is also configured with filters for Cross-Site Request Forgery (CSRF) protection and security headers.

## Run in Docker

- Add your New Relic license key to the `Dockerfile`.
- Run `docker build -f Dockerfile -t scala-app .`
- Run `docker run --rm -it -p 9000:9000 scala-app`
- Enter the following URL in your browser: http://localhost:9000
