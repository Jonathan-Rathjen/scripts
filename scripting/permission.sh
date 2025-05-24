#!/bin/bash

touch $1
chmod 744 $1
echo '#!/bin/bash' >> $1
