### In-progress

#### ~Refactor: mapScript.js compartmentalisation and tidy~
- TO-DOS
    - ~Move all helper functions to segmented seperate file~ (CANT DO: qrc file structuring prevents import statements in JS code)
    - ~Move all config parameters to segmented seperate file~ (CANT DO: qrc file structuring prevents import statements in JS code)
    - ~Move test suite to seperate testing file~ (CANT DO: qrc file structuring prevents import statements in JS code)
    - ~Refactor map and layer initialisation to intake entities from the backend DB~

#### Feat: Entity movement
- PRE-REQS (COMPLETE)
    - ~Create static entity from lat long vals -> Create multiple~
    - ~Update entity pos from backend DB and redraw marker -> Multiple~

- TO-DOS
    - ~Create animated dummy entity w/ rad + move~
        - ~Add random start/stop/reverse trajectory to simulate dynamic behaviour~
    - ~Init. multiple dummies w/ move~
    - ~Backfill dummy entity data w/ DB entity geometry data~
    - Predefine entity flight path data in DB for backfill?

#### ~Build: Migrate to Qt6~

#### Build: Integrate with alternate remote codebase
- PRE-REQS (INCOMPLETE)
    - Visual Studio configuration for compilation compatibility
