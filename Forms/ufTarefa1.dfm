object fTarefa1: TfTarefa1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Tarefa 1'
  ClientHeight = 340
  ClientWidth = 597
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDesktopCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblSQLGerado: TLabel
    Left = 8
    Top = 176
    Width = 57
    Height = 13
    Caption = 'SQL Gerado'
  end
  object lblColunas: TLabel
    Left = 8
    Top = 13
    Width = 38
    Height = 13
    Caption = 'Colunas'
  end
  object lblTabelas: TLabel
    Left = 176
    Top = 13
    Width = 37
    Height = 13
    Caption = 'Tabelas'
  end
  object lblCondicoes: TLabel
    Left = 344
    Top = 13
    Width = 49
    Height = 13
    Caption = 'Condi'#231#245'es'
  end
  object moColunas: TMemo
    Left = 8
    Top = 32
    Width = 153
    Height = 121
    Hint = 'Colunas'
    TabOrder = 0
  end
  object moTabelas: TMemo
    Left = 176
    Top = 32
    Width = 153
    Height = 121
    Hint = 'Tabelas'
    TabOrder = 1
  end
  object moCondicoes: TMemo
    Left = 344
    Top = 32
    Width = 153
    Height = 121
    Hint = 'Condi'#231#245'es'
    TabOrder = 2
  end
  object btnGeraSQL: TButton
    Left = 516
    Top = 80
    Width = 75
    Height = 25
    Caption = 'GeraSQL'
    TabOrder = 3
    OnClick = btnGeraSQLClick
  end
  object moSQLGerado: TMemo
    Left = 8
    Top = 195
    Width = 579
    Height = 136
    Hint = 'SQLGerado'
    TabOrder = 4
  end
  object spGeraSQL: TspQuery
    Left = 504
    Top = 160
  end
end
