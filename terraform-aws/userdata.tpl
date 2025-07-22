#!/bin/bash
sudo hostnamectl set-hostname mtc-${nodename} && curl -sL https://get.k3s.io | sh -s - server \
--datastore-endpoint="mysql://${dbuser}:${dbpass}@tcp(${db_endpoint})/${dbname}" \
--token="th1s1sat0k3n" \
--write-kubeconfig-mode 644
sudo ln -s /usr/local/bin/k3s /usr/local/bin/kubectl