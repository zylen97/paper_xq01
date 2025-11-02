# LaTeXmk 配置文件 - Elsarticle 模板配置
# 使用 XeLaTeX 编译（支持中文和现代字体）
$pdf_mode = 5;
$xelatex = "xelatex -synctex=1 -interaction=nonstopmode %O %S";

# 启用 BibTeX 编译（用于 elsarticle 参考文献）
$bibtex_use = 2;  # 强制每次运行BibTeX

# 输出目录设置 - 临时文件放到build，PDF放根目录
$aux_dir = "build";
# $out_dir 不设置，PDF默认输出到根目录

# 自动清理辅助文件（包含 BibTeX 相关文件）
$clean_ext = "bbl blg run.xml";

# 生成的PDF预览器（macOS）
$pdf_previewer = "open -a Preview %S";

# 自动检测文件变化并重新编译
$preview_continuous_mode = 1;