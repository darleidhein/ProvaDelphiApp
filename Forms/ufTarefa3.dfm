object fTarefa3: TfTarefa3
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Tarefa 3'
  ClientHeight = 406
  ClientWidth = 615
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
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object lblValoresProjeto: TLabel
    Left = 8
    Top = 8
    Width = 92
    Height = 13
    Caption = 'Valores do projeto:'
  end
  object lblTotal: TLabel
    Left = 479
    Top = 303
    Width = 44
    Height = 13
    Caption = 'Total R$:'
  end
  object lblTotalDivisoes: TLabel
    Left = 479
    Top = 349
    Width = 85
    Height = 13
    Caption = 'Total divis'#245'es R$:'
  end
  object dbgValoresProjeto: TDBGrid
    Left = 8
    Top = 27
    Width = 592
    Height = 262
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        Title.Caption = 'IdProjeto'
        Visible = True
      end
      item
        Expanded = False
        Title.Caption = 'NomeProjeto'
        Width = 380
        Visible = True
      end
      item
        Expanded = False
        Title.Caption = 'Valor'
        Width = 94
        Visible = True
      end>
  end
  object btnTotal: TButton
    Left = 392
    Top = 320
    Width = 75
    Height = 25
    Caption = 'Obter Total'
    TabOrder = 1
    OnClick = btnTotalClick
  end
  object btnTotalDivisoes: TButton
    Left = 352
    Top = 366
    Width = 115
    Height = 25
    Caption = 'Obter Total Divis'#245'es'
    TabOrder = 3
    OnClick = btnTotalDivisoesClick
  end
  object edtTotal: TEdit
    Left = 479
    Top = 322
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 2
  end
  object edtTotalDivisoes: TEdit
    Left = 479
    Top = 368
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 4
  end
end
