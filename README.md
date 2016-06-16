# AlarmBoy
Arduino Simple XFD


###Wiring diagram
![îzê¸ê}](https://raw.github.com/wiki/Blue-Tone/AlarmBoy/images/AlarmBoy_Fritzing.jpg)

###OverView
![äTîOê}](https://raw.github.com/wiki/Blue-Tone/AlarmBoy/images/Overview.jpg)

###Demo
[![Demo](http://img.youtube.com/vi/rYR4N6fq2Xw/0.jpg)](https://www.youtube.com/watch?v=rYR4N6fq2Xw)

#SetUp
##node-serialport
instal node.
npm install -g serialport

##_config.bat
NODE_PATH,COM port number,api token

###Setup Test
C:\AlarmBoy\tool\win\node-serialport\SerialTest.bat

##Jenkins Setting
###install Plugin
Post build task 
https://wiki.jenkins-ci.org/display/JENKINS/Post+build+task

###add 3task
1. before build

    call C:\AlarmBoy\tool\win\node-serialport\BuildOn.bat

2. after build,before test

    call C:\AlarmBoy\tool\win\node-serialport\testingOn.bat 

    call C:\AlarmBoy\tool\win\node-serialport\BuildOff.bat

3. after publish test result

    set JOB_URL=http://[Jenkins URL]/job/TestJob/ 

    call C:\AlarmBoy\tool\win\postBuild.bat

###Commands

<table>
    <tr>
        <td>Pin</td>
        <td>ON</td>
        <td>OFF</td>
        <td>Remarks</td>
    </tr>
    <tr>
        <td>D2</td>
        <td>c</td>
        <td>C</td>
        <td>Err(Blink)</td>
    </tr>
    <tr>
        <td>D3</td>
        <td>d</td>
        <td>D</td>
        <td>Warn</td>
    </tr>
    <tr>
        <td>D4</td>
        <td>e</td>
        <td>E</td>
        <td>NG</td>
    </tr>
    <tr>
        <td>D5</td>
        <td>f</td>
        <td>F</td>
        <td>OK</td>
    </tr>
    <tr>
        <td>D8</td>
        <td>i</td>
        <td>I</td>
        <td>Testing</td>
    </tr>
    <tr>
        <td>D9</td>
        <td>j</td>
        <td>J</td>
        <td>Building(Blink)</td>
    </tr>
    <tr>
        <td>A5</td>
        <td>t</td>
        <td>T</td>
        <td>Sound t:NG T:OK</td>
    </tr>
</table>

push A3:Button,then D2:Blink OFF.


#for Linux and Mac Soon!!

