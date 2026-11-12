#!/bin/bash
len=${1:-8}
tr -dc 'A-Za-z0-9!@#%&*_+-=' </dev/urandom | head -c "$len"; echo
