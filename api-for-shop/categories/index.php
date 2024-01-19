<?php
header("Access-Control-Allow-Origin: *");
header('Content-Type: application/json');
$db = new mysqli("localhost","root","","shop");

$con = "";
$con_count = 0;
if(isset($_GET['subcategory']) && $_GET['subcategory']!=-1)
{
    if($con_count > 0)$con.=' AND ';
    else $con.=' WHERE ';
        
    $con.="subcategory={$_GET['subcategory']}";
    $con_count++;
}else if(isset($_GET['subcategory']) && $_GET['subcategory']==-1){
    $con = "WHERE 1=1 ";
}else
{
    if(!isset($_GET['all']))
        $con = 'WHERE subcategory is NULL';
    else
        $con = "";
}

if(isset($_GET['id']))
{
    $con=="" ? $con.=" WHERE " : $con.=' AND ';
    $con.="id={$_GET['id']}";
    $con_count++;
}



$query = "SELECT * FROM categories $con";
$db_query = $db->query($query);


$rows = array();
while($r = $db_query->fetch_assoc())
{
    $rows[] = $r;
}

echo json_encode($rows);
?>