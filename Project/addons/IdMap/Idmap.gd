@tool
extends VisualShaderNodeCustom
class_name IdMap

func _get_name():
	return "IdMap"


func _get_category():
	return "Masking"


func _get_description():
	return "IdMap masking (by KelvysB)"


func _get_return_icon_type():
	return VisualShaderNode.PORT_TYPE_SCALAR


func _get_input_port_count():
	return 3


func _get_input_port_name(port):
	match port:
		0:
			return "ColorId"
		1:
			return "IdMap"
		2:
			return "Tolerance"        


func _get_input_port_type(port):
	match port:
		0:
			return VisualShaderNode.PORT_TYPE_VECTOR_3D
		1:
			return VisualShaderNode.PORT_TYPE_VECTOR_3D
		2:
			return VisualShaderNode.PORT_TYPE_SCALAR


func _get_output_port_count():
	return 1


func _get_output_port_name(port):
	return "Mask"


func _get_output_port_type(port):
	return VisualShaderNode.PORT_TYPE_VECTOR_3D


func _get_global_code(mode):
	return """
		vec3 GetMask(vec3 colorId, vec3 idMap, float tolerance) {

		// Vector Decompose Color Id
			float colorId_R = colorId.x;
			float colorId_G = colorId.y;
			float colorId_B = colorId.z;

		// Decompose IdMap
			float idMap_R = idMap.x;
			float idMap_G = idMap.y;
			float idMap_B = idMap.z;

		// subtract R
			float result_R = colorId_R - idMap_R;

		// Compare R
			bool compare_R = (abs(result_R - 0.00000) < tolerance);

		// Subtract G
			float result_G = colorId_G - idMap_G;

		// Compare G
			bool compare_G = (abs(result_G - 0.00000) < tolerance);

		// Divide R by G
			float result_R_G = (compare_R ? 1.0 : 0.0) / (compare_G ? 1.0 : 0.0);

		// Subtract B
			float result_B = colorId_B - idMap_B;

		// Compare B
			bool compare_B = (abs(result_B - 0.00000) < tolerance);

		// Divide R_G By B
			float result_R_G_B = result_R_G / (compare_B ? 1.0 : 0.0);

		// result
			return vec3(result_R_G_B);

		}
	"""


func _get_code(input_vars, output_vars, mode, type):
	return output_vars[0] + " = GetMask(%s, %s, %s);" % [input_vars[0], input_vars[1], input_vars[2]]
