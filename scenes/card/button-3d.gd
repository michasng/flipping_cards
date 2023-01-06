extends Area3D
class_name Button3D

signal pressed
signal released
signal hover_entered
signal hover_exited

var is_hovered: bool
var is_pressed: bool


func _ready():
	connect("input_event", _on_area_3d_input_event)
	connect("mouse_entered", _on_area_3d_mouse_entered)
	connect("mouse_exited", _on_area_3d_mouse_exited)


func _on_area_3d_input_event(_camera, event, _position, _normal, _shape_idx):
	if event is InputEventMouseButton and \
		event.button_index == MOUSE_BUTTON_LEFT:
			if is_pressed and not event.pressed:
				is_pressed = false
				emit_signal("released")
			elif event.pressed:
				is_pressed = true
				emit_signal("pressed")


func _input(event):
	if event is InputEventMouseButton and \
		event.button_index == MOUSE_BUTTON_LEFT and \
		not event.pressed and \
		not is_hovered:
			is_pressed = false
			# pressed on button, but released elsewhere


func _on_area_3d_mouse_entered():
	is_hovered = true
	emit_signal("hover_entered")


func _on_area_3d_mouse_exited():
	is_hovered = false
	emit_signal("hover_exited")
