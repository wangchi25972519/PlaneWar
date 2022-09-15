extends Area2D

const speed = 300

onready var mis = preload("res://src/Missile.tscn") 
# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(false)

func game_start():
	set_process(true)
	$ShootTimer.start()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var h_direction = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	var v_direction = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	var direction = Vector2(h_direction, v_direction).normalized()
	
	position += direction * speed * delta
	
	var half_width = $AnimatedSprite.frames.get_frame("idle", 0).get_width()/2 - 12
	var half_height = $AnimatedSprite.frames.get_frame("idle", 0).get_height()/2
	var window_width = OS.window_size.x
	var window_height = OS.window_size.y
	
	position.x = clamp(position.x, half_width, window_width - half_width)
	position.y = clamp(position.y, half_height, window_height - half_height)


func _on_ShootTimer_timeout():
	var mis_node = get_parent().get_node("Missiles")
	var missile = mis.instance()
	missile.global_position = $ShootPosition.global_position
	mis_node.add_child(missile)
