unit Hotel;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, Data.DbxSqlite,
  Data.FMTBcd, System.Rtti, FMX.Grid.Style, DataSnap.DBClient,
  Data.Bind.Controls, Fmx.Bind.Grid, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.Grid,
  FMX.Layouts, Fmx.Bind.Navigator, Data.Bind.DBScope, Data.Bind.DBXScope,
  Data.DB, FMX.Controls.Presentation, FMX.ScrollBox, FMX.Grid, Data.SqlExpr,
  FMX.Objects, FMX.StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.FMXUI.Wait;

type
  TOpremaPopravkaForm = class(TForm)
    Button1: TButton;
    Image1: TImage;
    Grid1: TGrid;
    FDConnection1: TFDConnection;
    BindSourceOsnovnaSredstvaHotel: TBindSourceDB;
    FDTableOsnovnaSredstvaHotel: TFDTable;
    LinkGridToDataSourceBindSourceOsnovnaSredstvaHotel: TLinkGridToDataSource;
    NavigatorBindSourceOsnovnaSredstvaHotel: TBindNavigator;
    BindingsList1: TBindingsList;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OpremaPopravkaForm: TOpremaPopravkaForm;

implementation
        uses OsnovnaSredstva;
{$R *.fmx}

procedure TOpremaPopravkaForm.Button1Click(Sender: TObject);
begin
OdrzavanjePocetna.Show;
Self.Close;
end;

end.