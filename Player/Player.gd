extends KinematicBody2D

enum Directions {UP, DOWN, LEFT, RIGHT}

export(float) var velocity = 100
export(Vector2) var minVelocity = Vector2(30, 30)
export(float) var minDeltaVelocity = 0.5
export(bool) var activate_ground_controls = false
export(float) var ground_velocity = 300
export(float) var ground_jump = 600
export(float) var ground_gravity = 900

var Vectors = [Vector2(0, -1), Vector2(0, 1), Vector2(-1, 0), Vector2(1, 0)]
var last_velocity: Vector2

func space_controls(delta):
	var new_velocity := last_velocity
	var input_vector := Vector2()
	var animatedSprite = $AnimatedSprite
	
	if Input.is_action_pressed("up"):
		input_vector += Vectors[Directions.UP]
		
	if Input.is_action_pressed("down"):
		input_vector += Vectors[Directions.DOWN]
	
	if Input.is_action_pressed("left"):
		animatedSprite.flip_h = true
		input_vector += Vectors[Directions.LEFT]
	
	if Input.is_action_pressed("right"):
		animatedSprite.flip_h = false
		input_vector += Vectors[Directions.RIGHT]

	new_velocity += input_vector.normalized() * velocity * delta
	if (abs(new_velocity.x) < minVelocity.x) && (abs(last_velocity.x - new_velocity.x) < minDeltaVelocity):
		new_velocity.x = 0
	if (abs(new_velocity.y) < minVelocity.y) && (abs(last_velocity.y - new_velocity.y) < minDeltaVelocity):
		new_velocity.y = 0
	print("X=" + str(new_velocity.x) + "\tY=" + str(new_velocity.y))
	last_velocity = move_and_slide(new_velocity)


func ground_controls(delta):
	
	var new_velocity := Vector2()
	new_velocity.y = last_velocity.y + ground_gravity * delta
	
	if Input.is_action_pressed("ground_right"):
		new_velocity += Vectors[Directions.RIGHT] * ground_velocity
		$AnimatedSprite.flip_h = false
	elif Input.is_action_pressed("ground_left"):
		new_velocity += Vectors[Directions.LEFT] * ground_velocity
		$AnimatedSprite.flip_h = true
	
	if Input.is_action_pressed("ground_jump") and is_on_floor():
		new_velocity.y = -ground_jump
	
	last_velocity = move_and_slide(new_velocity, Vectors[Directions.UP])


func _process(delta):
	
	if activate_ground_controls:
		ground_controls(delta)
	else:
		space_controls(delta)
