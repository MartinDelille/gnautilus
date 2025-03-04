@tool
extends Node

var OceanTile = preload("res://water_scene.tscn")
var spawn_point = preload("res://grid_spawn_info.tres")


func create_ocean_tiles():
	for i in 17:
		var spawn_location = spawn_point.spawn_points[i]
		var tile_subdivision = spawn_point.subdivision[i]
		var tile_scale = spawn_point.scale[i]
		var instance = OceanTile.instantiate()

		add_child(instance)

		instance.position = Vector3(spawn_location.x, 0.0, spawn_location.y) * 100.5
		var new_mesh = instance.mesh.duplicate()
		instance.mesh = new_mesh
		instance.mesh.set_subdivide_width(tile_subdivision)
		instance.mesh.set_subdivide_depth(tile_subdivision)
		instance.set_scale(Vector3(tile_scale, 1.0, tile_scale))


func _ready() -> void:
	create_ocean_tiles()
