# WeldDeps Template

This readme will show you how to use the WeldDeps template to create a new datapack project.


## Getting Started

Install poetry https://python-poetry.org/docs/#installation and run `poetry install` in the root of the project to install the dependencies.



## Managing `smithed.net` dependencies

In `pyproject.toml` you can find this section : 
```toml
[[tool.beet.meta.weld_deps.deps]]
id = "itemio"
version = "1.2.6"
```
Theses are smithed.net dependencies, this will automatically download the proper version and add it to the ctx object before your datapack is built. This use [weld](https://weld.smithed.dev/) internally to develop with the merging tool.

