class my-nginx::release::main {
case $::osfamily {
'OpenBSD': {
 case $::operatingsystemrelease {
                '5.4': { include my-nginx::release::openbsd54 }
                '5.5': { include my-nginx::release::openbsd55 }
                default: { include role::web::generic }

                }




}


default: { include role::web::generic }


}

