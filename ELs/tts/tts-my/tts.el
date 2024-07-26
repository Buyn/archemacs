;; * tts-set-name-by-id : 
(defun tts-set-name-by-id (id name)
  "tts set object name by finding object by GUID"
	(let (
			(lua-script (concat"
				x = getObjectFromGUID('" id "')
				x.setName('" name "')
				print ('set name = " name "')
				")))
			(tts-editor/execute-lua-code "-1" lua-script)))
;; (tts-set-name-by-id "5efda7" "New Name1")

;; * tts-set-disc-by-id : 
(defun tts-set-disc-by-id (id new-text)
  "tts set object discription by finding object by GUID"
	(let (
			(lua-script (concat"
				x = getObjectFromGUID('" id "')
				x.setDescription('" new-text "')
				print ('set diskription = " new-text "')
				")))
			(tts-editor/execute-lua-code "-1" lua-script)))
;; (tts-set-disc-by-id "5efda7" "New text")

;; * discprinter : 
(defun tts-set-discprinter-id (id)
  "set discprinter GUID"
	(setq tts-discprinter-id id))
(defun tts-discprinter-send-name (name)
  "send to discprinter name"
	(tts-set-name-by-id tts-discprinter-id name))
(defun tts-discprinter-send-text (text)
  "send to discprinter text for discription"
	(tts-set-disc-by-id tts-discprinter-id text))
;; (tts-set-discprinter-id "1")
;; (tts-discprinter-send-name "1")
;; (tts-discprinter-send-text "1")

;; * spawn-card : 
;; ** tts-spawn-card-from-urls : 
(defun tts-spawn-card-from-urls (front-url back-url)
  "tts spawn object card from 2 urls for front and back"
	(let (
;; 		type = 'DeckCustom',
;; type = 'CardCustom',
			(lua-script (concat"
spawnParams = {
		type = 'CardCustom',
		position          = {x=0, y=3, z=-5},
		rotation          = {x=0, y=90, z=0},
		scale             = {x=1, y=1, z=1},
		sound             = false,
		snap_to_grid      = true,
		}
my_dec = spawnObject(spawnParams)
params = {
		face		= '"front-url"' ,
		back		= '"back-url"' ,
		width		= 1,
		height	= 1,
		number	= 2
		}
my_dec.setCustomObject(params)
print ('all done')
				")))
;; print ('"front-url"')
;; print ('"back-url"')
		  (message lua-script)
			(tts-editor/execute-lua-code "-1" lua-script)))

;; ** tts-spawn-deck-from-urls : 
(defun tts-spawn-deck-from-urls (front-url back-url)
  "tts spawn object card of decs minimum 2 from 2 urls for front and back"
	(let (
			(lua-script (concat"
spawnParams = {
		type = 'DeckCustom',
		position          = {x=0, y=3, z=-5},
		rotation          = {x=0, y=90, z=0},
		scale             = {x=1, y=1, z=1},
		sound             = false,
		snap_to_grid      = true,
		}
my_dec = spawnObject(spawnParams)
params = {
		face		= '"front-url"' ,
		back		= '"back-url"' ,
		width		= 1,
		height	= 1,
		number	= 2
		}
my_dec.setCustomObject(params)
print ('all done')
				")))
;; print ('"front-url"')
;; print ('"back-url"')
		  (message lua-script)
			(tts-editor/execute-lua-code "-1" lua-script)))

;; ** tts-spawn-card-from-file : 
(defun tts-spawn-card-from-file (front-url back-url)
  "tts spawn object card from 2 urls for front and back"
	(let (
			(lua-script (concat"
spawnParams = {
		type = 'CardCustom',
		position          = {x=0, y=3, z=-5},
		rotation          = {x=0, y=90, z=0},
		scale             = {x=1, y=1, z=1},
		sound             = false,
		snap_to_grid      = true,
		}
my_dec = spawnObject(spawnParams)
params = {
		face		= '"front-url"' ,
		back		= '"back-url"' ,
		width		= 1,
		height	= 1,
		number	= 2
		}
my_dec.setCustomObject(params)
print ('all done')
				")))
;; print ('"front-url"')
;; print ('"back-url"')
		  (message lua-script)
			(tts-editor/execute-lua-code "-1" lua-script)))

;; ** mtg-card : 
(setq tts-mtg-card-back-face-url
"https://upload.wikimedia.org/wikipedia/en/a/aa/Magic_the_gathering-card_back.jpg")
(defun tts-spawn-mtg-card-from-url (front-url)
  "tts spawn object magic the geasering card from urel for front face"
	(tts-spawn-card-from-urls front-url tts-mtg-card-back-face-url))
;; (tts-spawn-card-from-urls "5efda7" "New text")
;; (tts-spawn-mtg-card-from-url "5efda7")

;; ** last-type-card : 
(defun tts-set-last-type-card-back-face-url (front-url)
	(setq tts-last-type-card-back-face-url
		front-url))

(tts-set-last-type-card-back-face-url
	"https://upload.wikimedia.org/wikipedia/en/a/aa/Magic_the_gathering-card_back.jpg")

(defun tts-spawn-last-type-card-from-url (front-url)
  "tts spawn object magic the geasering card from urel for front face"
	(tts-spawn-card-from-urls front-url tts-last-type-card-back-face-url))

;; (tts-set-last-type-card-back-face-url "https://upload.wikimedia.org/wikipedia/en/a/aa/Magic_the_gathering-card_back.jpg")
;; (tts-spawn-last-type-card-from-url "5efda7")

;; * spawn-tokens : 
;; ** tts-spawn-card-from-urls : 
(defun tts-spawn-token-from-urls (front-url thickness)
  "tts spawn object token from urls and thickness"
	(let (
			(lua-script (concat"
spawnParams = {
		type = 'Custom_Token',
		position          = {x=0, y=3, z=-5},
		rotation          = {x=0, y=90, z=0},
		scale             = {x=1, y=1, z=1},
		sound             = false,
		snap_to_grid      = true,
		}
my_dec = spawnObject(spawnParams)
params = {
		image		= '"front-url"' ,
		thickness = "thickness",
		width		= 1,
		height	= 1,
		}
my_dec.setCustomObject(params)
print ('spawn token')
				")))
;; print ('"front-url"')
;; print ('"back-url"')
		  (message lua-script)
			(tts-editor/execute-lua-code "-1" lua-script)))


;; * spawn-tokens : 
;; ** tts-spawn-figurine-from-urls : 
(defun tts-spawn-figurine-from-urls (front-url)
  "tts spawn object token from urls and thickness"
	(let (
			(lua-script (concat"
spawnParams = {
		type = 'Figurine_Custom',
		position          = {x=0, y=3, z=-5},
		rotation          = {x=0, y=90, z=0},
		scale             = {x=1, y=1, z=1},
		sound             = false,
		snap_to_grid      = true,
		}
my_dec = spawnObject(spawnParams)
params = {
		image		= '"front-url"' ,
		}
my_dec.setCustomObject(params)
print ('spawn Figurine')
				")))
;; print ('"front-url"')
;; print ('"back-url"')
		  (message lua-script)
			(tts-editor/execute-lua-code "-1" lua-script)))
