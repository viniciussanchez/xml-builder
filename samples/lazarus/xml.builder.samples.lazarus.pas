unit Xml.Builder.Samples.Lazarus;

{$mode objfpc}{$H+}

interface

uses Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type
  TFrmSamples = class(TForm)
    btnExample1: TButton;
    btnExample2: TButton;
    mmXml: TMemo;
    procedure btnExample1Click(Sender: TObject);
    procedure btnExample2Click(Sender: TObject);
  end;

var
  FrmSamples: TFrmSamples;

implementation

{$R *.lfm}

uses Xml.Builder;

procedure TFrmSamples.btnExample1Click(Sender: TObject);
begin
  mmXml.Lines.Text := TXmlBuilder.New
    .AddNode(TXmlNode.New('developer')
      .AddAttribute('mvp', 'true')
      .AddElement('firstName', 'Vinicius')
      .AddElement('lastName', 'Sanchez')
      .AddElement('age')
      .AddNode(TXmlNode.New('projects')
        .AddElement('Horse', 'yes')
        .AddElement('Boss', 'yes')
        .AddElement('RESTRequest4Delphi', 'yes')
        .AddElement('DataSet-Serialize', 'yes')
        .AddElement('BCrypt', 'yes')))
    .Xml;
end;

procedure TFrmSamples.btnExample2Click(Sender: TObject);
var
  LDeveloperNode, LProjectsNode: IXmlNode;
begin
  LProjectsNode := TXmlNode.New('projects')
    .AddElement('Horse', 'yes')
    .AddElement('Boss', 'yes')
    .AddElement('RESTRequest4Delphi', 'yes')
    .AddElement('DataSet-Serialize', 'yes')
    .AddElement('BCrypt', 'yes');

  LDeveloperNode := TXmlNode.New('developer')
    .AddAttribute('mvp', 'true')
    .AddElement('firstName', 'Vinicius')
    .AddElement('lastName', 'Sanchez')
    .AddElement('age')
    .AddNode(LProjectsNode);

  mmXml.Lines.Text := TXmlBuilder.New
    .AddNode(LDeveloperNode)
    .Xml;
end;

end.
