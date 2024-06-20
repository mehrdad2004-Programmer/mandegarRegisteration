<?php
    require_once "interfaces.php";
    class MandegarRegisteration implements CRUD_METHODS {
        public function __construct()
        {
            $this->registerationResponse = [];
            $this->statusCode = json_decode(file_get_contents(__DIR__."/statuscode.json"), true);

            try{
                $info = json_decode(file_get_contents(__DIR__."/env.json"), true);
                $host = $info['host'];
                $username = $info['username'];
                $password = $info['password'];
                $dbname = $info['dbname'];

                $this->conn = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $username, $password);
            }catch (Exception $e){
                echo $e;
            }
        }

        public function create($json, $table_name)
        {
            try{
                $fields = '';
                $params = '';
                foreach(array_keys($json) as $item){
                    $fields .= ($item . ",");
                    $params .= ":" . ($item . ",");
                }
                $fields = rtrim($fields, ',');
                $params = rtrim($params, ',');

                $query = "INSERT INTO $table_name($fields) VALUES ($params)";
                $res = $this->conn->prepare($query);
                $this->conn->beginTransaction();
                foreach(array_keys($json) as $item){
                    $res->bindParam(":$item", $json[$item]);
                }
                $res->execute();
                $this->conn->commit();
                http_response_code($this->statusCode['CREATE']);
                $this->registerationResponse[] = array(
                    "target_table" => "st_reg_info",
                    "msg_log" => "row created successfully",
                    "return_value" => true,
                    "status_code" => $this->statusCode['CREATE'],
                );
                return $this->registerationResponse;
            }catch (Exception $e){
                $this->conn->rollBack();
                http_response_code($this->statusCode['INTERNAL_SERVER_ERR']);
                $this->registerationResponse[] = array(
                    "target_table" => "st_reg_info",
                    "msg_log" => "occurred an error\n$e",
                    "return_value" => false,
                    "status_code" => $this->statusCode['INTERNAL_SERVER_ERR'],
                );
                return $this->registerationResponse;
            }
        }

    }

    class UploadFile implements UPLOAD_IMG{
        public function __construct()
        {
            $this->registerationResponse = [];
            $this->statusCode = json_decode(file_get_contents(__DIR__."/statuscode.json"), true);
        }

        public function uploadFile($file, $newFileName = 'file')
        {
            try{
                $name = explode('.', $file['name']);
                $fileExt = array_pop($name);
                $upload_status = move_uploaded_file($file['tmp_name'], "personalpic/".$newFileName.'.'.$fileExt);
                if($upload_status){
                    http_response_code($this->statusCode['OK']);
                    $this->registerationResponse[] = array(
                        "target_table" => "st_reg_info",
                        "msg_log" => "image uploaded successfully",
                        "return_value" => true,
                        "status_code" => $this->statusCode['OK'],
                    );
                    return $this->registerationResponse;
                }else{
                    http_response_code($this->statusCode['FORBIDDEN_ERR']);
                    $this->registerationResponse[] = array(
                        "target_table" => "st_reg_info",
                        "msg_log" => "could not upload image",
                        "return_value" => false,
                        "status_code" => $this->statusCode['FORBIDDEN_ERR'],
                    );
                    return $this->registerationResponse;
                }
        
            }catch(Exception $e){
                http_response_code($this->statusCode['INTERNAL_SERVER_ERR']);
                $this->registerationResponse[] = array(
                    "target_table" => "st_reg_info",
                    "msg_log" => "occurred an error",
                    "return_value" => true,
                    "status_code" => $this->statusCode['INTERNAL_SERVER_ERR'],
                );
                return $this->registerationResponse;
            }
        }
    }

    class Validation implements VALIDATION_METHODS {
        public function __construct()
        {
            $this->validExtensions = ['png', 'jpg', 'jpeg'];
            $this->statusCode = json_decode(file_get_contents(__DIR__."/statuscode.json"), true);
            $this->validInfo = [];
            $this->inputValidation = [
            "englishLetter" => [

                'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l',

                'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x',

                'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',

                'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V',

                'W', 'X', 'Y', 'Z'

            ],
            "numbers" => [
                '0', '2', '3', '4', '5', '6', '7', '8', '9'
            ],
            "specialChar" => [
                '!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '-', '_', '=', '+', ',', '.', '/', ' '
            ],
           ];
        }


        public function checkFileExtension($file)
        {
            $filename = explode('.', $file['name']);
            $fileExtension = array_pop($filename);
            foreach($this->validExtensions as $item){
                if($fileExtension === $item){
                    http_response_code($this->statusCode['OK']);
                    $this->validInfo[] = array(
                        "status_code" => $this->statusCode['OK'],
                        "msg_log" => "file extension is valid",
                        "is_valid" => true,
                    );
                    return $this->validInfo;
                }
            }
            http_response_code($this->statusCode['UNSUPPORTED_MEDIA_TYPE']);
            $this->validInfo[] = array(
                "status_code" => $this->statusCode['UNSUPPORTED_MEDIA_TYPE'],
                "msg_log" => "file extension is not valid",
                "is_valid" => false,
            );
            return $this->validInfo;
        }

        public function checkFileSize($file, $size)
        {
            if($file['size'] <= $size){
                http_response_code($this->statusCode['OK']);
                $this->validInfo[] = array(
                    "status_code" => $this->statusCode['OK'],
                    "msg_log" => "file size is ok",
                    "is_valid" => true,
                );
                return $this->validInfo;
            }
            http_response_code($this->statusCode['PAYLOAD_TOO_LARGE']);
            $this->validInfo[] = array(
                "status_code" => $this->statusCode['PAYLOAD_TOO_LARGE'],
                "msg_log" => "file size is too large",
                "is_valid" => false,
            );
            return $this->validInfo;
        }

        public function checkInputLen($text, $len)
        {
            if(strlen(trim($text)) <= $len){
                return true;
            }
            return false;
        }

        public function checkInputText($text)
        {
            //
        }
    }
