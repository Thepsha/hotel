unit uNalog;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.StdCtrls, FMX.Controls.Presentation, uIstorija;

type
  TformNalog = class(TForm)
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
    linijaIme: TLine;
    labelIme: TLabel;
    linijaPrezime: TLine;
    labelPrezime: TLabel;
    LinijaEmail: TLine;
    labelEmail: TLabel;
    linijaSifra: TLine;
    labelSifra: TLabel;
    linijaTelefon: TLine;
    labelTelefon: TLabel;
    linijaUsername: TLine;
    labelUsername: TLabel;
    checkboxPrikazi: TCheckBox;
    buttonIstorija: TButton;
    procedure slikaHomeClick(Sender: TObject);
    procedure slikaRezervacijaClick(Sender: TObject);
    procedure slikaLogoutClick(Sender: TObject);
    procedure checkboxPrikaziChange(Sender: TObject);
    procedure buttonIstorijaClick(Sender: TObject);
  private
    FEmail: string;
    FPassword: string;
    FUsername: string;
    FIme: string;
    Fprezime: string;
    Ftelefon: string;
  public
    property Email: string read FEmail write FEmail;
    property Password: string read FPassword write FPassword;
    property Username: string read FUsername write FUsername;
    property Ime: string read FIme write FIme;
    property Prezime: string read Fprezime write Fprezime;
    property Telefon: string read Ftelefon write Ftelefon;

  end;

var
  formNalog: TformNalog;

implementation

uses uMain,uRezervacija, uLogin;

{$R *.fmx}

procedure TformNalog.buttonIstorijaClick(Sender: TObject);
begin
    formNalog.Hide;
    formIstorija.Show;
end;

procedure TformNalog.checkboxPrikaziChange(Sender: TObject);
begin
    labelEmail.Text := 'Email: ' + FEmail;
    labelIme.Text := 'Ime: ' + Fime;
    labelPrezime.Text := 'Prezime: ' + FPrezime;
    labelSifra.Text := 'Sifra: ' + FPassword;
    labelUsername.Text := 'Username: ' + FUsername;
    labelTelefon.Text := 'Broj Telefona: ' + Ftelefon;
end;

procedure TformNalog.slikaHomeClick(Sender: TObject);
begin
    formNalog.Hide;
    formMain.Show;
end;

procedure TformNalog.slikaLogoutClick(Sender: TObject);
begin
    formNalog.Hide;
    formLogin.Show;
end;

procedure TformNalog.slikaRezervacijaClick(Sender: TObject);
begin
    formNalog.Hide;
    formRezervacija.Show;
end;

end.
