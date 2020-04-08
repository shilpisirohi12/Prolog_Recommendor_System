/* Developed By FNU Shilpi 
	It is a music recommendation game based on the user's choice. 
    Instructions to start execution is -->  ?- start.     */

start :- guess(Song),
      write('The song that you will enjoy is: '),
      write(Song),
      nl,
      undo.

/* hypotheses to be tested */
guess(imagine)   :- imagine, !.
guess(hey_jude)     :- hey_jude, !.
guess(heroes)	:- heroes, !.
guess(mad_world)	:- mad_world, !.
guess(bitter_sweet_symphony)	:- bitter_sweet_symphony, !.
guess(crawling)	:- crawling,	!.
guess(ironic)	:-	ironic,	!.
guess(chickamauga)	:- chickamauga,	!.
guess(we_are)	:-	we_are,	!.
guess(no_sleep)   :- no_sleep, !.
guess(lifting_you_higher)	:- lifting_you_higher,	!.
guess(greenlights)	:-	greenlights, !.
guess(kuch_kuch_hota_hai)	:- kuch_kuch_hota_hai, !.
guess(gabru)	:- gabru, !.
guess(lagdi_lahoor_di)	:- lagdi_lahoor_di, !.
guess(ek_do_teen)	:- ek_do_teen, !.
guess(song_is_not_available_with_us).             /* no diagnosis */

/* song identification rules */
imagine :- alternative, 
           year70s, 
		   check(is_in_top_10_song_of_all_time),
           check(by_John_Lenon).
heroes	:- alternative,
           year70s,
		   check(is_the_most_iconic_song),
		   check(by_david_bowie).
mad_world	:- alternative,
				year80s,
				check(most_popular_song),
				check(by_Tears_For_Fears).
bitter_sweet_symphony	:- alternative,
							year90s,
							check(is_it_90s_anthem),
							check(by_The_Verve).
crawling	:- alternative,
			   year2000s,
			   check(is_grammy_winner),
			   check(by_Linkin_Park).
ironic	:- alternative,
			year90s,
			check(is_from_the_grammy_winning_album),
			check(is_winner_of_record_of_the_year),
			check(by_Alanis_Morissette).
chickamauga 	:- country,
				year90s,
				fusion,
				check(by_unclee_tupelo).
we_are	:- country,
		   latest,
		   check(sung_by_the_australian_singer),
		   check(by_Keith_urban).
hey_jude :- country,  
            year70s,
            check(has_tawny_color), 
            check(has_black_stripes).		
no_sleep :- dance, 
			latest,
           check(is_on_billboards_chart_for_2_weeks), 
           check(by_Martin_Garrix).
lifting_you_higher	:- dance,
					   latest,
					   check(is_ASOT900_anthem),
					   check(by_Armin_Van_Buuren).
greenlights	:- dance,
			   check(is_from_2020),
			   check(is_in_top_10_on_Billboards),
			   check(by_Krewella).
kuch_kuch_hota_hai :- bollywood,
			year90s,
			check(is_a_movie_song),
			check(is_of_Shahrukh_Khan_movie).
gabru	:-	bollywood,
			latest,
			check(is_from_Ayushman_movie).
lagdi_lahoor_di	:- fusion,
				   latest,
				   check(is_from_street_dance_3D).
ek_do_teen	:-	bollywood,
				year80s,
				check(is_a_Madhuri_Dixit_song).
				   

/* classification rules */
alternative    :- check(is_alternative_rock), !.
alternative    :- check(is_progressive_rock), !.
alternative    :- check(is_hard_rock).
country      :- check(is_alternative_country), !.
country      :- check(is_progressive), !.
country      :- check(is_country_rock).
dance :- check(is_club_music), !.
dance :- check(is_trance_house), !.
dance :- check(is_electronic).
bollywood	:- check(is_bollywood_pop), !.
bollywood	:- check(is_bollywood_dance), !.
bollywood	:- check(is_bollywood_classic).
fusion :- alternative, 
          country, !.
fusion :- dance, 
          bollywood.
year70s	:-	check(is_from_70s).		  
year80s	:-	check(is_from_80s).
year90s	:-  check(is_from_90s).
year2000s	:- check(is_from_2000s).  
latest	:- check(is_from_past_year).

		  

/* how to ask questions */
ask(Question) :-
    write('The song: '),
    write(Question),
    write('? '),
    read(Response),
    nl,
    ( (Response == yes ; Response == y)
      ->
       assert(yes(Question)) ;
       assert(no(Question)), fail).

:- dynamic yes/1,no/1.

/* How to check something */
check(S) :-
   (yes(S) 
    ->
    true ;
    (no(S)
     ->
     fail ;
     ask(S))).

/* undo all yes/no assertions */
undo :- retract(yes(_)),fail. 
undo :- retract(no(_)),fail.
undo.