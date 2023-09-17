unit OdrzavanjeOpremaZaCiscenje;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Rtti,
  FMX.Grid.Style, FMX.StdCtrls, FMX.Controls.Presentation, FMX.ScrollBox,
  FMX.Grid, FMX.Objects, Data.DbxSqlite, Data.FMTBcd, DataSnap.DBClient,
  Data.Bind.Controls, FMX.Layouts, Fmx.Bind.Navigator, Data.Bind.Components,
  Data.Bind.DBScope, Data.Bind.DBXScope, Data.DB, Data.SqlExpr, Fmx.Bind.Grid,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Grid, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.FMXUI.Wait;

type
  TFormaOdrzavanjeOpremaZaCiscenje = class(TForm)
    Image1: TImage;
    Button1: TButton;
    Grid1: TGrid;
    FDConnection1: TFDConnection;
    BindSourceOpremaZaCiscenje: TBindSourceDB;
    FDTableOpremaZaCiscenje: TFDTable;
    LinkGridToDataSourceBindSourceOpremaZaCiscenje: TLinkGridToDataSource;
    NavigatorBindSourceOpremaZaCiscenje: TBindNavigator;
    BindingsList1: TBindingsList;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormaOdrzavanjeOpremaZaCiscenje: TFormaOdrzavanjeOpremaZaCiscenje;

implementation
 uses OdrzavanjeDruga;
{$R *.fmx}

procedure TFormaOdrzavanjeOpremaZaCiscenje.Button1Click(Sender: TObject);
begin
   FormaOdrzavanjeDruga.Show;
   Self.Close;
end;

end.
