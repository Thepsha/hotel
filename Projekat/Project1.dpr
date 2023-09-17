program Project1;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  uDM in 'uDM.pas' {Baza},
  uIstorija in 'uIstorija.pas' {formIstorija},
  uLogin in 'uLogin.pas' {formLogin},
  uLoginZaposleni in 'uLoginZaposleni.pas' {formLoginZaposleni},
  uMain in 'uMain.pas' {formMain},
  uNalog in 'uNalog.pas' {formNalog},
  uRegister in 'uRegister.pas' {formRegister},
  uRezervacija in 'uRezervacija.pas' {formRezervacija},
  Hotel in 'Hotel.pas' {OpremaPopravkaForm},
  OdrzavanjeDruga in 'OdrzavanjeDruga.pas' {FormaOdrzavanjeDruga},
  OdrzavanjeOpremaZaCiscenje in 'OdrzavanjeOpremaZaCiscenje.pas' {FormaOdrzavanjeOpremaZaCiscenje},
  OdrzavanjeOpremaZaPopravka in 'OdrzavanjeOpremaZaPopravka.pas' {FormaOdrzavanjeOpremaZaPopravku},
  OsnovnaSredstva in 'OsnovnaSredstva.pas' {OdrzavanjePocetna},
  Popravka in 'Popravka.pas' {PopravkaForm},
  Restoran in 'Restoran.pas' {OpremaCiscenjeForm},
  SigurnosnaOprema in 'SigurnosnaOprema.pas' {SigurnosnaOpremaForm},
  Zaposleni in 'Zaposleni.pas' {ZaposleniForm},
  uZaposleniMain in 'uZaposleniMain.pas' {formZaposleniMain},
  Izvestaj in 'Izvestaj.pas' {OsnovnaIzvestaj},
  DB in 'DB.pas' {DBForm},
  dobavljaci in 'dobavljaci.pas' {Form4},
  magacin in 'magacin.pas' {Form5},
  meni in 'meni.pas' {Form2},
  narucivanje in 'narucivanje.pas' {Form6},
  Pregled in 'Pregled.pas' {Form7},
  prZahteva in 'prZahteva.pas' {Form9},
  snabdevaci in 'snabdevaci.pas' {Form8},
  zahtev in 'zahtev.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TBaza, Baza);
  Application.CreateForm(TformIstorija, formIstorija);
  Application.CreateForm(TformLogin, formLogin);
  Application.CreateForm(TformLoginZaposleni, formLoginZaposleni);
  Application.CreateForm(TformMain, formMain);
  Application.CreateForm(TformNalog, formNalog);
  Application.CreateForm(TformRegister, formRegister);
  Application.CreateForm(TformRezervacija, formRezervacija);
  Application.CreateForm(TOpremaPopravkaForm, OpremaPopravkaForm);
  Application.CreateForm(TOsnovnaIzvestaj, OsnovnaIzvestaj);
  Application.CreateForm(TFormaOdrzavanjeDruga, FormaOdrzavanjeDruga);
  Application.CreateForm(TFormaOdrzavanjeOpremaZaCiscenje, FormaOdrzavanjeOpremaZaCiscenje);
  Application.CreateForm(TFormaOdrzavanjeOpremaZaPopravku, FormaOdrzavanjeOpremaZaPopravku);
  Application.CreateForm(TOdrzavanjePocetna, OdrzavanjePocetna);
  Application.CreateForm(TPopravkaForm, PopravkaForm);
  Application.CreateForm(TOpremaCiscenjeForm, OpremaCiscenjeForm);
  Application.CreateForm(TSigurnosnaOpremaForm, SigurnosnaOpremaForm);
  Application.CreateForm(TZaposleniForm, ZaposleniForm);
  Application.CreateForm(TformZaposleniMain, formZaposleniMain);
  Application.CreateForm(TDBForm, DBForm);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TDBForm, DBForm);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TOsnovnaIzvestaj, OsnovnaIzvestaj);
  Application.CreateForm(TDBForm, DBForm);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(TForm9, Form9);
  Application.CreateForm(TForm8, Form8);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
