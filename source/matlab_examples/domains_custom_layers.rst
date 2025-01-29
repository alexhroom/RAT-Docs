=====================================
Incoherent Summing with Custom Layers
=====================================

This is an example of using incoherent summing ('domains') from custom layers models. The sample is a simple two layer of permalloy/gold, with up/down domains

The domain custom model is similar to a normal custom models, except that the input (function arguments) of the custom function contains an additional 'domains' parameter as described in :ref:`domainsCustomModels`.

This parameter tells the function which is the current domain, so the appropriate layer stack can be generated.

This example can be run as a script or interactively using the instructions below.

.. tab-set::
    :sync-group: code

    .. tab-item:: Matlab
        :sync: Matlab

        .. note:: The custom model used is a MATLAB model - **examples/domains/customLayers/alloyDomains.m**.

        **Run Script**: 

        .. code-block:: Matlab 
        
            root = getappdata(0, 'root');
            cd(fullfile(root, 'examples', 'domains', 'customLayers'));
            domainsCustomXYScript
        
        **Run Interactively**: 

        .. code-block:: Matlab 
        
            root = getappdata(0, 'root');
            cd(fullfile(root, 'examples', 'domains', 'customLayers'));
            edit domainsCustomXYSheet.mlx


    .. tab-item:: Python 
        :sync: Python

        .. note:: The custom model used is a Python model - **RATapi.examples.domains.alloy_domains.py**.

        **Run Script**:  
        
        .. code-block:: console 
            
            python RATapi.examples.domains.domains_custom_layers.py

        **Run as Function**:  
        
        .. code-block:: Python 
            
            import RATapi as RAT
            problem, results = RAT.examples.domains.domains_custom_layers()
        
        **Run Interactively**:  
        
        .. code-block:: console 
            
            jupyter notebook RATapi.examples.domains.domains_custom_layers.ipynb
