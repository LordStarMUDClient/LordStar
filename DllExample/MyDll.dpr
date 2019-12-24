Library MyDll;

//
//
// 这里是接口函数 —— 
//                       注意！注意！注意！
// 请不要对接口函数做任何修改，否则可能无法与 LordStar.Dll 正常连接上！！！
// 如果你使用其他工具来编写 Dll ，请务必保持同样的格式！！！
//
// Buffer_ 打头的，是用来与 LordStar.Dll 进行数据交换的接口函数
// Buffer_Pop          用来清空 LordStar.Dll 中的数据堆栈中
// Buffer_pushXXXX     用来向 LordStar.Dll 中的数据堆栈中写入数据
// Buffer_toXXXX       用来从 LordStar.Dll 中的数据堆栈中读取数据
function Buffer_Pop(Handle: THandle): Integer;                              stdcall;  external 'LordStar.Dll';
function Buffer_toString(Handle: THandle; Index: Integer): PChar;           stdcall;  external 'LordStar.Dll';
function Buffer_toInteger(Handle: THandle; Index: Integer): Integer;        stdcall;  external 'LordStar.Dll';
function Buffer_toPointer(Handle: THandle; Index: Integer): Pointer;        stdcall;  external 'LordStar.Dll';
function Buffer_toChar(Handle: THandle; Index: Integer): Char;              stdcall;  external 'LordStar.Dll';
function Buffer_toBoolean(Handle: THandle; Index: Integer): Boolean;        stdcall;  external 'LordStar.Dll';
function Buffer_pushString(Handle: THandle; Data: PChar): Integer;          stdcall;  external 'LordStar.Dll';
function Buffer_pushInteger(Handle: THandle; Data: Integer): Integer;       stdcall;  external 'LordStar.Dll';
function Buffer_pushPointer(Handle: THandle; Data: Pointer): Integer;       stdcall;  external 'LordStar.Dll';
function Buffer_pushChar(Handle: THandle; Data: Char): Integer;             stdcall;  external 'LordStar.Dll';
function Buffer_pushBoolean(Handle: THandle; Data: Boolean): Integer;       stdcall;  external 'LordStar.Dll';
//
// 以下是 LordStar.Exe 游戏窗口提供的接口函数，你可以直接调用
//
function Run(Handle: THandle; CMD: PChar): Integer;                         stdcall; external 'LordStar.Dll';
function Result(Handle: THandle; Func: PChar): PChar;                       stdcall; external 'LordStar.Dll';
function Send(Handle: THandle; Msg: PChar): Integer;                        stdcall; external 'LordStar.Dll';
function Connect(Handle: THandle; Addr: PChar; Port: Integer): Integer;     stdcall; external 'LordStar.Dll';
function Disconnect(Handle: THandle): Integer;                              stdcall; external 'LordStar.Dll';
function IsConnect(Handle: THandle): Boolean;                               stdcall; external 'LordStar.Dll';
function GameBytes(Handle: THandle): Integer;                               stdcall; external 'LordStar.Dll';
function Echo(Handle: THandle; Msg: PChar): Integer;                        stdcall; external 'LordStar.Dll';
function Show(Handle: THandle; Msg: PChar): Integer;                        stdcall; external 'LordStar.Dll';
function Print(Handle: THandle; Msg: PChar): Integer;                       stdcall; external 'LordStar.Dll';
function Say(Handle: THandle; Msg: PChar): Integer;                         stdcall; external 'LordStar.Dll';
function GetAlias(Handle: THandle; Name: PChar): PChar;                     stdcall; external 'LordStar.Dll';
function SetAlias(Handle: THandle; Name: PChar; Value: PChar): Integer;     stdcall; external 'LordStar.Dll';
function GetVar(Handle: THandle; Name: PChar): PChar;                       stdcall; external 'LordStar.Dll';
function SetVar(Handle: THandle; Name: PChar; Value: PChar): Integer;       stdcall; external 'LordStar.Dll';
function AddTimer(Handle: THandle; Name: PChar; CMD: PChar;
      RunTime: Integer; RunCount: Integer; RunOnCreate: Boolean): Integer;  stdcall; external 'LordStar.Dll';
function DelTimer(Handle: THandle; Name: PChar): Integer;                   stdcall; external 'LordStar.Dll';

