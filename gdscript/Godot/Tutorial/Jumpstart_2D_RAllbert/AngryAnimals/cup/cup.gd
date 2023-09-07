extends StaticBody2D

@onready var animation_player = $AnimationPlayer
@onready var vanish_sound = $VanishSound
@onready var collision_polygon_2d = $CollisionPolygon2D

func die() -> void:
	vanish_sound.play()
	animation_player.play("vanish")


func _on_vanish_sound_finished():
	SignalManager.on_cup_destroyed.emit()
	queue_free() 
