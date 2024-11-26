#!/bin/bash

# Backup current state
timestamp=$(date +%Y%m%d_%H%M%S)
mkdir -p ../maat_backup_$timestamp
cp -r . ../maat_backup_$timestamp/

# Remove all node_modules and lock files
rm -rf node_modules
rm -rf package-lock.json
rm -rf pnpm-lock.yaml
rm -rf yarn.lock

# Clean up duplicate directories
rm -rf frontend/
rm -rf maat.is/
rm -rf backend/

# Create fresh structure
mkdir -p src/{lib/{components,services,stores},routes}
mkdir -p static 