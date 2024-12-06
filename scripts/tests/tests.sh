# SANITY CHECK tests
# This is a temporary solution we want something more standard then a custom script 
# in the future.
# This tests could take a large amount of time

VERSION=0.23.0

# Generate modules
python3 ../generate_modules.py $VERSION --output modules/spack
module use modules
module load spack/$VERSION

# Config sanity checks
echo "spack version found: $(spack --version | grep $VERSION | wc -l)"
echo "gcc 11 compiler found: $(spack compilers | grep gcc@11 | wc -l)"
echo "gcc 10 compiler found: $(spack compilers | grep gcc@11 | wc -l)"
echo "cce 15 compilers found: $(spack compilers | grep cce@15 | wc -l)"

# Check we can build and run a few example packages
spack install lammps
spack install quantum-espresso

# Check that we can run a package on the compute nodes
sbatch submit_lammps.sh