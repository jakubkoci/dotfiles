source ~/.bashrc
source ~/.git-prompt.sh

# Java
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

# Java with Jenv
# export PATH="$HOME/.jenv/bin:$PATH"
# eval "$(jenv init -)"

# Maven
export M2_HOME="/Applications/apache-maven-3.2.5"
export PATH=$M2_HOME/bin:$PATH
export MAVEN_OPTS="-Xmx512m -XX:MaxPermSize=256m"

# Node.js
export NVM_DIR="$HOME/.nvm"

# Tomcat opts
export CATALINA_OPTS="-Xmx512m -XX:MaxPermSize=256m"

# Tomcat opts for remote debug
export CATALINA_OPTS="$CATALINA_OPTS -Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=9999"

# Node Version Manager setup
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
nvm use stable

PS1='\u:\W$(__git_ps1 " (%s)")\$ '
