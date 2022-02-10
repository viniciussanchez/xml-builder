unit Xml.Builder.Samples.Delphi;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, VCL.ExtCtrls, Vcl.StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmSamples = class(TForm)
    Panel1: TPanel;
    btnExample1: TButton;
    mmXml: TMemo;
    btnExample2: TButton;
    mtDeveloper: TFDMemTable;
    btnExample3: TButton;
    mtDeveloperfirstName: TStringField;
    mtDeveloperlastName: TStringField;
    mtDevelopermvp: TBooleanField;
    procedure btnExample1Click(Sender: TObject);
    procedure btnExample2Click(Sender: TObject);
    procedure btnExample3Click(Sender: TObject);
  end;

var
  FrmSamples: TFrmSamples;

implementation

{$R *.dfm}

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

procedure TFrmSamples.btnExample3Click(Sender: TObject);
begin
  if not mtDeveloper.Active then
  begin
    mtDeveloper.Active := True;
    mtDeveloper.Insert;
    mtDeveloperfirstName.AsString := 'Vinicius';
    mtDeveloperlastName.AsString := 'Sanchez';
    mtDevelopermvp.AsBoolean := True;
    mtDeveloper.Post;
  end;
  mmXml.Lines.Text := TXmlBuilder.Adapter(mtDeveloper).Xml;
end;

end.
