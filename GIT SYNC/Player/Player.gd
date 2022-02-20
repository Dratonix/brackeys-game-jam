extends KinematicBody2D


var velocity := Vector2.ZERO


export var speed := 100
export var accel := 100
export var friction := 25

func _physics_process(delta: float) -> void:
	movement(delta)
	
func movement(delta):
	var input_vector := Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		velocity = input_vector * accel 
		velocity = velocity.clamped(speed) 
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction)
	
	
	velocity = move_and_slide(velocity)
