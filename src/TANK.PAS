Program TankGame;

 uses mouse,crt,graph;
 label 20;
 Type jilu=record
            name:string;
            score:integer;
           end;
 var mx,my,pl,bai,code,i,a,b,c,gd,gm,w1,w2,se,fen3,dsh,qsh,bsh:integer;
     long,mode,time,k,tankcolor,m1,m2,d,q,wx,x1,fen1,bj,bx1,sco:integer;
     ch,sh,th:char;
     dsh1,qsh1,bsh1,fen,fen2,s:string;
     con:boolean;f1:text;f2:file of integer;
     best:array[1..3]of jilu;
 Procedure window1(x,y,x1,y1,c:integer;str:string);
  var n,m,len:integer;
  begin
{  setcolor(7);
  bar(x,y,x1,y1);
  rectangle(x,y,x1,y1);
  setfillstyle(1,7);
  floodfill((x+x1)div 2,(y+y1)div 2,7);}
  setfillstyle(1,7);
  bar(x,y,x1,y1);
  setcolor(15);
  line(x,y,x,y1-1);
  line(x,y,x1-1,y);
  setcolor(0);
  line(x1,y+1,x1,y1);
  line(x1,y1,x+1,y1);
  n:=5;m:=25;
  setcolor(15);
  line(x1-n,y+n,x1-n,y+n+m);
  line(x1-n,y+n+m,x+n,y+n+m);
  setcolor(0);
  line(x1-n,y+n,x+n,y+n);
  line(x+n,y+n,x+n,y+n+m);
  setcolor(c);
  rectangle(x+n+1,y+n+1,x1-n-1,y+n+m-1);
  setfillstyle(1,c);
  floodfill((x+x1)div 2,y+n+(m div 2),c);
  setcolor(0);
  rectangle(x+n+1,y+n+1,x+n+m-1,y+n+m-1);
  setfillstyle(1,7);
  floodfill(x+n+(m div 2),y+n+(m div 2),0);
  setcolor(7);
  rectangle(x+n+1,y+n+1,x+n+m-1,y+n+m-1);
  setcolor(0);
  rectangle(x+n+4,y+n+11,x+n+m-4,y+n+m-11);
  setfillstyle(1,15);
  floodfill(x+n+(m div 2),y+n+(m div 2),0);
  len:=length(str);
  setcolor(15);
  settextstyle(1,0,1);
  outtextxy(((x+m+x1) div 2)-6*len,y+n+2,str);
 end;
  procedure en(x,y,x1,y1:integer;no1:boolean);
  begin
  if no1 then setcolor(15) else setcolor(0);
  line(x,y,x,y1);
  line(x,y,x1,y);
  if no1 then setcolor(0) else setcolor(15);
  line(x,y1,x1,y1);
  line(x1,y1,x1,y);
  end;

Procedure inputstring(x,y:Word;font,Size,wordcolor,bkcolor,Max:Byte;var s:string);
 Var stop:boolean;s1:string;long:integer;ch:char;
 Begin
  s1:='';
  long:=0;
  stop:=false;
  moveto(x,y);
  settextstyle(font,0,size);
  setcolor(wordcolor);
  repeat
   ch:=readkey;
   case ch of
    #13:stop:=true;
    #27:begin
         moveto(x,y);
         setcolor(bkcolor);
         outtext(s1);
         s1:='';
         stop:=true;
        end;
    #8:begin
        moveto(x,y);
        setcolor(bkcolor);
        outtext(s1);
        long:=long-1;
        s1:=copy(s1,1,long);
        moveto(x,y);
        setcolor(wordcolor);
        outtext(s1);
       end;
   else begin
         s1:=s1+ch;
         long:=long+1;
         outtext(ch);
        end;
   end;{case}
  until stop or (long>=max);
  s:=s1;
 end;

