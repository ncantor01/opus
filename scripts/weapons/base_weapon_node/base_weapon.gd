extends Node2D

class_name Weapon 

@export var base_damage: float = 0
@export var bonus_damage: float = 0
@export var damage_mult: float = 0

# Called when the node enters the scene tree for the first time.
func _enter_tree():
	set_meta(&"weapon", true)
	visible = false
	disable_hitbox()
	pass

func enable_hitbox():
	$hitbox.get_child(0).set_disabled(false)
	pass
	
func disable_hitbox():
	$hitbox.get_child(0).set_disabled(true)
	pass

func hold_attack(direction: Vector2):
	assert($primary_attack_behavior_node.get_children().size() != 0)
	$primary_attack_behavior_node.get_child(0).hold_attack(direction)
	pass

func release_attack(direction: Vector2):
	assert($primary_attack_behavior_node.get_children().size() != 0)
	$primary_attack_behavior_node.get_child(0).release_attack(direction)
	pass

func get_damage():
	return (base_damage * damage_mult) + bonus_damage

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
