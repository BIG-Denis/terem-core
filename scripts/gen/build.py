#
# This file is a part of Terem Core project (https://github.com/BIG-Denis/terem-core).
# This file used to generate sources via KaravaiSV templeting engine (https://github.com/BIG-Denis/karavaisv).
#
# @author: BIG-Denis (https://github.com/BIG-Denis)
# @description: Script for source code generation
#

import time
import karavaisv as ksv

from check_params import check_params
from calc_derived_params import calc_derived_params
from build_funcs import render_project


DEFAULT_PARAM_FILE = "config/trmc_default.yaml"
DEFAULT_BUILD_DIR = "build/"


def build(parameters, build_dir, log_time=False):
    # start building project
    start_time = time.time()

    # process parameters
    check_params(parameters)
    parameters = calc_derived_params(parameters)

    # render files
    render_project(parameters, build_dir)

    # end building project
    end_time = time.time()
    build_time = round(end_time - start_time, 2)
    if (log_time):
        print(f"KaravaiSV: Build TeremCore done in {build_time} sec!")


def main():
    parameters = ksv.read_params_from_yaml(DEFAULT_PARAM_FILE)
    build(parameters, DEFAULT_BUILD_DIR, log_time=True)


if __name__ == "__main__":
    main()
