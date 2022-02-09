unit Xml.Builder.Node.Intf;

interface

type
  IXmlNode = interface
    ['{83EC1878-082C-475D-9E9B-F158BDCA6E07}']
    function Build: string;
    function AddAttribute(const AName, AValue: string): IXmlNode;
    function AddNode(const ANode: IXmlNode): IXmlNode;
    function AddElement(const AName: string): IXmlNode; overload;
    function AddElement(const AName, AValue: string): IXmlNode; overload;
  end;

implementation

end.
