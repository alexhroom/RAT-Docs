.. _savingOutputs:

==========================
Copying and Saving Outputs
==========================
When you have completed your analysis, usually you will want to save a copy of your work for subsequent analysis. The **Project** can either be cloned so analysis is 
attempted with different parameters without risk of losing the best fits, or it can be saved to a file or as a script as detailed in the sections below  

****************
Saving to a file
****************
After a RAT calculation run, ``problem`` is the problem definition with updated fit parameters, ``controls`` is the settings used for the calculation and ``results`` is the computed reflectivities, SLDs and so on. 


.. image:: ../images/ratInput.png
    :width: 600
    :alt: RAT input model


Saving these objects to the current file directory can be done as shown below.

.. tab-set-code::
    .. code-block:: Matlab

        myResults = struct('problem', problem, 'results', results, 'controls', controls);
        save('myResultsFile.mat', 'myResults');

    .. code-block:: Python

        import pickle

        problem.save('problem.json')
        controls.save('controls.json')
        # Result file is saved using the builtin "pickle" library
        with open('results.pickle', 'wb') as result_file:
            # dump result into that file
            pickle.dump(results, result_file)

Later on, the objects can be loaded from the save directory as shown below:

.. tab-set-code::
    .. code-block:: Matlab

        myWork = load('myResultsFile.mat');
        problem = myWork.myResults.problem;
        controls = myWork.myResults.controls;
        results = myWork.myResults.results;

    .. code-block:: Python
            
        problem = RAT.Project.load('problem.json')
        controls = RAT.Controls.load('controls.json')
        with open('results.pickle', 'rb') as result_file:
            # load result from file
            results = pickle.load(result_file)


***********************
Copying a project class
***********************
During an analysis, it may be necessary to make a copy of your project, so that you can modify one of them in order 
to carry out some kind of comparison between them for example. 
In the example below, ``problem1`` and ``problem2`` are references to the same instance of the project class so modifying 
``problem2`` will also modify original object ``problem1`` which is not ideal.

.. tab-set-code::
    .. code-block:: Matlab

        >> problem1 = projectClass();
        >> problem2 = problem1;
        >> problem1.geometry

        ans =

            'air/substrate' 
        
        >> problem2.setGeometry('substrate/liquid');
        >> problem1.geometry
        
        ans =

            'substrate/liquid' 
    
    .. code-block:: Python

        >>> problem1 = RAT.Project()
        >>> problem2 = problem1
        >>> print(problem1.geometry)
        
        air/substrate
        
        >>> problem2.geometry = "substrate/liquid"
        >>> print(problem1.geometry)

        substrate/liquid

The proper way to make a copy/clone of the project class is shown in the example below, 

.. tab-set-code::
    .. code-block:: Matlab

        >> problem1 = projectClass();
        >> problem2 = problem1.clone(); % Copy with clone method
        >> problem1.geometry

        ans =

            'air/substrate' 
        
        >> problem2.setGeometry('substrate/liquid');
        >> problem1.geometry
        
        ans =

            'air/substrate'  
    
    .. code-block:: Python

        >>> import copy
        >>> problem1 = RAT.Project()
        >>> problem2 = copy.deepcopy(problem1) # Copy using deepcopy function in the copy module
        >>> print(problem1.geometry)
        
        air/substrate
        
        >>> problem2.geometry = "substrate/liquid"
        >>> print(pproblem1.geometry)

        air/substrate

Now ``problem1`` and ``problem2`` are separate instances of the **Project** class and changing ``problem2`` no longer changes ``problem1``.

*********************
Exporting as a script
*********************
Although saving a binary version of the class is useful, sometimes it would be better to have a script version which will reproduce the class. This can be done as shown below:

.. tab-set-code::
    .. code-block:: Matlab

        problem = projectClass();
        problem.writeScript(script="myProjectScript");
    
    .. code-block:: Python

        problem = RAT.Project()
        problem.write_script(script='myProjectScript')

Then, RAT will create a file containing all the statements needed to re-create your project:

