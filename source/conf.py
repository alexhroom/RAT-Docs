# This file only contains a selection of the most common options. For a full
# list see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html
# -- Path setup --------------------------------------------------------------
# If extensions (or modules to document with autodoc) are in another directory,
# add these directories to sys.path here. If the directory is relative to the
# documentation root, use os.path.abspath to make it absolute, like shown here.
import os
import sys
import datetime
from urllib.parse import urljoin
# -- Project information -----------------------------------------------------
# Add any Sphinx extension module names here, as strings. They can be
# extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
# ones.
exclude_patterns = []
current_dir = os.path.dirname(os.path.abspath(__file__))
# matlab_src_dir is required for sphinxcontrib-matlabdomain
matlab_src_dir = os.path.abspath(os.path.join(current_dir, '..', 'API'))
if not os.path.isdir(matlab_src_dir) or not os.path.isfile(os.path.join(matlab_src_dir, 'version.txt')):
    raise FileNotFoundError(f'A RAT MATLAB release could not be found in {matlab_src_dir}. ' 
                            'Please download and extract the RAT release to the API folder.')
sys.path.insert(0, matlab_src_dir)

import RATapi
sys.path.insert(0, os.path.dirname(os.path.abspath(RATapi.__file__)))
project = 'RAT'
copyright = u'2022-{}, ISIS Neutron and Muon Source'.format(datetime.date.today().year)
author = 'Arwel Hughes, Sethu Pastula, Alex Room, Rabiya Farooq, Paul Sharp, Stephen Nneji'

# The full version, including alpha/beta/rc tags
sys.path.insert(0, os.path.dirname(os.path.abspath(".")))
sys.path.insert(0, os.path.dirname(os.path.abspath("..")))
from version import get_doc_version
doc_version = get_doc_version()
    
# -- General configuration ---------------------------------------------------

# add extensions path for snippets
sys.path.append(os.path.abspath("./_ext"))

extensions = ['sphinxcontrib.matlab', 'sphinx.ext.autodoc', 'sphinx.ext.autosummary', 'sphinx_design', 'sphinx_copybutton', 'snippets', 'nbsphinx']

# Add any paths that contain templates here, relative to this directory.
templates_path = ['_templates']

# -- Options for HTML output -------------------------------------------------
#set primary_domain = 'matlab'
primary_domain = None
matlab_keep_package_prefix = False
# The theme to use for HTML and HTML Help pages.  See the documentation for
# a list of builtin themes.
html_theme = 'pydata_sphinx_theme'
bgcolor = 'white'

# Add any paths that contain custom static files (such as style sheets) here,
# relative to this directory. They are copied after the builtin static files,
# so a file named "default.css" will overwrite the builtin "default.css".
html_favicon = "_static/logo.png"
html_static_path = ['_static']
html_css_files = ["custom.css"]
html_logo = '_static/logo.png'
 
url = os.environ.get('RAT_URL', '') 
        
html_theme_options = {'show_prev_next': False,
                      'pygment_light_style': 'tango',
                      'pygment_dark_style': 'monokai',
                      'navbar_start': ['navbar-logo', 'version-switcher'],
                      'switcher': {'json_url': urljoin(url, 'switcher.json'), 
                                   'version_match': doc_version,
                                   'check_switcher': False,},
                      'secondary_sidebar_items': {
                                '**': ['page-toc'],
                                'index': [],
                                'install': [],},
                     }
html_sidebars = {
    'install': []
}

copybutton_prompt_text = r">>> |>> "
copybutton_prompt_is_regexp = True
