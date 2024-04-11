unit Unit6;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IdBaseComponent, IdComponent,
  IdCustomTCPServer, IdCustomHTTPServer, IdHTTPServer, IdContext, Vcl.StdCtrls,
  Vcl.Buttons,uAPIServer, Vcl.ExtCtrls,Vcl.Themes;

type
  TForm6 = class(TForm)
    BitBtn1: TBitBtn;
    Shape1: TShape;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    cbxVclStyles: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure IdHTTPServer1CommandGet(AContext: TIdContext;
      ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure UpdateIndicator(ServerRunning: Boolean);
    procedure cbxVclStylesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

  APIServer:TAPIServer;

implementation

{$R *.dfm}


procedure TForm6.UpdateIndicator(ServerRunning: Boolean);
begin
  if ServerRunning then
    Shape1.Brush.Color := clLime // зеленый
  else
    Shape1.Brush.Color := clRed; // красный
end;

procedure TForm6.BitBtn1Click(Sender: TObject);
begin
      APIServer:=TAPIServer.Create(8080);
      APIServer.Start;

     UpdateIndicator(APIServer.IsServerRunning);


end;

procedure TForm6.BitBtn2Click(Sender: TObject);
begin
    APIServer.stop;
    UpdateIndicator(APIServer.IsServerRunning);

end;

procedure TForm6.cbxVclStylesChange(Sender: TObject);
begin
      TStyleManager.SetStyle(cbxVclStyles.Text);
end;

procedure TForm6.FormCreate(Sender: TObject);
var
  StyleName: string;
begin



  for StyleName in TStyleManager.StyleNames do
    cbxVclStyles.Items.Add(StyleName);

  cbxVclStyles.ItemIndex := cbxVclStyles.Items.IndexOf(TStyleManager.ActiveStyle.Name);

end;

procedure TForm6.IdHTTPServer1CommandGet(AContext: TIdContext;
  ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
begin


  if ARequestInfo.Document = '/api/method1' then
  begin
    AResponseInfo.ContentText := 'Method 1 response';
  end
  else if ARequestInfo.Document = '/api/method2' then
  begin
    AResponseInfo.ContentText := 'Method 2 response';
  end
  else if ARequestInfo.Document = '/api/method3' then
  begin
    AResponseInfo.ContentText := 'Method 3 response';
  end
  else
  begin
    // Неизвестный путь
    AResponseInfo.ResponseNo := 404;
    AResponseInfo.ContentText := 'Not found';
  end;

end;

end.
