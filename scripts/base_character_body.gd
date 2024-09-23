extends CharacterBody2D

@export var BASE_SPEED = 100
@export var run_modifier = 2
@export var crouch_modifier = 0.25
@export var drag_modifier = 0.5
var speed = BASE_SPEED
@export var HEALTH = 100
var held_item = null
var dragged = null
var interactables = {}


var WALKING = 0
const   RUNNING = 1
const CROUCHING = 2
const  DRAGGING = 3
const  DEAD = 4
const  BAITFISHING = 5
var character_state = WALKING

func _enter_tree():
	set_meta(&"character", self)

func _physics_process(delta):
	set_speed_based_on_state()
	velocity = $BehaviorBaseNode.get_velocity() * speed 
	if velocity.x < 0:
		$sprite.flip_h = true
	if velocity.x > 0:
		$sprite.flip_h = false
	if velocity != Vector2.ZERO:
		$sprite.play("move")
	else:
		$sprite.play("idle")
	
	if dragged != null:
		velocity = dragged.get_velocity()
		
	$collisionBox.disabled = false 
	move_and_slide()
	if get_slide_collision_count() > 0:
		print(get_slide_collision_count())
	
func die():
	$sprite.play("dead")
	speed = 0
	set_state(DEAD)
	set_meta(&"corpse", true)
	#TODO extract this into behaviors
	remove_meta(&"interactable")
	set_meta(&"interactable", [&"draggable", &"butcherable"])
	motion_mode = CharacterBody2D.MOTION_MODE_FLOATING
	$hurtbox/hurtBoxCollisionShape.disabled = true
	pass
	
func take_damage(weapon: Weapon):
	HEALTH -= weapon.get_damage()


func _on_hurtbox_body_entered(body: Node2D):
	if body.has_meta(&"damage"):
		assert(body.get_meta(&"damage").has_meta(&"weapon"))
		take_damage(body.get_meta(&"damage"))
	pass # Replace with function body.


func _on_hurtbox_area_entered(area):
	if area.has_meta(&"damage"):
		print(HEALTH)
		assert(area.get_meta(&"damage").has_meta(&"weapon"))
		take_damage(area.get_meta(&"damage"))
	pass # Replace with function body.
	
func set_speed_based_on_state():
	match character_state:
		WALKING:
			speed = BASE_SPEED
		RUNNING: 
			speed = BASE_SPEED * run_modifier
		CROUCHING:
			speed = BASE_SPEED * crouch_modifier
		DRAGGING:
			speed = BASE_SPEED * drag_modifier
		DEAD:
			speed = 0
		BAITFISHING:
			speed = 0
	
func set_state(input_state):
	character_state = input_state
	pass

func get_state():
	return character_state

func unset_held_item():
	held_item = null
	pass
	
func set_held_item(item: Node2D):
	assert(item.has_meta(&"item"))
	held_item = item
	pass

func get_held_item():
	return held_item

func drag(dragger):
	dragged = dragger
	pass

func undrag():
	print("undragd")
	dragged = null
	pass

func get_collisionBox():
	return $collisionBox
	
func get_interactables():
	return interactables
	
func add_interactable(action, item):
	interactables[item] = action
	pass

func remove_interactable(item):
	interactables.erase(item)
	pass
	
