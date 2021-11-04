//
// Vivado(TM)
// rundef.js: a Vivado-generated Runs Script for WSH 5.1/5.6
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
//

echo "This script was generated under a different operating system."
echo "Please update the PATH variable below, before executing this script"
exit

var WshShell = new ActiveXObject( "WScript.Shell" );
var ProcEnv = WshShell.Environment( "Process" );
var PathVal = ProcEnv("PATH");
if ( PathVal.length == 0 ) {
  PathVal = "/ad/eng/support/software/linux/opt/Xilinx/Vivado_ML/2021.1/Vivado/2021.1/ids_lite/ISE/bin/lin64;/ad/eng/support/software/linux/opt/Xilinx/Vivado_ML/2021.1/Vivado/2021.1/bin;";
} else {
  PathVal = "/ad/eng/support/software/linux/opt/Xilinx/Vivado_ML/2021.1/Vivado/2021.1/ids_lite/ISE/bin/lin64;/ad/eng/support/software/linux/opt/Xilinx/Vivado_ML/2021.1/Vivado/2021.1/bin;" + PathVal;
}

ProcEnv("PATH") = PathVal;

var RDScrFP = WScript.ScriptFullName;
var RDScrN = WScript.ScriptName;
var RDScrDir = RDScrFP.substr( 0, RDScrFP.length - RDScrN.length - 1 );
var ISEJScriptLib = RDScrDir + "/ISEWrap.js";
eval( EAInclude(ISEJScriptLib) );


ISEStep( "vivado",
         "-log wrap_around_led.vds -m64 -product Vivado -mode batch -messageDb vivado.pb -notrace -source wrap_around_led.tcl" );



function EAInclude( EAInclFilename ) {
  var EAFso = new ActiveXObject( "Scripting.FileSystemObject" );
  var EAInclFile = EAFso.OpenTextFile( EAInclFilename );
  var EAIFContents = EAInclFile.ReadAll();
  EAInclFile.Close();
  return EAIFContents;
}