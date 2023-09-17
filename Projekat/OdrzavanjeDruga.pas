unit OdrzavanjeDruga;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, Zaposleni,
  OdrzavanjeOpremaZaCiscenje, OdrzavanjeOpremaZaPopravka, Popravka,
  Izvestaj;

type
  TFormaOdrzavanjeDruga = class(TForm)
    Image1: TImage;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    procedure Button6Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormaOdrzavanjeDruga: TFormaOdrzavanjeDruga;

implementation
            uses uZaposleniMain;
{$R *.fmx}

procedure TFormaOdrzavanjeDruga.Button1Click(Sender: TObject);
begin
OsnovnaIzvestaj.Show;
FormaOdrzavanjeDruga.Hide;
end;

procedure TFormaOdrzavanjeDruga.Button2Click(Sender: TObject);
begin
PopravkaForm.Show;
FormaOdrzavanjeDruga.Hide;
end;

procedure TFormaOdrzavanjeDruga.Button3Click(Sender: TObject);
begin
FormaOdrzavanjeOpremaZaPopravku.Show;
FormaOdrzavanjeDruga.Hide;
end;

procedure TFormaOdrzavanjeDruga.Button4Click(Sender: TObject);
begin
FormaOdrzavanjeOpremaZaCiscenje.Show;
FormaOdrzavanjeDruga.Hide;
end;

procedure TFormaOdrzavanjeDruga.Button5Click(Sender: TObject);
begin
ZaposleniForm.Show;
FormaOdrzavanjeDruga.Hide;
end;

procedure TFormaOdrzavanjeDruga.Button6Click(Sender: TObject);
begin
 FormZaposleniMain.Show;
Self.Close;
end;

end.
