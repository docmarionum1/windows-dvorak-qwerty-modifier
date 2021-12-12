; Get the current keyboard layout to disable this when we're already on query
; qwerty - 4026663945
; dvorak - 67699721

Loop {
  InputLocaleID := getKeyboardLayout()

  ; Disable for QWERTY
  if (InputLocaleID = 67699721) {
    Suspend, On
  } else if (GetKeyState("Control") or GetKeyState("Alt") or GetKeyState("LWin") or GetKeyState("RWin")) {
    ; Enable Mappings when pressing a modifier key
    Suspend, Off
  } else {
    Suspend, On
  }
  Sleep, 50
}

; https://www.autohotkey.com/boards/viewtopic.php?p=270037#p270037
getKeyboardLayout() {
  WinGet, WinID,, A
  ThreadID:=DllCall("GetWindowThreadProcessId", "UInt", WinID, "UInt", 0)
  InputLocaleID:=DllCall("GetKeyboardLayout", "UInt", ThreadID, "UInt")
  If(!InputLocaleID){
  	WinActivate, ahk_class WorkerW
  	WinGet, WinID2,, ahk_class WorkerW
  	ThreadID:=DllCall("GetWindowThreadProcessId", "UInt", WinID2, "UInt", 0)
  	WinActivate, ahk_id %WinID%
  	InputLocaleID:=DllCall("GetKeyboardLayout", "UInt", ThreadID, "UInt")
  }

  return InputLocaleID
}

; Bindings from Dvorak back to Qwerty

'::q
,::w
.::e
p::r
y::t
f::y
g::u
c::i
r::o
l::p
/::[
=::]
\::\
a::a
o::s
e::d
u::f
i::g
d::h
h::j
t::k
n::l
s::;
-::'
`;::z
q::x
j::c
k::v
x::b
b::n
m::m
w::,
v::.
z::/
