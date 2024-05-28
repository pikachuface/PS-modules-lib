function Resolve-PathStack()
{
  [CmdletBinding()]
  param(
    [string[]] $PathToResolve,
    [switch]   $Relative
  )

  [string] $ResolvedPath = $PathToResolve[0];  

  for ($i = 1; $i -lt $PathToResolve.Count; $i++) 
  { $ResolvedPath = Join-Path -Path $ResolvedPath -ChildPath $PathToResolve[$i] }

  if($Relative.IsPresent)
    { return Resolve-Path -Path $ResolvedPath -Relative }
  else
    { return Resolve-Path -Path $ResolvedPath }
}
