==================================
Alternative Custom Model Languages
==================================

In this example, we setup a :ref:`custom layers<customLayers>` problem using three different programming language (MATLAB, Python, and C++) to write the custom model function.
The provided C++ function needs to be compiled into a dynamic library using instructions given in :ref:`customLanguages` or instructions specific to your compiler.


This example can be run using the instructions below.
 

.. note:: The custom models used are - 
  **examples/miscellaneous/languages/alloyDomains.m**, 
  **examples/miscellaneous/languages/alloyDomains.m**, 
  **examples/miscellaneous/languages/alloyDomains.m**. 

.. warning:: For Python custom functions, you will need to setup the python environment for MATLAB, see `Setup MATLAB to use Python <https://uk.mathworks.com/help/matlab/matlab_external/install-supported-python-implementation.html>`_

**Run Script**: 

.. code-block:: Matlab 

  root = getappdata(0, 'root');
  cd(fullfile(root, 'examples', 'miscellaneous', 'alternativeLanguages'));
  customModelLanguagesScript
  
**Run Interactively**: 

.. code-block:: Matlab 

  root = getappdata(0, 'root');
  cd(fullfile(root, 'examples', 'miscellaneous', 'alternativeLanguages'));
  edit customModelLanguagesSheet.mlx

.. raw:: html
   :file: customModelLanguagesSheet.html
