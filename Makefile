run:
	irun +access+rwc -coverage ALL -covoverwrite test_top.sv
clean:
	\rm -rf irun.* waves.shm INCA_libs imc.log mdv.log cov_work
