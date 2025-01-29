.. _DSPC_Custom_Layers:

==================
DSPC Custom Layers
==================

This shows an example of using a :ref:`custom layers<customLayers>` model to analyse reflectivity from a supported bilayer of DSPC. 

In this example, we can make use of the fact that the volumes, and of course the atomistic composition are known. So, for lipid tails for example, then we can
take a literature value for the tails volume, have a fittable parameter for the lipid area per molecule, and then the tail thickness will simply be 

.. math:: Tail Thick = Tail Volume / Lipid APM.

Since the volume is known, then the SLD of the tails is also obviously easily calculable.

In addition, the datasets for this example, have a resolution (per point) in their fourth column. We use this resolution in our analysis, rather than declaring a constant, fittable one.

This example can be run as a script or interactively using the instructions below.


.. note:: The custom model used is a MATLAB model - **examples/normalReflectivity/customLayers/customBilayerDSPC.m**.

**Run Script**: 

.. code-block:: Matlab 

  root = getappdata(0, 'root');
  cd(fullfile(root, 'examples', 'normalReflectivity', 'customLayers'));
  customLayersDSPCScript

**Run Interactively**: 

.. code-block:: Matlab 

  root = getappdata(0, 'root');
  cd(fullfile(root, 'examples', 'normalReflectivity', 'customLayers'));
  edit customLayersDSPCSheet.mlx


.. raw:: html
   :file: customLayersDSPCSheet.html
