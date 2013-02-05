unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    btnCallDll: TButton;
    btnTrade: TButton;
    btnRelease: TButton;
    btnQuit: TButton;
    pnl1: TPanel;
    lblTradeType: TLabel;
    lblPayType: TLabel;
    lblNo: TLabel;
    lblMoney: TLabel;
    edtTradeType: TEdit;
    edtPayType: TEdit;
    edtMoney: TEdit;
    edtNo: TEdit;
    procedure btnCallDllClick(Sender: TObject);
    procedure btnTradeClick(Sender: TObject);
    procedure btnQuitClick(Sender: TObject);
    procedure btnReleaseClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

  PPosProxyConfig = ^TPosProxyConfig;
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
  
  function PosProxyInit(configfile : PChar; pProxyConfig : PPosProxyConfig) : THandle; stdcall; external 'Proxydll.dll';

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnCallDllClick(Sender: TObject);
var
   config:TPosProxyConfig;
begin
  PosProxyInit('config.ini', nil);
  Application.MessageBox('看到这个对话框就证明调用成功。', '测试');
end;

procedure TForm1.btnTradeClick(Sender: TObject);
begin
  //start trade
end;

procedure TForm1.btnQuitClick(Sender: TObject);
begin
  Close();
end;

procedure TForm1.btnReleaseClick(Sender: TObject);
begin
  //unload proxy
end;

end.
