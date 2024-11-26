#!/bin/bash

# Create backup of current state
timestamp=$(date +%Y%m%d_%H%M%S)
mkdir -p ../maat_backup_$timestamp
cp -r ../* ../maat_backup_$timestamp/

# Create new structure
mkdir -p new_maat/{src,static,backend}

# Copy main project configuration files
cp maat.is/package.json new_maat/
cp maat.is/tsconfig.json new_maat/
cp maat.is/svelte.config.js new_maat/
cp maat.is/vite.config.ts new_maat/
cp maat.is/tailwind.config.js new_maat/
cp maat.is/postcss.config.js new_maat/

# Copy backend
cp -r backend/src/* new_maat/backend/

# Merge src directories (prioritizing newer content)
cp -r src/* new_maat/src/
cp -r maat.is/src/* new_maat/src/

# Copy static assets
cp -r maat.is/static/* new_maat/static/

# Clean up duplicate routes and components
cd new_maat/src/routes
find . -type f -name "+page.svelte" -exec sh -c '
    if [ -f "${0%/*}/+page.ts" ]; then
        mv "${0%/*}/+page.ts" "${0%/*}/+page.ts.bak"
    fi
' {} \;

# Remove old directories
cd ../../..
rm -rf src maat.is frontend backend

# Move new structure into place
mv new_maat/* .
rmdir new_maat

# Update package.json dependencies
npx npm-check-updates -u

echo "Project cleanup complete! Please review the changes and run 'npm install'" 