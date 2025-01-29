==============
DSPC Custom XY
==============

This shows an example of using a :ref:`custom XY<customXYProfile>` model to analyse reflectivity from a supported bilayer of DSPC. 

Similar to :ref:`DSPC_Custom_Layers`, we can make use of the fact that the volumes, and of course the atomistic composition are known. So, 
for lipid tails for example, then we can take a literature value for the tails volume, have a fittable parameter for the lipid area per molecule, and then the tail thickness will simply be 

.. math:: \text{Tail Thick} = \frac{\text{Tail Volume}}{\text{Lipid APM}}.

Since the volume is known, then the SLD of the tails is also obviously easily calculable.

In this model, we make distributions to represent the volume fractions of each of the components in the sample, the convert these to SLD's, as described in :ref:`[1] <ref_1>`.

We also make our volume fractions as optional outputted parameters from our file. The optional nature of this output means we can suppress it to run the model, then
activate it to make final output plots of our analysis.

.. image:: ../images/examples/volumeFractions.png
    :align: center
    :alt: Volume fractions

This example can be run as a script or interactively using the instructions below.


.. note:: The custom model used is a MATLAB model - **examples/normalReflectivity/customXY/customXYDSPC.m**.

**Run Script**: 

.. code-block:: Matlab 

  root = getappdata(0, 'root');
  cd(fullfile(root, 'examples', 'normalReflectivity', 'customXY'));
  customXYDSPCScript

**Run Interactively**: 

.. code-block:: Matlab 

  root = getappdata(0, 'root');
  cd(fullfile(root, 'examples', 'normalReflectivity', 'customXY'));
  edit customXYDSPCSheet.mlx

.. _ref_1:

[1]  Shekhar et al, J. Appl. Phys, 100, 102216 (2011) [`DOI 10.1063/1.3661986 <https://doi.org/10.1063/1.3661986>`_]

.. raw:: html
   :file: customXYDSPCSheet.html
