extends KinematicBody2D

enum Directions {UP, DOWN, LEFT, RIGHT}

export(float) var velocity = 100
export(Vector2) var minVelocity = Vector2(30, 30)
export(float) var minDeltaVelocity = 0.5

var Vectors = [Vector2(0, -1), Vector2(0, 1), Vector2(-1, 0), Vector2(1, 0)]
var last_velocity: Vector2

func _process(delta):
	
	var new_velocity := last_velocity
	var input_vector := Vector2()
	
	if Input.is_action_pressed("up"):
		input_vector += Vectors[Directions.UP]
		
	if Input.is_action_pressed("down"):
		input_vector += Vectors[Directions.DOWN]
	
	if Input.is_action_pressed("left"):
		input_vector += Vectors[Directions.LEFT]
	
	if Input.is_action_pressed("right"):
		input_vector += Vectors[Directions.RIGHT]

	new_velocity += input_vector.normalized() * velocity * delta
	if (abs(new_velocity.x) < minVelocity.x) && (abs(last_velocity.x - new_velocity.x) < minDeltaVelocity):
		new_velocity.x = 0
	if (abs(new_velocity.y) < minVelocity.y) && (abs(last_velocity.y - new_velocity.y) < minDeltaVelocity):
		new_velocity.y = 0
	print("X=" + str(new_velocity.x) + "\tY=" + str(new_velocity.y))
	last_velocity = move_and_slide(new_velocity)
