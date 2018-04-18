DATE=$(date +%Y%m%d)
export JAVA_HOME PATH CLASSPATH
JAVA_HOME=/usr/java/jdk1.8.0_162
PATH=$JAVA_HOME/bin:$JAVA_HOME/jre/bin:$PATH
CLASSPATH=.:$JAVA_HOME/lib:$JAVA_HOME/jre/lib:$CLASSPATH
SOURCE=/root/.jenkins/workspace/spring-boot-jenkins/target/webapp
BACKUP=/data/wwwroot/backup/spring-boot-jenkins
DIR=/data/wwwroot/spring-boot-jenkins
FOLDER=webapp

if [ ! -d $BACKUP ];then
   mkdir -p $BACKUP
fi
cd $DIR
echo "stop tomcat..."
systemctl stop tomcat
echo "backup old folder..."
if [ -d $FOLDER ];then
   mv $FOLDER $BACKUP/$FOLDER$DATE
fi
echo "copy webapp folder..."
cp -r $SOURCE ./
chown -R www.www ../
echo "start tomcat..."
systemctl start tomcat
cd $BACKUP
ls -lt|awk 'NR>5{print $NF}'|xargs rm -rf