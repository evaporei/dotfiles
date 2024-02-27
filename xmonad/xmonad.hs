import qualified Data.Map as M
import System.Exit
import System.IO
import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks (docks, manageDocks, avoidStruts)
import XMonad.Util.Run(spawnPipe)
import qualified XMonad.StackSet as W

myTerminal :: [Char]
myTerminal = "kitty"

myBorderWidth :: Dimension
-- thin
-- myBorderWidth = 1
-- mid
-- myBorderWidth = 5
-- T H I C
myBorderWidth = 6

-- roxinho haskell
-- myNormalBorderColor :: [Char]
-- myNormalBorderColor = "#060611"

-- myFocusedBorderColor :: [Char]
-- myFocusedBorderColor = "#453a62"
----------------------------------

-- rosinha :3
-- myNormalBorderColor :: [Char]
-- myNormalBorderColor = "#181926"
--
-- myFocusedBorderColor :: [Char]
-- myFocusedBorderColor = "#f38ba8"

-- p r o d u c t i v i t y
myNormalBorderColor :: [Char]
myNormalBorderColor = "#202430"

myFocusedBorderColor :: [Char]
myFocusedBorderColor = "#43473e"

myKeys :: XConfig Layout -> M.Map (KeyMask, KeySym) (X ())
myKeys conf@(XConfig {XMonad.modMask = modm}) =
  M.fromList $
    [
--     -- , ((modMask, xK_t), withFocused $ windows . W.sink)
      -- crop the screen
      ( (modm, xK_Print),
        spawn "flameshot gui"
      ),
      -- lock screen
      ( (modm .|. shiftMask, xK_l),
        spawn "slock"
      ),
      -- launch dmenu
      ( (modm, xK_p),
        -- ls /usr/share/rofi/themes
        spawn "rofi -show run -theme Arc-Dark -theme-str '* {font: \"Mono 22\";}'"
      ),
      ( (modm, xK_w),
        -- ls /usr/share/rofi/themes
        spawn "rofi -show window -theme Arc-Dark -theme-str '* {font: \"Mono 22\";}'"
      ),
      ( (modm, xK_F1),
        spawn "~/.screenlayouts/monitor.sh"
      ),
      ( (modm, xK_F2),
        spawn "~/.screenlayouts/momonitor.sh"
      ),
      ( (modm, xK_F3),
        spawn "~/.screenlayouts/builtin.sh"
      ),
      ------ re-bindings of the default stuff ;-;
      ( (modm, xK_t),
        withFocused $ windows . W.sink
      ),
      -- close focused window
      ( (modm .|. shiftMask, xK_c),
        kill
      ),
      -- launch a new terminal
      ( (modm .|. shiftMask, xK_Return),
        spawn myTerminal
      ),
      -- Rotate through the available layout algorithms
      ( (modm, xK_space),
        sendMessage NextLayout
      ),
      -- Reset the layouts on the current workspace to default
      ( (modm .|. shiftMask, xK_space),
        setLayout $ XMonad.layoutHook conf
      ),
      -- Move focus to the next window
      ( (modm, xK_Tab),
        windows W.focusDown
      ),
      -- Move focus to the next window
      ( (modm, xK_j),
        windows W.focusDown
      ),
      -- Move focus to the previous window
      ( (modm, xK_k),
        windows W.focusUp
      ),
      -- Quit xmonad
      ( (modm .|. shiftMask, xK_q),
        io (exitWith ExitSuccess)
      ),
      -- Restart xmonad
      ( (modm, xK_q),
        spawn "xmonad --recompile; killall xmobar; xmonad --restart"
      )
    ]
      ++
      [ ((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9],
          (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]
      ]


myStatusBar :: [Char]
myStatusBar = "xmobar"
-- myStatusBarPP = xmobarPP { ppCurrent = xmobarColor "#453a62" "" }



-- Startup hook

-- Perform an arbitrary action each time xmonad starts or is restarted
-- with mod-q.  Used by, e.g., XMonad.Layout.PerWorkspace to initialize
-- per-workspace layout choices.
--
-- By default, do nothing.
-- myStartupHook :: X ()
-- myStartupHook = do
--   spawn "$HOME/.xmonad/scripts/autostart.sh"


main :: IO ()
main = do
    xmproc <- spawnPipe myStatusBar
    xmonad $ ewmh def {
                -- terminal = myTerminal
	            terminal = myTerminal,
                borderWidth = myBorderWidth,
                normalBorderColor = myNormalBorderColor,
                focusedBorderColor = myFocusedBorderColor,
                keys = myKeys,
                manageHook = manageDocks <+> manageHook def,
                layoutHook = avoidStruts $ layoutHook def,
                logHook = dynamicLogWithPP xmobarPP
                            { ppOutput = hPutStrLn xmproc
                            , ppTitle = xmobarColor "green" ""
                            }
                -- statusBar = myStatusBar
                -- modMask = mod4Mask -- change mod key to super/windows
	            }
