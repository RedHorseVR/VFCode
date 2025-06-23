import os
import sys
import re

import difflib
from pathlib import Path

DEBUG = True;

def replace_rightmost(s, old, new):
	return new.join(s.rsplit(old, 1))
def get_second_extension(filename):
	suffixes = Path(filename).suffixes
	return suffixes[-2] if len(suffixes) >= 2 else ""
def compare_strings(str1, str2):
	diff = difflib.ndiff(str1, str2)
	print("\n".join(diff))
	
def scan_file(filename):
	global  INLINE_COMMENT
	INLINE_COMMENT = '#'
	VFC_DELIM = r'\);'+'//'
	VFC_FILE  = False;
	RAWCODE = [] ;
	if not os.path.exists(filename):
		print(f"Error: File '{filename}' not found.")
		return ""
	else:
		if   os.path.splitext( filename )[1].lower() == '.vfc'.lower()  :
			VFC_FILE  =True ;
			EXTEN = get_second_extension(filename)
		else:
			EXTEN = os.path.splitext( filename )[1].lower()
			
		print( EXTEN )
		if  EXTEN.startswith( '.c' ) or  EXTEN.startswith( '.h' ) or  EXTEN.startswith( '.j' ) :
			INLINE_COMMENT = '//'
		elif EXTEN.startswith( '.py' )  :
			INLINE_COMMENT = '#'
		elif EXTEN.startswith( '.m' )  :
			INLINE_COMMENT = '%'
			
		
	try:
		with open(filename, 'r') as file:
			if DEBUG : print ( '------------------------------------------------')
			if DEBUG : print ( filename )
			if DEBUG : print ( '------------------------------------------------')
			RAWCODE = [] ;
			counter = 0
			for line in file:
				line = line.strip()
				line  = line.replace("\t", " ")
				line  = line.replace("\n", "")
				line = re.sub( r" +", " ", line )
				line = re.sub( r" +[\{]", "{", line )
				line = re.sub( r" +[\(]", "(", line )
				if   VFC_FILE  :
					LINE = line
					LINE  = re.sub(fr'^\w+\(', '', LINE )
					LINE = re.sub( VFC_DELIM ,  INLINE_COMMENT , LINE )
					LINE= replace_rightmost( LINE , INLINE_COMMENT, "" ) if LINE .endswith( INLINE_COMMENT ) else LINE
					if  LINE =='' or re.match(fr"^{INLINE_COMMENT} *Export\s+Date:", LINE.strip()) or LINE.startswith(';') or LINE.strip() == ""  :
						pass
					else:
						counter = counter+1
						LINE = LINE.replace(" ", "")
						if DEBUG : print ( LINE )
						RAWCODE .append( LINE );
						
					
					
					
					
					
					
				else:
					if   re.match(fr"^{INLINE_COMMENT} *Export\s+Date:", line.strip())  or line.strip() == "" or line.startswith(';')   :
						pass
					else:
						line = line.strip()
						counter = counter+1
						line = line.replace(" ", "")
						if DEBUG : print  ( line)
						RAWCODE .append( line );
						
					
					
				
			
			
		RAWCODE = [re.sub(r"\) *{", ")\n{", line) for line in RAWCODE]
	except Exception as e:
		print(f"Error reading file: { filename } - { e }")
		return -1
		
	if    DEBUG  :
		if    VFC_FILE :
			with open( 'T2.txt' , 'w' ) as T2  :
				T2.write( "\n".join( RAWCODE ))
				
		else:
			with open( 'T1.txt' , 'w' ) as T1  :
				T1.write( "\n".join( RAWCODE ))
				
			
		
	if DEBUG : print ( "File: ", filename, " Size:" , len( RAWCODE  )  )
	rawCODE = [item.replace("\n", "") for item in RAWCODE ]
	rawCODE = [ re.sub(r" +", ""  , item) for item in rawCODE ]
	
	return   "".join( rawCODE )
def check_for_update( filename ):
	global Code
	global CodeFlow
	
	Code = scan_file( filename )
	CodeFlow = scan_file( filename+'.vfc' )
	
	print (  filename , len(Code ) , " ------> VFC:", len( CodeFlow ) )
	if   Code == CodeFlow   :
		print( 'SYNCHED')
	else:
		print( 'UNSYNCHED')
		
	
global  INLINE_COMMENT
if __name__ == "__main__":
	if len(sys.argv) < 2:
		print("Usage: python update.py <filename>")
	else:
		filename = sys.argv[1]
		check_for_update(filename)
		
	print( INLINE_COMMENT )
	
#  Export  Date: 07:15:48 PM - 13:Jun:2025.

