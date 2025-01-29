=======================================
Incoherent Summing with Standard Layers
=======================================

Analysing data containing domains using standard layers models is done in a similar way to a normal standard layers model, but with a couple of 
additional steps. 

A normal standard layers model defines parameters, which are grouped into layers, and then these are arranged into contrasts. For sample containing domains, the 
layers are first grouped into domain 'contrasts', which are just groupings of layers with none of the additional parameters of a contrast (such as resolutions
etc). Then, the actual experimental contrasts are built in the usual way, but with the model set as any two of the domains.

.. image:: ../images/domainsGraph.png
    :align: center
    :alt: Domains graph

To control the ratio between the domains, we can add domain ratios as described in :ref:`domainsStanlay`. And each contrast has an additional field
for domain ratios which is set as one of the values from this block.

This example can be run as a script or interactively using the instructions below.

.. tab-set::
    :sync-group: code

    .. tab-item:: Matlab
        :sync: Matlab

        **Run Script**: 

        .. code-block:: Matlab 
        
            root = getappdata(0, 'root');
            cd(fullfile(root, 'examples', 'domains', 'standardLayers'));
            domainsStandardLayersScript
        
        **Run Interactively**: 

        .. code-block:: Matlab 
        
            root = getappdata(0, 'root');
            cd(fullfile(root, 'examples', 'domains', 'standardLayers'));
            edit domainsStandardLayersSheet.mlx


    .. tab-item:: Python 
        :sync: Python

        **Run Script**:  
        
        .. code-block:: console 
            
            python RATapi.examples.domains.domains_standard_layers.py

        **Run as Function**:  
        
        .. code-block:: Python 
            
            import RATapi as RAT
            problem, results = RAT.examples.domains.domains_standard_layers()
        
        **Run Interactively**:  
        
        .. code-block:: console 
            
            jupyter notebook RATapi.examples.domains.domains_standard_layers.ipynb
