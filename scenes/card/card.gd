extends Node3D
class_name Card

@onready var anim_player: AnimationPlayer = $AnimationPlayer
@onready var front_omni_light: OmniLight3D = $FrontOmniLight3D
@onready var back_omni_light: OmniLight3D = $BackOmniLight3D

@export var is_face_up: bool = true : set=set_is_face_up
@export var is_highlighted: bool = false : set=set_is_highlighted


func _ready():
	set_is_face_up(is_face_up)
	set_is_highlighted(is_highlighted)


func set_is_face_up(value: bool):
	is_face_up = value
	
	var target_rotation: float = 0.0 if is_face_up else PI
	print(rotation.z)
	if rotation.z == target_rotation:
		return
	
	if not anim_player: # in editor
		rotation.z = target_rotation
		return
	
	if is_face_up:
		anim_player.play_backwards("flip")
	else:
		anim_player.play("flip")


func _on_button_3d_pressed():
	is_face_up = !is_face_up


func set_is_highlighted(value: bool):
	is_highlighted = value
	front_omni_light.visible = is_highlighted
	back_omni_light.visible = is_highlighted


func _on_button_3d_hover_entered():
	is_highlighted = true


func _on_button_3d_hover_exited():
	is_highlighted = false


