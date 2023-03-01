CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'

find student-submission > file.txt
x=`grep -r "ListExamples.java" file.txt`

if [[ -n $x ]]
then
    echo "File found!"
    cp $x .
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