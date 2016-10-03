#!/bin/bash

# Just a quick bash snippet for setting Munge From on all mailing lists on a
# Mailman 2.x server.

for i in $(ls -1 /var/lib/mailman/lists); do
  /var/lib/mailman/bin/config_list -o ./$i.cfg $i;
  sed -i 's/^from_is_list = 0$/from_is_list = 1/g' ./$i.cfg;
  /var/lib/mailman/bin/config_list -i ./$i.cfg $i;
  rm $i.cfg;
done
