<?php
	class LootedItem {
 		public $itemName;
 		public $img;
 		public $monsterId;
 		public $prob;
 		public $quantityMin;
 		public $quantityMax;
 		
 		public function setItem($array){
 			$this->itemName = $array[0];
 			$this->img = $array[1];
 			$this->monsterId = $array[2];
 			$this->prob = $array[3];
 			$this->quantityMin = $array[4];
 			$this->quantityMax = $array[5];
 		}
	}
	
	function getLootableItemsByMonster($monsterId){
		global $conftp;
		$itemList = [];
		$retval = db_query("SELECT nombreobj, img, monstruoid, prob, min, max FROM {$conftp}tienemonstruos WHERE monstruoid = {$monsterId}");
		for($i = 0; $i < mysql_num_rows($retval); $i++){
			$ret = mysql_fetch_row($retval);
			$item = new LootedItem();
			$item->setItem($ret);
			array_push($itemList, $item);
		}
		return $itemList;
	}
?>