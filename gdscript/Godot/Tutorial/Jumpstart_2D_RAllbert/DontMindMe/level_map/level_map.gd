extends Node2D

@onready var label = $Camera2D/ColorRect/Label

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.on_debug.connect(on_debug)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func on_debug(text: String) -> void:
	label.text = text
	
