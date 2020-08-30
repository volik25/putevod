<?php
    class Question{
        public $id;
        public $question;
        public $answer;
        public $img;
        public $isFAQ;
        public $isFAQuestion;
    }

    class Headers{
        public $id;
        public $question;
    }
    
    class FAQs{
        public $id;
        public $isFAQuestion;
    }
    
    class User {
        public $id;
        public $login;
    }
?>