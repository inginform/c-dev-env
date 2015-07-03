#Kleine C-Entwicklungsumgebung basierend auf Docker und GCC
Basierend auf `debian:jessie` stellt dieses Docker-Image eine Entwicklungsumgebung für C bereit. Wie für Docker-Images üblich kann diese nur über die Kommandozeile bedient werden.

Folgende Anwendungen werden dem Basisimage hinzugefügt:

* **gcc:** Version 4.9.2 der GNU Compiler Collection [GCC Webseite](https://gcc.gnu.org)
* **git:** Version 2.1.4 des Tools zur Versionsverwaltung
* **libc6-dev:** GNU C Library: Bibliotheken und Header-Dateien zur Erstellung von Programmen, die die Standard C Bibliothek benutzen. [Details zu GNU C Library](http://de.wikipedia.org/wiki/GNU-C-Bibliothek)
* **make:** Build-Management-Tool zum einfachen erstellen von Programmen die aus mehreren Quelldateien besteht. [Beschreibung von Make auf Wikipedia](http://de.wikipedia.org/wiki/Make)
* **nano:** Einfacher Texteditor für die Kommandozeile von GNU. [GNU Nano Webseite](http://www.nano-editor.org)

Hinweis: Obwohl GCC 5.1 gerade erschienen ist, werde ich noch nicht darauf umstellen. Der Grund ist, dass dies noch nicht von der verwendeten Linux Distribution bereit gestellt wird. Das [Docker GCC Image](https://registry.hub.docker.com/_/gcc/) ist auch mit Version 5.1 erhältlich.

##Über

Das Ziel ist ein möglichst kleines Image zum erstellen von C-Programmen zu haben. Dabei soll die Umgebung die notwendigsten Tools bereit stellen, aber trotzdem möglichst kompakt sein. Dies Image dient als Basisimage für komplexere Images mit Entwicklungsumgebungen (z.B. mit zusätzlichen spezifischen Bibliotheken oder Tools). Es kann somit projektspezifisch angepasst werden.

Ebenfalls wichtig ist mir, dass sich GCC im Image verhält wie in der verwendeten Linux Distribution (Debian). Bei meinen ersten Versuchen habe ich das offizielle GCC Image aus der Docker Library verwendet. Dabei bin ich sofort auf ein Problem gestoßen, weil dies Image das Kommand `cc` bis dahin nicht unterstützte. Um sicher zu stellen, dass sich mein Image verhält wie die Distribution, verwende ich nur offizielle Debian Pakete. Das [GCC Image](https://registry.hub.docker.com/_/gcc/) aus der Docker Library geht einen anderen Weg. Daher ist jenes auch manchmal etwas aktueller (GCC 5.1 wird gerade vorbereitet).

Durch die Verwendung von `git`, ist das Image etwas größer als notwendig. Momentan sehe ich `git` für meine Arbeit in den Containern als wichtig an. Es wäre aber auch möglich es weg zu lassen. Dann könnte Quellcode via `curl` oder vom Host via `docker run -v ...` in den Container gelangen.

##Anwendung

Die einfachste Art das Image zu verwenden ist, wenn ein C-Projekt, welches auf dem Host gespeichert ist, im Image verwendet wird:
`docker run --rm -it -v $(pwd):/usr/src/project/ -w /usr/src/project/ c-dev-env /bin/bash`

Alternativ kann auch das `Dockerfile` überarbeitet werden und via `git clone` oder `curl` der Quellcode direkt in das Image kopiert werden. Wenn dies der Fall ist, kann das Image so gestartet werden:
`docker run --rm -it c-dev-env /bin/bash`

##Wartung

Dieses Image verwendet [Automated Builds](http://docs.docker.com/docker-hub/builds/). Damit wird die aktuellste Version des `Dockerfiles` immer automatisch auf [Docker Hub](https://registry.hub.docker.com/u/inginform/c-dev-env/) gebaut und bereit gestellt. Über einen [Repository link](http://docs.docker.com/docker-hub/builds/#repository-links) wird sicher gestellt, dass auch Änderungen am verwendeten Basisimage automatisch in dieses Image einfliessen. Somit gibt es aktuell keine manuellen Schritte dies Image zu warten.

##Copyright free

Wie alle Inhalte auf [ing.inform](http://www.inginform.de) ist auch dieser Quellcode frei von Copyright [nach CC0](LICENSE.md). Das heißt, ich verzichtet auf jegliche Nutzungsbedingungen. Entsprechend kann der erstellte Quellcode in jeglicher Art und Weise verwendet werden. Du brauchst keinerlei Bestätigung von mir um die Inhalte zu verarbeiten. Du kannst sie einfach teilen, drucken, verändern, ... und das alles mit oder ohne meinen Namen zu nennen. Viel Spaß!