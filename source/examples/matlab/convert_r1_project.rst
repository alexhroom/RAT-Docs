=============================
Converting a RasCAL-1 Project
=============================

If you have projects from RasCAL1, there is a simple utility supplied with the toolbox that makes converting between formats easy as explained in :ref:`conversionFuncs`. 

This example shows the conversion of a RasCAL-1 custom layers project into a RAT project and vice versa, because this is a custom layers project, the custom model 
function **Model_IIb.m** which in the example directory is required to run the converted RAT project successfully. 

This example can be run using the instructions below.

.. tab-set::
    :sync-group: code

    .. tab-item:: Matlab
        :sync: Matlab  

        .. note:: The custom model used is a MATLAB model - **examples/miscellaneous/convertRascal1Project/Model_IIb.m**.      
        
        **Run Interactively**: 

        .. code-block:: Matlab 
        
            root = getappdata(0, 'root');
            cd(fullfile(root, 'examples', 'miscellaneous', 'convertRascal1Project'));
            edit convertRascal.mlx


    .. tab-item:: Python 
        :sync: Python  

        .. note:: The custom model used is a MATLAB model - **RATapi.examples.convert_rascal_project.Model_IIb.m**. 
            A python version is provided for the jupyter notebook - **RATapi.examples.convert_rascal_project.Model_IIb.py**

        **Run Script**:  
        
        .. code-block:: console 
            
            python RATapi.examples.convert_rascal_project.convert_rascal.py

        **Run as Function**:  
        
        .. code-block:: Python 
            
            import RATapi as RAT
            problem, results = RAT.examples.convert_rascal_project.convert_rascal()
        
        **Run Interactively**:  
        
        .. code-block:: console 
            
            jupyter notebook RATapi.examples.convert_rascal_project.convert_rascal.ipynb
