extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.generate_new_board.emit()
