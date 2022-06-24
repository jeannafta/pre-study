##############################################
# This script is based on the following code:
#    Title: Convert msh-files to XDMF using meshio
#    Author: Jørgen S. Dokken
#    Date: 2022
#    Source: https://jorgensd.github.io/dolfinx-tutorial/chapter3/subdomains.html
#    License: Creative Commons Attribution 4.0 International License
##############################################

import meshio
import numpy
import argparse


def create_mesh(mesh, cell_type, prune_z=False):
    """Helper function to extract the cells and physical data"""
    cells = mesh.get_cells_type(cell_type)
    cell_data = mesh.get_cell_data("gmsh:physical", cell_type)
    points = mesh.points[:,:2] if prune_z else mesh.points
    out_mesh = meshio.Mesh(points=points, cells={cell_type: cells}, cell_data={"name_to_read":[cell_data]})
    return out_mesh


def main():
    parser = argparse.ArgumentParser(description='Mesh convertor')
    parser.add_argument('--mesh_full_path', type=str, required=True,
                        help='Path of the .msh mesh file (including the name of the file).')
    parser.add_argument('--output_full_path', type=str, required=True,
                        help='Path of the folder where the .XDMF mesh files will be saved.')
    parser.add_argument('--mesh_dim', type=int, default=2, choices=[2, 3],
                        help='Dimention of the mesh: 2D or 3D.')
    parser.add_argument('--deg', type=int, default=1, choices=[1, 2],
                        help='Interpolation degree of the mesh elements: linear or quadratic.')
    args = parser.parse_args()
    
    # Check that the input mesh have the correct format
    if not args.mesh_full_path.endswith('.msh'):
        raise Exception("The input file must have the extension .msh")
    if not args.output_full_path.endswith('.xdmf'):
        raise Exception("The output file must have the extension .xdmf")
        
    # Read the input mesh
    msh = meshio.read(args.mesh_full_path)

    # Convert mesh to XDMF
    prune_z = True if args.mesh_dim==2 else False
    
    if args.deg==1:
        line_mesh = create_mesh(msh, "line", prune_z)
        triangle_mesh = create_mesh(msh, "triangle", prune_z)
    elif args.deg==2:
        line_mesh = create_mesh(msh, "line3", prune_z)
        triangle_mesh = create_mesh(msh, "triangle6", prune_z)
    else:
        raise Exception("Not implemented yet. Type 'msh.cell_data_dict' to know the options.")
        
    meshio.write(args.output_full_path, triangle_mesh)
    meshio.write(args.output_full_path.replace('.xdmf', '_facet.xdmf'), line_mesh)

    print("Mesh conversion is done.")

    
if __name__ == '__main__':
    main()