procedure othertank;
  begin
    circle(w1,w2,30);
    setfillstyle(9,se);
    floodfill(w1,w2,15);
    rectangle(w1+35,w2+30,w1+30,w2-30);
    rectangle(w1-35,w2+30,w1-30,w2-30);
    rectangle(w1+2,w2+55,w1-2,w2+30);
    for d:=1 to 11 do
      begin
      line(w1+35,w2+30-d*5,w1+30,w2+30-d*5);
      line(w1-35,w2+30-d*5,w1-30,w2+30-d*5);
      end;
  end;
procedure zhx;
  begin
    if m1=w1 then begin
                    circle(w1,w2,30);
                    setfillstyle(1,12);
                    floodfill(w1,w2,15);
                    delay(100);
                    setfillstyle(1,0);
                    floodfill(w1,w2,15);
                    delay(100);
                    setfillstyle(9,se);
                    floodfill(w1,w2,15);
                  end;
    if m2-55>w2+55 then begin {m1,w2}
                          line(m1-10,w2,m1+10,w2);
                          line(m1,w2+10,m1,w2-10);
                        end
                   else begin {m1,30}
                          line(m1-10,30,m1+10,30);
                          line(m1,40,m1,20);
                        end;

    setcolor(15);
  end;
procedure qzh;
  begin
    setcolor(0);
    if m2-55>w2+55 then begin
                          line(m1-10,w2,m1+10,w2);
                          line(m1,w2+10,m1,w2-10);
                        end
                   else begin
                          line(m1-10,30,m1+10,30);
                          line(m1,40,m1,20);
                        end;
    setcolor(15);
  end;
procedure qf;
  begin
    setviewport(1,429,639,479,clipon);
    clearviewport;
    setviewport(0,0,639,479,clipon);
  end;
procedure qd;
  begin
    setviewport(m1+25,d-10,m1+36,d+42,clipon);
    clearviewport;
    setviewport(m1-36,d-10,m1-25,d+42,clipon);
    clearviewport;
    setviewport(0,0,639,479,clipon);
  end;
procedure dd;
  begin
    d:=m2-70;
    repeat
      setcolor(7);
      rectangle(m1+35,d,m1+29,d+30);
      rectangle(m1-35,d,m1-29,d+30);
      arc(m1+32,d,0,180,3);
      arc(m1-32,d,0,180,3);
      setcolor(12);
      line(m1+35,d,m1+30,d);
      line(m1-35,d,m1-30,d);
      line(m1+35,d+8,m1+30,d+8);
      line(m1-35,d+8,m1-30,d+8);
      rectangle(m1+34,d+31,m1+30,d+40);
      rectangle(m1-34,d+31,m1-30,d+40);
      setfillstyle(1,12);
      floodfill(m1+31,d+35,12);
      floodfill(m1-31,d+35,12);
      delay(10);
      qd;
      d:=d-20;
    until d<w2;
    setcolor(12);
    for bj:=1 to 30 do
    begin
      circle(m1+33,w2,bj);
      circle(m1-33,w2,bj);
    end;
    setcolor(0);
    for bj:=30 downto 1 do
    begin
      circle(m1+33,w2,bj);
      circle(m1-33,w2,bj);
    end;
    setcolor(15);
  end;
procedure bx;
  begin
    d:=m2-70;
    repeat
      setcolor(2);
      rectangle(m1+35,d,m1+29,d+30);
      rectangle(m1-35,d,m1-29,d+30);
      arc(m1+32,d,0,180,3);
      arc(m1-32,d,0,180,3);
      setcolor(12);
      line(m1+35,d,m1+30,d);
      line(m1-35,d,m1-30,d);
      line(m1+35,d+8,m1+30,d+8);
      line(m1-35,d+8,m1-30,d+8);
      rectangle(m1+34,d+31,m1+30,d+40);
      rectangle(m1-34,d+31,m1-30,d+40);
      setfillstyle(1,12);
      floodfill(m1+31,d+35,12);
      floodfill(m1-31,d+35,12);
      delay(10);
      qd;
      d:=d-20;
    until d<10;
   for d:=0 to 43 do
   begin
     line(1,w2-d+13,639,w2-d+13);
     line(1,w2+d+13,639,w2+d+13);
   end;
   setcolor(0);
   for d:=43 downto 0 do
   begin
     line(1,w2-d+13,639,w2-d+13);
     line(1,w2+d+13,639,w2+d+13);
   end;
   setcolor(15);
  end;
