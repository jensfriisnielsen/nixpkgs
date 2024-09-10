{
  lib,
  buildPythonPackage,
  pythonOlder,

  # build-system
  flit-core,

  # dependencies
  pyproject-metadata,
  packaging,
  rich,
  nodeenv,
  setuptools,
  build,
  click,
  sphinx-autobuild,
  tomli,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "sphinx-theme-builder";
  version = "0.2.0b2";
  format = "pyproject";
  disabled = pythonOlder "3.6";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-l72fjczuuDXg/cDiqJ7roNVm4X+au+1u4AA8Szs1bNo=";
  };

  build-system = [ flit-core ];

  dependencies =
    [
      pyproject-metadata
      packaging
      rich
      nodeenv
      setuptools
      # extra[cli]
      build
      click
      sphinx-autobuild
    ]
    ++ lib.optionals (pythonOlder "3.11") [ tomli ]
    ++ lib.optionals (pythonOlder "3.8") [ typing-extensions ];

  meta = {
    description = "A tool for authoring Sphinx themes with a simple (opinionated) workflow.";
    longDescription = ''
      Streamline the Sphinx theme development workflow, by building upon existing standardised tools.

      - simplified packaging experience
      - simplified JavaScript tooling setup
      - development server, with rebuild-on-save and automagical browser reloading
      - consistent repository structure across themes
    '';
    homepage = "https://pypi.org/project/sphinx-theme-builder/";
    changelog = "https://sphinx-theme-builder.readthedocs.io/en/latest/changelog/";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ jensfriisnielsen ];
  };
}
