export GUIDBASE_DATA_ROOT=/Users/christian/export/local/works/doublegsoft.io/guidbase/03.Development/guidbase-data
export GUIDBASE_JAR=/Users/christian/export/opt/guidbase/protosys-plugin-guidbase-7.0-shaded.jar
export PROJBASE_DATA_ROOT=/Users/christian/export/local/works/doublegsoft.io/projbase/03.Development/projbase-data
export PROJBASE_JAR=/Users/christian/export/opt/projbase/protosys-plugin-projbase-7.0-shaded.jar

export OUTPUT_ROOT=out

export SPEC=entry_form
export APPNAME=entry_form
export NAMESPACE=biz.doublegsoft
export MOBELBASE_MODEL=
export GUIDBASE_MODEL=spec/$SPEC.guidbase
export PROJECT_ROOT=$OUTPUT_ROOT/"$SPEC"-1.x
################################################################################
##                                                                            ##
##                                     VUE3                                   ##
##                                                                            ##
################################################################################
REPOS=("javascript-universal@vue3-1.x")

for repo in "${REPOS[@]}"
do
export TEMPLATE_ROOT=$GUIDBASE_DATA_ROOT/javascript/$repo

java -jar $GUIDBASE_JAR \
--modelbase=$MOBELBASE_MODEL \
--guidbase=$GUIDBASE_MODEL \
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
\"naming\":\"com.doublegsoft.jcommons.programming.java.JavaConventions\",\
\"globalNamingConvention\":\"com.doublegsoft.jcommons.programming.java.JavaNamingConvention\",\
\"language\":\"java\",\
\"imports\":\
\[\],\
\"dependencies\":\
\[\]\
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

cd $PROJECT_ROOT && yarn install && yarn run build