//
//
// 下面是你可以任意挥洒的地方 ——
// 在这里你可以定义自己的函数，所有通过 Exports 发布的函数都能够在 LordStar 中调用
//
// 请注意函数的参数必须且只能是固定的格式：
//
//   function MyFunc(Handle: THandle; ArgCount: Integer): Integer; export; stdcall;
//
//     Handle:      这是 LordStar.Dll 中用来与游戏窗口相关联的句柄，你只需知道它指向调用此函数的游戏窗口即可。
//                  具体如何与游戏窗口绑定，是 LordStar.Dll 的任务，你不需要去关心它。如非特殊情况，不要主动
//                  去修改这个值。
//
//     ArgCount:    这是游戏窗口在调用此函数时，向此函数传送的参数个数。具体参数数据，会存放在 LordStar.Dll
//                  中的数据堆栈里，你需要主动去读取。
//
//     返回值：     当你在 MyFunc 函数中运算完毕，如果要向游戏窗口回传数据，需要把数据逐条压入 LordStar.Dll
//                  中的数据堆栈。函数的返回值表示你往堆栈里压入了多少条数据。
//                  LordStar.Dll 会按照函数的返回值读取堆栈中的数据，并整理、交还给游戏窗口。如果有多条数据，
//                  通常情况下会以集合型变量的方式交还给游戏窗口。
//
//                  要注意的是：由于数据堆栈中包含着向此函数传送的参数数据，所以在往数据堆栈里压入数据之前，
//                  需要用 Buffer_Pop() 来把堆栈中原有的数据清空。
//
//
//
// 有部分固定名称的函数是具有专有意义的，会被 LordStar 自动调用，最好不要改变它们的用途：
//
//   LibName        本 Dll 在 LordStar 中运用时的 ID，最好起一个不容易和别人重名的名字
//                  在 LordStar 里，同名的 Dll 扩展库可以同时存在，事件函数也能正常运作，
//                  但在主动调取扩展库函数时会存在问题，所以最好避免重名。
//                  没有这个函数的 Dll 文件无法在 LordStar 使用！！！
//
//   LibVersion     本 Dll 的版本信息
//   About          显示本 Dll 的有关作者、功能、版本等有关信息
//   OnSend         当游戏窗口往服务器发送信息时，会自动调用执行该函数（如果有的话）
//   OnReceive      当游戏窗口收到服务器发来的信息时，会自动调用执行该函数（如果有的话）
//
// 以上各函数的函数名是大小写敏感的，请留意
//
function LibName(Handle: THandle; ArgCount: Integer): Integer; export; stdcall;
begin
  Buffer_Pop(Handle);
  Buffer_pushString(Handle, PChar('MyDll'));
  Result:= 1;
end;

function About(Handle: THandle; ArgCount: Integer): Integer; export; stdcall;
begin
  Buffer_Pop(Handle);
  //  Buffer_Pop() 清空堆栈，以便往里写入数据

  Buffer_pushString(Handle, PChar('这是一个自定义插件的示例。'));
  //  Buffer_pushString() 往堆栈里写入第一条数据

  Buffer_pushString(Handle, PChar('        云之遥编写(2019/12/15)'));
  //   往堆栈里写入第二条数据

  Result:= 2;
  //  返回值 Result = 2 通知 LordStar.Dll 这里往堆栈里写入了 2 条数据，对方才知道去取数据
end;

function LibVersion(Handle: THandle; ArgCount: Integer): Integer; export; stdcall;
begin
  Buffer_Pop(Handle);
  Buffer_pushString(Handle, PChar('v1.01'));
  Result:= 1;
end;

function OnReceive(Handle: THandle; ArgCount: Integer): Integer; export; stdcall;
var
  RawMsg, ClnMsg: PChar;
begin
  RawMsg:= Buffer_toString(Handle, 0);
  ClnMsg:= Buffer_toString(Handle, 1);
// RawMsg 是服务器发来的原始信息（包含各种控制码、颜色码等）
// ClnMsg 是 RawMsg 经过解读之后的纯文字信息，也就是最终在屏幕上所能看到的显示文字
//
//
//        在这里做你需要的处理
//
//
// 作为一个示例，在这里我们调用 LordStar.Dll 提供的接口函数 Say()
  Say(Handle, ClnMsg);
