import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class UtilsService {

  constructor() { }

  public isValidEmail(inputText: string): boolean {
    return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(inputText);
  }
}
