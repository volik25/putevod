<?php
//прием запросов с клиента
header("Access-Control-Allow-Origin: *"); 
header("Access-Control-Allow-Methods: GET, PUT, POST, DELETE, OPTIONS");
header("Access-Control-Allow-Headers: Origin, Content-Type, X-Auth-Token , Authorization");

include_once 'repository.php';
include_once './utils/token.php';
$repository = new Repository();
$token = new Token();
if(isset($_GET['key'])){
    switch($_GET['key']){
        case 'check-admin':
            if($decodeToken = checkToken($token, true)){
                if($decodeToken){
                    echo json_encode($decodeToken->isAdmin == "1");
                    return;
                } else {
                    echo json_encode($decodeToken);
                    return;
                }
            }
            echo json_encode(false);
            return;
        
        case 'search':
            $data = json_decode(file_get_contents("php://input"));
            echo json_encode($repository->search($data));
            return;
        
        case 'sign-in':
            $data = json_decode(file_get_contents("php://input"));
            echo json_encode($repository->SignIn($data));
            return;
        case 'sign-up':
            $data = json_decode(file_get_contents("php://input"));
            echo json_encode($repository->SignUp($data));
            return;
            
        case 'get-FAQs':
            echo json_encode($repository->GetFAQs());
            return;    
            
        case 'get-questions':
            echo json_encode($repository->GetQuestions());
            return;
            
        case 'get-question':
            echo json_encode($repository->GetQuestion($_GET['id']));
            return;
            
        case 'get-headers':
            echo json_encode($repository->GetHeaders($_GET['limit']));
            return;
        
        case 'add-question':
            if($decodeToken = checkToken($token, true)){
                $data = json_decode(file_get_contents("php://input"));
                echo json_encode($repository->AddQuestion($data));
            }
            return;
        
        case 'update-question':
            if($decodeToken = checkToken($token, true)){
                $data = json_decode(file_get_contents("php://input"));
                echo json_encode($repository->UpdateQuestion($data));
            }
            return;
        
        case 'remove-question':
            if($decodeToken = checkToken($token, true)){
                $data = json_decode(file_get_contents("php://input"));
                echo json_encode($repository->RemoveQuestion($data));
            }
            return;
        
        case 'upload-img':
            if($decodeToken = checkToken($token, true)){
                echo json_encode($repository->UploadImg($_FILES['qImage']));
            } else {
                echo json_encode(array("message" => "В доступе отказано"));
            }
            return;
        
        default: 
            echo json_encode(array("message" => "Ключ запроса не найден"));
            return;
    }

} else {
    http_response_code(500);
    echo json_encode(array("message" => "Отсутствует ключ запроса."));
}

function checkToken($token, $checkAdmin = false) {
    try{
        if(!isset($_GET['token'])){
            return false;
        }
        $data = $token->decode($_GET['token']);
        if($checkAdmin && (!isset($data->isAdmin) || !$data->isAdmin)){
            return false;
        }
        return $data;
        
    } catch(Exception $e) {
        return false;
    }
}
?>