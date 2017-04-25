# start the debugger
gdb your-executable

# set a breakpoint
b some-method, break some-method

# run the program
r, run

# when a breakpoint was reached:

# run the current line, stepping over any invocations
n, next
# run the current line, stepping into any invocations
s, step
# print a stacktrace
bt, backtrace
# evaluate an expression and print the result
p length=strlen(string)
p *array@arraylen
x /nfu position
x /16xb 0x81e5fe4
# list surrounding source code
l, list
# continue execution
c, continue

# exit gdb (after program terminated)
q, quit

# multi threads
set scheduler-locking off|on|step
info threads
thread <threads number>
break thread_test.c:123 thread all
thread apply ID1 ID2 command
thread apply all command

# multi process
set follow-fork-mode parent
set detach-on-fork off
info inferiors
inferior <infer number>

# options for print
set print elements 0
set print pretty on
set print union

#
show convenience
set $name=value

# start non-stop mode
set target-async 1
set pagination off
set non-stop on
