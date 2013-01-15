unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ShellAPI, Tlhelp32;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    GroupBox2: TGroupBox;
    Button3: TButton;
    Button4: TButton;
    GroupBox3: TGroupBox;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Label1: TLabel;
    GroupBox4: TGroupBox;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
ShellExecute(Form1.Handle, 'open', 'Run.exe', nil, '.\Denwer\denwer\', SW_SHOWNORMAL);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
ShellExecute(Form1.Handle, 'open', 'SwitchOff.exe', nil, '.\Denwer\denwer\', SW_SHOWNORMAL);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
ShellExecute(Form1.Handle, 'open', 'mangosd.exe', nil, '.\MaNGOS\bin\', SW_SHOWNORMAL);
ShellExecute(Form1.Handle, 'open', 'realmd.exe', nil, '.\MaNGOS\bin\', SW_SHOWNORMAL);
end;

function KillTask(ExeFileName: string): integer;

const PROCESS_TERMINATE=$0001;

var ContinueLoop: BOOL;
    FSnapshotHandle: THandle;
    FProcessEntry32: TProcessEntry32;

begin
  result := 0;
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := Sizeof(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle,FProcessEntry32);
  while integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) = UpperCase(ExeFileName))
        or (UpperCase(FProcessEntry32.szExeFile) = UpperCase(ExeFileName)))
    then
      Result := Integer(TerminateProcess(OpenProcess(PROCESS_TERMINATE, BOOL(0),
                                                     FProcessEntry32.th32ProcessID), 0));
      ContinueLoop := Process32Next(FSnapshotHandle,FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
KillTask('mangosd.exe');
KillTask('realmd.exe');
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
ShellExecute(Form1.Handle, 'open', 'mangosd.conf', nil, '.\MaNGOS\etc\', SW_SHOWNORMAL);
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
ShellExecute(Form1.Handle, 'open', 'realmd.conf', nil, '.\MaNGOS\etc\', SW_SHOWNORMAL);
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
ShellExecute(Form1.Handle, 'open', 'scriptdev2.conf', nil, '.\MaNGOS\etc\', SW_SHOWNORMAL);
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
ShellExecute(Form1.Handle, 'open', 'ahbot.conf', nil, '.\MaNGOS\etc\', SW_SHOWNORMAL);
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
ShellExecute(Form1.Handle, 'open', '.\Tools\extractors', nil, nil, SW_SHOWNORMAL);
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
ShellExecute(Form1.Handle, 'open', 'pjDbcEditer.exe', nil, '.\Tools\dbcEditer\', SW_SHOWNORMAL);
end;

procedure TForm1.Button11Click(Sender: TObject);
begin
ShellExecute(Form1.Handle, 'open', 'Quice.exe', nil, '.\Tools\quice_1_3_2\', SW_SHOWNORMAL);
end;

procedure TForm1.Button12Click(Sender: TObject);
begin
ShellExecute(Handle, 'open', PChar('http://download2.navicat.com/download/navicat101_mysql_en.exe'), nil, nil, SW_SHOW);
end;

end.
