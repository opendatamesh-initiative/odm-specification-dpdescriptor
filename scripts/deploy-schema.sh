
Help()
{
   # Display Help
   echo "Script usage:"
   echo
   #echo "Introduction"
   #echo
   echo "options:"
   echo "v     Specify the version to be updated."
   echo "l     Specify if the version is the latest."
   echo
}

Version=""
Latest=false
StartingFile="schema-dev.json"

while getopts ":hv:l" option; do
    case $option in
        h) # display Help
            Help
            exit;;
        v) # enter a name
            Version=$OPTARG;;
        l) #Latest
            Latest=true;;
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

if [ ! -f ../docs/resources/schemas/html/$Version.html ];
then
    echo "IMPORTANT: This seems to be the first pubblication of this version, remember to edit docs/resources/schemas/README.md and to create a specific md for this version!"
fi

cp ../schemas/v$Version/docs/html/schema.html ../docs/resources/schemas/html/$Version.html

if $Latest;
then
    cp ../schemas/latest/docs/html/schema.html ../docs/resources/schemas/html/latest.html;
fi