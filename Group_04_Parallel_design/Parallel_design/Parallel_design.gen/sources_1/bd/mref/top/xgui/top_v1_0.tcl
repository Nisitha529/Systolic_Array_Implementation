# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "DATA_BUFFER" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DATA_DEPTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DATA_DEPTH_ROOT" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DATA_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "FIF0_DEPTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "FIF0_DEPTH_ROOT" -parent ${Page_0}
  ipgui::add_param $IPINST -name "IDLE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "LOAD" -parent ${Page_0}
  ipgui::add_param $IPINST -name "MATRIX_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "MAX_SIZE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "STOR" -parent ${Page_0}
  ipgui::add_param $IPINST -name "STORCOMP" -parent ${Page_0}
  ipgui::add_param $IPINST -name "WRITE" -parent ${Page_0}


}

proc update_PARAM_VALUE.DATA_BUFFER { PARAM_VALUE.DATA_BUFFER } {
	# Procedure called to update DATA_BUFFER when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DATA_BUFFER { PARAM_VALUE.DATA_BUFFER } {
	# Procedure called to validate DATA_BUFFER
	return true
}

proc update_PARAM_VALUE.DATA_DEPTH { PARAM_VALUE.DATA_DEPTH } {
	# Procedure called to update DATA_DEPTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DATA_DEPTH { PARAM_VALUE.DATA_DEPTH } {
	# Procedure called to validate DATA_DEPTH
	return true
}

proc update_PARAM_VALUE.DATA_DEPTH_ROOT { PARAM_VALUE.DATA_DEPTH_ROOT } {
	# Procedure called to update DATA_DEPTH_ROOT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DATA_DEPTH_ROOT { PARAM_VALUE.DATA_DEPTH_ROOT } {
	# Procedure called to validate DATA_DEPTH_ROOT
	return true
}

proc update_PARAM_VALUE.DATA_WIDTH { PARAM_VALUE.DATA_WIDTH } {
	# Procedure called to update DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DATA_WIDTH { PARAM_VALUE.DATA_WIDTH } {
	# Procedure called to validate DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.FIF0_DEPTH { PARAM_VALUE.FIF0_DEPTH } {
	# Procedure called to update FIF0_DEPTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.FIF0_DEPTH { PARAM_VALUE.FIF0_DEPTH } {
	# Procedure called to validate FIF0_DEPTH
	return true
}

proc update_PARAM_VALUE.FIF0_DEPTH_ROOT { PARAM_VALUE.FIF0_DEPTH_ROOT } {
	# Procedure called to update FIF0_DEPTH_ROOT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.FIF0_DEPTH_ROOT { PARAM_VALUE.FIF0_DEPTH_ROOT } {
	# Procedure called to validate FIF0_DEPTH_ROOT
	return true
}

proc update_PARAM_VALUE.IDLE { PARAM_VALUE.IDLE } {
	# Procedure called to update IDLE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.IDLE { PARAM_VALUE.IDLE } {
	# Procedure called to validate IDLE
	return true
}

proc update_PARAM_VALUE.LOAD { PARAM_VALUE.LOAD } {
	# Procedure called to update LOAD when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.LOAD { PARAM_VALUE.LOAD } {
	# Procedure called to validate LOAD
	return true
}

proc update_PARAM_VALUE.MATRIX_WIDTH { PARAM_VALUE.MATRIX_WIDTH } {
	# Procedure called to update MATRIX_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MATRIX_WIDTH { PARAM_VALUE.MATRIX_WIDTH } {
	# Procedure called to validate MATRIX_WIDTH
	return true
}

proc update_PARAM_VALUE.MAX_SIZE { PARAM_VALUE.MAX_SIZE } {
	# Procedure called to update MAX_SIZE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MAX_SIZE { PARAM_VALUE.MAX_SIZE } {
	# Procedure called to validate MAX_SIZE
	return true
}

