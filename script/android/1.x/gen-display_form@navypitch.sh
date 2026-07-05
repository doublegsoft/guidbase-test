export GUIDBASE_DATA_ROOT=/Users/christian/export/local/works/doublegsoft.io/guidbase/03.Development/guidbase-data
export GUIDBASE_JAR=/Users/christian/export/opt/guidbase/protosys-plugin-guidbase-7.0-shaded.jar
export PROJBASE_DATA_ROOT=/Users/christian/export/local/works/doublegsoft.io/projbase/03.Development/projbase-data
export PROJBASE_JAR=/Users/christian/export/opt/projbase/protosys-plugin-projbase-7.0-shaded.jar
export TATABASE_DATA_ROOT=/Users/christian/export/local/works/doublegsoft.io/tatabase/03.Development/tatabase-data
export TATABASE_JAR=/Users/christian/export/opt/tatabase/protosys-plugin-tatabase-7.0-shaded.jar

export OUTPUT_ROOT=out

export SPEC=display_form
export APPNAME=display_form
export NAMESPACE=df
export MOBELBASE_MODEL=
export GUIDBASE_MODEL=spec/$SPEC.guidbase
export PROJECT_NAME="$SPEC"@navypitch"#"android-1.x
export PROJECT_ROOT=$OUTPUT_ROOT/$PROJECT_NAME
################################################################################
##                                                                            ##
##                              ANDROID (KOTLIN)                              ##
##                                                                            ##
################################################################################
REPOS=("kotlin-mobile@android-1.x" "kotlin-mobile@navypitch#android-1.x" \
       "kotlin-sdk@kotlin-1.x")

for repo in "${REPOS[@]}"
do
export TEMPLATE_ROOT=$GUIDBASE_DATA_ROOT/kotlin/$repo

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
\{\"form\":\"表单\"\}\
\} 2>&1
done

################################################################################
##                                                                            ##
##                              ANDROID (KOTLIN)                              ##
##                                                                            ##
################################################################################
export TEMPLATE_ROOT=$PROJBASE_DATA_ROOT/kotlin/kotlin-mobile@android-1.x

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
