rm build/* & cd build
../../../tools/genmake2 -mods=../code -mpi -of=../../../tools/build_options/linux_amd64_gfortran
make depend
make
cp mitgcmuv ../run/.
cd ../run/
