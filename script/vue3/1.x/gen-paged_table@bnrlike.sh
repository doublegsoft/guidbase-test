export GUIDBASE_DATA_ROOT=/Users/christian/export/local/works/doublegsoft.io/guidbase/03.Development/guidbase-data
export GUIDBASE_JAR=/Users/christian/export/opt/guidbase/protosys-plugin-guidbase-7.0-shaded.jar
export PROJBASE_DATA_ROOT=/Users/christian/export/local/works/doublegsoft.io/projbase/03.Development/projbase-data
export PROJBASE_JAR=/Users/christian/export/opt/projbase/protosys-plugin-projbase-7.0-shaded.jar
export TATABASE_DATA_ROOT=/Users/christian/export/local/works/doublegsoft.io/tatabase/03.Development/tatabase-data
export TATABASE_JAR=/Users/christian/export/opt/tatabase/protosys-plugin-tatabase-7.0-shaded.jar

export OUTPUT_ROOT=out

export SPEC=paged_table
export APPNAME=paged_table
export NAMESPACE=pt
export MOBELBASE_MODEL=
export GUIDBASE_MODEL=spec/$SPEC.guidbase
export PROJECT_ROOT=$OUTPUT_ROOT/"$SPEC"@bnrlike-1.x
################################################################################
##                                                                            ##
##                                     VUE3                                   ##
##                                                                            ##
################################################################################
REPOS=("javascript-desktop@vue3-1.x" "javascript-sdk@vanilla-1.x" \
       "../html/html-desktop@bnrlike#vue3-1.x")

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
\"modules\":\
\{\"table\":\"表格\"\}\
\} 2>&1
done

################################################################################
##                                                                            ##
##                                     VUE3                                   ##
##                                                                            ##
################################################################################
export TEMPLATE_ROOT=$PROJBASE_DATA_ROOT/javascript/javascript-desktop@vue3-1.x

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
REPOS=("markdown/markdown-dataspec@llm-1.x" "tebot/tebot-bnrlike@selenium-1.x" \
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

cd $PROJECT_ROOT && yarn install && yarn run build && cd ../..
