#!/bash/sh

## beta version
PLUGINS_DIR=~/Library/Containers/com.bohemiancoding.sketch3.beta/Data/Library/Application\ Support/com.bohemiancoding.sketch3/Plugins
if [ ! -d "${PLUGINS_DIR}" ]
  then
    PLUGINS_DIR=~/Library/Application\ Support/com.bohemiancoding.sketch3/Plugins
fi

## Sketch 插件的 Github 仓库列表
PLUGINS=(
  "nathco/Clear-Styles,清除样式"
  "petehouston/sketch-guides,参考线"
  "nathco/Swap-Fill-Border,图层和边框样式对换"
  "mauehara/sketch-page-switch,页面切换"
  "tadija/AEFlowchart,流程图"
  "utom/sketch-measure,标注工具"
  "PEZ/SketchDistributor,排列元素"
  "frankko/Artboard-Tools,面板工具"
  "Falkeyn/Modulizer,图层间距工具"
)

echo "===================================================="
echo "START Installation"
echo "===================================================="
echo ""

for plugin in ${PLUGINS[@]}
  do
    ## 拿到 url
    plugin_url=${plugin%,*}
    plugin_full_url="https://codeload.github.com/${plugin_url}/zip/master"
    ## 拿到插件名称
    plugin_name=${plugin#*/}
    plugin_name=$(echo $plugin_name | sed "s/\,/ /g")

    echo "DOWNLOAD $plugin_name"
    echo "  from $plugin_full_url"
    curl -o temp.zip $plugin_full_url
    unzip -o temp.zip -d "${PLUGINS_DIR}"
    plugin_repo_name=${plugin_url#*/}
    if  [ -d "${PLUGINS_DIR}/${plugin_name}" ]
      then
        rm -rf "${PLUGINS_DIR}/${plugin_name}"
    fi
    mv "${PLUGINS_DIR}/${plugin_repo_name}-master" "${PLUGINS_DIR}/${plugin_name}"
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
