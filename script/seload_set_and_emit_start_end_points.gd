class_name SELoadSetAndEmitStartEndPoints
extends Node3D

signal on_start_end_points_emitted(start_point:Vector3,end_point:Vector3)

@export var start_anchor:Node3D
@export var end_anchor:Node3D
@export var cursor_anchor:Node3D

func emit_current_points_in_signal():
	var start := start_anchor.global_position
	var end := start_anchor.global_position
	on_start_end_points_emitted.emit(start,end)
		
func set_start_anchor_with_cursor():
	start_anchor.position = cursor_anchor.position

func set_end_anchor_with_cursor():
	end_anchor.position = cursor_anchor.position

func set_cursor_global_position(global_position:Vector3):
	cursor_anchor.position = global_position

func set_random_positions_around_1_meter():
		start_anchor.global_position = Vector3(randf(),randf(),randf())
		end_anchor.global_position = Vector3(randf(),randf(),randf())
		cursor_anchor.global_position = (end_anchor.position-start_anchor.position)/2.0
	
