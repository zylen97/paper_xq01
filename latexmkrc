# LaTeXmk 配置文件 - Elsarticle 模板配置
# 使用 XeLaTeX 编译（支持中文和现代字体）
$pdf_mode = 5;
$xelatex = "xelatex -synctex=1 -interaction=nonstopmode %O %S";

# 启用 BibTeX 编译（用于 elsarticle 参考文献）
$bibtex_use = 2;  # 强制每次运行BibTeX

# 输出目录设置 - 所有编译产物统一到 build/
$aux_dir = "build";
$out_dir = "build";
$emulate_aux_dir = 1;  # 模拟辅助目录，确保xdvipdfmx能正确找到XDV文件

# 编译成功后：拷贝PDF到根目录，清理根目录残留的.spl文件
$success_cmd = 'cp build/*.pdf . 2>/dev/null; mv *.spl build/ 2>/dev/null; true';

# 自动清理辅助文件（包含 BibTeX 相关文件）
$clean_ext = "bbl blg run.xml spl";

# 生成的PDF预览器（macOS）
$pdf_previewer = "open -a Preview %S";

# 自动检测文件变化并重新编译
$preview_continuous_mode = 1;