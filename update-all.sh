#!/bin/bash

wget -q -O - https://gist.githubusercontent.com/basdelfos/2e193798ff3aa14d24d5cc05d61ad1f3/raw/setup.sh | bash

echo -e "\n-----------\n"

update-os.sh $@
