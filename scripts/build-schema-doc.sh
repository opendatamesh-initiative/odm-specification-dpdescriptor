
Help()
{
   # Display Help
   echo "Script usage:"
   echo
   #echo "Introduction"
   #echo
   echo "options:"
   echo "v     Specify the version to be built."
   echo "l     Specify if the version is the latest."
   echo "c     Specify alternate config filepath. (Default: ./jsfh-config.yaml)"
   echo
}

Version=""
Latest=false
StartingFile="schema-dev.json"
ConfigFilepath="./jsfh-config.yaml"

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
        c) #Config file name
            ConfigFilepath=$OPTARG;;
        \?) # Invalid option
            echo "Error: Invalid option"
            echo "Use -h to see all available options"
            exit;;
   esac
done

if [ -z $Version ];
then
    echo "Error: A version must be specified using option -v"
    exit;
fi

echo "Version: $Version"
echo "Latest: $Latest"

if [ ! -d ../schemas/v$Version ];
then
    echo "Error: Folder /schemas/v$Version does not exist"
    exit;
fi

if [ ! -f ../schemas/v$Version/schema.json ];
then
    echo "Error: File schema.json not found in /schemas/v$Version"
    exit;
fi

if [ ! -f $ConfigFilepath ];
then
    echo "Error: File $ConfigFilepath not found"
    exit;
fi

if [ ! -d ../schemas/v$Version/docs/html ];
then
    mkdir -p ../schemas/v$Version/docs/html;
fi

generate-schema-doc --config-file $ConfigFilepath ../schemas/v$Version/schema.json ../schemas/v$Version/docs/html/schema.html

if $Latest;
then
    if [ ! -d ../schemas/latest/docs/html ];
    then
        mkdir -p ../schemas/latest/docs/html;
    fi
    
    generate-schema-doc --config-file $ConfigFilepath ../schemas/latest/schema.json ../schemas/latest/docs/html/schema.html;
fi