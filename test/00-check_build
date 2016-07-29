#!/usr/bin/env bash

#!/usr/bin/env bash

trap "exit 255" ERR SIGTERM

echo "Testing image"

docker images | grep -e "^$1 "

exit 0