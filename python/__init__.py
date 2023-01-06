--------------- references
https://www.youtube.com/watch?v=cONc0NcKE7s


--------------- 
__init__.py
    - run automatically when a directory is imported. 
    - used to make a directory appear as a library
    

--------------- import directory that doesn't have __init__.py
directory tree:

tutorial
    resources
        object_one.py
            class One
        object_two.py
            class Two
    tutorial.py
    

scenario:
    - tutorial.py want to import class One, Two
    - what to do if without __init_.py ?
        - import as directory:
            - code: from directory.file import class            


# code: tutorial.py
from resources.object_one import One
from resources.object_two import Two

a = resources.One()
b = resources.Two()
# -----

--------------- import directory which has __init__.py
tutorial
    resources
        __init__.py
        object_one.py
            class One
        object_two.py
            class Two
    tutorial.py


# code: __init__.py
from resources.object_one import One
from resources.object_two import Two

# -----


# code: tutorial.py
import resources # run __init__.py automatically

a = resources.One()
b = resources.Two()
# -----

