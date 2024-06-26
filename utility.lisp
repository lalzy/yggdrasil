(in-package :yggdrasil)

(defun length-1 (sequence)
  "Returns one less than the length of the sequence."
  (1- (length sequence)))

(defun ends-in-symbol (string symbol)
  (string-equal symbol (subseq string (length-1 string))))

(defun is-valid-symbol (argument symbol)
  (ends-in-symbol-p (if (symbolp argument)
                        (string argument)
                        argument)
                    symbol))

;;
(defun get-aspectratio ()
  (/ *height* *width*))

;; Rename to dovector
;; TOdo mirror dolist's functionalities
(defmacro doarray ((name vector) &body body)
  `(let (,name)
     (loop :for i :below (array-total-size ,vector)
	   :do (setf ,name (aref ,vector i))
	   ,@body)))

;; Refactor to accept any sequence
(defun all=to-value (value &rest numbers)
  (dolist (number numbers)
    (when (/= number value)
      (return-from all=to-value nil)))
  t)

(defun any=to-value (value &rest numbers)
  (dolist (number numbers)
    (when (= number value)
      (return-from any=to-value t))))


(defun circle-to-rect (circle &key as-vector)
  (let ((x (- (yg:x circle) (yg:r circle)))
	(y (- (yg:y circle) (yg:r circle)))
	(size (1+ (* (yg:r circle) 2))))
    (if as-vector
	(vector x y size size)
	(make-instance 'rectangle :x x :y y :w size :h size))))

(defun rect-to-circle (rectangle &key as-vector)
  (let ((x (+ (yg:x rectangle) (round (yg:w rectangle) 2)))
	(y (- (yg:y circle) (round (yg:h rectangle) 2)))
	(size (if (> (yg:w rectangle) (yg:h rectangle))
                       (yg:w rectangle)
                       (yg:h rectangle))))
    (if as-vector
	(vector x y size circle)
	(make-instance 'circle :x x :y y :r size))))

;; Rename to something shorter
(defmacro toggle-variable (variable)
  "Switches the boolean state of passed variable (destructive macro)"
  `(setf ,variable (not ,variable)))
