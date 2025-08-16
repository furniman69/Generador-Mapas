extends Node2D
class_name HexCell

enum CellType { SEA, COAST }
const DIRECTIONS = [
    Vector2i(1, 0),
    Vector2i(1, -1),
    Vector2i(0, -1),
    Vector2i(-1, 0),
    Vector2i(-1, 1),
    Vector2i(0, 1)
]

var cell_type: CellType
var axial_coord: Vector2i

func _init(cell_type: CellType = CellType.COAST, axial_coord: Vector2i = Vector2i.ZERO) -> void:
    self.cell_type = cell_type
    self.axial_coord = axial_coord