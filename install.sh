#!/bash/sh
PLUGINS_DIR=~/Library/Application\ Support/com.bohemiancoding.sketch3/Plugins

## Sketch 插件的 Github 仓库列表
PLUGINS=(
  "nathco/Clear-Styles,清除样式"
  "petehouston/sketch-guides,参考线"
  "nathco/Swap-Fill-Border,清除样式"
  "mauehara/sketch-page-switch,页面切换"
  "tadija/AEFlowchart,流程图"
  "utom/sketch-measure,快速标注"
  "PEZ/SketchDistributor,排列元素"
)

echo "===================================================="
echo "START Installation"
echo "===================================================="
echo ""

for plugin in ${PLUGINS[@]}
  do
    ## 拿到 url
    plugin_url=${plugin%,*}
    plugin_url="https://codeload.github.com/${plugin_url}/zip/master"
    ## 拿到插件名称
    plugin_name=${plugin#*/}
    plugin_name=$(echo $plugin_name | sed "s/\,/ /g")

    echo "DOWNLOAD $plugin_name"
    echo "  from $plugin_url"
    curl -o temp.zip $plugin_url
    unzip -oj temp.zip -d "${PLUGINS_DIR}/${plugin_name}"
    rm temp.zip
    echo ""
done

echo "===================================================="
echo "FINISH Installation. INSTALLED LIST:"
for plugin in ${PLUGINS[@]}
do
  echo "  $plugin"
done
echo "  😀 😀 😀 😀 😀 😀"
echo "===================================================="
