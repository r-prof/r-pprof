
<!-- README.md is generated from README.Rmd. Please edit that file -->
pprof
=====

[![Travis build status](https://travis-ci.org/r-prof/r-pprof.svg?branch=master)](https://travis-ci.org/r-prof/r-pprof) [![Coverage status](https://codecov.io/gh/r-prof/r-pprof/branch/master/graph/badge.svg)](https://codecov.io/github/r-prof/r-pprof?branch=master) [![CRAN status](http://www.r-pkg.org/badges/version/pprof)](https://cran.r-project.org/package=pprof)

This is the [pprof](https://github.com/google/pprof) tool for visualization and analysis of profiling data, wrapped as an R package. It exports a single function which returns the path to the executable file.

The `pprof` binary can also be installed via `go get github.com/google/pprof`. However, some operating systems have an incompatible version of `pprof` on the `PATH` by default. This R package offers an easy-to-use robust alternative.

Installation
------------

You can install *pprof* from GitHub with:

``` r
# install.packages("devtools")
devtools::install_github("r-prof/r-pprof")
```

Example
-------

``` r
invisible(processx::run(
  pprof::get_pprof_pkg_path(),
  "-help",
  echo = TRUE,
  error_on_status = FALSE
))
#> usage:
#> 
#> Produce output in the specified format.
#> 
#>    pprof <format> [options] [binary] <source> ...
#> 
#> Omit the format to get an interactive shell whose commands can be used
#> to generate various views of a profile
#> 
#>    pprof [options] [binary] <source> ...
#> 
#> Omit the format and provide the "-http" flag to get an interactive web
#> interface at the specified host:port that can be used to navigate through
#> various views of a profile.
#> 
#>    pprof -http [host]:[port] [options] [binary] <source> ...
#> 
#> Details:
#>   Output formats (select at most one):
#>     -callgrind       Outputs a graph in callgrind format
#>     -comments        Output all profile comments
#>     -disasm          Output assembly listings annotated with samples
#>     -dot             Outputs a graph in DOT format
#>     -eog             Visualize graph through eog
#>     -evince          Visualize graph through evince
#>     -gif             Outputs a graph image in GIF format
#>     -gv              Visualize graph through gv
#>     -kcachegrind     Visualize report in KCachegrind
#>     -list            Output annotated source for functions matching regexp
#>     -pdf             Outputs a graph in PDF format
#>     -peek            Output callers/callees of functions matching regexp
#>     -png             Outputs a graph image in PNG format
#>     -proto           Outputs the profile in compressed protobuf format
#>     -ps              Outputs a graph in PS format
#>     -raw             Outputs a text representation of the raw profile
#>     -svg             Outputs a graph in SVG format
#>     -tags            Outputs all tags in the profile
#>     -text            Outputs top entries in text form
#>     -top             Outputs top entries in text form
#>     -topproto        Outputs top entries in compressed protobuf format
#>     -traces          Outputs all profile samples in text form
#>     -tree            Outputs a text rendering of call graph
#>     -web             Visualize graph through web browser
#>     -weblist         Display annotated source in a web browser
#> 
#>   Options:
#>     -call_tree       Create a context-sensitive call tree
#>     -compact_labels  Show minimal headers
#>     -divide_by       Ratio to divide all samples before visualization
#>     -drop_negative   Ignore negative differences
#>     -edgefraction    Hide edges below <f>*total
#>     -focus           Restricts to samples going through a node matching regexp
#>     -hide            Skips nodes matching regexp
#>     -ignore          Skips paths going through any nodes matching regexp
#>     -mean            Average sample value over first value (count)
#>     -nodecount       Max number of nodes to show
#>     -nodefraction    Hide nodes below <f>*total
#>     -normalize       Scales profile based on the base profile.
#>     -output          Output filename for file-based outputs
#>     -positive_percentages Ignore negative samples when computing percentages
#>     -prune_from      Drops any functions below the matched frame.
#>     -relative_percentages Show percentages relative to focused subgraph
#>     -sample_index    Sample value to report (0-based index or name)
#>     -show            Only show nodes matching regexp
#>     -source_path     Search path for source files
#>     -tagfocus        Restricts to samples with tags in range or matched by regexp
#>     -taghide         Skip tags matching this regexp
#>     -tagignore       Discard samples with tags in range or matched by regexp
#>     -tagshow         Only consider tags matching this regexp
#>     -trim            Honor nodefraction/edgefraction/nodecount defaults
#>     -unit            Measurement units to display
#> 
#>   Option groups (only set one per group):
#>     cumulative       
#>       -cum             Sort entries based on cumulative weight
#>       -flat            Sort entries based on own weight
#>     granularity      
#>       -addresses       Aggregate at the function level.
#>       -addressnoinlines Aggregate at the function level, including functions' addresses in the output.
#>       -files           Aggregate at the file level.
#>       -functions       Aggregate at the function level.
#>       -lines           Aggregate at the source code line level.
#>       -noinlines       Aggregate at the function level.
#> 
#>   Source options:
#>     -seconds              Duration for time-based profile collection
#>     -timeout              Timeout in seconds for profile collection
#>     -buildid              Override build id for main binary
#>     -add_comment          Free-form annotation to add to the profile
#>                           Displayed on some reports or with pprof -comments
#>     -base source          Source of profile to use as baseline
#>     profile.pb.gz         Profile in compressed protobuf format
#>     legacy_profile        Profile in legacy pprof format
#>     http://host/profile   URL for profile handler to retrieve
#>     -symbolize=           Controls source of symbol information
#>       none                  Do not attempt symbolization
#>       local                 Examine only local binaries
#>       fastlocal             Only get function names from local binaries
#>       remote                Do not examine local binaries
#>       force                 Force re-symbolization
#>     Binary                  Local path or build id of binary for symbolization
#> 
#> 
#>   Misc options:
#>    -http              Provide web based interface at host:port.
#>                       Host is optional and 'localhost' by default.
#>                       Port is optional and a randomly available port by default.
#>    -tools             Search path for object tools
#> 
#>   Legacy convenience options:
#>    -inuse_space           Same as -sample_index=inuse_space
#>    -inuse_objects         Same as -sample_index=inuse_objects
#>    -alloc_space           Same as -sample_index=alloc_space
#>    -alloc_objects         Same as -sample_index=alloc_objects
#>    -total_delay           Same as -sample_index=delay
#>    -contentions           Same as -sample_index=contentions
#>    -mean_delay            Same as -mean -sample_index=delay
#> 
#>   Environment Variables:
#>    PPROF_TMPDIR       Location for saved profiles (default $HOME/pprof)
#>    PPROF_TOOLS        Search path for object-level tools
#>    PPROF_BINARY_PATH  Search path for local binary files
#>                       default: $HOME/pprof/binaries
#>                       finds binaries by $name and $buildid/$name
#>    * On Windows, %USERPROFILE% is used instead of $HOME
```
