"""
BECOV时序图绘制脚本（优化版）
绘制8个配置（C1a-C4b）的BECOV时序图（2014-2016年）
特性：双色圆点、优化虚线、扁平布局、Times New Roman字体
"""

import matplotlib.pyplot as plt
import numpy as np

# ========== 全局字体设置 ==========
plt.rcParams['font.family'] = 'Times New Roman'
plt.rcParams['font.size'] = 10

# ========== 数据准备 ==========
years = np.array([2014, 2015, 2016])
configurations = ['C1a', 'C1b', 'C2a', 'C2b', 'C3a', 'C3b', 'C4a', 'C4b']

# BECOV数据（8配置 × 3年）- 最新更新
becov_data = {
    'C1a': [0.048, 0.035, 0.072],
    'C1b': [0.114, 0.082, 0.094],
    'C2a': [0.177, 0.106, 0.157],
    'C2b': [0.113, 0.072, 0.128],
    'C3a': [0.137, 0.084, 0.190],
    'C3b': [0.127, 0.087, 0.185],
    'C4a': [0.096, 0.070, 0.085],
    'C4b': [0.038, 0.029, 0.052]
}

# POCOV数据（8配置）
pocov_data = {
    'C1a': 0.074,
    'C1b': 0.092,
    'C2a': 0.139,
    'C2b': 0.146,
    'C3a': 0.202,
    'C3b': 0.182,
    'C4a': 0.067,
    'C4b': 0.059
}

# ========== 创建扁平化的2行×4列子图 ==========
fig, axes = plt.subplots(2, 4, figsize=(13, 6))
axes = axes.flatten()

# ========== 绘制每个配置的子图 ==========
for i, config in enumerate(configurations):
    ax = axes[i]

    # 提取当前配置的数据
    becov_values = np.array(becov_data[config])
    pocov_value = pocov_data[config]

    # === 1. 绘制优化的折线图（点+线一起） ===
    ax.plot(years, becov_values,
            marker='o',  # 圆点标记
            linestyle=(0, (5, 3)),  # 自定义虚线样式
            color='black',
            linewidth=1.8,
            markersize=8,  # 增大标记点
            markerfacecolor='black',  # 黑色填充
            markeredgecolor='white',  # 白色边框
            markeredgewidth=1.5)  # 边框宽度

    # === 2. 绘制优化的POCOV水平虚线 ===
    ax.axhline(y=pocov_value,
               linestyle=(0, (1, 1)),  # 密集点状虚线
               color='#404040',  # 深灰色
               linewidth=1.2,
               alpha=0.8,  # 提高不透明度
               zorder=0)  # 最底层

    # === 3. 计算并标注2014-2015年变化率（添加%符号） ===
    change_rate = ((becov_values[1] - becov_values[0]) / becov_values[0]) * 100

    # 标注位置：x在2014.5，y在两点平均值稍下方
    x_pos = 2014.5
    y_pos = (becov_values[0] + becov_values[1]) / 2 - 0.012

    # 添加百分比标注（加上%符号）
    ax.text(x_pos, y_pos, f'{change_rate:.1f}%',
            ha='center', va='top',
            fontsize=9, color='black')

    # === 4. 设置标题（仅POCOV值） ===
    ax.set_title(f'POCOV={pocov_value:.3f}',
                 fontsize=11, pad=8)

    # === 5. 设置X轴 ===
    ax.set_xlim(2013.5, 2016.5)
    ax.set_xticks([2014, 2015, 2016])
    ax.tick_params(axis='x', labelsize=10)

    # === 6. 设置配置名称标签（放在底部） ===
    ax.set_xlabel(config, fontsize=11, labelpad=5)

    # === 7. 设置Y轴 ===
    ax.set_ylim(0, 0.25)
    ax.set_yticks(np.arange(0, 0.26, 0.05))
    ax.tick_params(axis='y', labelsize=10)

    # === 8. 保留所有边框 ===
    for spine in ax.spines.values():
        spine.set_visible(True)

# ========== 优化布局 ==========
plt.tight_layout(pad=1.5, h_pad=2.5, w_pad=2.0, rect=[0, 0.05, 1, 1])

# ========== 添加图注 ==========
fig.text(0.5, 0.02,
         'Note: Black circles represent Between-Case Coverage (BECOV) for each configuration across years. '
         'Numbers adjacent to circles indicate percentage changes in coverage from 2014 to 2015. '
         'POCOV denotes Pooled Coverage. Dotted horizontal lines represent POCOV values for each configuration.',
         ha='center', va='bottom', fontsize=10, wrap=True)

# ========== 保存高清图片 ==========
output_path = 'Fig7_becov_2014_2016.pdf'
plt.savefig(output_path, dpi=300, bbox_inches='tight', facecolor='white')
print(f"✅ 优化后的图片已保存至: {output_path}")
print(f"📊 图表尺寸: 13×6英寸 (紧凑布局)")
print(f"🎨 优化特性: 双色圆点 + 点状POCOV线 + 配置名在底部 + Times New Roman字体")

# ========== 显示图片 ==========
plt.show()
