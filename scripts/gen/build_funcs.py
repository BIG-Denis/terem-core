#
# This file is a part of Terem Core project (https://github.com/BIG-Denis/terem-core).
# This file used to generate sources via KaravaiSV templeting engine (https://github.com/BIG-Denis/karavaisv).
#
# @author: BIG-Denis (https://github.com/BIG-Denis)
# @description: Functions used in building process
#

import karavaisv as ksv

from aux_funcs import aux_funcs_collection


FILELIST_PATH = "project/filelists/trmc_filelist.kf"


# top function, point of enter
def render_project(parameters, build_dir="build"):
    # add auxiliary functions to parameters
    parameters = parameters | aux_funcs_collection

    # render easy files
    render_easy_file(parameters, "src/trmc_pkg.ksv", build_dir)
    render_easy_file(parameters, "src/trmc_decoder_way.ksv", build_dir)
    render_easy_file(parameters, "src/trmc_decoder.ksv", build_dir)
    render_easy_file(parameters, "src/trmc_reallign_unit.ksv", build_dir)

    # render filelist
    render_filelist(parameters, FILELIST_PATH, build_dir)


# render easy files which not require any additional parameters manipulations
def render_easy_file(parameters, src_filename, build_dir):
    module_id = parameters["module_id"]
    source_code = ksv.read_source_from_file(src_filename)
    rendered_code = ksv.render(source_code, parameters, logging=False)
    dest_filename = build_dir + src_filename.replace(".ksv", ".sv").replace("trmc", module_id)
    ksv.write_rendered_to_file(rendered_code, dest_filename)


# render templated filelist
def render_filelist(parameters, filelist_path, build_dir):
    source_filelist = ksv.read_source_from_file(filelist_path)
    rendered_filelist = ksv.render(source_filelist, parameters, logging=False)
    dest_filename = build_dir + filelist_path.replace(".kf", ".f")
    ksv.write_rendered_to_file(rendered_filelist, dest_filename)


