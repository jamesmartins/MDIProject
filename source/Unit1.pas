unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    CriaJanela1: TMenuItem;
    Janelas1: TMenuItem;
    Cascata1: TMenuItem;
    LadoaLado1: TMenuItem;
    procedure CriaJanela1Click(Sender: TObject);
    procedure Cascata1Click(Sender: TObject);
    procedure LadoaLado1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit2;

{$R *.DFM}

procedure TForm1.CriaJanela1Click(Sender: TObject);
begin
  TForm2.Create(Self).Show;
end;

procedure TForm1.Cascata1Click(Sender: TObject);
begin
  Cascade;
end;

procedure TForm1.LadoaLado1Click(Sender: TObject);
begin
  Tile;
end;

end.
