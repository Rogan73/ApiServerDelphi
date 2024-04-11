object Form6: TForm6
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'API Server'
  ClientHeight = 279
  ClientWidth = 400
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object Shape1: TShape
    Left = 80
    Top = 108
    Width = 33
    Height = 17
    Brush.Color = clGray
    Pen.Color = clSilver
    Pen.Width = 3
    Shape = stRoundRect
  end
  object Label2: TLabel
    Left = 8
    Top = 20
    Width = 49
    Height = 15
    Caption = 'VCL Style'
  end
  object BitBtn1: TBitBtn
    Left = 119
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 200
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Stop'
    TabOrder = 1
    OnClick = BitBtn2Click
  end
  object cbxVclStyles: TComboBox
    Left = 80
    Top = 17
    Width = 195
    Height = 23
    Style = csDropDownList
    TabOrder = 2
    OnChange = cbxVclStylesChange
  end
end
