extends CharacterBody2D

@export var SPEED = 100
@export var HEALTH = 100

func _enter_tree():
	set_meta(&"character", self)

func _physics_process(delta):
	if HEALTH == 0:
		die()
	velocity = $BehaviorBaseNode.get_velocity() * SPEED 
	if velocity.x < 0:
		$sprite.flip_h = true
	if velocity.x > 0:
		$sprite.flip_h = false
	if velocity != Vector2.ZERO:
		$sprite.play("move")
	else:
		$sprite.play("idle")
	move_and_slide()

func equip(weapon: Node2D):
	var weapon_dupe = weapon.duplicate()
	weapon_dupe.name = &"weapon"
	$WeaponsBaseNode.add_child(weapon_dupe)
	
func die():
	visible = false
	pass
	
func get_weapon():
	var weapon = $WeaponsBaseNode.get_children()
	if weapon.size() == 0:
		return null
	return weapon[0]
	
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