procedure jq;
  begin
    setcolor(12);
    line(m1+1,m2-55,m1+1,w2);
    line(m1,m2-55,m1,w2);
    line(m1-1,m2-55,m1-1,w2);
    delay(20);
    setcolor(0);
    line(m1+1,m2-55,m1+1,w2);
    line(m1,m2-55,m1,w2);
    line(m1-1,m2-55,m1-1,w2);
    setcolor(12);
    for bj:=1 to 30 do
    circle(m1,w2,bj);
    setcolor(0);
    for bj:=30 downto 1 do
    circle(m1,w2,bj);
    setcolor(15);
  end;
procedure qm;
  begin
    setviewport(m1-36,m2-55,m1+36,m2+30,clipon);
    clearviewport;
    setviewport(0,0,639,479,clipon);
  end;
procedure qy;
   begin
    setviewport(w1-35,w2-30,w1+35,w2+55,clipon);
    clearviewport;
    setviewport(0,0,639,479,clipon);
  end;
procedure drawmytank;
  begin
    line(m1-10,m2+30,m1+10,m2+30);
    line(m1+10,m2-30,m1-10,m2-30);
    line(m1-30,m2-10,m1-30,m2+10);
    line(m1+30,m2+10,m1+30,m2-10);
    line(m1+10,m2+30,m1+30,m2+10);
    line(m1-10,m2-30,m1-30,m2-10);
    line(m1-10,m2+30,m1-30,m2+10);
    line(m1+10,m2-30,m1+30,m2-10);
    rectangle(m1+36,m2+30,m1+31,m2-30);
    rectangle(m1-36,m2+30,m1-31,m2-30);
    for d:=1 to 11 do
      begin
      line(m1+36,m2+30-d*5,m1+31,m2+30-d*5);
      line(m1-36,m2+30-d*5,m1-31,m2+30-d*5);
      end;
    rectangle(m1+2,m2-55,m1-2,m2-30);
    setfillstyle(1,tankcolor);
    floodfill(m1-20,m2,15);
  end;
procedure jf;
  begin
   qf;
   line(0,429,640,429);
   setcolor(12);
   rectangle(10,439,60,469);
   rectangle(70,439,120,469);
   rectangle(130,439,180,469);
   setfillstyle(1,4);
   if wx>=3 then begin
                  floodfill(40,449,12);
                  floodfill(100,449,12);
                  floodfill(160,449,12);
                end;
   if wx=2 then begin
                  floodfill(40,449,12);
                  floodfill(100,449,12);
                end;
   if wx=1 then begin
                  floodfill(40,449,12);
                end;
   setcolor(15);
   setcolor(9);
   rectangle(450,439,500,469);
   rectangle(510,439,560,469);
   rectangle(570,439,620,469);
   setfillstyle(1,1);
   if x1>=3 then begin
                  floodfill(480,449,9);
                  floodfill(520,449,9);
                  floodfill(580,449,9);
                end;
   if x1=2 then begin
                  floodfill(520,449,9);
                  floodfill(580,449,9);
                end;
   if x1=1 then begin
                  floodfill(580,449,9);
                end;

   setcolor(15);
   settextstyle(1,0,2);
   outtextxy(41,440,'Your Tank');
   outtextxy(472,440,'Hostile Tank');
   settextstyle(100,0,1*1);
   str(qsh,qsh1);
   str(dsh,dsh1);
   str(bsh,bsh1);
   outtextxy(210,439,'G  U  N:');
   outtextxy(280,439,qsh1);
   outtextxy(210,459,'MISSILE:');
   outtextxy(280,459,dsh1);
   outtextxy(320,459,'FRACTION:');
   outtextxy(400,459,fen);
   outtextxy(320,439,'UNIQUE SKILL:');
   outtextxy(428,439,bsh1);
  end;
