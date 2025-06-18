/* 
 * Title:           13-numberguess - C Example
 *
 * Description:     A number guessing game where the user guesses a number between 1 and 10.
 *                  The user has to guess the number and is given feedback on whether their guess
 *                  is too high or too low. The game keeps track of the number of attempts and
 *                  allows the user to play again. The game also uses the time taken to press enter
 *                  as a seed for the random number generator, ensuring a different number each time.
 *
 * Author:          Andy McCall, mailme@andymccall.co.uk
 * 
 * Created:		     2025-06-04 @ 15:27
 * Last Updated:	  2025-06-04 @ 15:27
 * 
 * Modinfo:
 * 
 */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {

   /* Initialize random number generator */
   printf("\n"); 
   printf("Welcome Number Guessing Game!\n");
   printf("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-\n");
   printf("\n");   

   char play_again;
   int best=0;

   do {

      /* Measure the time between the prompt and the user pressing enter */
      clock_t start_time = clock();
      printf("Generating a new number!\n\n");
      printf("Press enter to start...\n");
      getchar(); // Wait for the user to press enter again
      clock_t end_time = clock();

      /* Calculate the elapsed time and use it as a seed */
      clock_t elapsed_time = end_time - start_time;
      srand((unsigned int)elapsed_time);
      int number = rand() % 10 + 1;
      int guess;
      int attempts = 1;

      /* Prompt the user to guess a number */
      printf("Guess a number between 1 and 10: ");
      
      /* Check the number and give feedback */
      do {

         scanf("%d", &guess);
         printf("\n");

         if (guess != number) {

            if (guess < number) {
               printf("Too low!\n");
            } else {
               printf("Too high!\n");
            }

            printf("Guess again: ");

            attempts++;
      }

      } while (guess != number);

      if (attempts < best || best == 0) {
         best = attempts;
      }

      /* Congratulate the user */
      printf("\nCongratulations!\n\n");
      printf("You guessed the number in %d tries!\n\n", attempts);

      /* Ask the user if they want to play again */
      printf("Do you want to play again? (y/n): ");
      scanf(" %c", &play_again); // Note the space before %c to consume any leftover newline character
      printf("\n\n");   

    } while (play_again == 'y' || play_again == 'Y');

   printf("Thanks for playing, your lowest number of guesses was %d!\n\n", best);
   getchar(); // Wait for the user to press enter

   return 0;
}
