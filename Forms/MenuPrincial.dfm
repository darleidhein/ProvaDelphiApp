object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Menu principal'
  ClientHeight = 418
  ClientWidth = 796
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = mmMenuPrincipal
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object mmMenuPrincipal: TMainMenu
    Left = 88
    Top = 48
    object mmTarefas: TMenuItem
      Caption = 'Tarefas'
      object miTarefa1: TMenuItem
        Caption = 'Tarefa 1'
        OnClick = miTarefa1Click
      end
      object miTarefa2: TMenuItem
        Caption = 'Tarefa 2'
        OnClick = miTarefa2Click
      end
      object miTarefa3: TMenuItem
        Caption = 'Tarefa 3'
        OnClick = miTarefa3Click
      end
    end
  end
end
