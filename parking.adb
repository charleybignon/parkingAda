with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Voiture; use Voiture;

package body Parking is

   --procedure qui permet de remplir le parking avec différentes voitures
   procedure remplir_parking(p: out Type_Parking) is
      marqueur:Character;
      tv:Type_Voiture;
   begin
      p.nb_voitures:=0;
      Put_Line("Voulez vous commencer la saisie, appuyez sur o ou O.");
      get(marqueur);
      while (marqueur='o' or marqueur='O') and p.nb_voitures<=NB_MAX loop
         p.nb_voitures:=p.nb_voitures+1;
         Put_Line("Entrez la nouvelle voiture");
         lire_voiture(tv);
         p.voitures(p.nb_voitures):=tv;
         Put_Line("Appuyez sur o ou O pour ajouter une voiture");
         get(marqueur);
      end loop;
   end remplir_parking;


   --
   procedure afficher_parking(p: in Type_Parking) is
      c:Integer:=1;
   begin
      while c<=p.nb_voitures loop
         afficher_voiture(p.voitures(c));
         c:=c+1;
      end loop;
   end afficher_parking;


   procedure trouver_voiture(v: in Type_Voiture;p: in Type_Parking; trouve: out Boolean; rang: out Integer) is
      c:Integer:=1;
   begin
      trouve:=False;
      while c<=p.nb_voitures and trouve=False loop
         trouve:=egalite(v,p.voitures(c));
         c:=c+1;
      end loop;
      if trouve then
         rang:=c-1;
      end if;
   end trouver_voiture;


   procedure ajouter_voiture(v: in Type_Voiture;p: in out Type_Parking) is
   begin
      if p.nb_voitures<NB_MAX then
         p.nb_voitures:=p.nb_voitures+1;
         p.voitures(p.nb_voitures):=v;
      else
         Put("Le parking est deja plein.");
      end if;
   end ajouter_voiture;


   procedure ajouter_voiture_pos(v: in Type_Voiture;pos:in Integer;p: in out Type_Parking) is
   c:Integer:=p.nb_voitures;
   begin
      if p.nb_voitures<NB_MAX then
         while c>=pos loop
            p.voitures(c+1):=p.voitures(c);
            c:=c-1;
         end loop;
         p.nb_voitures:=p.nb_voitures+1;
         p.voitures(pos):=v;
      else
         Put("Le parking est deja plein.");
      end if;
   end ajouter_voiture_pos;


   procedure supprimer_voiture(p: in out Type_Parking) is
   begin
      if p>=1 then
         p.nb_voitures:=p.nb_voitures-1;
      else
         Put("Il n'y a plus de voiture dans le parking");
   end supprimer_voiture;


   procedure supprimer_voiture_pos(p: in out Type_Parking; pos: Integer) is
      c:Integer:=pos;
   begin
      while c<p.nb_voitures loop
         p.voitures(c):=p.voitures(c+1);
         c:=c+1;
      end loop;
      p.nb_voitures:=p.nb_voitures-1;
   end supprimer_voiture_pos;


end Parking;
