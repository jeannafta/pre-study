# Pre-study Master Project

This directory provides all the codes that were developed for my master project pre-study. They are based on the [FEniCSx tutorial]https://jorgensd.github.io/dolfinx-tutorial/index.html#) by Jørgen S. Dokken.

Below are some tips for using [FEniCS](https://fenicsproject.org/) with Docker.

## Create a dolfinx container
- To create a new container named `prestudy` that will have acess to the local folder  `data`:
  > docker run --name prestudy -p 8888:8888 -v $(pwd)/data:/root dolfinx/lab
- To stop the container:
  > docker stop prestudy
- To restart the container:
  > docker restart prestudy


## Operations on containers
- To list all containers (including stopped containers):
  > docker container ls -a
- To remove a container:
  > docker container rm container_ID
## Install other Python libraries inside a container
Installing an additional library in a docker container is similar to installing a library in a Python virtual environment. For example one can use pip3 to install `pyvista` library:
> pip3 install pyvista
