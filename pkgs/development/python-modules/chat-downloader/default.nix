{ lib
, buildPythonPackage
, fetchPypi
, requests
, isodate
, docstring-parser
, colorlog
, websocket-client
, pytestCheckHook
}:

buildPythonPackage rec {
  pname = "chat-downloader";
  version = "0.2.5";
  format = "setuptools";

  src = fetchPypi {
    inherit version pname;
    hash = "sha256-nxk1VcZr5teuev4cFrtUSIeZNQ8ynpk0n0obGTxqepA=";
  };

  propagatedBuildInputs = [
    requests
    isodate
    docstring-parser
    colorlog
    websocket-client
  ];

  # Tests try to access the network.
  doCheck = false;

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "chat_downloader" ];

  meta = with lib; {
    description = "A simple tool used to retrieve chat messages from livestreams, videos, clips and past broadcasts";
    homepage = "https://github.com/xenova/chat-downloader";
    changelog = "https://github.com/xenova/chat-downloader/releases/tag/v${version}";
    license = licenses.mit;
    maintainers = with maintainers; [ marsam ];
  };
}
