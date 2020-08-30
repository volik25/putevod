<?php
    //обработка запросов
    include_once './utils/token.php';
    include_once './utils/database.php';
    include_once './utils/filesManager.php';
    include_once 'models.php';
    class Repository{
        private $database;
        private $token;
        private $filesManager;
        private $baseUrl = 'http://vdknf.beget.tech/PutevodBack';

        public function __construct()
        {
            $this->database = new DataBase();
            $this->token = new Token();
            $this->filesManager = new FilesManager();
        }
        
        public function search($searchstring){
            $str = strtolower($searchstring->search);
            $sth = $this->database->db->query("SELECT * FROM questions WHERE LOWER(question) LIKE '%$str%' OR LOWER(answer) LIKE '%$str%'");
            $sth->setFetchMode(PDO::FETCH_CLASS, 'Question');
            return $sth->fetchAll();
        }
        
        public function GetQuestions(){
            $query = $this->database->db->query("SELECT * FROM questions");
            $query->setFetchMode(PDO::FETCH_CLASS, 'Question');
            $questions =  [];
            while($item = $query->fetch()){
                $item->isFAQ = $item->isFAQ == 1;
                $questions[] = $item;
            }
            return $questions;
        }
        
        public function GetQuestion($id){
            if($id == null){
                return array("message" => "Введите id вопроса", "method" => "GetQuestion", "requestData" => $id);
            }
            $query = $this->database->db->prepare("SELECT * FROM questions WHERE id = ?");
            $query->execute(array($id));
            $query->setFetchMode(PDO::FETCH_CLASS, 'Question');
            $item = $query->fetch();
            $item->isFAQ = $item->isFAQ == 1;
            return $item;
        }
        
        public function GetHeaders($limit){
            if($limit){
                $query = $this->database->db->query("SELECT id, question FROM questions LIMIT 27");
                //$query->execute(array($limit));
            }
            else{
                $query = $this->database->db->query("SELECT id, question FROM questions");
            }
            $query->setFetchMode(PDO::FETCH_CLASS, 'Headers');
            return $query->fetchAll();
        }
        
        public function GetFAQs(){
            $query = $this->database->db->query("SELECT id, isFAQuestion FROM questions WHERE isFAQ=true");
            $query->setFetchMode(PDO::FETCH_CLASS, 'FAQS');
            return $query->fetchAll();
        }

        public function AddQuestion($question){
            if(!isset($question->question) || !$question->question){
                return array("message" => "Укажите вопрос", "method" => "AddQuestion", "requestData" => $question);
            }
            $insert = $this->database->genInsertQuery((array)$question, 'questions');
            $query = $this->database->db->prepare($insert[0]);
            if($insert[1][0]!=null){
                $query->execute($insert[1]);
            }
            return $this->database->db->lastInsertId();
        }

        public function UpdateQuestion($question){
            if(!isset($question->id) || !$question->id){
                return array("message" => "Укажите id вопроса", "method" => "UpdateQuestion", "requestData" => $question);
            }
            if(!isset($question->question) || !$question->question){
                return array("message" => "Укажите вопрос", "method" => "UpdateQuestion", "requestData" => $question);
            }
            $questionId = $question->id;
            unset($question->id);
            if($question->oldImg && $question->img != $question->oldImg){
                $this->filesManager->remove($question->oldImg);
            }
            unset($question->oldImg);
            $a = $this->database->genUpdateQuery(array_keys((array)$question), array_values((array)$question), "questions", $questionId);
            $query = $this->database->db->prepare($a[0]);
            $query->execute($a[1]);
            return array('message' => 'Вопрос обновлен');
        }
        
        public function RemoveQuestion($item){
            $id = $item->id;
            $file = $item->filelink;
            if($id == null){
                return array("message" => "Введите id вопроса", "method" => "RemoveQuestion", "requestData" => $id);
            }
            $query = $this->database->db->prepare("delete from questions where id= ?");
            $query->execute(array($id));
            if($file){
                $this->filesManager->remove($file);
            }
            return array('message' => 'Вопрос удален');
        }
        
        public function UploadImg($file){
            $newFileName = $this->filesManager->upload($file, 'Files', uniqid());
            return $this->baseUrl.'/Files'.'/'.$newFileName;
        }

        public function SignIn($user = null){
            if($user != null){
                $sth = $this->database->db->prepare("SELECT id, password, isAdmin FROM users WHERE login = ? LIMIT 1");
                $sth->setFetchMode(PDO::FETCH_CLASS, 'User');
                $sth->execute(array($user->login));
                $fullUser = $sth->fetch();
                if($fullUser){
                    if(!password_verify($user->password, $fullUser->password)){
                        return false;
                    }
                    return $this->token->encode(array("id" => $fullUser->id, "isAdmin" => $fullUser->isAdmin));
                } else {
                    return false;
                }
                
            } else {
                return array("message" => "Введите данные для регистрации");
            }
        }
        
        public function SignUp($user = null){
            if($user != null){
                try{
                    $user->password = password_hash($user->password, PASSWORD_BCRYPT);
                    $insert = $this->database->genInsertQuery((array)$user, 'users');
                    $query = $this->database->db->prepare($insert[0]);
                    if ($insert[1][0]!=null) {
                        $query->execute($insert[1]);
                    }
                    return $this->token->encode(array("id" => $this->database->db->lastInsertId()));
                } catch(Exception $e) {
                    return false;
                }
                
            } else {
                return false;
            }
        }

    }
?>