unit uAPIServer;

interface

uses
  System.SysUtils, System.Classes, IdContext, IdCustomHTTPServer, IdHTTPServer,System.JSON;

type
  TUserFunctions = class
    class function GetResponseOne: TJSONObject;
  end;

  TAPIServer = class
  private
    FHTTPServer: TIdHTTPServer;
    procedure HandleAPIRequest(AContext: TIdContext; ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
  public
    constructor Create(port:integer);
    destructor Destroy; override;
    procedure Start;
    procedure Stop;

    function IsServerRunning: Boolean;

  end;

implementation

{ TSampleFunctions }

class function TUserFunctions.GetResponseOne: TJSONObject;
begin
  Result := TJSONObject.Create;
  Result.AddPair('text', 'Hello from the example function!');
end;

{ TAPIServer }

constructor TAPIServer.Create(port:integer);
begin
  FHTTPServer := TIdHTTPServer.Create(nil);
  FHTTPServer.DefaultPort := port;
  FHTTPServer.OnCommandGet := HandleAPIRequest;
end;

destructor TAPIServer.Destroy;
begin
  FHTTPServer.Free;
  inherited;
end;

function TAPIServer.IsServerRunning: Boolean;
begin
  Result := FHTTPServer.Active;
end;

procedure TAPIServer.HandleAPIRequest(AContext: TIdContext; ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
var
  ResponseJSON: TJSONObject;
begin
  ResponseJSON := TJSONObject.Create;
  try
    if ARequestInfo.URI = '/api/method1' then
      ResponseJSON.AddPair('message', 'This is API method 1')
    else if ARequestInfo.URI = '/api/method2' then
      ResponseJSON.AddPair('message', 'This is API method 2')
    else if ARequestInfo.URI = '/api/sample_function' then
      ResponseJSON.AddPair('message', TUserFunctions.GetResponseOne)
    else
      AResponseInfo.ResponseNo := 404;


     if AResponseInfo.ResponseNo = 404 then
     ResponseJSON.AddPair('result', false)
     else
     ResponseJSON.AddPair('result', true);




    AResponseInfo.ContentType := 'application/json; charset=utf-8';
    AResponseInfo.ContentText := ResponseJSON.ToString;
  finally
    ResponseJSON.Free;
  end;
end;

procedure TAPIServer.Start;
begin
  FHTTPServer.Active := True;
end;

procedure TAPIServer.Stop;
begin
  FHTTPServer.Active := False;
end;

end.