.. tab-set-code::
    .. code-block:: Matlab

        % THIS FILE IS GENERATED FROM RAT VIA THE "WRITESCRIPT" ROUTINE. IT IS NOT PART OF THE RAT CODE.

        project = createProject(name='', calcType='normal', model='standard layers', geometry='air/substrate', absorption=false);

        project.setParameterValue(1, 20);
        project.setParameterLimits(1, 1, 5);
        project.setParameterFit(1, true);
        project.setParameterPrior(1, 'uniform', 0, Inf);


        project.removeBulkIn(1);
        project.addBulkIn('SLD Air', 0, 0, 0, false, 'uniform', 0, Inf);

        project.removeBulkOut(1);
        project.addBulkOut('SLD D2O', 6.2e-06, 6.35e-06, 6.35e-06, false, 'uniform', 0, Inf);

        project.removeScalefactor(1);
        project.addScalefactor('Scalefactor 1', 0.02, 0.23, 0.25, false, 'uniform', 0, Inf);

        project.removeQzshift(1);
        project.addQzshift('Qz shift 1', -0.0001, 0, 0.0001, false, 'uniform', 0, Inf);

        project.removeBackgroundParam(1);
        project.addBackgroundParam('Background Param 1', 1e-07, 1e-06, 1e-05, false, 'uniform', 0, Inf);

        project.removeResolutionParam(1);
        project.addResolutionParam('Resolution par 1', 0.01, 0.03, 0.05, false, 'uniform', 0, Inf);

        project.removeBackground(1);
        project.removeResolution(1);

        project.addBackground('Background 1', 'constant', 'Background Param 1', '', '', '', '');

        project.addResolution('Resolution 1', 'constant', 'Resolution par 1', '', '', '', '');

        project.removeData(1);
        project.addData('Simulation');
        project.setData(1, 'simRange', [0.005 0.7]);

    .. code-block:: Python

        # THIS FILE IS GENERATED FROM RAT VIA THE "WRITE_SCRIPT" ROUTINE. IT IS NOT PART OF THE RAT CODE.

        import RAT
        from RAT.models import *
        from numpy import array, inf

        problem = RAT.Project(
            name='', calculation='normal', model='standard layers', geometry='air/substrate', absorption=False,
            parameters=RAT.ClassList([ProtectedRAT.models.Parameter(name='Substrate Roughness', min=1.0, value=3.0, max=5.0, fit=True, prior_type='uniform', mu=0.0, sigma=inf)]),
            background_parameters=RAT.ClassList([RAT.models.Parameter(name='Background Param 1', min=1e-07, value=1e-06, max=1e-05, fit=False, prior_type='uniform', mu=0.0, sigma=inf)]),
            scalefactors=RAT.ClassList([RAT.models.Parameter(name='Scalefactor 1', min=0.02, value=0.23, max=0.25, fit=False, prior_type='uniform', mu=0.0, sigma=inf)]),
            bulk_in=RAT.ClassList([RAT.models.Parameter(name='SLD Air', min=0.0, value=0.0, max=0.0, fit=False, prior_type='uniform', mu=0.0, sigma=inf)]),
            bulk_out=RAT.ClassList([RAT.models.Parameter(name='SLD D2O', min=6.2e-06, value=6.35e-06, max=6.35e-06, fit=False, prior_type='uniform', mu=0.0, sigma=inf)]),
            resolution_parameters=RAT.ClassList([RAT.models.Parameter(name='Resolution Param 1', min=0.01, value=0.03, max=0.05, fit=False, prior_type='uniform', mu=0.0, sigma=inf)]),
            backgrounds=RAT.ClassList([Background(name='Background 1', type='constant', source='Background Param 1', value_2='', value_3='', value_4='', value_5='')]),
            resolutions=RAT.ClassList([Resolution(name='Resolution 1', type='constant', source='Resolution Param 1', value_2='', value_3='', value_4='', value_5='')]),
            data=RAT.ClassList([Data(name='Simulation')]),
            )


This is useful because you can then edit this file as you wish, to re-use it as a template for further projects.