procedure help;
  begin
    cleardevice;
    line(10,0,30,0);
    repeat until keypressed;
    ch:=readkey;
    cleardevice;
    drawmytank;
    othertank;
    jf;
    zhx;
  end;
procedure dr;
  label 10,20,30,40,50;
  begin
    drawmytank;
    randomize;
    w2:=random(3);
    if w2=1 then begin
                   if (w2=0) or (w2=0) then w1:=600
                                       else w1:=40;
                   w2:=(random(30)+3)*10
                 end
            else begin
                   w2:=30;
                   w1:=(random(56)+4)*10;;
                 end;
    se:=random(4);
    if se=0 then begin
                         se:=14;
                         x1:=3;
                         fen2:='300';
                         goto 10;
                       end;
    if se=1 then begin
                        se:=9;
                        x1:=1;
                        fen2:='100';
                        goto 10;
                       end;
    if se=2 then begin
                        se:=10;
                        x1:=2;
                        fen2:='200';
                        goto 10;
                       end;
    if se=3 then begin
                        se:=13;
                        x1:=2;
                        fen2:='200';
                       end;
10: othertank;
    zhx;
    jf;
    repeat
      delay(200);
      qy;
      qzh;
      a:=random(100);
      b:=random(100);
      if a mod 3=0 then w1:=w1+10;
      if a mod 3=1 then w1:=w1-10;
30:   if w1>600 then w1:=w1-570;
      if w1<40   then w1:=w1+570;
      if b mod 4<>(0) and (1) then w2:=w2+time;
      if b mod 4=1 then w2:=w2-time;
