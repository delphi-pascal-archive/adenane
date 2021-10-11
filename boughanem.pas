unit boughanem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, jpeg, Menus, Buttons , Grids, Registry,
  frmInfo, AppEvnts, XPMan;

type
  TAdenane = class(TForm)
    adnanetimer: TTimer;
    leveltimer: TTimer;
    scoretimer: TTimer;
    boughanem: TImage;
    adnane: TImage;
    path: TLabel;
    gameImage: TImage;
    level: TLabel;
    score: TLabel;
    highscore: TLabel;
    hud: TImage;
    start: TImage;
    SpeedButtonInfo: TImage;
    procedure adnanetimerTimer(Sender: TObject);
    procedure leveltimerTimer(Sender: TObject);
    procedure scoretimerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure gameImageMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  
    procedure startClick(Sender: TObject);
    procedure SpeedButtonInfoClick(Sender: TObject);
  
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Adenane: TAdenane;

implementation

{$R *.dfm}

procedure TAdenane.adnanetimerTimer(Sender: TObject);
var
  ouverlay: trect;
begin
  if adnane.left < boughanem.left then adnane.Left := adnane.Left + level.Tag;
  if adnane.left > boughanem.left then adnane.Left := adnane.Left - level.Tag;
  if adnane.top < boughanem.top then adnane.top := adnane.top + level.Tag;
  if adnane.top > boughanem.top then adnane.top := adnane.top - level.Tag;

  if intersectrect(ouverlay, boughanem.boundsrect, adnane.BoundsRect) then begin
    SpeedButtonInfo.Enabled := true;
   adnanetimer.enabled := false;
   leveltimer.Enabled := false;
   scoretimer.Enabled := false;

   hud.Picture.LoadFromFile(path.Caption+'hud_playing.jpg');
   adnane.Visible := false;
   boughanem.visible := false;

   if score.tag > highscore.tag then begin
   highscore.tag := score.tag;
   highscore.caption := inttostr(highscore.tag);
   gameimage.Picture.LoadFromFile(path.Caption+'gameoverhs.jpg');
   end else
   gameimage.Picture.LoadFromFile(path.Caption+'gameover.jpg');
   
   start.Enabled := true;
   end;
end;

procedure TAdenane.leveltimerTimer(Sender: TObject);
begin
 level.Tag := level.Tag + 1;
 level.Caption := inttostr(level.tag);
end;

procedure TAdenane.scoretimerTimer(Sender: TObject);
begin
score.Tag := score.Tag + level.tag * 8;
score.Caption := inttostr(score.tag);
end;

procedure TAdenane.FormCreate(Sender: TObject);
begin
 path.Caption := extractfilepath(application.ExeName);
 gameimage.Picture.LoadFromFile(path.Caption+'bg.jpg');
 hud.Picture.LoadFromFile(path.Caption+'hud_playing.jpg');
end;

procedure TAdenane.gameImageMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
       if adnanetimer.Enabled = true then begin
  boughanem.left := x - boughanem.width div 2;
  boughanem.Top := y - boughanem.Height div 2;
  end;
end;

procedure TAdenane.startClick(Sender: TObject);
begin
start.Enabled := false;

   hud.Picture.LoadFromFile(path.Caption+'hud_playing1.jpg');
  gameimage.Picture.LoadFromFile(path.Caption+'bg_1.jpg');


adnane.Left := 8;
adnane.Top := 8;

 adnane.visible := true;

 boughanem.Left := 386;
boughanem.Top := 213;

  boughanem.visible := true;

  level.Tag := 1;
level.caption := '1';

score.Tag := 0;
score.caption := '0';

    SpeedButtonInfo.Enabled := false;
   adnanetimer.Enabled := true;
   leveltimer.Enabled := true;
   scoretimer.Enabled := true;
   

end;

procedure TAdenane.SpeedButtonInfoClick(Sender: TObject);
var

  fInf : TformInfo;
begin
  fInf := TformInfo.Create(nil);
  try

    fInf.ShowModal;
  finally
    fInf.Release;
  end;
end;



end.
