#Kleine C-Entwicklungsumgebung basierend auf Docker und GCC
Basierend auf `debian:jessie` stellt dieses Docker-Image eine Entwicklungsumgebung für C bereit. Wie für Docker-Images üblich kann diese nur über die Kommandozeile bedient werden.

Folgende Anwendungen werden dem Basisimage hinzugefügt:

* **gcc:** Version 4.9.2 der GNU Compiler Collection [GCC Webseite](https://gcc.gnu.org)
* **git:** Version 2.1.4 des Tools zur Versionsverwaltung
* **libc6-dev:** GNU C Library: Bibliotheken und Header-Dateien zur Erstellung von Programmen, die die Standard C Bibliothek benutzen. [Details zu GNU C Library](http://de.wikipedia.org/wiki/GNU-C-Bibliothek)
* **make:** Build-Management-Tool zum einfachen erstellen von Programmen die aus mehreren Quelldateien besteht. [Beschreibung von Make auf Wikipedia](http://de.wikipedia.org/wiki/Make)
* **nano:** Einfacher Texteditor für die Kommandozeile von GNU. [GNU Nano Webseite](http://www.nano-editor.org)

##Über

Das Ziel ist ein möglichst kleines Image zum erstellen von C-Programmen zu haben. Dabei soll die Umgebung die notwendigsten Tools bereit stellen, aber trotzdem möglichst kompakt sein. Dies Image dient als Basisimage für komplexere Images mit Entwicklungsumgebungen (z.B. mit zusätzlichen spezifischen Bibliotheken oder Tools). Es kann somit projektspezifisch angepasst werden.

Durch die Verwendung von `git`, ist das Image etwas größer als notwendig. Momentan sehe ich `git` für meine Arbeit in den Containern als wichtig an. Es wäre aber auch möglich es weg zu lassen. Dann könnte Quellcode via `ADD` oder vom Host via `docker run -v ...` in den Container gelangen.

##Anwendung

Die einfachste Art das Image zu verwenden ist, wenn ein C-Projekt, welches auf dem Host gespeichert ist, im Image verwendet wird:
`docker run --rm -it -v $(pwd):/usr/src/project/ -w /usr/src/project/ c-dev-env /bin/bash`

Alternativ kann auch das `Dockerfile` überarbeitet werden und via `git clone` oder `ADD` der Quellcode direkt in das Image kopiert werden. Wenn dies der Fall ist, kann das Image einfach so gestartet werden:
`docker run --rm -it c-dev-env /bin/bash`

##Wartung

Dieses Image verwendet [Automated Builds](http://docs.docker.com/docker-hub/builds/). Damit wird die aktuellste Version des `Dockerfiles` immer automatisch vom Docker Hub gebaut und bereit gestellt. Über einen [Repository link](http://docs.docker.com/docker-hub/builds/#repository-links) wird sicher gestellt, dass auch Änderungen am verwendeten Basisimage (`debian:jessie`) automatisch in dieses Image einfliessen. Somit gibt es aktuell keine manuellen Schritte dies Image zu warten.

##Copyright free

Wie alle Inhalte auf [ing.inform](www.inginform.de) ist auch dieser Quellcode frei von Copyright. Das heißt, der Urheber verzichtet auf jegliche Nutzungsbedingungen. Entsprechend kann der erstellte Quellcode in jeglicher Art und Weise verwendet werden. Du brauchst keinerlei Bestätigung von mir um die Inhalte zu verarbeiten. Du kannst sie einfach teilen, drucken, verändern, ... und das alles mit oder ohne meinen Namen zu nennen. Viel Spaß!