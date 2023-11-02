;;;; package.lisp

(defpackage #:yggdrasil
  (:use #:cl #:iterate)
  (:nicknames #:yg)
  (:export
   #:start

   :*width*
   :*height*
   
   :rectangle
   :circle

   #:get-aspectratio
   
   ;;; Controlls
   #:mouse-moved-p
   #:get-mouse-position
   #:is-mouse-dir
   #:is-mouse-key
   #:is-mouse-keys ; Checks if any of the passed mouse-buttons are pressed
   #:is-key
   #:is-keys
   #:is-all-keys
   

   ;;; Collision \ Positions
   #:collision-check ; Will have proper check between distances
   #:edge-collision-check
   #:x
   #:y
   #:w
   #:h
   #:r

   ;;; Alignment
   #:center-within-window
   #:place-within-window
   
   ;;; Drawing
   #:get-color
   #:set-color
   #:draw-line
   #:draw-rectangle
   #:draw-circle
   #:load-image
   #:draw-image
   #:find-image


   ;;; Context Menu
   #:init-context-menu
   #:menu-change-font
   #:menu-create
   #:menu-select-item
   #:menu-draw
   
   ;;; Text
   #:Make-font
   #:draw-string
   #:draw-string-*
   ))
