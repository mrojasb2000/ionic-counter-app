import { Component } from '@angular/core';
import {
  IonHeader,
  IonContent,
  IonButton,
  IonFooter
} from '@ionic/angular/standalone';

@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
  imports: [
    IonHeader,
    IonFooter,
    IonContent,
    IonButton
  ],
})
export class HomePage {
  constructor() {}
}
