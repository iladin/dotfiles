#!/usr/bin/env bash
git clone git://github.com/mooz/percol.git
cd percol
python setup.py install --prefix=~/.local
export PATH=~/.local/bin:$PATH