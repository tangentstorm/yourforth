default: clean yourforth

run: yourforth
	rlwrap ./yourforth

clean:
	rm -f ./yourforth

yourforth: yourforth.fas
	sed -e's/^/;PAGE/g' yourforth.fas > build.fas
	fasm build.fas yourforth
	chmod 755 yourforth
	brandelf -t Linux yourforth
	rm build.fas
