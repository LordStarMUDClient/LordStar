Library MyDll;

//
//
// �����ǽӿں��� ���� 
//                       ע�⣡ע�⣡ע�⣡
// �벻Ҫ�Խӿں������κ��޸ģ���������޷��� LordStar.Dll ���������ϣ�����
// �����ʹ��������������д Dll ������ر���ͬ���ĸ�ʽ������
//
// Buffer_ ��ͷ�ģ��������� LordStar.Dll �������ݽ����Ľӿں���
// Buffer_Pop          ������� LordStar.Dll �е����ݶ�ջ��
// Buffer_pushXXXX     ������ LordStar.Dll �е����ݶ�ջ��д������
// Buffer_toXXXX       ������ LordStar.Dll �е����ݶ�ջ�ж�ȡ����
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
// ������ LordStar.Exe ��Ϸ�����ṩ�Ľӿں����������ֱ�ӵ���
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
// �������������������ĵط� ����
// ����������Զ����Լ��ĺ���������ͨ�� Exports �����ĺ������ܹ��� LordStar �е���
//
// ��ע�⺯���Ĳ���������ֻ���ǹ̶��ĸ�ʽ��
//
//   function MyFunc(Handle: THandle; ArgCount: Integer): Integer; export; stdcall;
//
//     Handle:      ���� LordStar.Dll ����������Ϸ����������ľ������ֻ��֪����ָ����ô˺�������Ϸ���ڼ��ɡ�
//                  �����������Ϸ���ڰ󶨣��� LordStar.Dll �������㲻��Ҫȥ����������������������Ҫ����
//                  ȥ�޸����ֵ��
//
//     ArgCount:    ������Ϸ�����ڵ��ô˺���ʱ����˺������͵Ĳ�������������������ݣ������� LordStar.Dll
//                  �е����ݶ�ջ�����Ҫ����ȥ��ȡ��
//
//     ����ֵ��     ������ MyFunc ������������ϣ����Ҫ����Ϸ���ڻش����ݣ���Ҫ����������ѹ�� LordStar.Dll
//                  �е����ݶ�ջ�������ķ���ֵ��ʾ������ջ��ѹ���˶��������ݡ�
//                  LordStar.Dll �ᰴ�պ����ķ���ֵ��ȡ��ջ�е����ݣ���������������Ϸ���ڡ�����ж������ݣ�
//                  ͨ������»��Լ����ͱ����ķ�ʽ��������Ϸ���ڡ�
//
//                  Ҫע����ǣ��������ݶ�ջ�а�������˺������͵Ĳ������ݣ������������ݶ�ջ��ѹ������֮ǰ��
//                  ��Ҫ�� Buffer_Pop() ���Ѷ�ջ��ԭ�е�������ա�
//
//
//
// �в��̶ֹ����Ƶĺ����Ǿ���ר������ģ��ᱻ LordStar �Զ����ã���ò�Ҫ�ı����ǵ���;��
//
//   LibName        �� Dll �� LordStar ������ʱ�� ID�������һ�������׺ͱ�������������
//                  �� LordStar �ͬ���� Dll ��չ�����ͬʱ���ڣ��¼�����Ҳ������������
//                  ����������ȡ��չ�⺯��ʱ��������⣬������ñ���������
//                  û����������� Dll �ļ��޷��� LordStar ʹ�ã�����
//
//   LibVersion     �� Dll �İ汾��Ϣ
//   About          ��ʾ�� Dll ���й����ߡ����ܡ��汾���й���Ϣ
//   OnSend         ����Ϸ������������������Ϣʱ�����Զ�����ִ�иú���������еĻ���
//   OnReceive      ����Ϸ�����յ���������������Ϣʱ�����Զ�����ִ�иú���������еĻ���
//
// ���ϸ������ĺ������Ǵ�Сд���еģ�������
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
  //  Buffer_Pop() ��ն�ջ���Ա�����д������

  Buffer_pushString(Handle, PChar('����һ���Զ�������ʾ����'));
  //  Buffer_pushString() ����ջ��д���һ������

  Buffer_pushString(Handle, PChar('        ��֮ң��д(2019/12/15)'));
  //   ����ջ��д��ڶ�������

  Result:= 2;
  //  ����ֵ Result = 2 ֪ͨ LordStar.Dll ��������ջ��д���� 2 �����ݣ��Է���֪��ȥȡ����
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
// RawMsg �Ƿ�����������ԭʼ��Ϣ���������ֿ����롢��ɫ��ȣ�
// ClnMsg �� RawMsg �������֮��Ĵ�������Ϣ��Ҳ������������Ļ�����ܿ�������ʾ����
//
//
//        ������������Ҫ�Ĵ���
//
//
// ��Ϊһ��ʾ�������������ǵ��� LordStar.Dll �ṩ�Ľӿں��� Say()
  Say(Handle, ClnMsg);
