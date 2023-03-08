#!/bin/bash

[ -f /tmp/PASSWORD ] && echo -e "Credenziali per accedere alla console WAS\nUsername: wsadmin\nPassword: $(cat /tmp/PASSWORD)" || echo "Password non generata, startare prima il server"