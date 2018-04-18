DATE=$(date +%Y%m%d)
export JAVA_HOME PATH CLASSPATH
JAVA_HOME=/usr/java/jdk1.8.0_162
PATH=$JAVA_HOME/bin:$JAVA_HOME/jre/bin:$PATH
CLASSPATH=.:$JAVA_HOME/lib:$JAVA_HOME/jre/lib:$CLASSPATH
SOURCE=/root/.jenkins/workspace/spring-boot-jenkins/target
DIR=/data/wwwroot/spring-boot-jenkins
WARFILE=spring-boot-jenkins-0.0.1-SNAPSHOT.war

if [ ! -d $DIR/backup ];then
   mkdir -p $DIR/backup
fi
cd $DIR
echo "backup war file..."
if [ -f $WARFILE ];then
   mv $WARFILE backup/$WARFILE$DATE
fi
echo "stop tomcat..."
systemctl stop tomcat
echo "copy war file..."
cp $SOURCE/$WARFILE ./
chown -R www.www ../
echo "start tomcat..."
systemctl start tomcat
cd backup
ls -lt|awk 'NR>5{print $NF}'|xargs rm -rf