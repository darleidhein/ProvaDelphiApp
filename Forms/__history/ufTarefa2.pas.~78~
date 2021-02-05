unit ufTarefa2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, ufProgresso;

type
  TfTarefa2 = class(TForm)
    btnExecutar: TButton;
    edtMiliSegThread1: TEdit;
    lblThread1: TLabel;
    pgbUm: TProgressBar;
    pgbDois: TProgressBar;
    edtMiliSegThread2: TEdit;
    lblThread2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExecutarClick(Sender: TObject);
    procedure edtMiliSegThread1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FProgressoThread1: TProgressoThread;
    FProgressoThread2: TProgressoThread;

    procedure ValidarCampos;
    procedure ValidarExecucaoThreads;
  public
    { Public declarations }
  end;

var
  fTarefa2: TfTarefa2;
  teste: Boolean;

implementation

{$R *.dfm}

procedure TfTarefa2.btnExecutarClick(Sender: TObject);
begin
  ValidarCampos;
  ValidarExecucaoThreads;

  FProgressoThread1 := TProgressoThread.Create;
  FProgressoThread1.SetarPropriedades(StrToInt(edtMiliSegThread1.Text), pgbUm);
  try
    FProgressoThread1.Start;
  except on E: Exception do
    raise Exception.Create(Format('Ocorreu um erro ao executar a Thread 1, Erro original: %s', [E.Message]));
  end;

  FProgressoThread2 := TProgressoThread.Create;
  FProgressoThread2.SetarPropriedades(StrToInt(edtMiliSegThread2.Text), pgbDois);
  try
    FProgressoThread2.Start;
  except on E: Exception do
    raise Exception.Create(Format('Ocorreu um erro ao executar a Thread 2, Erro original: %s', [E.Message]));
  end;
end;

procedure TfTarefa2.edtMiliSegThread1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (CharInSet(Key,['0'..'9',#8])) then
    key := #0;
end;

procedure TfTarefa2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(FProgressoThread1) then
    FProgressoThread1.Terminate;

  if Assigned(FProgressoThread2) then
    FProgressoThread2.Terminate;

  Destroy;
end;

procedure TfTarefa2.FormCreate(Sender: TObject);
begin
  fTarefa2 := Self;
end;

procedure TfTarefa2.ValidarCampos;
begin
  if edtMiliSegThread1.Text = EmptyStr then
  begin
    edtMiliSegThread1.SetFocus;
    raise Exception.Create('Informe um valor válido!');
  end;

  if edtMiliSegThread2.Text = EmptyStr then
  begin
    edtMiliSegThread2.SetFocus;
    raise Exception.Create('Informe um valor válido!');
  end;
end;

procedure TfTarefa2.ValidarExecucaoThreads;
var
  bEmExecucao: Boolean;
begin
  bEmExecucao := False;
  if Assigned(FProgressoThread1) and Assigned(FProgressoThread2) then
    bEmExecucao := (not FProgressoThread1.Finished) and (not FProgressoThread1.Suspended)
      or (not FProgressoThread2.Finished) and (not FProgressoThread2.Suspended);

  if bEmExecucao then
    raise Exception.Create('As Threads ainda estão em execucação!');
end;

end.
