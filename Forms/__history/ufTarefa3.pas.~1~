unit ufTarefa3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Datasnap.DBClient, Vcl.Mask;

type
  TipoTotal = (tpTotal, tpTotalDiv);

  TfTarefa3 = class(TForm)
    dbgValoresProjeto: TDBGrid;
    lblValoresProjeto: TLabel;
    btnTotal: TButton;
    btnTotalDivisoes: TButton;
    edtTotal: TEdit;
    edtTotalDivisoes: TEdit;
    lblTotal: TLabel;
    lblTotalDivisoes: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnTotalClick(Sender: TObject);
    procedure btnTotalDivisoesClick(Sender: TObject);
  private
    { Private declarations }
    FcdsValoresProjeto: TClientDataSet;
    FdsValoresProjeto: TDataSource;

    procedure CriarComponentes;
    procedure PopularRegistros;
    procedure OrdernarDataSet;
    procedure DestruirDataSets;

    function ObterTotais(oTipoTotal: TipoTotal): Currency;
  public
    { Public declarations }
  end;

var
  fTarefa3: TfTarefa3;

implementation

{$R *.dfm}

procedure TfTarefa3.btnTotalClick(Sender: TObject);
begin
  edtTotalDivisoes.Text := CurrToStr(ObterTotais(tpTotal));
end;

procedure TfTarefa3.btnTotalDivisoesClick(Sender: TObject);
begin
  edtTotalDivisoes.Text := CurrToStr(ObterTotais(tpTotalDiv));
end;

procedure TfTarefa3.CriarComponentes;
begin
  FcdsValoresProjeto := TClientDataSet.Create(nil);
  FcdsValoresProjeto.FieldDefs.Add('IDPROJETO', ftInteger);
  FcdsValoresProjeto.FieldDefs.Add('NOMEPROJETO', ftString, 60);
  FcdsValoresProjeto.FieldDefs.Add('VALOR', ftCurrency);
  FcdsValoresProjeto.CreateDataSet;

  FdsValoresProjeto := TDataSource.Create(nil);
  FdsValoresProjeto.DataSet := FcdsValoresProjeto;

  dbgValoresProjeto.DataSource := FdsValoresProjeto;
  dbgValoresProjeto.Columns[0].FieldName := 'IDPROJETO';
  dbgValoresProjeto.Columns[1].FieldName := 'NOMEPROJETO';
  dbgValoresProjeto.Columns[2].FieldName := 'VALOR';
end;

procedure TfTarefa3.DestruirDataSets;
begin
  FreeAndNil(FcdsValoresProjeto);
  FreeAndNil(FdsValoresProjeto);
end;

procedure TfTarefa3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DestruirDataSets;
  Destroy;
end;

procedure TfTarefa3.FormCreate(Sender: TObject);
begin
  CriarComponentes;
  PopularRegistros;
  OrdernarDataSet;
end;

procedure TfTarefa3.FormDestroy(Sender: TObject);
begin
  DestruirDataSets;
end;

function TfTarefa3.ObterTotais(oTipoTotal: TipoTotal): Currency;
var
  cValorTotal, cValorTotalAnt, cValorTotalDiv: Currency;
begin
  try
    cValorTotal := 0;
    cValorTotalAnt := 0;
    cValorTotalDiv := 0;

    FcdsValoresProjeto.DisableControls;
    FcdsValoresProjeto.First;
    while not FcdsValoresProjeto.Eof do
    begin
      if oTipoTotal = tpTotal then
        cValorTotal := cValorTotal + FcdsValoresProjeto.Fields[2].Value
      else
      begin
        if cValorTotalAnt <> 0 then
          cValorTotalDiv := cValorTotalDiv + FcdsValoresProjeto.Fields[2].Value / cValorTotalAnt;

        cValorTotalAnt := FcdsValoresProjeto.Fields[2].Value;
      end;

      FcdsValoresProjeto.Next;
    end;
  finally
    FcdsValoresProjeto.EnableControls;
  end;

  if oTipoTotal = tpTotal then
    Result := cValorTotal
  else
    Result := cValorTotalDiv;
end;

procedure TfTarefa3.OrdernarDataSet;
begin
  FcdsValoresProjeto.IndexFieldNames := 'IDPROJETO';
end;

procedure TfTarefa3.PopularRegistros;
var
  iIndex: Integer;
begin
  for iIndex := 1 to 10 do
  begin
    FcdsValoresProjeto.Insert;
    FcdsValoresProjeto.FieldByName('IDPROJETO').AsInteger := iIndex;
    FcdsValoresProjeto.FieldByName('NOMEPROJETO').AsString := Format('Projeto %s', [IntToStr(iIndex)]);
    FcdsValoresProjeto.FieldByName('VALOR').AsCurrency := iIndex*10;
    FcdsValoresProjeto.Post;
  end;
end;

end.
