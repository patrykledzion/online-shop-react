<?php
    header('Access-Control-Allow-Origin: *');
    // header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
    header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, X-Requested-With, Authorization ");

    //echo json_encode($_POST);
    
    if(!isset($_POST['id']))
    {
        echo json_encode($_POST);
    }else{
    
        $db = new mysqli("localhost","root","","shop");
        $id = $_POST['id'];

        $q = "SELECT id, name, lastname, join_date   FROM users WHERE id='$id'";
        $db_qury = $db->query($q);

        $users = array();
        while($r = $db_qury->fetch_assoc())
        {
            $users[] = $r;
        }


        if(count($users)==0)echo json_encode(['res'=>401]);
        else {
            $users[0]['res'] = 200; 
            echo json_encode([$users]);
            
        } 
    }
?>