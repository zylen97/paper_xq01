#!/bin/bash
# make-diff.sh — Generate highlighted diff PDF
# Compares manuscript-original.tex vs manuscript.tex
# Output: manuscript-track-changes.pdf (blue=additions, red strikethrough=deletions)

PROJ_DIR="$(cd "$(dirname "$0")/.." && pwd)"
cd "$PROJ_DIR"

ORIGINAL="manuscript-original.tex"
MODIFIED="manuscript.tex"
PREAMBLE="tools/latexdiff-preamble.tex"
DIFF_TEX="manuscript-track-changes.tex"

# Dependency checks
for f in "$ORIGINAL" "$MODIFIED" "$PREAMBLE"; do
    if [ ! -f "$f" ]; then
        echo "[diff] ERROR: $f not found"
        exit 1
    fi
done

echo "[diff] Running latexdiff..."
latexdiff \
    --preamble="$PREAMBLE" \
    --math-markup=coarse \
    "$ORIGINAL" "$MODIFIED" > "$DIFF_TEX" 2>/dev/null

if [ $? -ne 0 ]; then
    echo "[diff] ERROR: latexdiff failed"
    exit 1
fi

# Post-process: fix latexdiff + booktabs incompatibility
# \DIFxxxFL markers before \toprule/\midrule/\bottomrule break \noalign context
echo "[diff] Post-processing diff for booktabs compatibility..."
sed -i '' 's/\\DIFaddendFL \\bottomrule/\\bottomrule/g' "$DIFF_TEX"
sed -i '' 's/\\DIFdelendFL \\bottomrule/\\bottomrule/g' "$DIFF_TEX"
sed -i '' 's/\\DIFaddendFL \\midrule/\\midrule/g' "$DIFF_TEX"
sed -i '' 's/\\DIFdelendFL \\midrule/\\midrule/g' "$DIFF_TEX"
sed -i '' 's/\\DIFaddendFL \\toprule/\\toprule/g' "$DIFF_TEX"
sed -i '' 's/\\DIFdelendFL \\toprule/\\toprule/g' "$DIFF_TEX"
sed -i '' 's/\\DIFaddbeginFL \\toprule/\\toprule/g' "$DIFF_TEX"
sed -i '' 's/\\DIFdelbeginFL \\toprule/\\toprule/g' "$DIFF_TEX"

echo "[diff] Compiling diff PDF..."
latexmk -pvc- -pv- "$DIFF_TEX" 2>/dev/null

if [ $? -eq 0 ]; then
    echo "[diff] SUCCESS: manuscript-track-changes.pdf generated"
else
    echo "[diff] WARNING: Compilation had issues, check build/manuscript-track-changes.log"
    exit 1
fi
