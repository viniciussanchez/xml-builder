unit Xml.Builder.Samples.Lazarus;

{$mode objfpc}{$H+}

interface

uses Classes, SysUtils, memds, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TFrmSamples }

  TFrmSamples = class(TForm)
    btnExample1: TButton;
    btnExample2: TButton;
    btnExample3: TButton;
    mtDeveloper: TMemDataset;
    mmXml: TMemo;
    procedure btnExample1Click(Sender: TObject);
    procedure btnExample2Click(Sender: TObject);
    procedure btnExample3Click(Sender: TObject);
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

procedure TFrmSamples.btnExample3Click(Sender: TObject);
begin
  if not mtDeveloper.Active then
  begin
    mtDeveloper.Active := True;
    mtDeveloper.Insert;
    mtDeveloper.FieldByName('firstName').AsString := 'Vinicius';
    mtDeveloper.FieldByName('lastName').AsString := 'Sanchez';
    mtDeveloper.FieldByName('mvp').AsBoolean := True;
    mtDeveloper.Post;
  end;
  mmXml.Lines.Text := TXmlBuilder.Adapter(mtDeveloper).Xml;
end;

end.
