import { Component, signal } from '@angular/core';
import { Snakey } from './snakey';

@Component({
  selector: 'app-root',
  imports: [Snakey],
  templateUrl: './app.html',
  styleUrl: './app.css'
})
export class App {
  protected readonly title = signal('snakey-ui');
}
