# Boost.Python With CMake

## 概要

このソースコードは、CMake + Boost.PythonでPythonのモジュールを作成してみるサンプルプログラムです。

## ビルド方法

```bash
$ mkdir build
$ cd build
$ cmake .. -DCMAKE_INSTALL_PREFIX=./install
$ make -j install
```

※MacやPyenvを使うと、HomebrewとシステムのPythonが競合して正しくビルドできないことがあります。
その時はcmakeコマンド実行時に下記オプションを追加してPythonのパスを直接指定してください

```bash
$ cmake .. -DCMAKE_INSTALL_PREFIX=./install \
           -DPYTHON_INCLUDE_DIRS={使用するPythonのヘッダパス} \
           -DPYTHON_LIBRARY={使用するPythonのlibpythonX.X.{so|dylib}へのパス}
```

## Pythonで使うには？

```bash
$ PYTHONPATH=/path/to/myproject/build/install/lib:${PYTHONPATH} python
>>> import simple
```

## モジュールについて

### simple

* 掛け算と引き算ができるモジュール
* ソースコードは`cpp/pymodule/simple`を参照

### klass

* クラスの呼び出しに関するテスト
* ソースコードは`cpp/pymodule/klass`を参照

### opencv連携

※実装中

## ディレクトリ説明

* cpp
  * cmake    --- CMakeのモジュールを格納するディレクトリ。今は使っていない
  * module   --- C++でも使い回しとかできたらいいなと思っている各種ライブラリを格納予定
  * pymodule --- Pythonモジュールのソースコード
* python
  * サンプルプログラム

## Dockerfileについて

付属のDockerfileは、PythonとOpenCVの環境を作ることができるDockerfileです。
OpenCV+Pythonの環境を作りたくない、システムワイドにOpenCVとかPythonをインストールしたくない
という人はこのDockerfileを使ってください。
なお、GUIは使えないので注意してください。

以上
