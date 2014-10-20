run: clean yourforth
	./yourforth

clean:
	rm ./yourforth

yourforth: yourforth.fas
	sed -i.bak -e's/^/;PAGE/g' yourforth.fas
	fasm yourforth.fas
	sed -i.bak -e's/^;PAGE//g' yourforth.fas
	chmod 755 yourforth
	brandelf -t Linux yourforth
