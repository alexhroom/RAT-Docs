.. _RAT: 

.. title:: Home

.. image:: _static/banner.png
    :alt: RAT banner

Reflectivity Algorithms Toolbox (RAT) is a toolbox for analysing neutron reflectivity data at multiple contrasts.
It has been designed as the calculation engine for the upcoming RasCAL-2,
which will supersede the reflectivity software `RasCAL <https://github.com/arwelHughes/RasCAL_2019>`_. 

It is designed to be flexible, allowing analysis using traditional layer models,
but also using user-defined custom models, which can be parameterised by the user however they wish
(either as an array of layers, or a continuous SLD profile). 
It is also incredibly fast; the core algorithm code is native C++, 
created from the MATLAB source code using `MATLAB Coder <https://www.mathworks.com/products/matlab-coder.html>`_.

By separating the GUI from the toolbox, users can create and run a full analysis from a script, 
which can be written in either our MATLAB or Python API. 
This means that the reflectivity analysis can be integrated alongside other analysis tools written in MATLAB or Python, 
and this analysis script can be provided alongside publications to ensure reproducible data.

RAT contains a number of improvements over legacy RasCAL, including:

* :ref:`Automatic parallelisation<parallelisation>` (MPI) either over contrasts or points using a simple flag
* Advanced interface microslicing using :ref:`adaptive resampling<resampling>`
* Option to write :ref:`custom models<customLanguages>` in MATLAB, Python or C++
* Custom models for background and resolution functions (not yet functional)
* Fast Bayesian analysis using :ref:`DREAM<DREAM>`
* An integrated :ref:`Nested sampler<nestedSampling>` for Bayesian model selection
* Fully validated against ORSO examples
* Ability to :ref:`load and run RasCAL-1 projects<conversionFuncs>` (usually) without modification
* :ref:`Plotting routines<simplePlotting>` for easy visualisation of data and fits
* and more!

.. grid:: 1 1 3 3

    .. grid-item-card::

        Getting started with RAT
        ^^^
        Follow these guides to get started:

        * :ref:`install`: Learn how to install RAT.

        * :ref:`guide`: Learn the core principles of RAT with code snippets.

        * :ref:`matlabExamples`: Jump into some practical examples for the MATLAB interface.

        * :ref:`pythonExamples`: Explore some practical examples for the Python interface.


    .. grid-item-card::

        Go deeper into RAT
        ^^^
        Learn more by diving into the RAT reference:
        
        * :ref:`matlab_api`: Detailed information about all of RAT's MATLAB API.


    .. grid-item-card::

        Get more help
        ^^^

        The easiest way to get help with the project is to start discussions or open an issue on `Github <https://github.com/RascalSoftware/RAT>`_.


.. toctree::
   :hidden:

   Home <self>

.. toctree::
   :hidden:
   :titlesonly:
   
   install
   guide
   reference/matlab/index

