#!/usr/bin/env python3

####
# python
# pip install pdf2docx
###

import os, sys, subprocess, shutil
try:
	from pdf2docx import parse
except ModuleNotFoundError:
	print("Run(on command prompt): pip install pdf2docx")
	sys.exit()

def open_docx(file_path):
    """This function opens the converted docx file with the default
    application, platform-independently."""
    
    try:
        if sys.platform.startswith('win'):
            subprocess.run(["start", " ", file_path], shell=True)
        elif sys.platform.startswith('linux'):
            subprocess.run(["xdg-open", file_path])
        elif sys.platform.startswith('darwin'):
            subprocess.run(["open", file_path])
        else:
            print("Unsupported platform.")
    except subprocess.CalledProcessError as e:
        print(f"Error: {e}")

def new_filename(my_str: str, src_path: str):
	"""This function will:
	1. Rename the output file or lets the user specify a name
	2. generates a unique name if the suggested name exists"""

	num = 1
	while True:
		suggested_name = f"""{os.path.basename(''.join(my_str.split(".docx")))}_{num}.docx"""
		newly_suggested_name = os.path.join(src_path, suggested_name)
		if os.path.exists(newly_suggested_name):
			print(f'The file "{os.path.basename(newly_suggested_name)}" exists. ❌')
			num += 1
			continue
		print(f"""..........................................................................
Would you like to rename the output to "{suggested_name}"? - [y]. (press any key to change name)
		or 
you prefer to enter a new name - [i]?
		""")
		response = input(">>> ")
		if response.lower() == "i":
			input_name = input("Enter the output filename: ")
			if input_name.endswith(".docx"):
				suggested_name = input_name
			else:
				suggested_name = f"{input_name}.docx"
			return suggested_name
		elif response.lower() == "y":
			return suggested_name
		num += 1


def numbers_and_whitespace(my_str: str):
	"""This function validates that the string contains only:
	1. Number(s)
	2. Whitespace(s)"""

	summary = True
	for check in my_str:
		if not check.isdecimal() and not check.isspace():
			summary = False
	if summary:
		return True
	return False


def pdf2docx_converter(pdf_file_arg: str, docx_file_arg: str, option: int, pages: list = None):
	"""This function converts the pdf file to docx file"""
	
	# generating a converted file
	first, last = 0, None
	if option == 3:
		first = pages[0]
		last = pages[1]
		pages = None

	parse (pdf_file=pdf_file_arg, docx_file=docx_file_arg, start=first, end=last, pages=pages)
		
	information = {"Input File": os.path.basename(pdf_file_arg), "Expected output File": os.path.basename(docx_file_arg)}
	
	# Printing information
	print("Information .......................................................")
	for k, v in information.items():
		print(f"{k}: {v}")
	print("...................................................................")
	print()





print()
# setup default location for source and converted files
src_Path = os.path.join(os.path.expanduser("~"), "desktop", "PDF2WORD")

# os.makedirs(src_Path, exist_ok=True)
if not os.path.exists(src_Path):
	os.makedirs(src_Path, exist_ok=True)
	# copy(os.path.expanduser("~"), "pdf2docx_converter", "test.pdf") src_Path
	test_src = os.path.join(os.path.expanduser("~"), "pdf2docx_converter", "test.pdf")
	test_dst = os.path.join(src_Path, "test.pdf")
	shutil.copy(test_src, test_dst)
	print(f"""Hey! A test.pdf file has been created for you to test the functionality of this converter.
To Convert any pdf file, simply type its name. You can respond to this prompt with "test" to see.
Enjoy!
""")
os.chdir(src_Path)

# user inputs
print("PDF-TO-DOCX bY Dafetite. O")
file_name = input("Enter filename: ")
print()

# checks for pdf
if file_name.endswith(".pdf"):
	file_name_pdf = file_name
else:
	file_name_pdf = f"{file_name}.pdf"

file_check_pdf = os.path.join(src_Path, file_name_pdf)
if os.path.exists(file_check_pdf):
    print(f'The file "{os.path.basename(file_check_pdf)}" exists. ✅')
else:
    print(f'The file "{os.path.basename(file_check_pdf)}" does not exist. ❌')
    print()
    print("You can't convert a file that does not exist in the PDF2WORD folder.")
    print(f"""Place "{file_name_pdf}" file in the PDF2WORD folder on your desktop.""")
    print()
    sys.exit()
    

# checks for docx
if file_name.endswith(".docx"):
	split_file_name = file_name.split(".docx")
	file_name_docx = f"{split_file_name[0]}.docx"
elif file_name.endswith(".pdf"):
	split_file_name = file_name.split(".pdf")
	file_name_docx = f"{split_file_name[0]}.docx"
else:
	file_name_docx = f"{file_name}.docx"

file_check_docx = os.path.join(src_Path, file_name_docx)
if os.path.exists(file_check_docx):
    print(f'The file "{os.path.basename(file_check_docx)}" exists. ❌')
    file_name_docx = new_filename(file_check_docx, src_Path)
else:
    print(f'The file "{os.path.basename(file_check_docx)}" does not exist. ✅')

while True:
	print(f"""
How do you want to convert {file_name_pdf}?
[1] or [A] - Convert all the pages of {file_name_pdf}
[2] or [B] - Convert non-consecutive number of page(s) in {file_name_pdf}
[3] or [C] - Convert a range of pages in {file_name_pdf}
	""")
	choice = input(">>> ")
	print(".......................................")
	if choice.isalnum() :
		if choice == "1" or choice.lower() == "a":
			page_num = None
			option = 1
		elif choice == "2" or choice.lower() == "b":
			while True:
				page_num = list(input("Enter page number(s) separated by space: "))
				if numbers_and_whitespace(page_num):
					break
				print("Invalid entry.\n")
			page_num = [(int(i) - 1) for i in page_num if i.isnumeric()]
			option = 2
		elif choice == "3" or choice.lower() == "c":
			while True:
				page_num = list(input("Enter Start and End page numbers, separated by space: "))
				if numbers_and_whitespace(page_num):
					break
				print("Invalid entry.\n")
			clean = [(int(i) - 1) for i in page_num if i.isnumeric()]
			first = int(clean[0])
			last = int(clean[1]) + 1
			page_num = [first, last]
			option = 3
		else:
			continue
		break
print()

pdf_file = os.path.join(src_Path, file_name_pdf)
docx_file = os.path.join(src_Path, file_name_docx)

pdf2docx_converter(pdf_file, docx_file, option, page_num)

to_open = input(f"Would you like to open {file_name_docx} in Microsoft Word? Hit Enter for [y] >>> ")
if to_open.lower() == "y" or to_open == "":
	open_docx(docx_file)
	print("Yass!")
else:
	print("Gracias!")
print()
print("""To carry out another pdf file conversion, simply run: "pdf2word" on your command prompt.
Note: There is a default folder "PDF2WORD" on your desktop. copy/move any pdf file into it and
run this program for all your conversions.
Cheers!""")
