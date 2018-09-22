extends Node

func make_quad():
    var st = SurfaceTool.new()
    st.begin(Mesh.PRIMITIVE_TRIANGLE_STRIP)

    for s in 10000:
        var x = s * 0.1 - 100
        st.add_color(Color(1, 0, 0))
        st.add_uv(Vector2(0, 0))
        var height = sin(x * 0.2)
        st.add_vertex(Vector3(-x, height, -5.0))
        st.add_vertex(Vector3(-x, height, 5.0))

    return st.commit()

func _enter_tree():
    rebuild()

func rebuild():
    var mesh = make_quad()
    get_node("mesh").set_mesh(mesh)
