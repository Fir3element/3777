## Useful links
### Binaries
- Windows x32: https://github.com/Fir3element/binaries/raw/master/x32-windows.zip
- Windows x64: https://github.com/Fir3element/binaries/raw/master/x64-windows.zip

### Source
- https://github.com/Fir3element/3777/archive/master.zip

## Libraries for Visual Studio 2022 (using vcpkg)

- x32:
```
.\vcpkg install luajit sqlite3 libmariadb libxml2 gmp boost-filesystem boost-regex boost-thread boost-asio boost-foreach boost-any openssl
```

- x64:
```
.\vcpkg install --triplet x64-windows luajit sqlite3 libmariadb libxml2 gmp boost-filesystem boost-regex boost-thread boost-asio
```

## Build instruction for Ubuntu

```
sudo apt-get update
```

```
sudo apt-get install --no-install-recommends -y git autoconf automake pkg-config build-essential cmake liblua5.1-0-dev libsqlite3-dev libmysqlclient-dev libxml2-dev libgmp3-dev libboost-filesystem-dev libboost-regex-dev libboost-thread-dev
```

```
git clone https://github.com/Fir3element/3777.git
```

```
cd /3777-master
```

```
mkdir build
```

```
cd build
```

```
cmake ..
```

```
make -j$(grep processor /proc/cpuinfo | wc -l)
```
