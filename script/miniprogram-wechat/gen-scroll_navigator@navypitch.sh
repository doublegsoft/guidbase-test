export GUIDBASE_DATA_ROOT=/Users/christian/export/local/works/doublegsoft.io/guidbase/03.Development/guidbase-data
export GUIDBASE_JAR=/Users/christian/export/opt/guidbase/protosys-plugin-guidbase-7.0-shaded.jar
export PROJBASE_DATA_ROOT=/Users/christian/export/local/works/doublegsoft.io/projbase/03.Development/projbase-data
export PROJBASE_JAR=/Users/christian/export/opt/projbase/protosys-plugin-projbase-7.0-shaded.jar
export TATABASE_DATA_ROOT=/Users/christian/export/local/works/doublegsoft.io/tatabase/03.Development/tatabase-data
export TATABASE_JAR=/Users/christian/export/opt/tatabase/protosys-plugin-tatabase-7.0-shaded.jar

export OUTPUT_ROOT=out

export SPEC=scroll_navigator
export APPNAME=scroll_navigator
export NAMESPACE=df
export MOBELBASE_MODEL=
export GUIDBASE_MODEL=spec/$SPEC.guidbase
export PROJECT_NAME="$SPEC"@wechat"#"navypitch-1.x
export PROJECT_ROOT=$OUTPUT_ROOT/$PROJECT_NAME
################################################################################
##                                                                            ##
##                             WECHAT MINI PROGRAM                            ##
##                                                                            ##
################################################################################
REPOS=("javascript-miniprogram@wechat-1.x" "javascript-sdk@vanilla-1.x" \
       "../html/html-miniprogram@wechat#navypitch-1.x")

for repo in "${REPOS[@]}"
do
export TEMPLATE_ROOT=$GUIDBASE_DATA_ROOT/javascript/$repo

java -jar $GUIDBASE_JAR \
--modelbase-model=$MOBELBASE_MODEL \
--guidbase-model=$GUIDBASE_MODEL \
--template-root=$TEMPLATE_ROOT \
--output-root=$PROJECT_ROOT \
--license=LICENSE \
--globals=\
\{\
\"application\":\"$APPNAME\",\
\"namespace\":\"$NAMESPACE\",\
\"artifact\":\"$APPNAME\",\
\"version\":\"1.0.0\",\
\"description\":\"\",\
\"naming\":\"com.doublegsoft.jcommons.programming.javascript.JavaScriptConventions\",\
\"globalNamingConvention\":\"com.doublegsoft.jcommons.programming.javascript.JavaScriptNamingConvention\",\
\"language\":\"javascript\",\
\"imports\":\
\[\],\
\"dependencies\":\
\[\],\
\"designSystem\":\"navypitch\",\
\"modules\":\
\{\"form\":\"表单\"\}\
\} 2>&1
done

################################################################################
##                                                                            ##
##                             WECHAT MINI PROGRAM                            ##
##                                                                            ##
################################################################################
export TEMPLATE_ROOT=$PROJBASE_DATA_ROOT/javascript/javascript-miniprogram@wechat-1.x

java -jar $PROJBASE_JAR \
--template-root=$TEMPLATE_ROOT \
--output-root=$PROJECT_ROOT \
--license=LICENSE \
--globals=\
\{\
\"application\":\"$APPNAME\",\
\"apptitle\":\"表单示例\",\
\"namespace\":\"$NAMESPACE\",\
\"artifact\":\"$APPNAME\",\
\"version\":\"1.0.0\",\
\"description\":\"\",\
\"naming\":\"com.doublegsoft.jcommons.programming.javascript.JavaScriptConventions\",\
\"globalNamingConvention\":\"com.doublegsoft.jcommons.programming.javascript.JavaScriptNamingConvention\",\
\"language\":\"javascript\",\
\"imports\":\
\[\],\
\"dependencies\":\
\[\]\
\} 2>&1

################################################################################
##                                                                            ##
##                                    TEST                                    ##
##                                                                            ##
################################################################################
REPOS=("markdown/markdown-dataspec@llm-1.x" \
       "javascript/javascript-sdk@vanilla-1.x")

for repo in "${REPOS[@]}"
do
export TEMPLATE_ROOT=$TATABASE_DATA_ROOT/$repo

java -jar $TATABASE_JAR \
--modelbase-model=$MOBELBASE_MODEL \
--guidbase-model=$GUIDBASE_MODEL \
--template-root=$TEMPLATE_ROOT \
--output-root=$PROJECT_ROOT \
--license=LICENSE \
--globals=\
\{\
\"projectRoot\":\"$PROJECT_ROOT\",\
\"application\":\"$APPNAME\",\
\"namespace\":\"$NAMESPACE\",\
\"artifact\":\"$APPNAME\",\
\"version\":\"1.0.0\",\
\"description\":\"\",\
\"naming\":\"com.doublegsoft.jcommons.programming.javascript.JavaScriptConventions\",\
\"globalNamingConvention\":\"com.doublegsoft.jcommons.programming.javascript.JavaScriptNamingConvention\",\
\"language\":\"javascript\",\
\"imports\":\
\[\],\
\"dependencies\":\
\[\]\
\} 2>&1
done


mkdir -p $PROJECT_ROOT/utils
rm -rf $PROJECT_ROOT/sdk
mv $PROJECT_ROOT/src/sdk $PROJECT_ROOT
rm -rf $PROJECT_ROOT/src

#export DYLD_LIBRARY_PATH=~/export/opt/goolib
#~/export/opt/goolib/goo-sftp-upload \
#--server=10.12.100.82 --port=22 \
#--username=christian --password=ganguo \
#-l $PROJECT_ROOT \
#-r /home/christian/projs/wechat-miniprogram-gen/$PROJECT_NAME
