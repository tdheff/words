You are to build an API server that can respond to the following http endpoints. You may use any language or framework that you want, as well as any outside resources (Google, libraries, etc.). We do not expect you to be able to completely finish this question, just make progress. Several of these endpoints can be extremely complex, but given the time constraints we expect you to make sensible decisions and document them (noting possible pitfalls) and not spend an inordinate amount of time going down rabbit holes. Additionally, we'd rather see 3 working endpoints than 6 buggy ones.

These are ordered by expected difficulty, but do not feel you need to do them in any particular order.

Endpoints (and http paths):
	- Average word length (/words/avg_len)
		 Tokenization doesn't need to be perfect, but document your choices
	- Most common word (/words/most_com)
		 Break ties alphabetically
	- Find the word(s) with the median frequency in the corpus (/words/median)
	- Average sentence length (/sentences/avg_len)
	- Find all phone numbers (/phones)
		 Document the cases that you handle and any known cases that you do not

All endpoints should be http POSTs that consume a JSON body with a single tag "text", and produce a JSON result of your defining.

Example POST body: { "text" : "My cat is gray. It doesn't have feathers." }
