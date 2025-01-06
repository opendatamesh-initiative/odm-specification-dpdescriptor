
Help()
{
   # Display Help
   echo "Script usage:"
   echo
   echo "options:"
   echo "v     Specify the version to be updated."
   echo "l     Specify if the version is the latest."
   echo
}

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

if [ -z $Version ];
then
    echo "Error: A version must be specified using option -v"
    exit;
fi

echo "Version: $Version"
echo "Latest: $Latest"

if [ ! -f ../schemas/v$Version/docs/html/schema.html ];
then
    echo "Error: File schema.html not found in ../schemas/v$Version/docs/html/"
    exit;
fi

if [ ! -f ../schemas/v$Version/schema.json ];
then
    echo "Error: File schema.json not found in ../schemas/v$Version/"
    exit;
fi

if [ ! -f ../docs/specifications/dpds/$Version/html ];
then
    echo "IMPORTANT: This seems to be the first pubblication of this version, remember to edit docs/resources/schemas/README.md and to create a specific md for this version!"
fi

cp ../schemas/v$Version/docs/html/schema.html ../docs/site/specifications/dpds/$Version/html/schema.html
cp ../schemas/v$Version/schema.json ../docs/site/specifications/dpds/$Version/schema.json

if $Latest;
then
    cp ../schemas/latest/docs/html/schema.html ../docs/site/specifications/dpds/latest/html/schema.html
    cp ../schemas/latest/schema.json ../docs/site/specifications/dpds/latest/schema.json
fi