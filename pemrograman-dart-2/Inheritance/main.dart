import 'dart:io';

import 'armor_titan.dart';
import 'attack_titan.dart';
import 'beast_titan.dart';
import 'human.dart';

void main(List<String> args) {
  armor_titan art1 = new armor_titan();
  attack_titan att1 = new attack_titan();
  beast_titan bet1 = new beast_titan();
  human h1 = new human();

  art1.powerPoint = 70;
  att1.powerPoint = 40;
  bet1.powerPoint = 100;
  h1.powerPoint = 2;

  stdout.write("This is armor titan "+art1.terjang+" my power point is ");
  print(art1.powerPoint);
  stdout.write("This is attack titan "+att1.punch+" my power point is ");
  print(att1.powerPoint);
  stdout.write("This is beast titan "+bet1.lempar+" my power point is ");
  print(bet1.powerPoint);
  stdout.write("This is human "+h1.killAllTitan+" my power point is ");
  print(h1.powerPoint);
}