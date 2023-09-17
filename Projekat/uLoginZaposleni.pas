unit uLoginZaposleni;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts,uDM,uMain,uZaposleniMain;

type
  TformLoginZaposleni = class(TForm)
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
    buttonLogin: TButton;
    Text1: TText;
    registracijaText: TText;
    cbPrikaziSifru: TCheckBox;
    procedure registracijaTextClick(Sender: TObject);
    procedure cbPrikaziSifruChange(Sender: TObject);
    procedure buttonLoginClick(Sender: TObject);
  private
    { Private declarations }
  public
    GuestName, GuestLastName, GuestEmail, GuestPhone, GuestUsername, GuestPassword, username: string;
     GuestID: integer;
  end;

var
  formLoginZaposleni: TformLoginZaposleni;

implementation

uses uLogin;

{$R *.fmx}

procedure TformLoginZaposleni.buttonLoginClick(Sender: TObject);
var pwd: string;
begin
    username := editUsername.Text;
    if trim(editUsername.Text)='' then
      begin
        ShowMessage('Molimo vas unesite korisnicko ime!');
        editUsername.SetFocus;
      end;
    if trim(editSifra.Text)='' then
      begin
        ShowMessage('Molimo vas unesite sifru!');
        editUsername.SetFocus;
      end
    else
      begin
      //PROVERA DA LI USERNAME I SIFRA POSTOJI U BAZI
        with baza do begin
          dm.open;
          qtemp.sql.clear;
          qtemp.SQL.Text:='Select * FROM Zaposleni WHERE KorisnickoIme= '+quotedstr(editUsername.text);
          qtemp.Open;
            if qtemp.RecordCount > 0 then
              begin
                pwd:=qtemp.FieldByName('Lozinka').AsString;
                if pwd= editSifra.Text then
                  begin
                    // Pretpostavimo da ste provjerili korisničko ime i lozinku i da je prijava uspješna.
                    // Dohvatite ID gosta na temelju korisničkog imena.
                    qtemp.SQL.Text := 'SELECT Id FROM Zaposleni WHERE KorisnickoIme = :username;';
                    qtemp.ParamByName('username').AsString := editUsername.Text; // Zamijenite s pravim poljem za korisničko ime
                    qtemp.Open;
                    GuestID := qtemp.FieldByName('Id').AsInteger;
                    qtemp.Close;
                    // Sada kad imate ID gosta, možete dohvatiti njihovo ime iz baze.
                    qtemp.SQL.Text := 'SELECT Ime, Prezime, Email, KorisnickoIme, Lozinka, Tel, RadnoVreme, RadnoMesto FROM Zaposleni WHERE Id = :gostID;';
                    qtemp.ParamByName('gostID').AsInteger := GuestID;
                    qtemp.Open;
                    GuestName := qtemp.FieldByName('ime').AsString;
                    GuestLastName := qtemp.FieldByName('prezime').AsString;
                    GuestEmail := qtemp.FieldByName('email').AsString;
                    GuestPhone := qtemp.FieldByName('Tel').AsString;
                    GuestUsername := qtemp.FieldByName('KorisnickoIme').AsString;
                    GuestPassword := qtemp.FieldByName('Lozinka').AsString;
                    qtemp.Close;

                   formLogin.Hide;
                    if not Assigned(formZaposleniMAin) then
                    formZaposleniMAin:= tformZaposleniMAin.Create(self);
                    formZaposleniMAin.ShowModal(
                                      procedure(Modalresult: TmodalResult)
                                        begin
                                     if ModalResult = mrClose then Application.Terminate
                                    end);
                  end
              else
                 begin
                  ShowMessage('Pogresna Sifra!');
                 end;
              end
            else begin
              ShowMessage('Korisnicko ime nije validno!')
            end;
           end;
          end;
        end;

procedure TformLoginZaposleni.cbPrikaziSifruChange(Sender: TObject);
begin
    editSifra.Password:= not cbPrikaziSifru.IsChecked;
end;

procedure TformLoginZaposleni.registracijaTextClick(Sender: TObject);
begin
    Hide;

    formLogin.Show;
end;

end.
