unit uRegister;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts, uLoginZaposleni, uDM, uMain;

type
  TformRegister = class(TForm)
    loginSlika: TImage;
    footer: TLayout;
    header: TLayout;
    klijent: TLayout;
    forestTekst: TText;
    drvoSlika: TImage;
    usernameLinija: TLine;
    usernameLabel: TLabel;
    editUsername: TEdit;
    sifraLinija: TLine;
    labelSifra: TLabel;
    editSifra: TEdit;
    Text1: TText;
    imeLinija: TLine;
    imeLabel: TLabel;
    editIme: TEdit;
    prezimeLinija: TLine;
    labelPrezime: TLabel;
    editPrezime: TEdit;
    emailLinija: TLine;
    labelEmail: TLabel;
    editEmail: TEdit;
    telefonLinija: TLine;
    labelTelefon: TLabel;
    editTelefon: TEdit;
    tekstLogin: TText;
    tekstZaposleniLogin: TText;
    buttonRegister: TButton;
    cbPrikaziSifru: TCheckBox;
    procedure tekstLoginClick(Sender: TObject);
    procedure tekstZaposleniLoginClick(Sender: TObject);
    procedure cbPrikaziSifruChange(Sender: TObject);
    procedure buttonRegisterClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formRegister: TformRegister;

implementation

uses uLogin;

{$R *.fmx}
////ZATVARANJE I OTVARANJE LOGIN I LOGINA ZA ZAPOSLENE
procedure TformRegister.buttonRegisterClick(Sender: TObject);
var
  username, sifra, ime, prezime, telefon, email: string;
  begin
  //provera da li su podaci uneti
  if trim(editUsername.Text)='' then
      begin
        ShowMessage('Molimo vas unesite korisnicko ime!');
        editUsername.SetFocus;
      end;
  if trim(editSifra.Text)='' then
      begin
        ShowMessage('Molimo vas unesite sifru!');
        editSifra.SetFocus;
      end;
  if trim(editEmail.Text)='' then
      begin
        ShowMessage('Molimo vas unesite email!');
        editEmail.SetFocus;
      end;
  if trim(editime.Text)='' then
      begin
        ShowMessage('Molimo vas unesite ime!');
        editime.SetFocus;
      end;
  if trim(editprezime.Text)='' then
      begin
        ShowMessage('Molimo vas unesite prezime!');
        editprezime.SetFocus;
      end;
  if trim(edittelefon.Text)='' then
      begin
        ShowMessage('Molimo vas unesite broj telefona!');
        edittelefon.SetFocus;
      end
  else
  // Dohvaćanje unesenih podataka
  username := editUsername.Text;
  sifra := editsifra.Text;
  ime := editime.Text;
  prezime := editprezime.Text;
  telefon := edittelefon.Text;
  email := editemail.Text;
    with baza do
      begin
        dm.Open();
        qtemp.SQL.Clear;
        qtemp.SQL.Text:= 'SELECT COUNT(*) FROM gosti WHERE email = :Email';
        qtemp.ParamByName('Email').AsString := editEmail.Text;
        qtemp.Open;
        if qtemp.Fields[0].AsInteger > 0 then
          begin
            ShowMessage('Email adresa već postoji. Molimo izaberite drugu.');
            qtemp.Close;
            qtemp.Connection.Close;
            Exit;
          end;
      begin
        dm.Open();
        qtemp.SQL.Clear;
        qtemp.SQL.Text:= 'SELECT COUNT(*) FROM gosti WHERE username = :Username';
        qtemp.ParamByName('Username').AsString := editUsername.Text;
        qtemp.Open;
        if qtemp.Fields[0].AsInteger > 0 then
          begin
            ShowMessage('Username već postoji. Molimo izaberite drugi.');
            qtemp.Close;
            qtemp.Connection.Close;
            Exit;
          end;

      end;
    with baza do
      begin
        dm.open;
        qtemp.sql.clear;
        qtemp.SQL.Text:='INSERT INTO gosti (ime, prezime, username, sifra, email, broj_telefona) ' +
                        'VALUES (:ime, :prezime, :username, :sifra, :email, :telefon)';
      qtemp.Params.ParamByName('username').AsString := username;
      qtemp.Params.ParamByName('sifra').AsString := sifra;
      qtemp.Params.ParamByName('ime').AsString := ime;
      qtemp.Params.ParamByName('prezime').AsString := prezime;
      qtemp.Params.ParamByName('email').AsString := email;
      qtemp.Params.ParamByName('telefon').AsString := telefon;
      qtemp.ExecSQL;

        ShowMessage('Uspešno ste se registrovali!');

        formRegister.Hide;

        formlogin.Show;

        qtemp.Free;

      end;
    end;
  end;


procedure TformRegister.cbPrikaziSifruChange(Sender: TObject);
begin
    editSifra.Password:= not cbPrikaziSifru.IsChecked;
end;

procedure TformRegister.tekstLoginClick(Sender: TObject);
begin
    Hide;

    formLogin.Show;
end;

procedure TformRegister.tekstZaposleniLoginClick(Sender: TObject);
begin
    Hide;

    formLoginZaposleni.Show;
end;

end.
