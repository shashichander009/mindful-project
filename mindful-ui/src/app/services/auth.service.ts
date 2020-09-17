import { Injectable } from '@angular/core';
import { JwtHelperService } from '@auth0/angular-jwt';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private jwtHelper = new JwtHelperService();

  constructor() { }

  public isAuthenticated(): boolean {
    const token = localStorage.getItem('access_token') || undefined;
    if (this.jwtHelper.isTokenExpired(token)) {
      localStorage.removeItem('access_token');
      return false;
    }
    return true;
  }
}
