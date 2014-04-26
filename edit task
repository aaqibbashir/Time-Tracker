<?php

include 'db.php';
$userid=$_COOKIE['userid'];
$id=  $_POST['id'];
$taskname= $_POST['taskName'];
$project=  $_POST['project'];
$starttime= $_POST['startTime'];
$endtime= $_POST['endTime'];
$startdate= $_POST['startDate'];
$duration= $_POST['duration'];
$sql = "update task set taskname='$taskname',project='$project',starttime='$starttime',
endtime='$endtime',startdate='$startdate',duration='$duration' where (taskid='$id' AND userid='$userid')";
mysql_query($sql); 
echo $sql;
?>
