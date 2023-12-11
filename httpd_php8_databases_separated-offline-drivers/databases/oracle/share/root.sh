#!/bin/sh
unset WAS_ROOTMACRO_CALL_MADE
. /opt/oracle/product/19c/dbhome_1/install/utl/rootmacro.sh "$@"
. /opt/oracle/product/19c/dbhome_1/install/utl/rootinstall.sh
/opt/oracle/product/19c/dbhome_1/suptools/tfa/release/tfa_home/install/roottfa.sh
/opt/oracle/product/19c/dbhome_1/install/root_schagent.sh

#
# Root Actions related to network
#
/opt/oracle/product/19c/dbhome_1/network/install/sqlnet/setowner.sh 

#
# Invoke standalone rootadd_rdbms.sh
#
/opt/oracle/product/19c/dbhome_1/rdbms/install/rootadd_rdbms.sh

/opt/oracle/product/19c/dbhome_1/rdbms/install/rootadd_filemap.sh 
