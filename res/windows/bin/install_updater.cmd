@set PATH=%SYSTEMROOT%\System32\;%PATH%
@set INSTALL_PATH=$INSTALL_PATH
@set JAVA_HOME=$JAVA_HOME
@cd /D %INSTALL_PATH%

@echo "Downloading update.cmd"
@java -jar bin\sha1test.jar update/update.cmd . > NUL
@echo node.updater.enabled=true >> freenet.ini
@if exist update echo node.updater.autoupdate=true >> freenet.ini
@del /F update > NUL