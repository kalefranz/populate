printenv
conda info
# PKG_VERSION=0.0.0
# CPU_COUNT=8

pkg_names="$(conda list --canonical --no-pip)"

conda_pkgs_dir="$(conda info 2> /dev/null | grep "package cache" | cut -d: -f2 | tr -d '[[:space:]]')"

echo $conda_pkgs_dir

pushd $conda_pkgs_dir

conda list --canonical --no-pip --name _build | xargs -I{} -n1 ls -al {}.tar.bz2

conda list --canonical --no-pip --name _build | xargs -t -I{} -n1 anaconda --token ae-3f82bb6b-d33f-43d1-b8f1-a14e2ae1c1ed upload --user aetrial --label $PKG_VERSION {}.tar.bz2

# xargs -t -I{} -n1 -P$CPU_COUNT anaconda upload --user aetrial --label $PKG_VERSION {}.tar.bz2

# anaconda upload --register



