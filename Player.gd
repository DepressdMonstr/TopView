extends KinematicBody2D

export (PackedScene) var Bullet

onready var end_of_gun = $EndOfGun

var curHp : int = 10
var maxHp : int = 10
var moveSpeed : int = 250
var damage : int = 1
var interactDist : int = 70
var vel : Vector2 = Vector2()
var facingDir : Vector2 = Vector2()
onready var rayCast = get_node("RayCast2D")

func _ready():
	pass # Replace with function body.



func _physics_process(delta):
  
	vel = Vector2()
	
  # inputs
	if Input.is_action_pressed("move_up"):
		vel.y -= 1
		facingDir = Vector2(0, -1)
		rotation_degrees = -90
		
	if Input.is_action_pressed("move_down"):
		vel.y += 1
		facingDir = Vector2(0, 1)
		rotation_degrees = 90
		
	if Input.is_action_pressed("move_left"):
		vel.x -= 1
		facingDir = Vector2(-1, 0)
		rotation_degrees = -180
	
	if Input.is_action_pressed("move_right"):
		vel.x += 1
		facingDir = Vector2(1, 0)
		rotation_degrees = 0
  
	vel = vel.normalized()
  
  # move the player
	move_and_slide(vel * moveSpeed)
	look_at(get_global_mouse_position())

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_released("shoot"):
		shoot()

func shoot():
	var bullet_instance = Bullet.instance()
	owner.add_child(bullet_instance)
	bullet_instance.transform = $EndOfGun.global_transform
	bullet_instance.global_position = end_of_gun.global_position
	var target = get_global_mouse_position()
	var direction_to_mouse = bullet_instance.global_position.direction_to(target).normalized()
	bullet_instance.set_direction(direction_to_mouse)

