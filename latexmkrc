# LaTeXmk 配置文件 - Elsarticle 模板配置
# 使用 pdfLaTeX 编译
$pdf_mode = 1;
$pdflatex = "pdflatex -synctex=1 -interaction=nonstopmode %O %S";

# 启用 BibTeX 编译（用于 elsarticle 参考文献）
$bibtex_use = 2;  # 强制每次运行BibTeX

# 输出目录设置 - 所有编译产物统一到 build/
$aux_dir = "build";
$out_dir = "build";

# BibTeX 在 build/ 下运行时需要找到根目录的 .bib 文件
$ENV{'BIBINPUTS'} = '..:' . ($ENV{'BIBINPUTS'} || '');

# 编译成功后：拷贝PDF到根目录，若编译的是 manuscript 则自动生成 track-changes PDF
$success_cmd = 'cp build/*.pdf . 2>/dev/null; mv *.spl build/ 2>/dev/null; '
             . 'if [ "%R" = "manuscript" ] && [ -f "manuscript-original.tex" ] && [ -f "tools/latexdiff-preamble.tex" ]; then '
             .   'echo "[auto-diff] Regenerating highlighted diff..." && '
             .   'bash tools/make-diff.sh 2>&1 | tail -1; '
             . 'fi';

# 自动清理辅助文件（包含 BibTeX 相关文件）
$clean_ext = "bbl blg run.xml spl";

# 生成的PDF预览器（macOS）
$pdf_previewer = "open -a Preview %S";

# 自动检测文件变化并重新编译
$preview_continuous_mode = 1;