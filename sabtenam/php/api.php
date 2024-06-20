<?php
    header('Content-Type: application/json');
    require_once "classes.php";

    $reg = new MandegarRegisteration();
    $upload = new UploadFile();
    $validation = new Validation();

    //checking request method
    switch ($_SERVER['REQUEST_METHOD']){
        case "POST":
            //checking post storage type
            switch ($_GET['type']){
                case "st_reg_info":
                    /*echo (json_encode($reg->create(array(
                        "st_fname" => "Jason",
                        "st_lname" => "hodson"
                    ), 'st_reg_info')[0], JSON_PRETTY_PRINT));*/
                    break;
                case "st_fa_reg":
                    echo (json_encode($reg->create(array(
                        "fa_fname" => "ali",
                        "fa_id_no" => "0372647170"
                    ), 'st_fa_reg')[0], JSON_PRETTY_PRINT));
                    break;
                case "st_mo_reg":
                    echo (json_encode($reg->create(array(
                        "mo_fname" => "ali",
                        "mo_id_no" => "0372647170"
                    ), 'st_mo_reg')[0], JSON_PRETTY_PRINT));
                    break;
                case "st_education_reg":
                    echo (json_encode($reg->create(array(
                        "last_avrage" => "14.26",
                        "last_heigh_school" => "امام صادق"
                    ), 'st_education_info')[0], JSON_PRETTY_PRINT));
                    break;
            }
            break;
    }