40:   if w2>335 then w2:=w2-305;
      if w2<30  then w2:=w2+2;
      if (w2+55>m2-55) and (w2-30<m2+30) and (w1+35>m1-35) and (w1-35<m1+35) then
       begin
        setcolor(12);
        for bj:=1 to 100 do
         circle(w1,w2,bj);
        setcolor(0);
        for bj:=100 downto 1 do
         circle(w1,w2,bj);
        setcolor(15);
        x1:=0;
        wx:=wx-1;
        jf;
        goto 50
       end;
      othertank;
      zhx;
      if a mod pl=0  then begin
                          if m2-55>w2+55  then begin
                                                 b:=(random(56)+4)*10;
                                                 setcolor(5);
                                                 line(w1+1,w2+55,b+1,m2);
                                                 line(w1,w2+55,b,m2);
                                                 line(w1-1,w2+55,b-1,m2);
                                                 delay(100);
                                                 setcolor(0);
                                                 line(w1+1,w2+55,b+1,m2);
                                                 line(w1,w2+55,b,m2);
                                                 line(w1-1,w2+55,b-1,m2);
                                                 setcolor(12);
                                                 for bj:=1 to 30 do
                                                 circle(b,m2,bj);
                                                 setcolor(0);
                                                 for bj:=30 downto 1 do
                                                 circle(b,m2,bj);
                                                 setcolor(15);
                                                 if abs(b-m1)<3 then begin
                                                                wx:=wx-1;
                                                                jf;
                                                              end;
                                               end
                                          else begin
                                                 b:=(random(56)+4)*10;
                                                 setcolor(5);
                                                 line(w1+1,w2+55,b+1,398);
                                                 line(w1,w2+55,b,398);
                                                 line(w1-1,w2+55,b-1,398);
                                                 delay(100);
                                                 setcolor(0);
                                                 line(w1+1,w2+55,b+1,398);
                                                 line(w1,w2+55,b,398);
                                                 line(w1-1,w2+55,b-1,398);
                                                 setcolor(12);
                                                 for bj:=1 to 30 do
                                                 circle(b,398,bj);
                                                 setcolor(0);
                                                 for bj:=30 downto 1 do
                                                 circle(b,398,bj);
                                                 setcolor(15);
                                               end;
                        end;
      drawmytank;
      getmouseinformation(mode,mx,my);
      if (keypressed)or(mx<>m1)or(my<>m2)or(mode<>0) then begin
                           qm;
                           qzh;
                           if keypressed then ch:=readkey
                                         else ch:=' ';
                            m1:=m1+(mx-m1)div 5;
                            m2:=m2+(my-m2)div 7;
                           case ord(ch) of
                            0:begin ch:=readkey;
                            case ch of
                            #75:m1:=m1-10;
                            #77:m1:=m1+10;
                            #72:m2:=m2-10;
                            #80:m2:=m2+10
                            end;
                            end;
                            55:begin
                                 m1:=m1-10;
                                 m2:=m2-10;
                               end;
                            57:begin
                                 m1:=m1+10;
                                 m2:=m2-10;
                               end;
                            49:begin
                                 m1:=m1-10;
                                 m2:=m2+10;
                               end;
                            51:begin
                                 m1:=m1+10;
                                 m2:=m2+10;
                               end;
                           end;
                           if m1>600 then m1:=m1-570;
                           if m1<40 then m1:=m1+570;
                           if m2>370 then m2:=m2-10;
                           if m2<80 then m2:=m2+290;
                           drawmytank;
                           zhx;
                           if (w2+55>m2-55) and (w2-30<m2+30) and (w1+35>m1-35) and (w1-35<m1+35) then begin
                           setcolor(12);
                           for bj:=1 to 100 do
                           circle(w1,w2,bj);
                           setcolor(0);
                           for bj:=100 downto 1 do
                           circle(w1,w2,bj);
                           setcolor(15);
                           x1:=0;
                           wx:=wx-1;
                           jf;
                           goto 50
                           end;
                           case ord(ch) of
                            97:begin
                                if dsh=0 then goto 20;
{                                val(dsh,dsh1,code);}
                                dsh:=dsh-1;
{                                str(dsh1,dsh);}
                                if m2-55>w2+55  then begin
                                                       if (abs(m1-36-w1)<6) or(abs(m1+36-w1)<6)
                                                         then begin
                                                          x1:=x1-1;
                                                          end;
                                                       dd;
                                                     end
                                                else begin
                                                       k:=w2;
                                                       w2:=30;
                                                       dd;
                                                       w2:=k;
                                bx1:=0;
                               end;
                              end;
                            115:begin
                               if qsh=0 then goto 20;
{                               val(qsh,qsh1,code);  }
                               qsh:=qsh-1;
 {                              str(qsh1,qsh);}
                               if m2-55>w2+55  then begin
                                                       if abs(w1-m1)<4 then begin
                                                                       x1:=x1-1;
                                                                     end;
                                                       jq;
                                                     end
                                                else begin
                                                       k:=w2;
                                                       w2:=30;
                                                       jq;
                                                       w2:=k;
                                                     end;
                               bx1:=0;
                              end;
                            100:begin
                                 if bsh=0 then goto 20;
                                 bx;
{                                 val(bsh,bsh1,code);    }
                                 bsh:=bsh-1;
{                                 str(bsh1,bsh);     }
                                 x1:=x1-5;
                                 case se of
                                  14:begin dsh:=dsh-3;qsh:=qsh-6;end;
                                   9:begin dsh:=dsh-1;qsh:=qsh-2;end;
                                  else begin dsh:=dsh-2;qsh:=qsh-4;end;
                                 end;
                                 if (w2+55>m2-55) and (w2-30<m2+30) then begin
                                 wx:=wx-1;
                                 setcolor(12);
                                 for bj:=1 to 30 do
                                 circle(m1,m2,bj);
                                 setcolor(0);
                                 for bj:=30 downto 1 do
                                 circle(m1,m2,bj);
                                 setcolor(15);
                                                                         end;
                                 bx1:=0;
                                end;
                           end;
                           case mode of
                            1:begin
                                if dsh=0 then goto 20;
{                                val(dsh,dsh1,code);     }
                                dsh:=dsh-1;
           {                     str(dsh1,dsh);}
                                if m2-55>w2+55  then begin
                                                        if (abs(m1-36-w1)<6) or(abs(m1+36-w1)<6)
                                                        then begin
                                                         x1:=x1-1;
                                                         end;
                                                       dd;
                                                     end
                                                else begin
                                                       k:=w2;
                                                       w2:=30;
                                                       dd;
                                                       w2:=k;
                                bx1:=0;
                               end;
                              end;
                            2:begin
                               if qsh=0 then goto 20;
{                               val(qsh,qsh1,code);     }
                               qsh:=qsh-1;
 {                              str(qsh1,qsh);}
                               if m2-55>w2+55  then begin
                                                       if abs(w1-m1)<4 then begin
                                                                       x1:=x1-1;
                                                                     end;
                                                       jq;
                                                     end
                                                else begin
                                                       k:=w2;
                                                       w2:=30;
                                                       jq;
                                                       w2:=k;
                                                     end;
                               bx1:=0;
                              end;
                            3:begin
                                 if bsh=0 then goto 20;
                                 bx;
{                                 val(bsh,bsh1,code);}
                                 bsh:=bsh-1;
{                                 str(bsh1,bsh);}
                                 x1:=x1-5;
                                 case se of
                                  14:begin dsh:=dsh-3;qsh:=qsh-6;end;
                                  9:begin dsh:=dsh-1;qsh:=qsh-2;end;
                                  else begin dsh:=dsh-2;qsh:=qsh-4;end;
                                 end;

                                 if (w2+55>m2-55) and (w2-30<m2+30) then begin
                                 wx:=wx-1;
                                 setcolor(12);
                                 for bj:=1 to 30 do
                                 circle(m1,m2,bj);
                                 setcolor(0);
                                 for bj:=30 downto 1 do
                                 circle(m1,m2,bj);


                                 setcolor(15);
                                                                         end;
                                 bx1:=0;
                                end;
                            end;
                            case ord(ch) of
                            20:bx1:=1;
                            1:if bx1=1 then bx1:=2;
                            14:if bx1=2 then bx1:=3;
                            11:if bx1=3 then begin
                                              bx;
                                              x1:=x1-5;
                                              bx1:=0;
                                            end;
                            63:begin
                                tankcolor:=tankcolor+1;
                                drawmytank;
                              end;
                            64:begin
                                tankcolor:=tankcolor-1;
                                drawmytank;
                              end;
                            27:bai:=2;
                            112:begin
                                  repeat until keypressed;
                                  th:=readkey;
                                end;
                            104:help;
                           end;
