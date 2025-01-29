(Optional) Praxis:  

Challenge: Dockerized Lambda Deployment with Function URLs in JavaScript

Aufgabe 1: Grundlegendes Docker-Image für Node.js Lambda erstellen

Beschreibung:
Erstelle ein Dockerfile, das eine einfache Lambda-Funktion in JavaScript (Node.js) enthält. Die Funktion soll mit einer Lambda Function URL erreichbar sein und eine statische JSON-Antwort zurückgeben (z. B. { "message": "Hello from Lambda!" }).

Schritte:
Erstelle ein Verzeichnis für dein Projekt. Schreibe eine Datei index.js mit einer Lambda-Funktion exports.handler. Baue ein Dockerfile basierend auf node:22 oder einer anderen kompatiblen Node.js-Version, die AWS Lambda unterstützt. Teste die Funktion lokal mit docker run. Stelle die Funktion in AWS bereit und aktiviere eine Lambda Function URL mit der AWS CLI.

Aufgabe 2: Node.js Lambda mit benutzerdefinierter Abhängigkeit

Beschreibung:
Erweitere die Lambda-Funktion, um eine externe JavaScript-Bibliothek (z. B. axios) einzubinden. Die Funktion soll einen HTTP-GET-Request an eine API (z. B. https://api.github.com) senden und die Antwort zurückgeben.

Schritte:
Ergänze index.js um die Verwendung von axios für HTTP-Anfragen. Aktualisiere das Dockerfile, um npm install während des Builds auszuführen und axios als Abhängigkeit hinzuzufügen. Teste die Funktion lokal. Pushe das Docker-Image in Amazon Elastic Container Registry (ECR). Aktualisiere die Lambda-Funktion, um das neue Image zu verwenden, und aktiviere die Lambda Function URL.

Aufgabe 3: Umgebungsvariablen in Lambda und Docker

Beschreibung:
Füge der Lambda-Funktion Umgebungsvariablen hinzu, die dynamisch sowohl im Docker-Container als auch in AWS Lambda gesetzt werden können. Die Funktion soll den Wert einer Umgebungsvariablen zurückgeben.

Schritte:
Ergänze index.js, um auf eine Umgebungsvariable (z. B. process.env.MY_ENV_VAR) zuzugreifen und diese in der Antwort zurückzugeben. Aktualisiere das Dockerfile, um Standardwerte für die Umgebungsvariablen zu setzen. Teste das Docker-Image lokal mit benutzerdefinierten Umgebungsvariablen (docker run -e MY_ENV_VAR=VALUE). Konfiguriere die Umgebungsvariablen in der AWS Lambda-Konsole oder über die AWS CLI.

Aufgabe 4: Lambda Function URL mit Eingabeparametern

Beschreibung:
Erstelle eine Lambda-Funktion, die HTTP-POST-Anfragen über die Function URL verarbeiten kann. Die Funktion soll die im Body übergebenen Parameter lesen und in der JSON-Antwort zurückgeben.

Schritte:
Aktualisiere index.js, um die Eingaben aus dem Request-Body (event.body) zu lesen. Implementiere eine einfache Validierung, um sicherzustellen, dass ein bestimmter Parameter (z. B. name) übergeben wurde. Baue das Docker-Image, pushe es in ECR und aktualisiere die Lambda-Funktion. Aktiviere die Lambda Function URL und teste sie mit Tools wie curl oder Postman. Beispiel-Antwort: { "message": "Hello, [name]" }, wenn ein name-Parameter im Body gesendet wurde.

Aufgabe 5: Fehlerbehandlung und Logging

Beschreibung:
Erstelle eine robuste Lambda-Funktion, die auf HTTP-POST-Anfragen antwortet, Fehler ordnungsgemäß behandelt und Logs erstellt. Die Logs sollen im Lambda-CloudWatch-Log erscheinen.

