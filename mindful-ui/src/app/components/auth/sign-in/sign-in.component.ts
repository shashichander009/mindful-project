import { Component, OnInit } from '@angular/core';
import { FormBuilder, Validators } from '@angular/forms';
import { UserService } from 'src/app/services/user.service';

@Component({
  selector: 'app-sign-in',
  templateUrl: './sign-in.component.html',
  styleUrls: ['./sign-in.component.scss']
})
export class SignInComponent implements OnInit {

  signInForm = this.formBuilder.group({
    email: ['', [Validators.required, Validators.email]],
    password: ['', [Validators.required]],
  });

  constructor(private formBuilder: FormBuilder, private userService: UserService) { }

  ngOnInit(): void {
  }


  get email() { return this.signInForm.get('email'); }
  get password() { return this.signInForm.get('password'); }

  onFormSubmit() {
    if (this.signInForm.valid) {
      this.userService.login(JSON.stringify({ username: this.email?.value, password: this.password?.value }));
    }
  }

}
