with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Voiture; use Voiture;

package Parking is

   NB_MAX:constant Integer:=500;
   type TAB_Voitures is array(1..NB_MAX) of Type_Voiture;

   type Type_Parking is record
      voitures:TAB_Voitures;
      nb_voitures:Integer;
   end record;

   procedure remplir_parking(p: out Type_Parking);
   procedure afficher_parking(p: in Type_Parking);
   procedure trouver_voiture(v: in Type_Voiture;p: in Type_Parking; trouve: out Boolean; rang: out Integer);
   procedure ajouter_voiture(v: in Type_Voiture;p: in out Type_Parking);
   procedure ajouter_voiture_pos(v: in Type_Voiture;pos:in Integer;p: in out Type_Parking);
   procedure supprimer_voiture(p: in out Type_Parking);
   procedure supprimer_voiture_pos(p: in out Type_Parking; pos: Integer);

   end Parking;
