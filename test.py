import cocotb
from cocotb.triggers import Timer


@cocotb.test()
async def test_test(dut):
    # rst 0
    dut.io_in[1].value = 1
    dut.io_in[0].value = 1
    await Timer(1, units='ns')
    dut.io_in[0].value = 0
    await Timer(1, units='ns')

    # tick
    dut.io_in[1].value = 0
    dut.io_in[0].value = 1
    await Timer(1, units='ns')
    dut.io_in[0].value = 0
    await Timer(1, units='ns')

    assert dut.io_out.value == 0

    # one more tick
    dut.io_in[0].value = 1
    await Timer(1, units='ns')
    dut.io_in[0].value = 0
    await Timer(1, units='ns')

    assert dut.io_out.value == 1

    # even more ticks
    for i in range(254):
        dut.io_in[0].value = 1
        await Timer(1, units='ns')
        dut.io_in[0].value = 0
        await Timer(1, units='ns')

    assert dut.io_out.value == 255

    # the last tick
    dut.io_in[0].value = 1
    await Timer(1, units='ns')
    dut.io_in[0].value = 0
    await Timer(1, units='ns')

    assert dut.io_out.value == 0
