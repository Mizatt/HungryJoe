unit unitPerfil;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unitBase, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Vcl.StdCtrls, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList, Vcl.ExtCtrls,
  Vcl.CategoryButtons, Vcl.WinXCtrls, Vcl.Imaging.pngimage, Vcl.ComCtrls,
  Vcl.TabNotBk;

type
  TformPerfil = class(TformBasico)
    LabeledEdit1: TLabeledEdit;
    TabbedNotebook1: TTabbedNotebook;
    Image1: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formPerfil: TformPerfil;

implementation

{$R *.dfm}

end.
