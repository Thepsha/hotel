unit OsnovnaSredstva;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, Izvestaj, Popravka, Restoran,
  Hotel, Zaposleni, SigurnosnaOprema;

type
  TOdrzavanjePocetna = class(TForm)
    Image1: TImage;
    Izvestaj: TButton;
    Popravka: TButton;
    Zaposleni: TButton;
    Button1: TButton;
    Restoran: TButton;
    Hotel: TButton;
    SigurnosnaOprema: TButton;
    procedure IzvestajClick(Sender: TObject);
    procedure PopravkaClick(Sender: TObject);
    procedure OpremaZaPopravkuClick(Sender: TObject);
    procedure OpremaZaCiscenjeClick(Sender: TObject);
    procedure ZaposleniClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure RestoranClick(Sender: TObject);
    procedure HotelClick(Sender: TObject);
    procedure SigurnosnaOpremaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OdrzavanjePocetna: TOdrzavanjePocetna;

implementation
       uses uZaposleniMain;

{$R *.fmx}

procedure TOdrzavanjePocetna.Button1Click(Sender: TObject);
begin
FormZaposleniMain.Show;
Self.Close;

end;

procedure TOdrzavanjePocetna.HotelClick(Sender: TObject);
begin
OpremaPopravkaForm.Show;
OdrzavanjePocetna.Hide;
end;

procedure TOdrzavanjePocetna.IzvestajClick(Sender: TObject);
begin
OsnovnaIzvestaj.Show;
OdrzavanjePocetna.Hide;
end;

procedure TOdrzavanjePocetna.OpremaZaCiscenjeClick(Sender: TObject);
begin
OpremaCiscenjeForm.Show;
OdrzavanjePocetna.Hide;
end;

procedure TOdrzavanjePocetna.OpremaZaPopravkuClick(Sender: TObject);
begin
OpremaPopravkaForm.Show;
OdrzavanjePocetna.Hide;
end;

procedure TOdrzavanjePocetna.PopravkaClick(Sender: TObject);
begin
PopravkaForm.Show;
OdrzavanjePocetna.Hide;
end;

procedure TOdrzavanjePocetna.RestoranClick(Sender: TObject);
begin
  OpremaCiscenjeForm.Show;
OdrzavanjePocetna.Hide;
end;

procedure TOdrzavanjePocetna.SigurnosnaOpremaClick(Sender: TObject);
begin
SigurnosnaOpremaForm.Show;
OdrzavanjePocetna.Hide;
end;

procedure TOdrzavanjePocetna.ZaposleniClick(Sender: TObject);
begin
ZaposleniForm.Show;
OdrzavanjePocetna.Hide;
end;

end.
