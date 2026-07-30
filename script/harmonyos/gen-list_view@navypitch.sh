export MODELBASE_DATA_ROOT=/Users/christian/export/local/works/doublegsoft.io/modelbase/03.Development/modelbase-data
export MODELBASE_JAR=/Users/christian/export/opt/modelbase/protosys-plugin-modelbase-7.0-shaded.jar
export GUIDBASE_DATA_ROOT=/Users/christian/export/local/works/doublegsoft.io/guidbase/03.Development/guidbase-data
export GUIDBASE_JAR=/Users/christian/export/opt/guidbase/protosys-plugin-guidbase-7.0-shaded.jar
export PROJBASE_DATA_ROOT=/Users/christian/export/local/works/doublegsoft.io/projbase/03.Development/projbase-data
export PROJBASE_JAR=/Users/christian/export/opt/projbase/protosys-plugin-projbase-7.0-shaded.jar
export TATABASE_DATA_ROOT=/Users/christian/export/local/works/doublegsoft.io/tatabase/03.Development/tatabase-data
export TATABASE_JAR=/Users/christian/export/opt/tatabase/protosys-plugin-tatabase-7.0-shaded.jar

export OUTPUT_ROOT=out

export SPEC=list_view
export APPNAME=list_view
export NAMESPACE=com.doublegsoft
export MOBELBASE_MODEL=spec/modelbase/$SPEC.modelbase
export GUIDBASE_MODEL=spec/$SPEC.guidbase
export PROJECT_NAME="$SPEC".harmonyos"."navypitch-1.x
export PROJECT_ROOT=$OUTPUT_ROOT/$PROJECT_NAME
################################################################################
##                                                                            ##
##                            HARMONYOS (TYPESCRIPT)                          ##
##                                                                            ##
################################################################################
REPOS=("typescript-mobile@harmonyos-1.x" "typescript-mobile@harmonyos#navypitch-1.x" \
       "typescript-sdk@harmonyos#http-1.x")

for repo in "${REPOS[@]}"
do
export TEMPLATE_ROOT=$GUIDBASE_DATA_ROOT/typescript/$repo

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
\"naming\":\"com.doublegsoft.jcommons.programming.java.JavaConventions\",\
\"globalNamingConvention\":\"com.doublegsoft.jcommons.programming.java.JavaNamingConvention\",\
\"language\":\"javascript\",\
\"imports\":\
\[\],\
\"dependencies\":\
\[\],\
\"designSystem\":\"navypitch\",\
\"modules\":\
\{\"list\":\"列表\"\}\
\} 2>&1
done

################################################################################
##                                                                            ##
##                            HARMONYOS (TYPESCRIPT)                          ##
##                                                                            ##
################################################################################
export TEMPLATE_ROOT=$PROJBASE_DATA_ROOT/typescript/typescript-mobile@harmonyos-1.x

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
\"naming\":\"com.doublegsoft.jcommons.programming.java.JavaConventions\",\
\"globalNamingConvention\":\"com.doublegsoft.jcommons.programming.java.JavaNamingConvention\",\
\"language\":\"javascript\",\
\"imports\":\
\[\],\
\"dependencies\":\
\[\]\
\} 2>&1

################################################################################
##                                                                            ##
##                                      SDK                                   ##
##                                                                            ##
################################################################################
#REPOS=("kotlin/kotlin-sdk@dto-1.x" "kotlin/kotlin-poco@gui-1.x")
#
#export MOBELBASE_MODEL=spec/modelbase/$SPEC.modelbase
#
#for repo in "${REPOS[@]}"
#do
#export TEMPLATE_ROOT=$MODELBASE_DATA_ROOT/$repo
#
#java -jar $MODELBASE_JAR \
#--model=$MOBELBASE_MODEL \
#--template-root=$TEMPLATE_ROOT \
#--output-root=$PROJECT_ROOT/app \
#--license=LICENSE \
#--globals=\
#\{\
#\"application\":\"$APPNAME\",\
#\"namespace\":\"$NAMESPACE\",\
#\"artifact\":\"$APPNAME\",\
#\"version\":\"1.0.0\",\
#\"description\":\"\",\
#\"naming\":\"com.doublegsoft.jcommons.programming.java.JavaConventions\",\
#\"globalNamingConvention\":\"com.doublegsoft.jcommons.programming.java.JavaNamingConvention\",\
#\"language\":\"java\",\
#\"imports\":\
#\[\],\
#\"dependencies\":\
#\[\]\
#\} 2>&1
#done

################################################################################
##                                                                            ##
##                                    TEST                                    ##
##                                                                            ##
################################################################################
#REPOS=("kotlin/kotlin-sdk@memory-1.x")
#
#export MOBELBASE_MODEL=spec/modelbase/$SPEC.modelbase
#
#for repo in "${REPOS[@]}"
#do
#export TEMPLATE_ROOT=$TATABASE_DATA_ROOT/$repo
#
#java -jar $TATABASE_JAR \
#--modelbase-model=$MOBELBASE_MODEL \
#--guidbase-model=$GUIDBASE_MODEL \
#--template-root=$TEMPLATE_ROOT \
#--output-root=$PROJECT_ROOT/app \
#--license=LICENSE \
#--globals=\
#\{\
#\"projectRoot\":\"$PROJECT_ROOT\",\
#\"application\":\"$APPNAME\",\
#\"namespace\":\"$NAMESPACE\",\
#\"artifact\":\"$APPNAME\",\
#\"version\":\"1.0.0\",\
#\"description\":\"\",\
#\"naming\":\"com.doublegsoft.jcommons.programming.javascript.JavaScriptConventions\",\
#\"globalNamingConvention\":\"com.doublegsoft.jcommons.programming.javascript.JavaScriptNamingConvention\",\
#\"language\":\"javascript\",\
#\"imports\":\
#\[\],\
#\"dependencies\":\
#\[\]\
#\} 2>&1
#done

