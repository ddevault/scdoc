# TODO: Just use a makefile
project(
	'scdoc',
	'c',
	license: 'MIT',
	meson_version: '>=0.43.0',
	default_options: [
		'c_std=c99',
		'warning_level=2',
		'werror=true',
	],
)

add_project_arguments('-Wno-unused-parameter', language: 'c')

executable(
	'scdoc', [
		'src/main.c',
		'src/string.c',
		'src/utf8_chsize.c',
		'src/utf8_decode.c',
		'src/utf8_encode.c',
		'src/utf8_fgetch.c',
		'src/utf8_fputch.c',
		'src/utf8_size.c',
		'src/util.c',
	],
	include_directories: include_directories('include')
)
