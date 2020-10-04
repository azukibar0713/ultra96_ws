# Set SDK workspace.
setws ./
#
catch {
    createhw -name hw -hwspec ./hdf/ultra96.hdf
}
#
catch {
    createbsp -name bsp -hwproject hw -proc psu_cortexr5_0 -os freertos10_xilinx
}
#
configbsp -bsp bsp stdin psu_uart_1;# 標準入力をuart1にする（ultra96用の設定）.
configbsp -bsp bsp stdout psu_uart_1;# 標準出力をuart1にする（ultra96用の設定）.
updatemss -mss bsp/system.mss;# configbspしたら必要.
regenbsp -bsp bsp;# configbspしたら必要.

catch {
    # psu_cortexr5がなぜかエラーになる.
    # createlib -name led_driver -type static -proc psu_cortexr5 -lang c ;
}

catch {
    # Empty
    createapp -name app -app {Empty Application} -bsp bsp -hwproject hw -proc psu_cortexr5_0 -os freertos10_xilinx -lang c
    # Hello World
    #createapp -name app_hello -app {FreeRTOS Hello World} -bsp bsp -hwproject hw -proc psu_cortexr5_0 -os freertos10_xilinx -lang c
}

# app config
#   https://www.xilinx.com/html_docs/xilinx2018_1/SDK_Doc/xsct/sdk/reference_sdk_configapp.html
#configapp -app app_hello -add define-compiler-symbols MY_DEBUG_INFO


# FSBL.
catch {
    # freertosのbspではビルドエラーとなる。-bsp bsp_fsblで新しいbspを作るとOKだった.
    createapp -name fsbl_r5 -app {Zynq MP FSBL} -hwproject hw -bsp bsp_fsbl -proc psu_cortexr5_0 -os standalone
    configapp -app fsbl_r5 define-compiler-symbols FSBL_DEBUG_INFO
}


configbsp -bsp bsp_fsbl stdin psu_uart_1;# 標準入力をuart1にする（ultra96用の設定）.
configbsp -bsp bsp_fsbl stdout psu_uart_1;# 標準出力をuart1にする（ultra96用の設定）.
updatemss -mss bsp_fsbl/system.mss;# configbspしたら必要.
regenbsp -bsp bsp_fsbl;# configbspしたら必要.