proc update_PARAM_VALUE.STOR { PARAM_VALUE.STOR } {
	# Procedure called to update STOR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.STOR { PARAM_VALUE.STOR } {
	# Procedure called to validate STOR
	return true
}

proc update_PARAM_VALUE.STORCOMP { PARAM_VALUE.STORCOMP } {
	# Procedure called to update STORCOMP when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.STORCOMP { PARAM_VALUE.STORCOMP } {
	# Procedure called to validate STORCOMP
	return true
}

proc update_PARAM_VALUE.WRITE { PARAM_VALUE.WRITE } {
	# Procedure called to update WRITE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.WRITE { PARAM_VALUE.WRITE } {
	# Procedure called to validate WRITE
	return true
}


proc update_MODELPARAM_VALUE.DATA_WIDTH { MODELPARAM_VALUE.DATA_WIDTH PARAM_VALUE.DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DATA_WIDTH}] ${MODELPARAM_VALUE.DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.DATA_DEPTH { MODELPARAM_VALUE.DATA_DEPTH PARAM_VALUE.DATA_DEPTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DATA_DEPTH}] ${MODELPARAM_VALUE.DATA_DEPTH}
}

proc update_MODELPARAM_VALUE.DATA_BUFFER { MODELPARAM_VALUE.DATA_BUFFER PARAM_VALUE.DATA_BUFFER } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DATA_BUFFER}] ${MODELPARAM_VALUE.DATA_BUFFER}
}

proc update_MODELPARAM_VALUE.FIF0_DEPTH { MODELPARAM_VALUE.FIF0_DEPTH PARAM_VALUE.FIF0_DEPTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.FIF0_DEPTH}] ${MODELPARAM_VALUE.FIF0_DEPTH}
}

proc update_MODELPARAM_VALUE.DATA_DEPTH_ROOT { MODELPARAM_VALUE.DATA_DEPTH_ROOT PARAM_VALUE.DATA_DEPTH_ROOT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DATA_DEPTH_ROOT}] ${MODELPARAM_VALUE.DATA_DEPTH_ROOT}
}

proc update_MODELPARAM_VALUE.FIF0_DEPTH_ROOT { MODELPARAM_VALUE.FIF0_DEPTH_ROOT PARAM_VALUE.FIF0_DEPTH_ROOT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.FIF0_DEPTH_ROOT}] ${MODELPARAM_VALUE.FIF0_DEPTH_ROOT}
}

proc update_MODELPARAM_VALUE.MATRIX_WIDTH { MODELPARAM_VALUE.MATRIX_WIDTH PARAM_VALUE.MATRIX_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MATRIX_WIDTH}] ${MODELPARAM_VALUE.MATRIX_WIDTH}
}

proc update_MODELPARAM_VALUE.MAX_SIZE { MODELPARAM_VALUE.MAX_SIZE PARAM_VALUE.MAX_SIZE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MAX_SIZE}] ${MODELPARAM_VALUE.MAX_SIZE}
}

proc update_MODELPARAM_VALUE.IDLE { MODELPARAM_VALUE.IDLE PARAM_VALUE.IDLE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IDLE}] ${MODELPARAM_VALUE.IDLE}
}

proc update_MODELPARAM_VALUE.LOAD { MODELPARAM_VALUE.LOAD PARAM_VALUE.LOAD } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.LOAD}] ${MODELPARAM_VALUE.LOAD}
}

proc update_MODELPARAM_VALUE.WRITE { MODELPARAM_VALUE.WRITE PARAM_VALUE.WRITE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.WRITE}] ${MODELPARAM_VALUE.WRITE}
}

proc update_MODELPARAM_VALUE.STOR { MODELPARAM_VALUE.STOR PARAM_VALUE.STOR } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.STOR}] ${MODELPARAM_VALUE.STOR}
}

proc update_MODELPARAM_VALUE.STORCOMP { MODELPARAM_VALUE.STORCOMP PARAM_VALUE.STORCOMP } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.STORCOMP}] ${MODELPARAM_VALUE.STORCOMP}
}

