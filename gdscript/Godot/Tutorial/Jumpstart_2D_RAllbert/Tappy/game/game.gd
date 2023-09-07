extends Node2D

@export var pipes_scene: PackedScene

@onready var spawn_l = $SpawnL
@onready var spawn_u = $SpawnU
@onready var pipes_holder = $PipesHolder
@onready var engine_sound = $EngineSound
@onready var game_over_sound = $GameOverSound

@onready var spawn_timer = $SpawnTimer


# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.set_score(0)
	GameManager.on_game_over.connect(on_game_over)
	spawn_pipes()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func spawn_pipes() -> void:
	var yPos = randf_range(spawn_u.position.y, spawn_l.position.y)
	var newPipes = pipes_scene.instantiate()
	
	newPipes.position = Vector2(spawn_l.position.x, yPos)
	pipes_holder.add_child(newPipes)
	

func stop_pipes() -> void:
	spawn_timer.stop()
	for pipe in pipes_holder.get_children():
		pipe.set_process(false)

func _on_spawn_timer_timeout():
	spawn_pipes()


func on_game_over():
	stop_pipes()
	engine_sound.stop()
	game_over_sound.play()
