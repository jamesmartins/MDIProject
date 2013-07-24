unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
  TForm2 = class(TForm)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     procedure WMSize(var Msg : TWMSize);Message WM_SIZE;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.DFM}

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TForm2.WMSize(var Msg:TWMSize); 
begin 
  if Msg.SizeType = Size_Minimized then 
    ShowWindow(Handle, Sw_Hide); 
end; 

end.
