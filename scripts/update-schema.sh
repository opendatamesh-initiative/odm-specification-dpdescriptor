
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
   echo "f     Specify alternate source file name. (Default: schema-dev.json)"
   echo
}

Version=""
Latest=false
StartingFile="schema-dev.json"

while getopts ":hv:lf:" option; do
    case $option in
        h) # display Help
            Help
            exit;;
        v) # enter a name
            Version=$OPTARG;;
        l) #Latest
            Latest=true;;
        f) #Customize file name
            StartingFile=$OPTARG;;
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

if [ ! -f ../schemas/v$Version/$StartingFile ];
then
    echo "Error: File $StartingFile not found in /schemas/v$Version"
    exit;
fi

cd ../schemas/v$Version
sed "s,SPEC-BASE-URL,https://dpds.opendatamesh.org/resources/specifications/$Version/,g" $StartingFile > schema.json

if $Latest;
then
    cp schema.json ../latest/;
fi