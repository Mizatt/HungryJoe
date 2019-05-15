unit unitDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, FireDAC.Comp.Client, Data.DB,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TDM = class(TDataModule)
    FDConnection1: TFDConnection;
    FDTrans: TFDTransaction;
    FDEstoque: TFDTable;
    FDEstoqueID: TFDAutoIncField;
    FDEstoqueSTATUS: TStringField;
    FDEstoquePRO_ID_CATEGORIA: TIntegerField;
    FDEstoquePRO_DESCRICAO: TStringField;
    FDEstoquePRO_VALOR: TBCDField;
    FDEstoquePRO_EST_MINIMO: TIntegerField;
    FDEstoquePRO_ESTOQUE: TIntegerField;
    FDEstoqueDATA_INC: TSQLTimeStampField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
