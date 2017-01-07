python
import os
gdb.execute('symbol-file ' + os.environ['OUT'] + '/obj/EXECUTABLES/updater_intermediates/LINKED/updater')
gdb.execute('set solib-absolute-prefix '+ os.environ['OUT'] + '/symbols')
gdb.execute('set solib-search-path ' + os.environ['OUT'] + '/symbols/system/lib')
end


