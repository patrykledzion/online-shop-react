<?php
header("Access-Control-Allow-Origin: *");
header('Content-Type: application/json');
$db = new mysqli("localhost","root","","shop");

if(isset($_GET['name']) && isset($_GET['desc']) && isset($_GET['price']) && isset($_GET['category']) && isset($_GET['user']))
{
    //Check if user exists
    $q = "SELECT * FROM users WHERE id={$_GET['user']}";
    $query = $db->query($q);
    if($query->num_rows > 0)
    {
        $q = "SELECT * FROM categories WHERE id={$_GET['category']}";
        $query = $db->query($q);
        if($query->num_rows > 0)
        {
            $id = 1;
            $id_q = $db->query("SELECT max(id) FROM shopitem");
            if($id_q->num_rows>0)
            {
                $id_r = $id_q->fetch_array();
                $id = $id_r[0]+1;
            }
            
            $date = date('Y-m-d H:i:s');
            $add_q = "INSERT INTO shopitem(id, category_id, price, user_id, date, active) VALUES('{$id}', '{$_GET['category']}','{$_GET['price']}','{$_GET['user']}','{$date}','{1}')";
            $add_query = $db->query($add_q);
            
            $details_q = "INSERT INTO itemdetails(`item_id`, `name`, `desc`) VALUES('{$id}', '{$_GET['name']}', '{$_GET['desc']}')";
            //echo $details_q;
            $details_query = $db->query($details_q);
            echo json_encode(["res"=>$id]);
        }else{
            echo json_encode(["res"=>69420]);
        }
    }else{
        echo json_encode(["res"=>69420]);
    }
    
}else{
    echo json_encode(["res"=>2137]);
}


?>