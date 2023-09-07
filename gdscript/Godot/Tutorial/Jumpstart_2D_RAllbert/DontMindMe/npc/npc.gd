extends CharacterBody2D

@onready var nav_agent = $NavAgent
@onready var sprite_2d = $Sprite2D
@onready var player_detect = $PlayerDetect

enum ENEMY_STATE { PATROLLING, CHASING, SEARCHING}

@export var patrol_points: NodePath


var _speed: float = 60.0
var _waypoints: Array = []
var _current_wp: int = 0
var _state: ENEMY_STATE = ENEMY_STATE.PATROLLING

var _player_ref: Player

# Called when the node enters the scene tree for the first time.
func _ready():
	_player_ref = get_tree().get_first_node_in_group("player")
	create_wp() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	raycast_to_player()
	update_movement()
	update_navigation()
	debug_label()
		

func debug_label() -> void:
	var s = "FOV: %.0f" % get_fov_angle()
	SignalManager.on_debug.emit(s)

func get_fov_angle() -> float:
	var direction = global_position.direction_to(_player_ref.global_position)
	var dot_product = direction.dot(velocity.normalized())
	return rad_to_deg(acos(dot_product))
	
func raycast_to_player() -> void:
	player_detect.look_at(_player_ref.global_position)

func create_wp() -> void:
	for c in get_node(patrol_points).get_children():
		_waypoints.append(c.global_position)

func navigate_wp() -> void:
	if _current_wp >= len(_waypoints):
		_current_wp = 0
	nav_agent.target_position = _waypoints[_current_wp]
	_current_wp += 1

func update_navigation() -> void:
	var npp = nav_agent.get_next_path_position()
	var ini_v = (npp - global_position).normalized() * _speed
	sprite_2d.look_at(npp)
	nav_agent.set_velocity(ini_v)
	
func process_patrolling() -> void:
	if nav_agent.is_navigation_finished() == true:
		navigate_wp()

func update_movement() -> void:
	match _state:
		ENEMY_STATE.PATROLLING:
			process_patrolling()

func _on_nav_agent_velocity_computed(safe_velocity):
	velocity = safe_velocity
	move_and_slide()
