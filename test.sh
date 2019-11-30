echo "1 of 3 clean ======================"
# make clean
echo "2 of 3 unit tests ================="
make test
echo "3 of 3 diff ======================="
make

printf "  Checking no flag output\n"
diff -sw <(./mem-sim inputs/sim_1) verify/outputs/deliverable_02/sim_1_output_no_flag

printf "  Checking verbose flag output\n"
diff -sw <(./mem-sim -v inputs/sim_1) verify/outputs/deliverable_02/sim_1_output_v_flag

printf "  Checking csv flag output\n"
diff -sw <(./mem-sim -c inputs/sim_1) verify/outputs/deliverable_02/sim_1_output_c_flag

printf "  Checking LRU output\n"
diff -sw <(./mem-sim -s LRU inputs/sim_1) verify/outputs/deliverable_02/sim_1_output_LRU

printf "  Checking maxframes 11 output\n"
diff -sw <(./mem-sim -vf 11 inputs/sim_1) verify/outputs/deliverable_02/sim_1_output_MF_11

echo "COMPLETED"
