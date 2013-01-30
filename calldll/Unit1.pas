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
    size: Integer;
    sport: Integer;
    baudrate: LongWord;
    parity: Byte;
    bytesize: Byte;
    stopbits: Byte;
    iserialsecs: Integer;
    port: Integer;
    cnetaddress: String;
    isocketsecs: Integer;
    pcallback: Pointer;
    bBlock: Integer;
    ihhsecs: Integer;
    idtsecs: Integer;
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
  Application.MessageBox('��������Ի����֤�����óɹ���', '����');
end;

end.
