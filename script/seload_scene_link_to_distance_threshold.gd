## I am class that store the scene to create with the expected distance and threshold of tolerence
class_name SELoadSceneDistanceThresholdResource
extends Resource

@export var _scene_to_create: PackedScene
@export var _distance_expected: float = 0.0
@export var _threshold: float = 0.02


func get_threshold_in_meter() -> float:
	return _threshold

func get_distance_expected_in_meter() -> float:
	return _distance_expected

func get_scene_to_create() -> PackedScene:
	return _scene_to_create

func is_distance_in_range(distance:float):
	return abs(distance-_distance_expected)<_threshold

func create_scene_at_global_position_with_angle(
	global_position: Vector3,
	angle_y_rotation: float,
	parent_node:Node3D
) -> Node3D:
	if _scene_to_create == null:
		return null
	var instance := _scene_to_create.instantiate() as Node3D
	if instance == null:
		return null
	
	parent_node.add_child(instance)
	
	instance.global_position = global_position
	instance.global_rotation_degrees = Vector3(0,angle_y_rotation,0)
	return instance
