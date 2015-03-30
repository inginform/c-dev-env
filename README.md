#Kleine C-Entwicklungsumgebung basierend auf Docker und GCC
Basierend auf `debian:jessie` stellt dieses Docker-Image eine Entwicklungsumgebung für C bereit. Wie für Docker-Images üblich kann diese nur über die Kommandozeile bedient werden.

Folgende Anwendungen werden dem Basisimage hinzugefügt:

* **gcc:** Version 4.9.2 der GNU Compiler Collection [GCC Webseite](https://gcc.gnu.org)
* **libc6-dev** GNU C Library: Bibliotheken und Header-Dateien zur Erstellung von Programmen, die die Standard C Bibliothek benutzen. [Details zu GNU C Library](http://de.wikipedia.org/wiki/GNU-C-Bibliothek)
* **make** Build-Management-Tool zum einfachen erstellen von Programmen die aus mehreren Quelldateien besteht. [Beschreibung von Make auf Wikipedia](http://de.wikipedia.org/wiki/Make)

##Ziel

Ein möglichst kleines Image zum erstellen von C-Programmen. Dabei soll die Umgebung die notwendigsten Tools bereit stellen, aber trotzdem möglichst kompakt sein.

##Anwendung

##Wartung

##Copyright free

Wie alle Inhalte auf [ing.inform](www.inginform.de) ist auch dieser Quellcode frei von Copyright. Das heißt, der Urheber verzichtet auf jegliche Nutzungsbedingungen. Entsprechend kann der erstellte Quellcode in jeglicher Art und Weise verwendet werden. Du brauchst keinerlei Bestätigung von mir um die Inhalte zu verarbeiten. Du kannst sie einfach teilen, drucken, verändern, ... und das alles mit oder ohne meinen Namen zu nennen. Viel Spaß!