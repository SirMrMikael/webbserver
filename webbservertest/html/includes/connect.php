<?php 
$dhb = new mysqli("localhost", "webbserver", "qwe123", "webbshop");

if(!$dhb){
    echo "ingen anslutning till databasen";
    exit(1);
}

//echo "Ansluten till databasen";

$sql = "SELECT * FROM products";

$result = $dhb->prepare($sql);
$result->execute();

$result = $result->get_result();

//var_dump($result);
echo "<table><tr>";
echo "<th>Namn</th><th>Pris</th><th>beskrivning</th></tr>";
while($row = $result->fetch_object()){
    //echo "Namn: ". $row->name;
   // echo "<br>";
   echo "<tr><td>";
   echo $row->name;
   echo "</td><td>";
   echo $row->pris;
   echo "</td><td>";
   echo $row->beskrivning;
   echo "</td></tr>";
   

} 
echo "</table>";
?>