unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, uNalog, uRezervacija;

type
  TformMain = class(TForm)
    Image1: TImage;
    footer: TLayout;
    header: TLayout;
    klijent: TLayout;
    forestTekst: TText;
    drvoSlika: TImage;
    Image2: TImage;
    Image3: TImage;
    buttonRezervisi: TButton;
    slikaHome: TImage;
    slikaLogout: TImage;
    slikaNalog: TImage;
    slikaRezervacija: TImage;
    procedure slikaRezervacijaClick(Sender: TObject);
    procedure buttonRezervisiClick(Sender: TObject);
    procedure slikaNalogClick(Sender: TObject);
    procedure slikaLogoutClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formMain: TformMain;


implementation

uses uLogin;

{$R *.fmx}

procedure TformMain.buttonRezervisiClick(Sender: TObject);
begin
    formMain.Hide;
    formRezervacija.Show;
end;

procedure TformMain.slikaLogoutClick(Sender: TObject);
begin
    formMain.Hide;
    formLogin.Show;
end;

procedure TformMain.slikaNalogClick(Sender: TObject);
begin
    formMain.Hide;
    formNalog.Show;
end;

procedure TformMain.slikaRezervacijaClick(Sender: TObject);
begin
    formMain.Hide;
    formRezervacija.Show;
end;

end.
