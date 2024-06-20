<?php
    /*
     * interfaces to use as a model in classes
     * MANDEGAR INTERFACE - CREATED BY MEHRDAD KALATEH ARABI - 28 KHORDAD 1403
     *
     * */

    interface CRUD_METHODS{
        public function create($json, $table_name);

    }

    interface DATABASE_CONFIG{
        public function createDatabase($dbname);
        public function createTable($fieldList);
        public function insertDefaultValues($json);
    }

    interface VALIDATION_METHODS{
        public function checkFileSize($file, $size);
        public function checkFileExtension($file);
        public function checkInputLen($text, $len);
        public function checkInputText($text);
    }

    interface UPLOAD_IMG{
        public function uploadFile($file);
    }

    interface SMS_SENDER{
        public function sendSMS($text);
    }