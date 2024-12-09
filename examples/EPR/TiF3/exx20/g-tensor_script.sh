#!/bin/sh
NAME="tif3_gtensor.exx20.nscf"

for DIR in 1
do
cat > ${NAME}_${DIR}.in << EOF

&input_qeconverse
        prefix = 'tif3'
        outdir = './scratch/'
        diagonalization = 'david'
        verbosity = 'high'
        q_gipaw = 0.01
        dudk_method = 'singlepoint'
        diago_thr_init = 1d-4
        conv_threshold = 1d-8
        mixing_beta = 0.5
        lambda_so(${DIR}) = 1.0
        exx_gipaw = .true.
        non_scf   = .true.
/
EOF

mpirun -np 6 /home/sfioccola/Desktop/test_singlepoint/QE-CONVERSE/bin/qe-converse.x  < ${NAME}_${DIR}.in > ${NAME}_${DIR}.out
echo ${NAME}_${DIR}

done

