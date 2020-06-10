<?php
class Database
{
	private static $dbName = 'd02d9a07' ;
	private static $dbHost = 'localhost' ;
	private static $dbUsername = 'd02d9a07';
	private static $dbUserPassword = '12morp75';

	private static $cont  = null;

	public function __construct() {
		exit('Init function is not allowed');
	}

	public static function connect() {
		// One connection through whole application
		if ( null == self::$cont ) {
			try {
				self::$cont =  new PDO( "mysql:host=".self::$dbHost.";"."dbname=".self::$dbName, self::$dbUsername, self::$dbUserPassword);
			} catch(PDOException $e) {
				die($e->getMessage());
			}
		}
		return self::$cont;
	}

	public static function disconnect() {
		self::$cont = null;
	}
}
?>