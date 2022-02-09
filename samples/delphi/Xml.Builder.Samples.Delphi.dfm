object FrmSamples: TFrmSamples
  Left = 0
  Top = 0
  Caption = 'XML Builder'
  ClientHeight = 456
  ClientWidth = 699
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 699
    Height = 456
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object btnExample1: TButton
      Left = 24
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Example 1'
      TabOrder = 0
      OnClick = btnExample1Click
    end
    object mmXml: TMemo
      Left = 24
      Top = 56
      Width = 649
      Height = 377
      TabOrder = 1
    end
    object btnExample2: TButton
      Left = 105
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Example 2'
      TabOrder = 2
      OnClick = btnExample2Click
    end
  end
end
