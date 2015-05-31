#!/bash/sh
PLUGINS_DIR=~/Library/Application\ Support/com.bohemiancoding.sketch3/Plugins

## Sketch 插件的 Github 仓库列表
PLUGINS_URL=(
  "nathco/Clear-Styles"
  "petehouston/sketch-guides"
  "nathco/Swap-Fill-Border"
  "mauehara/sketch-page-switch"
  "tadija/AEFlowchart"
  "utom/sketch-measure"
  "PEZ/SketchDistributor"
)

echo "===================================================="
echo "START Installation"
echo "===================================================="
echo ""

for plugin_url in ${PLUGINS_URL[@]}
  do
    plugin_name=${plugin_url#*/}
    plugin_name=$(echo $plugin_name | sed "s/\-/ /g")
    echo $plugin_name
    plugin_url="https://codeload.github.com/${plugin_url}/zip/master"
    echo "DOWNLOAD $plugin_url"
    curl -o  temp.zip $plugin_url
    unzip -oj temp.zip -d "${PLUGINS_DIR}/${plugin_name}"
    rm temp.zip
    echo ""
done

echo "===================================================="
echo "FINISH Installation. INSTALLED LIST:"
for plugin_url in ${PLUGINS_URL[@]}
do
  echo "  $plugin_url"
done
echo "  😀 😀 😀 😀 😀 😀"
echo "===================================================="
