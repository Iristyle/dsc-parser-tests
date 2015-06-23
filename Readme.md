### Parser tests

* Original gist that served as the basis for this repo at https://gist.github.com/Iristyle/cbd1f57ce53de9964202

### Executing tests

* `bundle install --path .bundle/gems`
    * Note that this uses the MOF gem from https://github.com/Iristyle/mof
* `bundle exec ruby parse.rb`

### Original steps for cobbling together this repo

* All DSC resources come from `git clone --recursive https://github.com/PowerShell/DSCResources` .. and then a copy of all MOFs to a flattened hierarchy via `cp DSCResources/**/*.mof`
* The `cim_schema_2.26.0Final-MOfs` folder came from `git clone https://github.com/msutter/cim_schema_2.26.0Final-MOFs.git`

