function Invoke-Starship-TransientFunction {
  &starship module character
}

Invoke-Expression (&starship init powershell)
Enable-TransientPrompt


if ( Test-Path '~/.inshellisense/pwsh/init.ps1' -PathType Leaf ) { . ~/.inshellisense/pwsh/init.ps1 } 
