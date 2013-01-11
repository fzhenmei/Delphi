unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    btnCallDll: TButton;
    procedure btnCallDllClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TPosProxyConfig = record
    
  end;

  function PosProxyInit(configfile : PChar; pProxyConfig : TPosProxyConfig) : THandle; external 'Proxydll' index 1;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnCallDllClick(Sender: TObject);
var
   config:TPosProxyConfig;
begin

  PosProxyInit('E:\Git\Delphi\calldll\config.ini', config);
  Application.MessageBox('看到这个对话框就证明调用成功。', '测试');
end;

end.
