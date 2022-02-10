# XML Builder

## ⚙️ Installation
Installation is done using the [`boss install`](https://github.com/HashLoad/boss) command line:
``` sh
boss install viniciussanchez/xml-builder
```

## ⚙️ Manual Installation for Delphi
If you choose to install manually, simply add the following folders to your project, in *Project > Options > Resource Compiler > Directories and Conditionals > Include file search path*
```
../xml-builder/src
```

## ⚡️ Quickstart

```pascal
uses Xml.Builder;

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

  TXmlBuilder.New
    .AddNode(LDeveloperNode)
    .Xml;
end;

// Another way to implement:

begin
  TXmlBuilder.New
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
``` 
Result:
```xml
<?xml version="1.0" encoding="UTF-8"?>
<developer mvp="true">
   <firstName>Vinicius</firstName>
   <lastName>Sanchez</lastName>
   <age />
   <projects>
      <Boss>yes</Boss>
      <DataSet-Serialize>yes</DataSet-Serialize>
      <RESTRequest4Delphi>yes</RESTRequest4Delphi>
      <BCrypt>yes</BCrypt>
      <Horse>yes</Horse>
   </projects>
</developer>
```
You can also save the file to disk:
```pascal
TXmlBuilder.New.SaveToFile('C:\sample.xml');
```

## ⚡️ DataSet Adapter

```pascal
uses Xml.Builder;

begin
  mtDeveloper.Append;
  mtDeveloperfirstName.AsString := 'Vinicius';
  mtDeveloperlastName.AsString := 'Sanchez';
  mtDevelopermvp.AsBoolean := True;
  mtDeveloper.Post;
  
  mmXml.Lines.Text := TXmlBuilder.Adapter(mtDeveloper).Xml;
end;
``` 
Result:
```xml
<?xml version="1.0" encoding="UTF-8"?>
<mtDeveloper>
   <firstName>Vinicius</firstName>
   <lastName>Sanchez</lastName>
   <mvp>True</mvp>
</mtDeveloper>
```

## ⚠️ License

`XML Builder` is free and open-source software licensed under the [MIT License](https://github.com/viniciussanchez/xml-builder/blob/master/LICENSE). 
