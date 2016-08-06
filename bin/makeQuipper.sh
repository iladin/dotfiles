wget http://www.mathstat.dal.ca/~selinger/quipper/downloads/quipper-0.8.tgz
tar -xvf quipper-0.8.tgz
cd quipper-0.8
sudo apt-get ghc cabal-install
cabal update
cabal install mtl primes Lattices zlib easyrender fixedprec newsynth containers set-monad QuickCheck random
make
