=================================
Incoherent Summing with Custom XY
=================================

This is an example of using incoherent summing ('domains') from custom XY models.

The domain custom XY model is similar to a normal custom models, except that the input (function arguments) of the custom function contains an additional 'domains' parameter as described in :ref:`domainsCustomModels`.

This parameter tells the function which is the current domain, so the appropriate layer stack can be generated.

This example can be run as a script or interactively using the instructions below.


.. note:: The custom model used is a MATLAB model - **examples/domains/customXY/domainsXY.m**.

**Run Script**: 

.. code-block:: Matlab 

  root = getappdata(0, 'root');
  cd(fullfile(root, 'examples', 'domains', 'customXY'));
  domainsCustomXYScript

**Run Interactively**: 

.. code-block:: Matlab 

  root = getappdata(0, 'root');
  cd(fullfile(root, 'examples', 'domains', 'customXY'));
  edit domainsCustomXYSheet.mlx

.. raw:: html
   :file: domainsCustomXYSheet.html
