<?php
header("Access-Control-Allow-Origin: *");
header('Content-Type: application/json');
$db = new mysqli("localhost","root","","shop");

if(isset($_GET['q']) || isset($_GET['cat']) || isset($_GET['page']))
{
    $q = "SELECT *  FROM shopitem i INNER JOIN itemdetails d on d.item_id=i.id ";
    $q.= " WHERE ";
    $q.= isset($_GET['cat'])  ?   " category_id='{$_GET['cat']}' AND " : "";
    $q.= isset($_GET['q'])    ?   " name LIKE '%{$_GET['q']}%' OR " : "";
    $q.= isset($_GET['q'])    ?   " desc LIKE '%{$_GET['q']}%' OR " : "";
    $q.= "1=1";
    
    $query = $db->query($q);
    
    if($query->num_rows == 0)
    {
        echo json_encode(["res"=>69]);
    }else{
        $data = [];
        while($r = $query->fetch_assoc())
        {
            $data[] = $r;
        }
        echo json_encode(["res"=>$data]);
    }
    
    
}else{
    echo json_encode(["res"=>2137]);
}


?>