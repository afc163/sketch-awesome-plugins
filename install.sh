#!/bash/sh
PLUGINS_DIR=~/Library/Application\ Support/com.bohemiancoding.sketch3/Plugins/
PLUGINS_URL=(
  "nathco/Clear-Styles"
)

echo "==================================="
echo "START Installation"
echo "==================================="
echo ""

for plugin_url in $PLUGINS_URL
do
  plugin_url="https://codeload.github.com/${plugin_url}/zip/master"
  echo "DOWNLOAD $plugin_url"
  curl -o  temp.zip $plugin_url
  unzip -o temp.zip -d "${PLUGINS_DIR}"
  echo "INSTALLED $plugin_url"  
  rm temp.zip
  echo ""
done

echo "==================================="
echo "FINISH Installation"
for plugin_url in $PLUGINS_URL
do
  plugin_url="https://codeload.github.com/${plugin_url}/zip/master"
  echo "INSTALLED LIST:"
  echo " $plugin_url"
done
echo "==================================="
