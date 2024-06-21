extends CharacterBody2D

@export var SPEED = 100

func _physics_process(delta):
	velocity = $BehaviorBaseNode._get_velocity() * SPEED 
	move_and_slide()
