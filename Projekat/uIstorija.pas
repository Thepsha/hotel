unit uIstorija;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts, System.Rtti,
  FMX.Grid.Style, FMX.ScrollBox, FMX.Grid, uDM, FMX.ListBox, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.FMXUI.Wait, Data.DB,
  FireDAC.Comp.Client;

type
  TformIstorija = class(TForm)
    Image1: TImage;
    footer: TLayout;
    slikaHome: TImage;
    slikaLogout: TImage;
    slikaNalog: TImage;
    slikaRezervacija: TImage;
    header: TLayout;
    Image2: TImage;
    klijent: TLayout;
    forestTekst: TText;
    drvoSlika: TImage;
    gridIstorija: TGrid;
    btnPrikazei: TButton;
    procedure btnPrikazeiClick(Sender: TObject);
    procedure slikaNalogClick(Sender: TObject);
    procedure slikaLogoutClick(Sender: TObject);
    procedure slikaRezervacijaClick(Sender: TObject);
    procedure slikaHomeClick(Sender: TObject);
  private
    Fidgosta: integer;
  public
    property idgosta: integer read fidgosta write fidgosta;
  end;

var
  formIstorija: TformIstorija;

implementation

uses uNalog, uMain, uRezervacija, uLogin;

{$R *.fmx}

procedure TformIstorija.btnPrikazeiClick(Sender: TObject);
begin
with baza do begin

end;
end;

procedure TformIstorija.slikaHomeClick(Sender: TObject);
begin
formIstorija.Hide;
formMain.Show;
end;

procedure TformIstorija.slikaLogoutClick(Sender: TObject);
begin
formIstorija.Hide;
formLogin.Show;

end;

procedure TformIstorija.slikaNalogClick(Sender: TObject);
begin
 formIstorija.Hide;
 formNalog.Show;
end;

procedure TformIstorija.slikaRezervacijaClick(Sender: TObject);
begin
formIstorija.Hide;
formRezervacija.Show;
end;

end.