50:                      if x1<=0 then begin
                                         setcolor(12);
                                         for bj:=1 to 50 do
                                           circle(w1,w2,bj);
                                         setcolor(0);
                                         for bj:=50 downto 1 do
                                           circle(w1,w2,bj);
                                         setcolor(15);
                                         settextstyle(100,0,1*1);
                                         outtextxy(w1-10,w2-1,fen2);
                                         case se of
                                          14:begin dsh:=dsh+3;qsh:=qsh+6;end;
                                           9:begin dsh:=dsh+1;qsh:=qsh+2;end;
                                          else begin dsh:=dsh+2;qsh:=qsh+4;end;
                                         end;
                                         delay(300);
                                         setviewport(w1-9,0,w1-10,479,clipon);
                                         clearviewport;
                                         setviewport(0,0,639,479,clipon);
                                         val(fen,fen1,code);
                                         val(fen2,fen3,code);
                                         fen1:=fen1+fen3;
                                         str(fen1,fen);
                                       end;
                         jf;
                         end;
20:for d:=19 downto 0 do
     if keypressed then sh:=readkey;
  putmouse(m1,m2);
  until (wx<=0) or (x1<=0) or (bai=2);
  if wx<=0 then begin
                  bai:=1;
                  setcolor(12);
                  for bj:=1 to 50 do
                  circle(m1,m2,bj);
                  setcolor(0);
                  for bj:=50 downto 1 do
                  circle(m1,m2,bj);
                  setcolor(15);
                  if (wx<=0) and (x1>0) then
                    othertank;
{                  repeat until keypressed;}
                end;
  end;
