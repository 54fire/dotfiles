;在<cdsroot>\share\local\pcb\skill\allegro.ilinit文件（不存在就建一个同名空文档）中添加一行 loadi("setGrid.il")
;重启allegro PCB editor后， 在command中输入 g xx即可设置grid， xx就是grid值

axlCmdRegister("g", 'setGrid, ?cmdType "general")

defun(setGrid (s)
	let((o_grid)
		o_grid = axlDBGridGet("TOP")
		o_grid->name = 'all
		s = atof(s)
		o_grid->xGrids = s
		o_grid->yGrids = s
		axlDBGridSet(o_grid)
	)
)
