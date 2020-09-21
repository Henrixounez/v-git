module git

import os

fn prepend_(p string, a []string) []string {
	mut copy := a
	copy.prepend(p)
	return copy
}
fn concat_(a []string, b []string) []string {
	mut copy := a
	copy << b
	return copy
}

pub struct Git {
	mut:
		dir string
		bin string
}

pub fn create(dir string, bin string) Git {
	return Git {
		dir
		bin
	}
}



fn (g Git)execute(command []string) ?string {
	res := os.exec(prepend_(g.bin, command).join(' ')) or {
		return none
	}
	if res.exit_code != 0 {
		eprint(res.output)
		return none
	}
	return res.output
}

pub fn (mut g Git)cwd(dir string) {
	if os.is_dir(dir) {
		g.dir = dir
	} else {
		eprintln('$dir doesnt exists')
	}
	// TODO check if folder exists
}

////////

// Clone a repository into a new directory
pub fn (g Git)clone(repository string) {
	g.execute(['clone', repository])
}
pub fn (g Git)clone_to(repository string, dir string) {
	g.execute(['clone', repository, dir])
}
pub fn (g Git)clone_with_options(repository string, dir string, options string) {
	g.execute(['clone', repository, dir, options])
}

// Create an empty Git repository or reinitialize an existing one
pub fn (g Git)init(bare bool) {
	g.init_with_options(bare, '')
}
pub fn (g Git)init_with_options(bare bool, options string) {
	mut cmd := ['init']
	if bare {
		cmd << '--bare'
	}
	cmd << options
	g.execute(cmd)
}

////////

// Add file contents to the index
pub fn (g Git)add(file string) {
	g.execute(['add', file])
}
pub fn (g Git)add_multiple(files []string) {
	g.execute(prepend_('add', files))
}

// Move or rename a file, a directory, or a symlink
pub fn (g Git)mv(from string, to string) {
	g.execute(['mv', from, to])
}

// Remove files from the working tree and from the index
pub fn (g Git)rm(file string) {
	g.execute(['rm', file])
}
pub fn (g Git)rm_multiple(files []string) {
	g.execute(prepend_('rm', files))
}

pub fn (g Git)rm_keep_local(file string) {
	g.execute(['rm', '--cached', file])
}
pub fn (g Git)rm_multiple_keep_local(files []string) {
	g.execute(concat_(['rm' '--cached'], files))
}

////////

// Show changes between commits, commit and working tree, etc
pub fn (g Git)diff() {

}

// Show commit logs
pub fn (g Git)log() {

}

// Show various types of objects
pub fn (g Git)show() {

}

// Show the working tree status
pub fn (g Git)status() {

}

////////

// List, create, or delete branches
pub fn (g Git)branch(options []string) {
	g.execute(prepend_('branch', options))
	// TODO List branches
}
pub fn (g Git)branch_delete(branch string) {
	g.execute(['branch', '-D', branch])
}

// Record changes to the repository
pub fn (g Git)commit(message string/* options ?*/) {
	g.execute(['commit', '-m', '"$message"'])
}
pub fn (g Git)commit_with_files(message string, files []string) {
	g.execute(concat_(['commit', '-m', message], files))
}

// Join two or more development histories together
// pub fn (g Git)merge() {

// }

// Reapply commits on top of another base tip
// pub fn (g Git)rebase() {

// }

// Reset current HEAD to the specified state
// pub fn (g Git)reset() {

// }

////////

// Download objects and refs from another repository
pub fn (g Git)fetch() {
	g.execute(['fetch'])
}
pub fn (g Git)fetch_from(remote string, branch string) {
	g.execute(['fetch', remote, branch])
}

// Fetch from and integrate with another repository or a local branch
pub fn (g Git)pull() {
	g.execute(['pull'])
}
pub fn (g Git)pull_from(remote string, branch string) {
	g.execute(['pull', remote, branch])
}
pub fn (g Git)pull_with_options(remote string, branch string, options string) {
	g.execute(['pull', remote, branch, options])
}

// Update remote refs along with associated objects
pub fn (g Git)push() {
	g.execute(['push'])
}
pub fn (g Git)push_to(remote string, branch string) {
	g.execute(['push', remote, branch])
}
pub fn (g Git)push_with_options(remote string, branch string, options string) {
	g.execute(['push', remote, branch, options])
}