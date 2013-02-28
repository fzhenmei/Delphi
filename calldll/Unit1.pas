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

  //TCharArray = array of char;

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

  TradeReq = ^TTradeReq;
  TTradeReq = record
    cType : Char;
    payType : Char;
    carrTradeSum : array[0..12] of char;
    carrTradeSN : array [0..12] of char;
    carrTermSN : array[0..6] of char;
    sType : array [0..2] of char;
    czTran : array [0..19] of char;
    czType : array [0..2] of char;
    payName : array [0..10] of char;
  end;

  TradeRsp = ^TTradeRsp;
  TTradeRsp = record
    carrTradeSum : array [0..12] of char;
    carrRsp : array [0..2] of char;
    carrTermNum : array [0..8] of char;
    carrMerchantNo : array [0..15] of char;
    carrTermSN : array [0..6] of char;
    settlementDate : array [0..4] of char;
    carrCardNo : array [0..20] of char;
    carrCardBankNo : array[0..8] of char;
    carrCardBankName : array[0..8] of char;
    carrActualSum : array[0..12] of char;
    carrSysRefNo : array[0..12] of char;
    queryRealBal : array[0..12] of char;
    maxDiscount : array[0..2] of char;
    exchangeJFCount : array[0..12] of char;
    exchangeFLAmount : array[0..12] of char;
    exchangeZJAmount : array[0..12] of char;
    fundConsumeAmount : array[0..12] of Char;
    giftConsumeAmount : array[0..12] of char;
    lotteryName1 : array[0..10] of char;
    lotteryName2 : array[0..10] of char;
    lotteryName3 : array[0..10] of char;
    commonECGiftAmount : array[0..12] of char;
    exclusECGiftAmount : array[0..12] of char;
    commonPaperGiftNum : array[0..12] of Char;
    exclusPaperGiftNum : array[0..12] of char;
    businessECGiftAmount : array[0..12] of char;
    businessPaperGiftNum : array[0..12] of char;
    commonJFCount : array[0..12] of char;
    exclusJFCount : array[0..12] of char;
    businessJFCount : array[0..12] of char;
    otherJFCount : array[0..12] of char;
    consumeDiscType : Char;
    realDiscountAmount : array[0..2] of char;
  end;


  function PosProxyInit(configfile : PChar; pProxyConfig : PPosProxyConfig) : THandle; stdcall; external 'Proxydll.dll';
  function PosProxyDoTrade(handler : THandle; req : TradeReq; rep : TradeRsp ) : THandle; stdcall; external 'Proxydll.dll';
  function PosProxyUninit() : THandle; stdcall; external 'Proxydll.dll'

var
  Form1: TForm1;
  InitHnadler: THandle;

implementation

{$R *.dfm}

{function StringToCharArray(str : string) : TCharArray;
  var
    charArray : TCharArray;
    len : Integer;
    i : Integer;
begin
  len := Length(str);
  SetLength(charArray, Length(str));
  for i := 0 to len do
  begin
    charArray[i] := str[i];
  end;
  //copymemory(@charArray, pchar(str), Length(str));
  Result := charArray;
end;}

procedure TForm1.btnCallDllClick(Sender: TObject);
var
   config:TPosProxyConfig;
begin
  InitHnadler := PosProxyInit('config.ini', nil);
  btnCallDll.Enabled := False;
end;

procedure TForm1.btnTradeClick(Sender: TObject);
  var
    t_request : TTradeReq;
    t_response : TTradeRsp;
    p_request : TradeReq;
    p_response : TradeRsp;
    money : array[0..12] of char;
begin
  t_request.cType := '0';
  t_request.payType := '1';

  t_request.carrTradeSum[0] := '0';
  t_request.carrTradeSum[1] := '0';
  t_request.carrTradeSum[2] := '0';
  t_request.carrTradeSum[3] := '0';
  t_request.carrTradeSum[4] := '0';
  t_request.carrTradeSum[5] := '0';
  t_request.carrTradeSum[6] := '0';
  t_request.carrTradeSum[7] := '0';
  t_request.carrTradeSum[8] := '0';
  t_request.carrTradeSum[9] := '0';
  t_request.carrTradeSum[10] := '0';
  t_request.carrTradeSum[11] := '0';
  t_request.carrTradeSum[12] := '1';

  t_request.carrTermSN[0] := '0';
  t_request.carrTermSN[1] := '0';
  t_request.carrTermSN[2] := '0';
  t_request.carrTermSN[3] := '0';
  t_request.carrTermSN[4] := '0';
  t_request.carrTermSN[5] := '0';
  t_request.carrTermSN[6] := '1';
  
  PosProxyDoTrade(InitHnadler, @t_request, @t_response);
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
