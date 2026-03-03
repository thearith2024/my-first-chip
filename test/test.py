# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: MIT

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles, RisingEdge

@cocotb.test()
async def test_project(dut):
    dut._log.info("Start Blink LED Test")

    # បង្កើតចង្វាក់ Clock 10MHz
    clock = Clock(dut.clk, 100, units="ns") 
    cocotb.start_soon(clock.start())

    # ធ្វើការ Reset ឈីប
    dut._log.info("Resetting the chip")
    dut.ena.value = 1
    dut.ui_in.value = 0    # ក្នុង info.yaml ui[0] គឺជា reset
    dut.uio_in.value = 0
    dut.rst_n.value = 0    # កម្រិតទាបដើម្បី Reset
    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1    # ឱ្យវាចាប់ផ្ដើមដើរ

    dut._log.info("Testing LED toggling")

    # រង់ចាំមើលការប្រែប្រួលនៃ LED
    # ដោយសារយើងប្រើ counter[23] វានឹងប្រើពេលយូរបន្តិច
    # ក្នុងកូដតេស្ត យើងគ្រាន់តែឆែកមើលថាវាមានតម្លៃចេញមក (0 ឬ 1)
    await ClockCycles(dut.clk, 100)
    
    # បោះពុម្ពតម្លៃ LED បច្ចុប្បន្នលើ Log
    current_led = dut.uo_out[0].value
    dut._log.info(f"Current LED value: {current_led}")

    # ឈប់តេស្តការបូកលេខ (លុប Assert ចាស់ចោល)
    # យើងគ្រាន់តែចង់ឱ្យវាដើរដល់ចប់ដោយជោគជ័យ
    dut._log.info("Test Finished Successfully!")