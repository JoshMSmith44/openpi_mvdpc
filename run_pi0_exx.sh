# Run pi0 at PAL EXX 

# Here is server computing side, 
# you also need to run the pi0 on franka laptop

# Memory optimization for JAX
# Controls the fraction of GPU memory JAX will use (default is 0.75)
# export XLA_PYTHON_CLIENT_MEM_FRACTION=0.3
# Alternative: Prevent JAX from preallocating memory
# export XLA_PYTHON_CLIENT_PREALLOCATE=false

# conda activate openpi
# export CUDA_VISIBLE_DEVICES=1  # Use second GPU
#  Link torch to with correct cuda version for UV
export LD_LIBRARY_PATH=/home/exx/Projects/openpi-main/.venv/lib/python3.11/site-packages/torch/lib/../../nvidia/nvjitlink/lib:$LD_LIBRARY_PATH

# uv run, notice the program will not halt
uv run scripts/serve_policy.py policy:checkpoint --policy.config=pi0_droid_mvdpc --policy.dir=s3://openpi-assets/checkpoints/pi0_droid

# YOU NEED TO KILL THE PROCESS MANUALLY


