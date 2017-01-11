if [ -z "$1" ]
then
      echo "Supply jenkins home directory uncompressed to mount on docker container"
      exit 1
elif [ ! -d $(pwd)/$1 ]
then
    echo "Jenkins directory does not exist"
    exit 1
fi

echo "Creating docker container in port 8080"
jenkins_directory=$1

docker run -d -p 8080:8080 -v /var/run/docker.sock:/var/run/docker.sock -v $(pwd)/$jenkins_directory:/var/jenkins_home dockertestenv/jenkins_dockeri
