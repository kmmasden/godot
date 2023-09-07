extends Node

#HARDCODING FOR NOW WITH PLACEHOLDER IMAGES TO GET LOGIC WORKING

const BOARD_ITEM_SCENE: PackedScene = preload("res://scenes/board_item/board_item.tscn")
const ITEM_DEFAULT_TEXTURE = preload("res://assets/img/icons/x.png")
const COIN_TYPE = "COIN"
const ROCK_TYPE = "ROCK"
const TREE_TYPE = "TREE"

enum ITEM_KEYS {COIN, ROCK, TREE}

enum LEVEL_KEYS {ONE, TWO, THREE, FOUR, FIVE}

const COINS = {
	LEVEL_KEYS.ONE : preload("res://assets/img/items/coin/coin-0.png"),
	LEVEL_KEYS.TWO : preload("res://assets/img/items/coin/coin-1.png"),
	LEVEL_KEYS.THREE : preload("res://assets/img/items/coin/coin-2.png"),
	LEVEL_KEYS.FOUR : preload("res://assets/img/items/coin/coin-3.png"),
	LEVEL_KEYS.FIVE : preload("res://assets/img/items/coin/coin-4.png")
}

const ROCKS = {
	LEVEL_KEYS.ONE : preload("res://assets/img/items/rock/rock-0.png"),
	LEVEL_KEYS.TWO : preload("res://assets/img/items/rock/rock-1.png"),
	LEVEL_KEYS.THREE : preload("res://assets/img/items/rock/rock-2.png"),
	LEVEL_KEYS.FOUR : preload("res://assets/img/items/rock/rock-3.png"),
	LEVEL_KEYS.FIVE : preload("res://assets/img/items/rock/rock-4.png")
}

const TREES = {
	LEVEL_KEYS.ONE : preload("res://assets/img/items/tree/tree-0.png"),
	LEVEL_KEYS.TWO : preload("res://assets/img/items/tree/tree-1.png"),
	LEVEL_KEYS.THREE : preload("res://assets/img/items/tree/tree-2.png"),
	LEVEL_KEYS.FOUR : preload("res://assets/img/items/tree/tree-3.png")
}
	

func _get_starter_img_from_item_type(type: String) -> CompressedTexture2D:
	var temp_img: CompressedTexture2D = ITEM_DEFAULT_TEXTURE
	match type:
		COIN_TYPE:
			temp_img = COINS[LEVEL_KEYS.ONE]
		ROCK_TYPE:
			temp_img = ROCKS[LEVEL_KEYS.ONE]
		TREE_TYPE:
			temp_img = TREES[LEVEL_KEYS.ONE]
	return temp_img
		
	
	
	
