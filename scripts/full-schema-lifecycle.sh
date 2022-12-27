
Help()
{
    # Display Help
    echo "Script usage:"
    echo
    #echo "Introduction"
    #echo
    echo "options:"
    echo "v     Specify the version of the schema to be managed."
    echo "l     Specify if the version is the latest."
    echo "c     Specify alternate config filepath for JSON Schema for Humans. (Default: ./jsfh-config.yaml)"
    echo "f     Specify alternate source file name. (Default: schema-dev.json)"
   echo
}

GREEN=$'\e[0;32m'
RED=$'\e[0;31m'
CYAN=$'\e[0;36m'
YELLOW=$'\e[0;33m'
MAGENTA=$'\e[0;35m'
NC=$'\e[0m'

Version=""
Latest=false
StartingFile="schema-dev.json"

while getopts ":hv:lf:c:" option; do
    case $option in
        h) # display Help
            Help
            exit;;
        v) # enter a name
            Version=$OPTARG;;
        l) #Latest
            Latest=true;;
        f) # not used
            ;;
        c) # not used
            ;;
        \?) # Invalid option
            echo "Error: Invalid option"
            echo "Use -h to see all available options"
            exit;;
   esac
done

echo "${GREEN} BEGIN full-schema-lifecycle.sh ${NC}"
echo "Version: $Version"
echo "Latest: $Latest"

echo "${CYAN} BEGIN update-schema.sh ${NC}"
./update-schema.sh $@ || { echo "${RED} ERROR Something went wrong in update-schema.sh"; exit 1; }
echo "${CYAN} END update-schema.sh ${NC}"

echo "${YELLOW} BEGIN build-schema-doc.sh ${NC}"
./build-schema-doc.sh $@ || { echo "${RED} ERROR Something went wrong in build-schema-doc.sh"; exit 1; }
echo "${YELLOW} END build-schema-doc.sh ${NC}"

echo "${MAGENTA} BEGIN deploy-schema-doc.sh ${NC}"
./deploy-schema-doc.sh $@ || { echo "${RED} ERROR Something went wrong in deploy-schema-doc.sh"; exit 1; }
echo "${MAGENTA} END deploy-schema-doc.sh ${NC}"

echo "${GREEN} END full-schema-lifecycle.sh LIFECYCLE SUCCESSFUL"