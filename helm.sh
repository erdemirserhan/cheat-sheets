# pull a chart from remote helm-registry
helm pull oci://<your.repo.url.here>/path/to/your/chart --version <helm_chart_version_here>

# lint a chart
helm lint .

# make a new chart with the given chart, also with line numbers to debug
helm template . --debug | grep -n '^'

# get the dependencies that is defined in the chart.yaml
helm dependency build
