#!/bin/bash

base_dir=OS-Project-2-Verifier/outputs

# these are the arrays that generate the output files
args=(
    " "
    "-v"
    "-c"
    "-vs LRU"
    "-vf 20"
    "-vf 155"
    "-vf 50"
    "-vf 500"
    "-vf 1000"
    "-vf 20 -s LRU"
    "-vf 155 -s LRU"
    "-vf 50 -s LRU"
    "-vf 500 -s LRU"
    " -s LRU"
    "-v -s LRU"
    "-v -s LRU"
    "-s LRU"
    "-c"
    "-s LRU"
    "-vf 11"
    ""
    "-v"
)
file_names=(
    "nothing"
    "verbose"
    "csv"
    "vslru"
    "f20"
    "f155"
    "f50"
    "f500"
    "f1000"
    "fLRU20"
    "fLRU155"
    "fLRU50"
    "fLRU500"
    "sim_segfault_1_output_no_flag"
    "sim_segfault_2_output_lru_v_flag"
    "sim_segfault_1_output_lru_v_flag"
    "sim_segfault_2_output_no_flag"
    "sim_1_output_c_flag"
    "sim_1_output_LRU"
    "sim_1_output_MF_11"
    "sim_1_output_no_flag"
    "sim_1_output_v_flag"
)
sims=(
    "./OS-Project-2-Verifier/inputs/sim_1"
    "./OS-Project-2-Verifier/inputs/sim_1"
    "./OS-Project-2-Verifier/inputs/sim_1"
    "./OS-Project-2-Verifier/inputs/sim_1"
    "./OS-Project-2-Verifier/inputs/sim_1"
    "./OS-Project-2-Verifier/inputs/sim_1"
    "./OS-Project-2-Verifier/inputs/sim_1"
    "./OS-Project-2-Verifier/inputs/sim_1"
    "./OS-Project-2-Verifier/inputs/sim_1"
    "./OS-Project-2-Verifier/inputs/sim_1"
    "./OS-Project-2-Verifier/inputs/sim_1"
    "./OS-Project-2-Verifier/inputs/sim_1"
    "./OS-Project-2-Verifier/inputs/sim_1"
    "./OS-Project-2-Verifier/inputs/sim_segfault_1"
    "./OS-Project-2-Verifier/inputs/sim_segfault_2"
    "./OS-Project-2-Verifier/inputs/sim_segfault_1"
    "./OS-Project-2-Verifier/inputs/sim_segfault_2"
    "./OS-Project-2-Verifier/inputs/sim_1"
    "./OS-Project-2-Verifier/inputs/sim_1"
    "./OS-Project-2-Verifier/inputs/sim_1"
    "./OS-Project-2-Verifier/inputs/sim_1"
    "./OS-Project-2-Verifier/inputs/sim_1"
)

# takes optional parameter
if [ "$1" == "test" ]; then
    echo "Test your code"
    echo "1 of 2 unit tests ================="
    make test
    echo "2 of 2 diff ======================="
    make
    for index in ${!args[*]}; do
        echo
        echo "## Performing [${args[$index]}] ${sims[$index]}       > ${file_names[$index]}"
        echo "diff -sw <(./mem-sim ${args[$index]} ${sims[$index]}) $base_dir/${file_names[$index]}"
        diff -sw <(./mem-sim ${args[$index]} ${sims[$index]}) $base_dir/${file_names[$index]}
    done
elif [ "$1" = "gen" ]; then
    echo "Generate Outputs"
    for index in ${!args[*]}; do
        ./mem-sim ${args[$index]} ${sims[$index]} >$base_dir/${file_names[$index]}
    done
else
    echo "Error enter either: [test|gen]"
    echo "you entered [$1]"
fi

echo
echo "COMPLETED"
