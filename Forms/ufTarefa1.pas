unit ufTarefa1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Phys.MongoDBDataSet, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.VCLUI.Wait, uspQuery;

type
  TfTarefa1 = class(TForm)
    moColunas: TMemo;
    moTabelas: TMemo;
    moCondicoes: TMemo;
    btnGeraSQL: TButton;
    moSQLGerado: TMemo;
    lblSQLGerado: TLabel;
    lblColunas: TLabel;
    lblTabelas: TLabel;
    lblCondicoes: TLabel;
    spGeraSQL: TspQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGeraSQLClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }

    procedure ValidaMemosPreenchidos;
    procedure ValidarEstrutura(Memo: TMemo);
  public
    { Public declarations }
  end;

var
  fTarefa1: TfTarefa1;

implementation

{$R *.dfm}

procedure TfTarefa1.btnGeraSQLClick(Sender: TObject);
begin
  ValidaMemosPreenchidos;
  ValidarEstrutura(moTabelas);
  ValidarEstrutura(moColunas);

  spGeraSQL.spColunas.Text := moColunas.Text;
  spGeraSQL.spTabelas.Text := moTabelas.Text;
  spGeraSQL.spCondicoes.Text := moCondicoes.Text;

  moSQLGerado.Text := spGeraSQL.GeraSQL;
end;

procedure TfTarefa1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Destroy;
end;

procedure TfTarefa1.FormCreate(Sender: TObject);
begin
  fTarefa1 := Self;
end;

procedure TfTarefa1.ValidaMemosPreenchidos;
var
  iIndex: Integer;
begin
  for iIndex := 0 to Pred(fTarefa1.ComponentCount) do
  begin
    if (fTarefa1.Components[iIndex] is TMemo)
      and (TMemo(fTarefa1.Components[iIndex]).Hint <> 'SQLGerado') then
    begin
      if TMemo(fTarefa1.Components[iIndex]).Lines.Count = 0 then
        raise Exception.Create(Format('Por favor, preencha as %s', [TMemo(fTarefa1.Components[iIndex]).Hint]));
    end;
  end;
end;

procedure TfTarefa1.ValidarEstrutura(Memo: TMemo);
var
  iIndex: Integer;
  sMsgErro: String;
begin
  sMsgErro := EmptyStr;

  if (Memo.Name = 'moTabelas') and (Memo.Lines.Count > 1) then
    raise Exception.Create('� permitido informar somente uma tabela para a gera��o do SQL');

  for iIndex := 0 to Memo.Lines.Count do
  begin
    if Pos(' ', Memo.Lines[iIndex]) > 0 then
      sMsgErro := sMsgErro + Memo.Lines[iIndex] +#13#10;
  end;

  if (sMsgErro <> EmptyStr) and (Memo.Name <> 'moCondicoes') then
    raise Exception.Create(Format('Estrutura inv�lida, informe uma %s por linha: %s', [Memo.Hint, sMsgErro]));
end;

end.
