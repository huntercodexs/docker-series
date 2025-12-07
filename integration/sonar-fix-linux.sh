#!/usr/bin/env bash
set -e

echo "🧨 Sonar Qube Fix Script Started"
sudo sysctl -w vm.max_map_count=524288 >> /dev/null 2>&1
sudo sysctl -w fs.file-max=131072 >> /dev/null 2>&1
sleep 2
echo "⚠️  System parameters updated"
ulimit -n 131072
ulimit -u 8192
sleep 2
echo "✅ Sonar Qube Fix Script Completed"