// ���ܹ�����Ϸ��������ʾһ�οͻ������֣��� LordStar �еĿͻ������� #say ��Ч����һ����
// ������� Say() �Ľ�����������������¼�����Ϸ�����л���һ��ͬ�������֡�
//
// Ҫע���һ�㣺���ýӿں��� Echo() ��������Ϸ�������һ��ģ����������������֣��ú���
// ��ִ��ʱ�ᴥ��һ�� OnReceive �¼�����ˣ���������������� Echo() �ᵼ�³���������ѭ��
//
//
// ����з������ݣ������� Buffer_pushString() ѹ���ջ֮�⣬�������޸� Result ����ֵ
  Result:= 0;
end;

function OnSend(Handle: THandle; ArgCount: Integer): Integer; export; stdcall;
var
  SendMsg: PChar;
begin
  SendMsg:= Buffer_toString(Handle, 0);
// SendMsg ��׼������������͵�ָ����Ϣ
//
//
//        ������������Ҫ�Ĵ���
//
//
// ����ͨ���޸Ĵ˺�������ֵ�ķ�ʽ�����滻��ԭ��Ҫ���������ָ�
//  Buffer_Pop(Handle);    // ������ջ��ԭ��Ҫ���͵�ָ�׼��ѹ���滻ָ�
//                         // ���粻��ն�ջ��ѹ����ָ�ԭ�е�ָ��ᱣ����������ָ��ᱻ�����ԭ�е�ָ���ͷ
//  Buffer_pushString(Handle, 'My New Command');   // ����ָ��ѹ���ջ������ж��ָ��Ͱ��� push
//                                                 // ���粻ѹ����ָ�ֻ�� Buffer_Pop() ����ԭָ��ͻ᳷�����η���ָ��Ĳ���
// ����滻����ָ��������޸� Result ����ֵ
  Result:= 0;
end;

//
//
// �Զ��庯�������� LordStar ��Ϸ������ʹ�� %LibName::function() �ķ�ʽ����
//
// ע�⣡ע�⣡ע�⣡
// �ں������в�Ҫʹ�ô�д��ĸ�������ܱ���ȷ���á�����ʹ��Сд��ĸ���»��ߺ�����
// 
//
// ������һ���Զ��庯���ļ�ʾ�������Ը�����Ҫ�����޸�
//
function add(Handle: THandle; ArgCount: Integer): Integer;  export; stdcall;
var
  a, b: Integer;
begin
  a:= 0;
  b:= 0;
  if (ArgCount > 0) then
    a:= Buffer_toInteger(Handle, 0);
  //  ArgCount ���ֵ�������ջ���ܵ��ж���������
  //  Buffer_toInteger() �Ѷ�ջ�����Ϊ 0��Ҳ���ǵ� 1 �����ݣ�ȡ����

  if (ArgCount > 1) then
    b:= Buffer_toInteger(Handle, 1);
  //  Buffer_toInteger() �Ѷ�ջ�����Ϊ 1��Ҳ���ǵ� 2 �����ݣ�ȡ����

  Buffer_Pop(Handle);
  //  Buffer_Pop() ��ն�ջ���Ա�����д������

  Buffer_pushInteger(Handle, a + b);
  //  Buffer_pushInteger() ����ջ��д��� 1 ������

  Result:= 1;
  //  ����ֵ Result = 1 ֪ͨ LordStar.Dll ��������ջ��д���� 1 �����ݣ��öԷ�ȥȡ����
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

// �����˰�Ҫ�����ĺ������ӵ�����
// ֻ�з�����ȥ�ĺ������ܱ�����������ã������ֻ���� Dll �ڲ�ʹ�ã�
exports
  LibName, LibVersion, About, OnSend, OnReceive,
  add, do_echo, do_newtimer, func1, func2, func3, func4;

begin
end.
