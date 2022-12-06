SHELVE=$1
PIPELINE=$2
if [ "$2" == "" ]; then
    PIPELINE=74
fi


SOAP="<?xml version=\"1.0\" encoding=\"utf-8\"?>
<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">
  <soap:Body>
    <QueueBuilds xmlns=\"http://schemas.microsoft.com/TeamFoundation/2010/Build\">
      <requests>
        <BuildRequest BuildDefinitionUri=\"vstfs:///Build/Definition/$PIPELINE\" Reason=\"CheckInShelveset\" ShelvesetName=\"$SHELVE;TSDOMAIN\Rodionov\"/>
      </requests>
    </QueueBuilds>
  </soap:Body>
</soap:Envelope>"

curl -X POST --ntlm -u rodionov:TFSp4HEs --header "Content-Type: text/xml; charset=utf-8" --header "SOAPAction: \"http://schemas.microsoft.com/TeamFoundation/2010/Build/QueueBuilds\"" --data "$SOAP" http://tfs.tsdomain.ru:23333/tfs/DefaultCollection/Build/v4.0/BuildQueueService.asmx
echo -e "\n"