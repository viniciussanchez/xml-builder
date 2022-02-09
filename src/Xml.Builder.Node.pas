unit Xml.Builder.Node;

{$IF DEFINED(FPC)}
  {$MODE DELPHI}{$H+}
{$ENDIF}

interface

uses
  Xml.Builder.Node.Intf,
{$IF DEFINED(FPC)}
  Generics.Collections;
{$ELSE}
  System.Generics.Collections;
{$ENDIF}

type
  TXmlNode = class(TInterfacedObject, IXmlNode)
  private
    FNodeName: string;
    FNodes: TList<IXmlNode>;
    FElements: TDictionary<string, string>;
    FAttributes: TDictionary<string, string>;
    function Build: string;
    function AddAttribute(const AName, AValue: string): IXmlNode;
    function AddNode(const ANode: IXmlNode): IXmlNode;
    function AddElement(const AName: string): IXmlNode; overload;
    function AddElement(const AName, AValue: string): IXmlNode; overload;
    constructor Create(const ANodeName: string); reintroduce;
  public
    class function New(const ANodeName: string): IXmlNode;
    destructor Destroy; override;
  end;

implementation

{ TXmlNode }

uses
{$IF DEFINED(FPC)}
  SysUtils,
  StrUtils;
{$ELSE}
  System.SysUtils,
  System.StrUtils;
{$ENDIF}

function TXmlNode.AddAttribute(const AName, AValue: string): IXmlNode;
begin
  FAttributes.AddOrSetValue(AName, AValue);
  Result := Self;
end;

function TXmlNode.AddElement(const AName: string): IXmlNode;
begin
  Result := Self.AddElement(AName, EmptyStr);
end;

function TXmlNode.AddElement(const AName, AValue: string): IXmlNode;
begin
  FElements.AddOrSetValue(AName, AValue);
  Result := Self;
end;

function TXmlNode.AddNode(const ANode: IXmlNode): IXmlNode;
begin
  FNodes.Add(ANode);
  Result := Self;
end;

function TXmlNode.Build: string;
var
  LNode: IXmlNode;
  LPair: TPair<string, string>;
begin
  Result := '<' + FNodeName;
  if FAttributes.Count > 0 then
    for LPair in FAttributes do
      Result := Result + Chr(32) + LPair.Key + '="' + LPair.Value + '"';
  if (FNodes.Count = 0) and (FElements.Count = 0) then
  begin
    Result := Result + '/>';
    Exit;
  end;
  Result := Result + '>';
  for LPair in FElements do
  begin
    Result := Result + '<' + LPair.Key + IfThen(LPair.Value.IsEmpty, '/>', '>');
    if not LPair.Value.IsEmpty then
    begin
      Result := Result + LPair.Value;
      Result := Result + '</' + LPair.Key + '>';
    end;
  end;
  for LNode in FNodes do
    Result := Result + LNode.Build;
  Result := Result + '</' + FNodeName + '>';
end;

constructor TXmlNode.Create(const ANodeName: string);
begin
  FNodes := TList<IXmlNode>.Create;
  FElements := TDictionary<string, string>.Create();
  FAttributes := TDictionary<string, string>.Create();
  FNodeName := ANodeName;
end;

destructor TXmlNode.Destroy;
begin
  FNodes.Free;
  FElements.Free;
  FAttributes.Free;
  inherited;
end;

class function TXmlNode.New(const ANodeName: string): IXmlNode;
begin
  Result := TXmlNode.Create(ANodeName);
end;

end.
