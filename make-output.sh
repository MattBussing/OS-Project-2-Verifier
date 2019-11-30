base_dir=OS-Project-2-Verifier/outputs

make

./mem-sim inputs/sim_1 >$base_dir/sim_1_output_no_flag
./mem-sim -v inputs/sim_1 >$base_dir/sim_1_output_v_flag
./mem-sim -c inputs/sim_1 >$base_dir/sim_1_output_c_flag
./mem-sim -s LRU inputs/sim_1 >$base_dir/sim_1_output_LRU
./mem-sim -vf 11 inputs/sim_1 >$base_dir/sim_1_output_MF_11

echo "outputs updated to your simulation"