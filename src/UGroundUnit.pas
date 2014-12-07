unit UGroundUnit;

interface

uses 
  W3System,
  UEnemy, UTextures;

type TGroundUnit = class(TEnemy)
  public
    Speed : float;
    constructor Create(newX, newY, newSpeed : float; newHealth : integer);
    procedure Move(); override;
    function GetRect() : TRectF; override;
    procedure Hit(damage : integer); override;
end;

implementation

constructor TGroundUnit.Create(newX, newY, newSpeed : float; newHealth : integer);
begin
  X := newX;
  Y := newY;
  Speed := newSpeed;
  Health := newHealth;
end;

procedure TGroundUnit.Move();
begin
  X -= Speed;
end;

function TGroundUnit.GetRect() : TRectF;
begin
  exit(TRectF.Create(X, Y, X + GroundUnitTexture.Handle.width, Y + GroundUnitTexture.Handle.height));
end;

procedure TGroundUnit.Hit(damage : integer);
begin
  Health -= damage;
end;

end.