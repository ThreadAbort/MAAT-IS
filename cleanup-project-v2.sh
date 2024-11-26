#!/bin/bash

# Create backup
timestamp=$(date +%Y%m%d_%H%M%S)
mkdir -p ../maat_backup_v2_$timestamp
cp -r . ../maat_backup_v2_$timestamp/

# Create temporary structure
mkdir -p temp_structure/{src,backend,static}
mkdir -p temp_structure/src/{lib,routes}

# Merge frontend components into main src
cp -r frontend/src/lib/components/* temp_structure/src/lib/components/
cp -r frontend/src/lib/services/* temp_structure/src/lib/services/
cp -r frontend/src/lib/stores/* temp_structure/src/lib/stores/

# Copy main app files
cp src/app.* temp_structure/src/
cp -r src/lib/images temp_structure/src/lib/

# Merge routes (prioritizing frontend routes if they exist)
cp -r src/routes/* temp_structure/src/routes/
cp -r frontend/src/routes/* temp_structure/src/routes/

# Organize backend
mkdir -p temp_structure/backend/{src,config,types}
cp -r backend/src/* temp_structure/backend/src/

# Copy static assets
cp -r static/* temp_structure/static/

# Copy and consolidate config files
cp package.json temp_structure/
cp tsconfig.json temp_structure/
cp svelte.config.js temp_structure/
cp vite.config.ts temp_structure/
cp tailwind.config.js temp_structure/
cp postcss.config.js temp_structure/
cp README.md temp_structure/
cp VosH-AI.md temp_structure/

# Clean up old directories
rm -rf src frontend backend static

# Move new structure into place
cp -r temp_structure/* .
rm -rf temp_structure

# Remove empty directories
find . -type d -empty -delete

# Update dependencies
npx npm-check-updates -u

echo "Project cleanup v2 complete! Please review the changes and run 'npm install'" 