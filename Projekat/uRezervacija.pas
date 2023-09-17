unit uRezervacija;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls, FMX.ListBox,
  FMX.DateTimeCtrls, FMX.Memo.Types, FMX.ScrollBox, FMX.Memo, uDM;

type
  TformRezervacija = class(TForm)
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
    linijaDatum: TLine;
    labelIme: TLabel;
    Line1: TLine;
    labelDatumD: TLabel;
    dateOdlazak: TDateEdit;
    cbSoba: TComboBox;
    Line2: TLine;
    Label1: TLabel;
    dateDolazak: TDateEdit;
    cbSpa: TCheckBox;
    Line3: TLine;
    Label2: TLabel;
    Line4: TLine;
    Label3: TLabel;
    cbRestoran: TCheckBox;
    buttonPotvrdi: TButton;
    buttonPrikaziCenu: TButton;
    labelCena: TLabel;
    labeltrt: TLabel;
    procedure slikaHomeClick(Sender: TObject);
    procedure slikaNalogClick(Sender: TObject);
    procedure slikaLogoutClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure buttonPrikaziCenuClick(Sender: TObject);
    procedure buttonPotvrdiClick(Sender: TObject);
  private
    Fidgosta: integer;
  public
    property idgosta: integer read fidgosta write fidgosta;
  end;

var
  formRezervacija: TformRezervacija;

implementation

uses uMain, uNalog, uLogin;

{$R *.fmx}

procedure TformRezervacija.buttonPotvrdiClick(Sender: TObject);
var
  IDSoba: Integer;
  DatumPocetka, DatumZavrsetka: TDate;
  IzabraniOpisSobe: string;
  spa, restoran : integer;
begin
  // Dobijte izabrani opis sobe iz ComboBox-a
  IzabraniOpisSobe := cbSoba.Items[cbSoba.ItemIndex];
  DatumPocetka := dateDolazak.Date;
  DatumZavrsetka := dateOdlazak.Date;

   if cbSpa.IsChecked then
  spa := 1
  else
  spa:= 0;

  if cbRestoran.IsChecked then
  restoran := 1
  else
  restoran := 0;


  with baza do
  begin
    // Pronađite odgovarajući ID sobe za izabrani opis u bazi podataka
    qtemp.SQL.Text := 'SELECT sobaID FROM Sobe WHERE opis = :Opis';
    qtemp.Params.ParamByName('Opis').AsString := IzabraniOpisSobe;
    qtemp.Open;

    if not qtemp.IsEmpty then
    begin
      IDSoba := qtemp.FieldByName('sobaID').AsInteger;
      qtemp.Close;

      // Proverite dostupnost sobe za unesene datume
      qtemp.SQL.Text :=
        'SELECT * FROM rezervisaneSobe WHERE sobaID = :SobaID ' +
        'AND (:DatumPocetka <= krajRezervacije) AND (:DatumZavrsetka >= pocetakRezervacije)';
      qtemp.Params.ParamByName('SobaID').AsInteger := IDSoba;
      qtemp.Params.ParamByName('DatumPocetka').AsDate := DatumPocetka;
      qtemp.Params.ParamByName('DatumZavrsetka').AsDate := DatumZavrsetka;
      qtemp.Open;

      if qtemp.IsEmpty then
      begin
        // Unesite rezervaciju u tabelu "Rezervacija"
        qtemp.SQL.Text :=
          'INSERT INTO rezervacije (gost_id, datum_dolaska, datum_odlaska, soba_id, spa, restoran) ' +
          'VALUES (:IDGosta,:DatumPocetka, :DatumZavrsetka, :IDSoba, :spa, :restoran)';
        qtemp.Params.ParamByName('DatumPocetka').AsDate := DatumPocetka;
        qtemp.Params.ParamByName('DatumZavrsetka').AsDate := DatumZavrsetka;
        qtemp.Params.ParamByName('IDSoba').AsInteger := IDSoba;
        qtemp.Params.ParamByName('IDGosta').AsInteger := fidGosta;
        qtemp.Params.ParamByName('spa').AsInteger := spa;
        qtemp.Params.ParamByName('restoran').AsInteger := restoran;
        qtemp.ExecSQL;

        // Unesite rezervisanu sobu u tabelu "Rezervisane Sobe"
        qtemp.SQL.Text :=
          'INSERT INTO RezervisaneSobe (sobaID, pocetakRezervacije, krajRezervacije) ' +
          'VALUES (:IDSoba, :DatumPocetka, :DatumZavrsetka)';
        qtemp.Params.ParamByName('IDSoba').AsInteger := IDSoba;
        qtemp.Params.ParamByName('DatumPocetka').AsDate := DatumPocetka;
        qtemp.Params.ParamByName('DatumZavrsetka').AsDate := DatumZavrsetka;
        qtemp.ExecSQL;

        ShowMessage('Soba je uspešno rezervisana.');
      end
      else
      begin
        ShowMessage('Soba nije dostupna u odabranom periodu.');
      end;
    end
    else
    begin
      ShowMessage('Opis sobe nije pronađen u bazi.');
    end;
  end;
end;

procedure TformRezervacija.buttonPrikaziCenuClick(Sender: TObject);
var
  TipSobeCena: double;
  SpaCena: double;
  RestoranCena: double;
  CelaCena: Double;
  BrojDana: integer;
  begin
  BrojDana:= Trunc(dateOdlazak.Date - dateDolazak.Date) + 1;

  case cbSoba.ItemIndex of
    0: TipSobeCena := 50.00;
    1: TipSobeCena := 100.00;
    2: TipSobeCena := 150.00;
    3: TipSobeCena := 250.00;
    else
    TipSobeCena := 0.00;

  end;
  if cbSpa.IsChecked then
  SpaCena := 50.00
  else
  SpaCena:= 0.00;
  if cbRestoran.IsChecked then
    RestoranCena:= 30.00
    else
    RestoranCena:=0.00;

    CelaCena:=(TipSobecena+SpaCena+restoranCena) * BrojDana;

    labelCena.Text := 'Cena rezervacije je: ' + FormatFloat('#,##0.00', CelaCena) + ' Evra';

end;


procedure TformRezervacija.FormCreate(Sender: TObject);
begin
  with baza do
  begin
  // SQL upit za dohvat svih soba iz tabele "sobe"
  qtemp.SQL.Text := 'SELECT opis FROM sobe';

  // Izvršavanje upita
  qtemp.Open;

  // Popunjavanje ComboBox-a sa rezultatima upita
  while not qtemp.Eof do
  begin
    cbSoba.Items.Add(qtemp.FieldByName('opis').AsString);
    qtemp.Next;
  end;

  // Zatvaranje upita
  qtemp.Close;
  end;
end;



procedure TformRezervacija.slikaHomeClick(Sender: TObject);
begin
    formRezervacija.Hide;
    formMain.Show;
end;

procedure TformRezervacija.slikaLogoutClick(Sender: TObject);
begin
    formRezervacija.Hide;
    formLogin.Show;
end;

procedure TformRezervacija.slikaNalogClick(Sender: TObject);
begin
  formRezervacija.Hide;
  formNalog.Show;
end;

end.
