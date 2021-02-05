unit MenuPrincial;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, ufTarefa1, ufTarefa2, ufTarefa3,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uspQuery;

type
  TfrmPrincipal = class(TForm)
    mmMenuPrincipal: TMainMenu;
    mmTarefas: TMenuItem;
    miTarefa1: TMenuItem;
    miTarefa2: TMenuItem;
    miTarefa3: TMenuItem;
    procedure miTarefa2Click(Sender: TObject);
    procedure miTarefa1Click(Sender: TObject);
    procedure miTarefa3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := True;
end;

procedure TfrmPrincipal.miTarefa1Click(Sender: TObject);
begin
  TfTarefa1.Create(Self);
end;

procedure TfrmPrincipal.miTarefa2Click(Sender: TObject);
begin
  TfTarefa2.Create(Self);
end;

procedure TfrmPrincipal.miTarefa3Click(Sender: TObject);
begin
  TfTarefa3.Create(Self);
end;

end.
