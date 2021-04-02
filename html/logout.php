<?php

/**
 * Завершение работы с приложением под привелегированным пользователем
 * php version 7
 * 
 * @category Login_Logout
 * @package  EXLibrary
 * @author   Key Sansa <keysansa@yandex.ru>
 * @license  MIT 
 * @link     http://key10.ru
 */

// Удаляем сохраненного пользователя
session_destroy();
// Перенаправляем на домашнюю страницу
header('Location: index.php');

?>