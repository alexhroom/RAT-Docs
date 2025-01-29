.. _DSPC_Standard_Layers:

====================
DSPC Standard Layers
====================
This shows an example of using a :ref:`standard layers<standardLayers>` model to analyse reflectivity from a floating bilayer of DSPC. 

The model is set up in the script, we set Gaussian priors on some of the parameters, build the two contrasts, run the calculation and plot the results.  

This example can be run as a script or interactively using the instructions below.


**Run Script**: 

.. code-block:: Matlab 

  root = getappdata(0, 'root');
  cd(fullfile(root, 'examples', 'normalReflectivity', 'standardLayers'));
  standardLayersDSPCScript

**Run Interactively**: 

.. code-block:: Matlab 

  root = getappdata(0, 'root');
  cd(fullfile(root, 'examples', 'normalReflectivity', 'standardLayers'));
  edit standardLayersDSPCSheet.mlx

.. raw:: html
   :file: standardLayersDSPCSheet.html
