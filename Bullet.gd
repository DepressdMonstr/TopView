extends Area2D

export (int)var speed =  10
var test = 10
var direction := Vector2.ZERO

func _physics_process(delta):
	if direction != Vector2.ZERO:
		var velocity = direction * speed
		
		
		global_position += velocity
	

func set_direction(directionb: Vector2):
	self.direction = directionb