Begin (* The Main of the Program *)
  assign(f1,'tank1.ini');
  assign(f2,'tank2.ini');
  reset(f1);
  reset(f2);
  for d:=1 to 3 do
   begin
    readln(f1,s);
    best[d].name:=s;
    read(f2,sco);
    best[d].score:=sco;
   end;
  gd:=detect;
  initgraph(gd,gm,' ');
  initmouse;
  cleardevice;
  randomize;
  for d:=1 to 20 do
   begin

    a:=random(500)+50;
    b:=random(400)+50;
    setcolor(12);
    for bj:=1 to 50 do
      circle(a,b,bj);
    setcolor(0);
    for bj:=50 downto 1 do
      circle(a,b,bj);
   end;
  setcolor(12);
  settextstyle(1,0,15*15);
  outtextxy(150,100,'T');
  delay(300);
  settextstyle(1,0,20*20);
  outtextxy(230,100,'A');
  delay(300);
  settextstyle(1,0,20*20);
  outtextxy(310,100,'N');
  delay(300);
  settextstyle(1,0,20*20);
  outtextxy(390,100,'K');
  delay(300);
  setcolor(15);
  settextstyle(0,0,1*1);
  outtextxy(250,450,'Press any key');
  for d:=14 downto 1 do
  begin
    setbkcolor(d);
    delay(20);
    setbkcolor(0);
    delay(20);
  end;
  repeat
    getmouseinformation(mode,mx,my);
  until (keypressed) or (mode<>0);
  mode:=0;
  if keypressed then ch:=readkey;
