# Vim Notes

打开 hello.txt 文件后迅速执行一条命令，您可以向 Vim 传递一个 `+{cmd}` 选项。在 Vim 中，您可以使用 `:s` 命令（substitue的缩写）替换文本。如果您想打开 hello.txt 后立即将所有的 `pancake`替换成 `bagel`，在终端中：

```shell
vim +%s/pancake/bagel/g hello.txt
vim +%s/pancake/bagel/g +%s/bagel/egg/g +%s/egg/donut/g hello.txt
```

可以使用 `-c` 标志来代替 `+` 语法，在终端中：

```shell
vim -c %s/pancake/bagel/g hello.txt
vim -c %s/pancake/bagel/g -c %s/bagel/egg/g -c %s/egg/donut/g hello.txt
```

`+{cmd}` 或 `-c {cmd}` 可以向 vim 命令传递不同的选项（option）和标志（flag），就像其他终端命令一样。

```shell
# 水平分割，指分割线是水平的
vim -o2
vim -o5
vim -o5 hello1.txt hello2.txt

# 垂直分割，指水平线是垂直的
vim -O2
vim -O5
vim -O5 hello1.txt hello2.txt
```

将 ls 命令的输出重定向到 Vim 中编辑，命令是 `ls -l | vim -`。

`autochdir` 选项开启，当打开文件、切换缓冲区、删除缓冲区、关闭窗口时，将改变当前工作目录为已打开文件的目录。

## Buffers Windows Tabs

### buffer

```shell
vim file1.js file2.js
```

运行 `vim file1 file2 file3 ... filen` 创建 n 个 buffer。每一次您打开一个新文件，Vim 就为这个文件创建一个新的 buffer。

要遍历所有 buffer，有以下几种方法：

- `:bnext` 切换至下一个 buffer（`:bprevious` 切换至前一个 buffer）。
- `:buffer + 文件名`（按下 `<Tab>` 键 Vim 会自动补全文件名）。
- `:buffer + n`, n 是 buffer 的编号。比如，输入 `:buffer 2` 将使您切换到 buffer #2。
- 按下 `Ctrl-O` 将跳转至跳转列表中旧的位置，对应的，按下 `Ctrl-I` 将跳转至跳转列表中新的位置。这并不是属于 buffer 的特有方法，但它可以用来在不同的 buffer 中跳转。
- 按下 `Ctrl-^` 跳转至先前编辑过的 buffer。

删除 buffer：

- `:bdelete + n` 删除第 n 个 buffer。
- `:bdelete + 文件名` 使用 `<Tab>` 键补全，删除对应 buffer。

### window

```shell
vim file1.js
```

先不忙急着退出Vim，在Vim中运行：

```vim
" 在 Vim 中运行
:split file2.js
```

现在看到两个 buffers 通过**两个窗口**显示出来。上面的窗口显示的是 file2.js 的 buffer，而下面的窗口显示的是 file1.js 的 buffer。可以让多个窗口显示同一个 buffer。

窗口导航：

```
Ctrl-w hjkl
```

这里有一些普通模式下关于窗口的命令：

```vim
Ctrl-W V    打开一个新的垂直分割的窗口
Ctrl-W S    打开一个新的水平分割的窗口
Ctrl-W C    关闭一个窗口
Ctrl-W O    除了当前窗口，关闭所有其他的窗口
```

当关闭一个窗口后，buffer 仍然会在列表中。（可以运行 `:buffers` 来确认这一点）。

下面列出了一些有用的关于 window 的命令行命令：

```vim
:vsplit filename    垂直分割当前窗口，并在新窗口中打开名为 filename 的文件。
:split filename     水平分割当前窗口，并在新窗口中打开名为 filename 的文件。
:new filename       创建一个新窗口并打开名为 filename 的文件。
```

### tab

Tab 就是 Window 的集合，它就像窗口的布局。在大部分的现代文本编辑器（还有现代互联网浏览器）中，一个 tab 意味着打开一个文件/页面，当您关闭标签，相应的文件/页面就消失了。但在 Vim 中，tab 并不表示打开了一个文件。当您在 Vim 中关闭一个 tab，您并不是关闭一个文件。您仅仅关闭了窗口布局，文件的数据依然存储在内存中的 buffer 中。

下面的列表列出了一些有用的关于 tab 导航的命令：

```vim
:tabnew file.txt    在tab中打开一个文件
:tabclose           关闭当前tab
:tabnext            切换至下一个tab
:tabprevious        切换至前一个tab
:tablast            切换至最后一个tab
:tabfirst           切换至第一个tab
```

在普通模式下输入 `gt` 切换到下一个标签页（对应的，可以用 `gT`切换到前一个标签页）。也可以传递一个数字作为参数给 `gt`，这个数字是 tab 的编号。若想切换到第3个 tab，输入 `3gt`。

若想让 Vim 启动时就包含多个 tab，您可以在终端中运行如下命令：

```shell
vim -p file1.js file2.js file3.js
```

## 文件搜索

### 打开和编辑文件

使用 `**` 进行*递归搜索*，如果想查找当前项目文件夹下所有 `*.md` 文件，但您不知道在哪个目录，可以这样做：

```vim
:edit **/*.md<Tab>
```

`:edit` 可以用于运行 `netrw`（Vim 的内置文件浏览器），使用方法是，给 `:edit` 一个目录参数而不是文件名即可：

```vim
:edit .
:edit test/unit/
```

### 使用 find 命令搜索文件

可以使用 `:find` 命令搜索文件，比如：

```vim
:find package.json
:find app/controllers/users_controller.rb
```
`:find` 和 `:edit` 看起来很像，它们的区别是什么呢？
