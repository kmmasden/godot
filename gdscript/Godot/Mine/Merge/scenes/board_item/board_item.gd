extends Control

class_name BoardItem 

@onready var item_img = $ItemImg



func _ready():
	var rand_item = ItemManager.ITEM_KEYS.keys().pick_random() 
	item_img.texture = ItemManager._get_starter_img_from_item_type(rand_item)


func _on_item_img_gui_input(event):
	if event is InputEventMouseButton:
		print("clicked")
