source ~/.bashrc
source ~/.git-prompt.sh

export JAVA_HOME=$(/usr/libexec/java_home -v 1.6)
export M2_HOME="/Applications/apache-maven-3.2.5"
export NVM_DIR="/Users/jakubkoci/.nvm"
export PATH=$M2_HOME/bin:$PATH

# Tomcat opts
export CATALINA_OPTS="-Xmx512m -XX:MaxPermSize=256m"

# Tomcat opts for remote debug
export CATALINA_OPTS="$CATALINA_OPTS -Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=9999"

# Node Version Manager setup
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
nvm use stable

PS1='\u:\W$(__git_ps1 " (%s)")\$ '
