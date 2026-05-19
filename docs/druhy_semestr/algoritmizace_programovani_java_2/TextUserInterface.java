

import java.util.InputMismatchException;
import java.util.Scanner;

/**
 *
 * @author 
 */
public class TextUserInterface {

    private static final Scanner sc = new Scanner(System.in);

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        boolean konecProgramu = false;
        while (!konecProgramu) {
            vypisMenu();
            int volba = nactiVolbu();
            konecProgramu = obsluzVolbu(volba);
        }
    }

    private static void vypisMenu() {
        System.out.println("");
        System.out.println("Title");
        System.out.println("1. ");
        System.out.println("2. ");
        System.out.println("3. ");
        System.out.println("4. ");
        System.out.println("5. ");
        // .. dalsi volby dle potreby
        System.out.println("0. Konec");
    }

    private static int nactiVolbu() {
        System.out.print("Zadej cislo volby: ");
        int v;
        try {
            v = sc.nextInt();
        } catch (InputMismatchException ex) {
            v = -1;
        } finally {
            sc.nextLine();
        }
        return v;
    }

    private static boolean obsluzVolbu(int volba) {
        switch (volba) {
            case 0:
                return true;
            case 1: // .. volani metody pro obsluhu volby 1
                break;
            case 2: // .. volani metody pro obsluhu volby 2
                break;
            case 3: // .. volani metody pro obsluhu volby 3
                break;
            case 4: // .. volani metody pro obsluhu volby 4
                break;
            case 5: // .. volani metody pro obsluhu volby 5
                break;
            // ...
            default:
                System.out.println("Neplatna volba");
        };
        return false;
    }

    // metody pro obsluhu jednotlivych voleb
    
    // dalsi metody dle potreby
}
