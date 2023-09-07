extends Control

@export var board_rows: int = 6
@export var board_column: int = 6

@onready var merge_grid = $MC/MergeGrid
const BOARD_ITEM_SCENE: PackedScene = preload("res://scenes/board_item/board_item.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.generate_new_board.connect(generate_new_board)


func generate_new_board() -> void:
	print("generate new board signal recieved")
	_generate_board()

# fill board with blank starter items
func _generate_board() -> void:
	for n in (board_rows * board_column): 
		var new_item = BOARD_ITEM_SCENE.instantiate()
		merge_grid.add_child(new_item)
	
