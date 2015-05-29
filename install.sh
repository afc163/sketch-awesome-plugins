#!/bash/sh
PLUGINS_DIR=~/Library/Application\ Support/com.bohemiancoding.sketch3/Plugins/
PLUGINS_URL=(
  "nathco/Clear-Styles"
  "petehouston/sketch-guides"
)

<<<<<<< HEAD
echo "==================================="
echo "Start Installation"
echo "==================================="
=======
echo "===================================================="
echo "START Installation"
echo "===================================================="
>>>>>>> 3755ce11fdef1c5c98229efda27130101dc4b56c
echo ""

for plugin_url in ${PLUGINS_URL[@]}
  do
    plugin_name=${plugin_url#*/}
    plugin_name=${plugin_name/-/ }
    echo $plugin_name
    plugin_url="https://codeload.github.com/${plugin_url}/zip/master"
    echo "DOWNLOAD $plugin_url"
    curl -o  temp.zip $plugin_url
    unzip -oj temp.zip -d "${PLUGINS_DIR}/${plugin_name}"
    rm temp.zip
    echo ""
done

<<<<<<< HEAD
echo "==================================="
echo "Finish Installation"
=======
echo "===================================================="
echo "FINISH Installation. INSTALLED LIST:"
>>>>>>> 3755ce11fdef1c5c98229efda27130101dc4b56c
for plugin_url in $PLUGINS_URL
do
  echo "  $plugin_url"
done
echo "===================================================="