Repeat
  closegraph;
  d:=0;
  initmouse;
  clrscr;
  textcolor(14);
  gotoxy(35,9);
  writeln('1. EASY');
  textcolor(7);
  gotoxy(35,10);
  writeln('2. MIDDLE');
  gotoxy(35,11);
  writeln('3. HIGH  ');
  long:=1;
  sh:=' ';
  repeat
    getmouseinformation(mode,mx,my);
    if keypressed then begin
    sh:=readkey;
    case ord(sh) of
      80:long:=long+1;
      72:long:=long-1;
    end;
    if long>3 then long:=1;
    if long<1 then long:=3;
    gotoxy(35,9);
    writeln('1. EASY');
    gotoxy(35,10);
    writeln('2. MIDDLE');
    gotoxy(35,11);
    writeln('3. HIGH  ');
    gotoxy(35,8+long);
    textcolor(14);
    if long=1 then writeln('1. EASY');
    if long=2 then writeln('2. MIDDLE');
    if long=3 then writeln('3. HIGH');
    textcolor(7);
    end;
    if my<>m2 then begin
    if (my>60) and (my<72) then long:=1;
    if (my>71) and (my<79) then long:=2;
    if (my>78) and (my<83) then long:=3;
    gotoxy(35,9);
    writeln('1. EASY');
    gotoxy(35,10);
    writeln('2. MIDDLE');
    gotoxy(35,11);
    writeln('3. HIGH  ');
    gotoxy(35,8+long);
    textcolor(14);
    if long=1 then writeln('1. EASY');
    if long=2 then writeln('2. MIDDLE');
    if long=3 then writeln('3. HIGH');
    textcolor(7);
    m2:=my;
    end;
  until (sh=#13) or (mode<>0);
  case long of
  1:begin
        time:=3;
        pl:=3;
        bsh:=3;
        s:='Easy';
      end;
  2:begin
        time:=5;
        pl:=2;
        bsh:=2;
        s:='Middle';
      end;
  3:begin
        time:=10;
        pl:=1;
        bsh:=1;
        s:='High';
      end;
  end;
  gd:=detect;
  initgraph(gd,gm,' ');
  cleardevice;
  fen:='0';
  dsh:=20;
  qsh:=40;
  wx:=3;
  m2:=370;
  m1:=320;
  mx:=m1;
  my:=m2;
  tankcolor:=1;
  bai:=0;
  repeat
    dr
  until (bai=1) or (bai=2);
  val(fen,fen1,code);
  if bai=1 then begin
  if fen1<=best[4-pl].score then begin
  window1(200,175,440,290,1,'Game Over');
  setcolor(0);
  Outtextxy(210,210,'Your Score:');
  settextstyle(7,0,1);
  setcolor(4);

  Outtextxy(220,235,fen+'('+s+')');

  en(360,213,430,232,true);
  setcolor(0);
  settextstyle(1,0,1);
  outtextxy(384,210,'OK');
  en(360,238,430,257,true);
  outtextxy(380,235,'Exit');
  en(300,263,430,282,true);
  outtextxy(316,260,'Best Scores');
  initmouse;
  con:=false;sco:=0;
  repeat
   getmouseinformation(mode,mx,my);
   if (mode=1) then
    begin
     if (mx>360) and (my>213) and (mx<430) and (my<232) then
      begin
       con:=true;closemouse;en(360,213,430,232,false);end;
     if (mx>360) and (my>238) and (mx<430) and (my<257) then
      begin
       con:=true;closemouse;bai:=2;en(360,238,430,257,false);end;
     if (mx>300) and (my>263) and (mx<430) and (my<282) then
      begin
       con:=true;sco:=1;closemouse;en(300,263,430,282,false);end;
     repeat
      getmouseinformation(mode,mx,my);
     until (mode=0);
    end;
  until con;
  end
  else begin
     window1(200,175,470,300,1,'Game Over');
     settextstyle(8,0,1);
     setcolor(0);
     outtextxy(208,200,'You have the best score');
     outtextxy(215,218,'for '+s+' game');
     outtextxy(208,236,'Please type your name');
     rectangle(220,270,400,290);
     inputstring(222,265,8,1,4,7,9,best[4-pl].name);
     best[4-pl].score:=fen1;sco:=1;
    end;
  if sco=1 then
   begin
    window1(200,160,470,305,1,'Best Scores');
    setcolor(0);
    settextstyle(8,0,1);
    outtextxy(210,190,'Easy:');
    outtextxy(210,210,'Middle:');
    outtextxy(210,230,'High:');
    settextstyle(7,0,1);
    for d:=1 to 3 do
     with best[d] do
      begin

       outtextxy(280,173+d*20,name);
       str(score,s);
       outtextxy(400,173+d*20,s);
      end;
    en(215,270,320,289,true);
    en(350,270,455,289,true);
    setcolor(0);
    settextstyle(1,0,1);
    outtextxy(257,267,'OK');
    outtextxy(388,267,'Exit');
    initmouse;
    con:=false;
    repeat
     getmouseinformation(mode,mx,my);
     if mode=1 then
      begin
       if (mx>215) and (my>270) and (mx<320) and (my<289) then
        begin con:=true;closemouse;en(215,270,320,289,false);end;
       if (mx>350) and (my>270) and (mx<455) and (my<289) then
        begin con:=true;bai:=2;closemouse;en(350,270,455,289,false);end;
       repeat
        getmouseinformation(mode,mx,my);
       until (mode=0);
      end;
    until con;
  end;
 end;
Until (bai=2);
  for d:=19 downto 0 do
    if keypressed then sh:=readkey;
  clearviewport;
  setfillstyle(9,1);
  floodfill(1,1,1);
  setcolor(14);
  settextstyle(1,0,10*10);
  outtextxy(180,10,'END');
  delay(100);
  settextstyle(1,0,2*2);
  outtextxy(100,200,'DESIGNER ZhaoQi');
  delay(100);
  settextstyle(1,0,2*2);
  outtextxy(100,280,'MAKER ZhaoQi DuanRan');
  settextstyle(1,0,1);
  outtextxy(320,400,'1997.12-1999.2');
  repeat until keypressed;
  ch:=readkey;
  closegraph;
  closemouse;
  rewrite(f1);
  rewrite(f2);
  for d:=1 to 3 do
   begin
    writeln(f1,best[d].name);
    write(f2,best[d].score);
   end;
  close(f1);
  close(f2);
end.