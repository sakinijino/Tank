UNIT MOUSE;
(* For GraphPlus Softwares Version 2.00 *)
(* Program Maker: ZhongShan *)

INTERFACE
  Uses crt,dos,graph;
  Var Regs:Registers;
  Procedure InitMouse;
  Procedure GetMouseInformation(Var ButtonMode,MouseX,MouseY:Integer);
  Procedure PutMouse(MouseX,MouseY:Integer);
  Function LeftMouseButtonClicked(X1,Y1,X2,Y2:integer):Boolean;
  Function RightMouseButtonClicked(X1,Y1,X2,Y2:integer):Boolean;
  Function BothMouseButtonClicked(X1,Y1,X2,Y2:integer):Boolean;
  Procedure CloseMouse;

IMPLEMENTATION
  Procedure InitMouse;
    Begin
      Regs.Ax:=0;
      Intr($33,regs);
      If Regs.Ax=0 then
        begin
          closegraph;
          writeln('Mouse Driver is not installed.');
          writeln('Program Termination.');
          writeln('Help: Type LH C:\DOS\MOUSE');
          halt;
          exit;
        end;
      Regs.Ax:=1;
      Intr($33,regs);
    End;
  Procedure GetMouseInformation(Var ButtonMode,MouseX,MouseY:Integer);
    Begin
      Regs.Ax:=3;
      Intr($33,regs);
      ButtonMode:=Regs.Bx;
      MouseX:=Regs.Cx;
      MouseY:=Regs.Dx;
    End;
  Procedure PutMouse(MouseX,MouseY:integer);
    Begin
      Regs.Ax:=4;
      Regs.Cx:=MouseX;
      Regs.Dx:=MouseY;
      Intr($33,regs);
    End;
  Function LeftMouseButtonClicked(X1,Y1,X2,Y2:integer):Boolean;
    Begin
        Regs.Ax:=5;
        Regs.Bx:=0;
        Intr($33,regs);
        if (regs.ax=1) and (regs.cx>x1) and (regs.cx<x2) and (regs.dx>y1)
          and (regs.dx<y2)  then LeftMouseButtonClicked:=true
                            else LeftMouseButtonClicked:=false;
    End;

  Function RightMouseButtonClicked(X1,Y1,X2,Y2:integer):Boolean;
    Begin
      Regs.Ax:=5;
      Regs.Bx:=1;
      Intr($33,regs);
      if (regs.ax=2) and (regs.cx>x1) and (regs.cx<x2) and (regs.dx>y1)
        and (regs.dx<y2) then RightMouseButtonClicked:=true
                         else RightMouseButtonClicked:=false;
    End;
  Function BothMouseButtonClicked(X1,Y1,X2,Y2:integer):Boolean;
    Begin
      Regs.Ax:=5;
      Regs.Bx:=2;
      Intr($33,regs);
      if (regs.ax=3) and (regs.cx>x1) and (regs.cx<x2) and (regs.dx>y1)
        and (regs.dx<y2) then BothMouseButtonClicked:=true
                         else BothMouseButtonClicked:=false;
    End;
  Procedure CloseMouse;
    Begin
      Regs.Ax:=2;
      Intr($33,regs);
    End;

END.



