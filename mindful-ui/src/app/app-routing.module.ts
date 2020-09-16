import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AuthMainComponent } from './components/auth/auth-main/auth-main.component';
import { HomeComponent } from './components/home/home.component';
import { AuthGuardService } from './services/auth-guard.service';

const routes: Routes = [
  { path: '', component: HomeComponent, canActivate: [AuthGuardService] },
  { path: 'login', component: AuthMainComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
