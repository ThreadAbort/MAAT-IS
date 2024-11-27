#!/bin/bash

# Create directories if they don't exist
mkdir -p woff2
mkdir -p css

# Download Noto Sans Egyptian Hieroglyphs if not present
if [ ! -f "NotoSansEgyptianHieroglyphs-Regular.ttf" ]; then
    echo "Downloading Noto Sans Egyptian Hieroglyphs..."
    curl -L "https://github.com/googlefonts/noto-fonts/raw/main/unhinted/ttf/NotoSansEgyptianHieroglyphs/NotoSansEgyptianHieroglyphs-Regular.ttf" -o "NotoSansEgyptianHieroglyphs-Regular.ttf"
fi

# Convert all TTF fonts to WOFF2
for font in *.ttf; do
    if [ -f "$font" ]; then
        echo "Converting $font to WOFF2..."
        woff2_compress "$font"
        mv "${font%.*}.woff2" ./woff2/
    fi
done

# Generate CSS file
cat > ./css/fonts.css << EOL
/* Auto-generated font-face declarations */
$(for font in *.ttf; do
    if [ -f "$font" ]; then
        basename="${font%.*}"
        echo "
@font-face {
    font-family: '${basename}';
    src: url('/fonts/woff2/${basename}.woff2') format('woff2'),
         url('/fonts/${basename}.ttf') format('truetype');
    font-weight: normal;
    font-style: normal;
    font-display: block;
}"
    fi
done)
EOL

echo "Font conversion complete! 🎨"