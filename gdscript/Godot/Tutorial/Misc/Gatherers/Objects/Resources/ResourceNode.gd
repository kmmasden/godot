class_name ResourceNode

extends StaticBody2D

@export var node_types : Array[ResourceNodeType]
@export var starting_resources: int = 1
@export var pickup_type : PackedScene
@export var launch_speed : float = 100
@export var launch_duration : float = 0.25

@export var depleted_effect : PackedScene

@onready var level_parent = get_parent()

var current_resources : int :
	set(value):
		current_resources = value
		if (value <= 0):
			var effect_instance : GPUParticles2D = depleted_effect.instantiate()
			effect_instance.position = position
			level_parent.add_child(effect_instance)
			effect_instance.emitting = true
			queue_free()

func _ready():
	current_resources = starting_resources

func harvest(amount : int) :
	for n in amount:
		spawn_resource()
	
	current_resources -= amount
	
func spawn_resource():
	var pickup_instance : Pickup = pickup_type.instantiate() as Pickup
	level_parent.add_child(pickup_instance)
	pickup_instance.position = position
	
	var direction : Vector2 = Vector2(
		randf_range(-1.0, 1.0),
		randf_range(-1.0, 1.0)
	).normalized()
	
	#launch pickup 
	pickup_instance.launch(direction * launch_speed, launch_duration)
