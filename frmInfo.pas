unit frmInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Buttons, StdCtrls, ExtCtrls, Jpeg, ShellAPI, AppEvnts;
  
type
  TformInfo = class(TForm)
    PageControl1: TPageControl;
    TabSheetAuthor: TTabSheet;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure Label1MouseMove(Sender: TObject; Shift: TShiftState; X,
    Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
    Y: Integer);
    procedure Label1Click(Sender: TObject);
  private
    { Private declarations }
    function GetResStreamJPG(const ResName:String):TJPEGImage;
  public
    { Public declarations }
  end;
  
var
  formInfo: TformInfo;
  
implementation

{$R *.dfm}
{$R About_RES.RES}

procedure TformInfo.SpeedButton1Click(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TformInfo.FormKeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
begin
  if Key = VK_RETURN then SpeedButton1.Click;;
end;

procedure TformInfo.FormCreate(Sender: TObject);
//var
 // Pic : TJPEGImage;
begin
 {
  PageControl1.ActivePage := TabSheetAuthor;

  Pic:=TJPEGImage.Create;
  try
    Pic:=GetResStreamJPG('About');
   
  finally
    Pic.Free;
  end;
 }
end;

procedure TformInfo.Label1MouseMove(Sender: TObject; Shift: TShiftState; X,
Y: Integer);
begin
  Label1.Font.Color := clRed;
  Label1.Cursor := crHandPoint;
end;

procedure TformInfo.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
Y: Integer);
begin
  Label1.Font.Color := clBlue;
end;

function TformInfo.GetResStreamJPG(const ResName: String): TJPEGImage;
var
  Stream:TResourceStream;
begin
 {
  Stream:=TResourceStream.Create(HInstance, ResName, PChar('JPG'));
  Result:=TJPEGImage.Create;
  try
    Result.LoadFromStream(Stream);
  finally
    Stream.Free;
  end;
 }
end;

procedure TformInfo.Label1Click(Sender: TObject);
var
  Eml, Subj, Param : String;
begin
  Eml:='adnaner_05@yahoo.fr';
  Subj:='Adnaner';
  Param:='mailto:' + Eml + '?subject=' + Subj;
  ShellExecute(Handle, 'open', PChar(Param), nil, nil, SW_SHOWNORMAL);
end;

end.
