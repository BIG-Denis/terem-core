#
# This file is a part of Terem Core project (https://github.com/BIG-Denis/terem-core).
# This file used to generate sources via KaravaiSV templeting engine (https://github.com/BIG-Denis/karavaisv).
#
# @author: BIG-Denis (https://github.com/BIG-Denis)
# @description: Functions used to check given config for correctness
#


# top function, point of enter
def check_params(parameters):
    check_params_common(parameters)
    check_params_core(parameters)
    check_params_branch_predictor(parameters)


def check_params_common(parameters):
    # module_id
    assert type(parameters['module_id']) == str, "module_id must be string!"
    assert len(parameters['module_id']) > 1, "module_id must be longer than 1!"
    assert parameters['module_id'][0] != '_', "module_id must not start with underscore!"
    assert parameters['module_id'][0] not in set([str(i) for i in range(10)]), "module_id must not start with number!"

    # assertions
    assert type(parameters['assertions']), "assertions must be boolean!"


def check_params_core(parameters):
    # pipeline_width
    assert type(parameters['pipeline_width']) == int, "pipeline_width must be integer!"
    assert parameters['pipeline_width'] > 1, "pipeline_width must be greater than 1!"
    assert parameters['pipeline_width'] < 9, "pipeline_width must not be greater than 8!"


def check_params_branch_predictor(parameters):
    # bp_pc_hash_bits
    assert type(parameters['bp_pc_hash_bits']) == int, "bp_pc_hash_bits must be integer!"
    assert parameters['bp_pc_hash_bits'] > 1, "bp_pc_hash_bits must be greater than 1!"
    assert parameters['bp_pc_hash_bits'] < 9, "bp_pc_hash_bits must not be greater than 30!"
