#!/bin/bash

echo "Starting PyTorch Vulkan installation for Linux..."

# Navigate to the PyTorch directory
cd pytorch || { echo "Error: 'pytorch' directory not found. Please run this script from the directory containing the 'pytorch' folder."; exit 1; }

# Install PyTorch
echo "Installing PyTorch with pip..."
pip install . || { echo "Error: PyTorch installation failed."; exit 1; }

# Install TorchVision
echo "Installing TorchVision with pip..."
cd ../torchvision || { echo "Error: 'torchvision' directory not found."; exit 1; }
pip install . || { echo "Error: TorchVision installation failed."; exit 1; }

# Install TorchAudio
echo "Installing TorchAudio with pip..."
cd ../torchaudio || { echo "Error: 'torchaudio' directory not found."; exit 1; }
pip install . || { echo "Error: TorchAudio installation failed."; exit 1; }

echo "PyTorch, TorchVision, and TorchAudio Vulkan installation completed successfully."
