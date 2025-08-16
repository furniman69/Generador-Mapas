extends Node2D
class_name MapGenerator

var cells: Dictionary = {}
var to_process: Array[HexCell] = []

func _ready() -> void:
	randomize()
	var start := HexCell.new(HexCell.CellType.COAST, Vector2i.ZERO)
	add_child(start)
	cells[start.axial_coord] = start
	to_process.append(start)
	while to_process.size() > 0:
		var current: HexCell = to_process.pop_front()
		for dir in HexCell.DIRECTIONS:
			var neighbor_coord := current.axial_coord + dir
			if cells.has(neighbor_coord):
				continue
			var roll := randi_range(1, 100)
			var neighbor_type := HexCell.CellType.COAST if roll <= 50 else HexCell.CellType.SEA
			var neighbor := HexCell.new(neighbor_type, neighbor_coord)
			add_child(neighbor)
			cells[neighbor_coord] = neighbor
			if neighbor_type == HexCell.CellType.COAST:
				to_process.append(neighbor)
