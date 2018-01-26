*.............................................................................
*
*   Program Name: PASSTRAN.PRG      Copyright: Automated Logic Systems                                  
*   Date Created: 06/02/90           Language: FoxPro                                              
*   Time Created: 11:59:18             Author: Brian Gardner                             
*   C:BRIEF/LIBRARY.SRC
*.............................................................................
* Purpose:	Encodes and decodes passwords
* 
* Syntax.:	password = passtran(<pass_str>,[<word_lngth>,<encrypt>])
* 
* Where..:	<pass_str>	 =	A string to be encoded or decoded, depending upon
* 							     	value of the <ENCRYPT> parameter					  
* 
* 				<word_lngth> = The length of the DECRYPTED password (ENCRYPTED is
* 									1 character longer).  This value does not need to
* 									be passed when DECRYPTING--the routine determines
*									the appropriate value.  See the "NOTES" section
* 									below for an explanation of the reason for this
* 									parameter when encrypting.
* 
* 				<encrypt>    = .T. to ENCRYPT the password
*       					   .F. to DECRYPT the password
* 
* Returns:	The ENCRYPTED or DECRYPTED version of the string passed in the 
* 				<PASS_STR> parameter, depending upon the value of the <ENCRYPT> 
* 				parameter.
* 
* Notes..:	Function converts the password to all UPPER case characters before
* 				encrypting it, and thus always returns all characters in UPPER
* 				case when decrypting.													  
* 				If the value to be encrypted is all blanks, or is a null string,
* 				it is returned as all blanks as well, rather than being actually
* 				encrypted.
*				When encrypting a string, the string to be encrypted is padded
* 				to the length specified in the <WORD_LNGTH> parameter.  The
* 				string returned is actually one character longer than the 
* 				<WORD_LNGTH>, because the "offset character" for decrypting the
* 				first actual character of the string is added to the front of
* 				the string.	  
*
* Usage...:	Get the user to enter a password, then call this routine to
* 				encrypt it.  The ENCRYPTED value is the one which should be
* 				stored to the DBF.  Then, whenever checking the user's password,
* 				have the user input the password, and compare the value they
* 				input to the DECRYPTED version of the password stored to check
* 				for validity.  That is:
* 
* 				*--Get user to input password			
* 				pword = SPACE(15)
* 				@x,y SAY "Enter password:" GET pword
* 
* 				*--Encrypt and store to DBF
* 				REPLACE user->password WITH passtran(pword,15,.T.)
* 
* 				...
* 
* 				*--Get user to input password			
* 				pword = SPACE(15)
* 				@x,y SAY "Enter password:" GET pword
* 
* 				*--Check against actual password
* 				IF pword==passtran(user->password)
* 					? 'Valid password.'
* 				ELSE
* 					? 'INVALID password!'
* 				ENDIF
* 
*.............................................................................

PARAMETERS pass_str,word_lngth,encrypt

IF encrypt										&& Procedure called to encrypt string
	IF !EMPTY(pass_str)

      wrk_string = PADR(UPPER(pass_str),word_lngth)
		STORE '' TO wrk_pass, wrk_char

      *---Generate a random ascii code for the offset character
		offset = MOD(RAND(-1)*10000,255)+1

		wrk_pass = chr(offset)				&& Store offset character as first
													&& character in the translated string

      FOR i=1 TO word_lngth				&& Parse characters from input string
			wrk_char = SUBSTR(wrk_string,i,1)											 

			*---The character is encrypted as follows:
			*  1: Take its ASCII value
			*  2: Add value of the offset
			*  3: MOD this new number by 255 to make sure it is a legal
			*     ASCII value
			*  4: Convert it back into an ASCII character

			wrk_char = CHR(MOD(ASC(wrk_char)+offset,255)+1)
			wrk_pass = wrk_pass+wrk_char

			*---The ASCII value of this encrypted character is then used as the
			*---offset for the next character.  In this way, the offset value
			*---changes for each character, making it harder to decrypt.
			offset = ASC(wrk_char)

      ENDFOR
   ELSE											&& If string to be encrypted is blank
      wrk_pass = SPACE(word_lngth+1)	&& return blanks as the encrypted value.
	ENDIF							  

ELSE												&& Decryption section...

	IF !EMPTY(pass_str)

		STORE '' TO wrk_pass, wrk_char
      wrk_string = SUBSTR(pass_str,2)
		word_lngth = LEN(pass_str)
      done = .F.

	   *---Determine offset value of first character
      offset = ASC(pass_str)

		*---Note first character is skipped because it is only the "offset
		*   character" for the first character of the actual string
		FOR i=2 TO word_lngth				
			wrk_char = SUBSTR(pass_str,i,1)

         IF ASC(wrk_char) <= offset
            wrk_pass = wrk_pass + CHR(255+ASC(wrk_char)-offset-1)
         ELSE
            wrk_pass = wrk_pass + CHR(ASC(wrk_char)-offset-1)
			ENDIF

			offset = ASC(wrk_char)

      ENDFOR
   ELSE
      wrk_pass = SPACE(word_lngth)
	ENDIF

ENDIF

RETURN wrk_pass