// 它能够在游戏窗口中显示一段客户端文字，与 LordStar 中的客户端命令 #say 的效果是一样的
// 这里调用 Say() 的结果，可以往触发本事件的游戏窗口中回显一行同样的文字。
//
// 要注意的一点：调用接口函数 Echo() 可以往游戏窗口添加一段模拟服务器发来的文字，该函数
// 在执行时会触发一次 OnReceive 事件。因此，假如你在这里调用 Echo() 会导致程序陷入死循环
//
//
// 如果有返回数据，除了用 Buffer_pushString() 压入堆栈之外，别忘了修改 Result 返回值
  Result:= 0;
end;

function OnSend(Handle: THandle; ArgCount: Integer): Integer; export; stdcall;
var
  SendMsg: PChar;
begin
  SendMsg:= Buffer_toString(Handle, 0);
// SendMsg 是准备向服务器发送的指令信息
//
//
//        在这里做你需要的处理
//
//
// 可以通过修改此函数返回值的方式，来替换掉原本要发给服务的指令：
//  Buffer_Pop(Handle);    // 弹出堆栈中原本要发送的指令，准备压入替换指令。
//                         // 假如不清空堆栈就压入新指令，原有的指令会保留下来，新指令会被添加在原有的指令后头
//  Buffer_pushString(Handle, 'My New Command');   // 把新指令压入堆栈。如果有多个指令就挨个 push
//                                                 // 假如不压入新指令，只用 Buffer_Pop() 弹出原指令，就会撤销本次发送指令的操作
// 如果替换了新指令，别忘了修改 Result 返回值
  Result:= 0;
end;

//
//
// 自定义函数可以在 LordStar 游戏窗口中使用 %LibName::function() 的方式调用
//
// 注意！注意！注意！
// 在函数名中不要使用大写字母，否则不能被正确调用。可以使用小写字母、下划线和数字
// 
//
// 以下是一个自定义函数的简单示例，可以根据需要自行修改
//
function add(Handle: THandle; ArgCount: Integer): Integer;  export; stdcall;
var
  a, b: Integer;
begin
  a:= 0;
  b:= 0;
  if (ArgCount > 0) then
    a:= Buffer_toInteger(Handle, 0);
  //  ArgCount 这个值告诉你堆栈里总的有多少条数据
  //  Buffer_toInteger() 把堆栈里序号为 0（也就是第 1 条数据）取出来

  if (ArgCount > 1) then
    b:= Buffer_toInteger(Handle, 1);
  //  Buffer_toInteger() 把堆栈里序号为 1（也就是第 2 条数据）取出来

  Buffer_Pop(Handle);
  //  Buffer_Pop() 清空堆栈，以便往里写入数据

  Buffer_pushInteger(Handle, a + b);
  //  Buffer_pushInteger() 往堆栈里写入第 1 条数据

  Result:= 1;
  //  返回值 Result = 1 通知 LordStar.Dll 这里往堆栈里写入了 1 条数据，让对方去取数据
end;

function do_echo(Handle: THandle; ArgCount: Integer): Integer;  export; stdcall;
var
  i: Integer;
begin
  for i:= 0 to ArgCount - 1 do
    Echo(Handle, Buffer_toString(Handle, i));
  Result:= 0;
end;

function do_newtimer(Handle: THandle; ArgCount: Integer): Integer;  export; stdcall;
begin
  Result:= AddTimer(Handle, Buffer_toString(Handle, 0), Buffer_toString(Handle, 1),
      Buffer_toInteger(Handle, 2), Buffer_toInteger(Handle, 3), (Buffer_toInteger(Handle, 4) <> 0));
end;

function func1(Handle: THandle; ArgCount: Integer): Integer;  export; stdcall;
begin
  Result:= 1;
end;

function func2(Handle: THandle; ArgCount: Integer): Integer;  export; stdcall;
begin
  Result:= 1;
end;

function func3(Handle: THandle; ArgCount: Integer): Integer;  export; stdcall;
begin
  Result:= 1;
end;

function func4(Handle: THandle; ArgCount: Integer): Integer;  export; stdcall;
begin
  Result:= 1;
end;

// 别忘了把要发布的函数名加到这里
// 只有发布出去的函数才能被其他程序调用（否则就只能在 Dll 内部使用）
exports
  LibName, LibVersion, About, OnSend, OnReceive,
  add, do_echo, do_newtimer, func1, func2, func3, func4;

begin
end.
