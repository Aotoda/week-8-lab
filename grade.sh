CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'

cd student-submission
if [[ -e ListExamples.java ]]
then
    echo "File found!"
    cd ..
    cp student-submission/ListExamples.java .
    javac ListExamples.java
    if [[ $? == 0 ]]
    then 
        echo "It compiled!"
        javac -cp ".;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar" *.java
        java -cp ".;lib/junit-4.13.2.jar;lib/hamcrest-core-1.3.jar" org.junit.runner.JUnitCore TestListExamples
    else    
        echo "It didn't compile!"
        exit
    fi
else
    echo "File not found!"
    exit
fi

