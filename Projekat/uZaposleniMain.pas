unit uZaposleniMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls, OsnovnaSredstva, OdrzavanjeDruga;

type
  TformZaposleniMain = class(TForm)
    Image1: TImage;
    footer: TLayout;
    header: TLayout;
    Image2: TImage;
    klijent: TLayout;
    forestTekst: TText;
    drvoSlika: TImage;
    odrzavanje: TButton;
    osnovna: TButton;
    slikaLogout: TImage;
    nabavka: TButton;
    procedure slikaLogoutClick(Sender: TObject);
    procedure osnovnaClick(Sender: TObject);
    procedure odrzavanjeClick(Sender: TObject);
    procedure nabavkaClick(Sender: Tobject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formZaposleniMain: TformZaposleniMain;

implementation
       uses Unit1, meni;
{$R *.fmx}

procedure TformZaposleniMain.nabavkaClick(Sender: TObject);
begin
FormaOdrzavanjeDruga.Show;
Self.Hide;
end;

procedure TformZaposleniMain.odrzavanjeClick(Sender: TObject);
begin
form2.Show;
Self.Hide;
end;

procedure TformZaposleniMain.osnovnaClick(Sender: TObject);
begin
 OdrzavanjePocetna.Show;
 Self.Hide;
end;

procedure TformZaposleniMain.slikaLogoutClick(Sender: TObject);
begin
 formZaposleniMAin.Hide;
 form1.Show;
end;

end.
