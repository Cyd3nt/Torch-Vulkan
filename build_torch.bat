@echo off
CALL "C:\Program Files\Microsoft Visual Studio\2022\Preview\VC\Auxiliary\Build\vcvarsall.bat" x64
IF %ERRORLEVEL% NEQ 0 (
    ECHO Error: vcvarsall.bat failed.
    EXIT /B %ERRORLEVEL%
)

REM Set INCLUDE and LIB environment variables after vcvarsall.bat
SET INCLUDE=%INCLUDE%;C:\Program Files\Microsoft Visual Studio\2022\Preview\VC\Tools\MSVC\14.44.35207\include;C:\Program Files (x86)\Windows Kits\10\Include\10.0.26100.0\ucrt;C:\Program Files (x86)\Windows Kits\10\Include\10.0.26100.0\um;C:\Program Files (x86)\Windows Kits\10\Include\10.0.26100.0\shared
SET LIB=%LIB%;C:\Program Files\Microsoft Visual Studio\2022\Preview\VC\Tools\MSVC\14.44.35207\lib\x64;C:\Program Files (x86)\Windows Kits\10\Lib\10.0.26100.0\ucrt\x64;C:\Program Files (x86)\Windows Kits\10\Lib\10.0.26100.0\um\x64

REM Clone repositories if they don't exist
if not exist pytorch ( git clone --recursive https://github.com/pytorch/pytorch.git )
if not exist torchvision ( git clone https://github.com/pytorch/vision.git torchvision )
if not exist torchaudio ( git clone https://github.com/pytorch/audio.git torchaudio )

cd pytorch\build
IF %ERRORLEVEL% NEQ 0 (
    ECHO Error: Failed to change directory to pytorch\build.
    EXIT /B %ERRORLEVEL%
)
cmake -GNinja -DUSE_VULKAN=ON -DUSE_EXECUTORCH=ON -DUSE_CUDA=OFF -DUSE_DISTRIBUTED=ON -DVULKAN_SDK=E:/torch-vulkan/VulkanSDK/1.4.321.1 ..
IF %ERRORLEVEL% NEQ 0 (
    ECHO Error: CMake configuration failed.
    EXIT /B %ERRORLEVEL%
)
ninja install
IF %ERRORLEVEL% NEQ 0 (
    ECHO Error: Ninja build failed.
    EXIT /B %ERRORLEVEL%
)
ECHO Build process completed.