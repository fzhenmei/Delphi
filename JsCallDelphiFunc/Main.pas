unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, SHDocVw_EWB, EwbCore, EmbeddedWB;

type
  TForm1 = class(TForm)
    embdwb1: TEmbeddedWB;
    procedure FormCreate(Sender: TObject);
    procedure embdwb1GetExternal(Sender: TCustomEmbeddedWB;
      var ppDispatch: IDispatch);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  embdwb1.Navigate(ExtractFilePath(Paramstr(0))+'test.htm');
end;

procedure TForm1.embdwb1GetExternal(Sender: TCustomEmbeddedWB;
  var ppDispatch: IDispatch);
begin
  ShowMessage('Call from script', 'Hi')
end;

end.
