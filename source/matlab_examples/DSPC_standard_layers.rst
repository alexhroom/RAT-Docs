.. _DSPC_Standard_Layers:

====================
DSPC Standard Layers
====================
This shows an example of using a :ref:`standard layers<standardLayers>` model to analyse reflectivity from a floating bilayer of DSPC. 

The model is set up in the script, we set Gaussian priors on some of the parameters, build the two contrasts, run the calculation and plot the results.  

This example can be run as a script or interactively using the instructions below.

.. tab-set::
    :sync-group: code

    .. tab-item:: Matlab
        :sync: Matlab

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


    .. tab-item:: Python 
        :sync: Python

        **Run Script**:  
        
        .. code-block:: console 
            
            python RATapi.examples.normal_reflectivity.DSPC_standard_layers.py

        **Run as Function**:  
        
        .. code-block:: Python 
            
            import RATapi as RAT
            problem, results = RAT.examples.normal_reflectivity.DSPC_standard_layers()
        
        **Run Interactively**:  
        
        .. code-block:: console 
            
            jupyter notebook RATapi.examples.normal_reflectivity.DSPC_standard_layers.ipynb
