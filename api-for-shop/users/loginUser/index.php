<?php
    header('Access-Control-Allow-Origin: *');
    // header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
    header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, X-Requested-With, Authorization ");

    //echo json_encode($_POST);
    
    if(!isset($_POST['email']) || !isset($_POST['password']))
    {
        echo json_encode($_POST);
    }else{
    
        $db = new mysqli("localhost","root","","shop");
        $email = $_POST['email'];
        $password = $_POST['password'];

        $q = "SELECT id, email  FROM users WHERE email='$email' and password='$password'";
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