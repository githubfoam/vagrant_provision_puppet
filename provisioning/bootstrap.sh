#!/bin/sh
# set -o errexit
# set -o pipefail
# set -o nounset
# set -o xtrace
# set -eox pipefail #safety for script

  echo "===================================================================================="
                        uname -a
  echo "===================================================================================="
  echo "         \   ^__^                                                                  "
  echo "          \  (oo)\_______                                                          "
  echo "             (__)\       )\/\                                                      "
  echo "                 ||----w |                                                         "
  echo "                 ||     ||                                                         "
  echo "===================================================================================="

apt-get update -qqy
apt-get install -qqy puppet