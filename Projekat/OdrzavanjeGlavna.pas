unit OdrzavanjeGlavna;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, OdrzavanjeDruga,
  OsnovnaSredstva,
  FMX.Edit, Data.DbxSqlite, Data.FMTBcd, Data.DB, Data.SqlExpr,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Data.Bind.Components, Data.Bind.DBScope, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.FMXUI.Wait;

type
  TFormaOdrzavanjeGlavna = class(TForm)
    Image1: TImage;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    EdU: TEdit;
    EdP: TEdit;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
      property Action;
    { Public declarations }
  end;

var
  FormaOdrzavanjeGlavna: TFormaOdrzavanjeGlavna;

implementation

{$R *.fmx}

procedure TFormaOdrzavanjeGlavna.Button1Click(Sender: TObject);



begin
if (EdU.Text = 'Moskov97@gmail.com') AND (EdP.Text = 'Yowza1972')
then
begin
FormaOdrzavanjeDruga.Show;
FormaOdrzavanjeGlavna.Hide;
Showmessage('Uspesno ste se ulogovali.');
end
else if (EdU.Text = 'Jeca28@gmail.com') AND (EdP.Text = 'Kopaonik77') then
begin
OdrzavanjePocetna.Show;
FormaOdrzavanjeGlavna.Hide;
Showmessage('Uspesno ste se ulogovali.');
end
else if (EdU.Text = 'Nikolic77@gmail.com') AND (EdP.Text = 'Nikolici74') then
begin
OdrzavanjePocetna.Show;
FormaOdrzavanjeGlavna.Hide;
Showmessage('Uspesno ste se ulogovali.');
end
else if (EdU.Text = 'Misko00@gmail.com') AND (EdP.Text = 'MilosM33') then
begin
OdrzavanjePocetna.Show;
FormaOdrzavanjeGlavna.Hide;
Showmessage('Uspesno ste se ulogovali.');
end
else if (EdU.Text = 'Veljko82@gmail.com') AND (EdP.Text = 'Veljko82') then
begin
OdrzavanjePocetna.Show;
FormaOdrzavanjeGlavna.Hide;
Showmessage('Uspesno ste se ulogovali.');
end;

end;




procedure TFormaOdrzavanjeGlavna.Button2Click(Sender: TObject);

begin
                    OdrzavanjePocetna.Show;
                     FormaOdrzavanjeGlavna.Hide;
end;


procedure TFormaOdrzavanjeGlavna.Button3Click(Sender: TObject);
begin
Application.Terminate;
end;

end.
