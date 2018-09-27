<?php

namespace MyApp;

class Poll {
  private $_db;

  public function __construct() {
    $this->_connectDB();
    $this->_createToken();
  }

  private function _createToken() {
    if (!isset($_SESSION['token'])) {
      $_SESSION['token'] = bin2hex(openssl_random_pseudo_bytes(16));
    }
  }

  //トークンをチェック
  private function _validateToken() {
    if (
      !isset($_SESSION['token']) ||
      !isset($_POST['token']) ||
      $_SESSION['token'] !== $_POST['token']
    ) {
      throw new \Exception('invalid token');
    }
  }


  public function post() {
    try {
      $this->_validateToken();
      $this->_validateAnswer();
      $this->_save();
      // redirect to result.php
      header('Location: http://' . $_SERVER['HTTP_HOST'] . '/07_03_ikedaakio/result.php');
    } catch (\Exception $e) {
      // set error
      $_SESSION['err'] = $e->getMessage();
      // redirect to index.php
      header('Location: http://' . $_SERVER['HTTP_HOST']);
    }
    exit;
  }

  public function getResults() {
    $data = array_fill(0, 3, 0);

    $sql = "select answer, count(id) as c from answers group by answer";
    foreach ($this->_db->query($sql) as $row) {
      $data[$row['answer']] = (int)$row['c'];
    }
    return $data;
  }

  public function getError() {
    $err = null;
    if (isset($_SESSION['err'])) {
      $err = $_SESSION['err'];
      unset($_SESSION['err']);
    }
    return $err;
  }

  private function _validateAnswer() {
    // var_dump($_POST);
    // exit;
    if (
      !isset($_POST['answer']) ||
      !in_array($_POST['answer'], [0, 1, 2])
    ) {
      throw new \Exception('invalid answer!');
    }
  }
//インジェクション対策
  private function _save() {
    $sql = "insert into answers
      (answer, created)
      values (:answer, now())";
      $stmt = $this->_db->prepare($sql);
      $stmt->bindValue(':answer', (int)$_POST['answer'], \PDO::PARAM_INT);
      $stmt->execute();
      // exit;
  }

  private function _connectDB() {
    try {
      $this->_db = new \PDO(DSN, DB_USERNAME, DB_PASSWORD);
      $this->_db->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);
    } catch (\PDOException $e) {
      throw new \Exception('Failed to connect DB');
    }
  }

}