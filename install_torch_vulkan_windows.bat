@echo off

echo Starting PyTorch Vulkan installation for Windows...

REM Navigate to the PyTorch directory
cd pytorch
IF %ERRORLEVEL% NEQ 0 (
    echo Error: 'pytorch' directory not found. Please run this script from the directory containing the 'pytorch' folder.
    goto :eof
)

REM Install PyTorch
echo Installing PyTorch with pip...
pip install .
IF %ERRORLEVEL% NEQ 0 (
    echo Error: PyTorch installation failed.
    goto :eof
)

REM Install TorchVision
echo Installing TorchVision with pip...
cd ..\torchvision
pip install .
IF %ERRORLEVEL% NEQ 0 (
    echo Error: TorchVision installation failed.
    goto :eof
)

REM Install TorchAudio
echo Installing TorchAudio with pip...
cd ..\torchaudio
pip install .
IF %ERRORLEVEL% NEQ 0 (
    echo Error: TorchAudio installation failed.
    goto :eof
)

echo PyTorch, TorchVision, and TorchAudio Vulkan installation completed successfully.
