unit Xml.Builder.Intf;

interface

uses
  Xml.Builder.Node.Intf;

type
  IXmlBuilder = interface
    ['{37DA336E-B602-4985-A05A-4833D3FAF951}']
    function Xml: string;
    function Version(const AValue: string): IXmlBuilder;
    function Encoding(const AValue: string): IXmlBuilder;
    function AddNode(const ANode: IXmlNode): IXMlBuilder;
    procedure SaveToFile(const APath: string);
  end;

implementation

end.
