\version "2.16.2" % absolutely necessary!

\header {
  snippet-title = "Scaling stencils"
  snippet-author = "Janek Warchoł"
  snippet-description = \markup {
    Sometimes you want to scale (stretch or squeeze) an object -
    for example, make a flag shorter so that a tie can be placed below it,
    or make a lyric syllable narrower so that it won't distort the note
    spacing.  To do this, you have to override the stencil property of
    that object.
    Note that you can place such override in a "\layout" block and thus
    make, for example, all lyrics in your piece narrower by a certain factor.
  }
  % add comma-separated tags to make searching more effective:
  tags = "scale, stretch, squeeze, lyrics, flag, stencil"
  % is this snippet ready?  See meta/status-values.md
  status = "ready"
  
  %{
    TODO: 
    - make the music function accept music (to be used as tweak)
  %}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%
% here goes the snippet: %
%%%%%%%%%%%%%%%%%%%%%%%%%%

scaleStencil= 
#(define-music-function (parser locaion x y grob)
   (number? number? string?)
   #{
     \once \override Flag #'stencil =
     #(lambda (grob)
        (ly:stencil-scale (ly:flag::print grob) x y)) #})
