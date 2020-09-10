import { Component, OnInit } from '@angular/core';
import { FormBuilder, Validators, FormGroup } from '@angular/forms';


@Component({
  selector: 'app-sign-up',
  templateUrl: './sign-up.component.html',
  styleUrls: ['./sign-up.component.scss']
})
export class SignUpComponent implements OnInit {
  currentPage = 1;

  userPicture: string = ''

  signUpForm = this.formBuilder.group({
    email: ['', [Validators.required, Validators.email]],
    username: ['', [Validators.required, Validators.minLength(2)]],
    dateOfBirth: ['', Validators.required],
    passwords: this.formBuilder.group({
      password: ['', [Validators.required, Validators.minLength(4)]],
      confirmPassword: ['', [Validators.required]]
    }, { validator: this.matchPassword }),
    profilePicture: [''],
    name: [''],
    bio: [''],
  })

  constructor(private formBuilder: FormBuilder) { }

  ngOnInit(): void {
    this.setDefaultPicture()
  }

  get email() { return this.signUpForm.get('email') }
  get username() { return this.signUpForm.get('username') }
  get password() { return this.signUpForm.get('passwords.password') }
  get dateOfBirth() { return this.signUpForm.get('dateOfBirth') }
  get name() { return this.signUpForm.get('name') }
  get bio() { return this.signUpForm.get('bio') }
  get profilePicture() { return this.userPicture }


  matchPassword(f: FormGroup) {
    let password = f.get('password')?.value
    let confirmPassword = f.get('confirmPassword')?.value
    return password === confirmPassword ? null : { notSame: true }
  }

  onFormSubmit() {
    if (this.signUpForm.invalid) {
      this.changePage(1)
    }
    const userDetails = {
      username: this.username?.value,
      email: this.email?.value,
      password: this.password?.value,
      dateOfBirth: this.dateOfBirth?.value,
      name: this.name?.value,
      bio: this.bio?.value,
      profilePicture: this.profilePicture,
    }
    console.log(JSON.stringify(userDetails))
  }

  changePage(page: number) {
    this.currentPage = page
  }

  setDefaultPicture() {
    this.userPicture = 'https://www.pinkvilla.com/files/styles/contentpreview/public/iron-man-star-robert-downey-jr-best-film.jpg'
  }

  showPreview(event: any) {
    if (event.target.files && event.target.files[0]) {
      const reader = new FileReader();
      reader.readAsDataURL(event.target.files[0]);
      reader.onload = (e: any) => this.userPicture = e.target.result;
    } else {
      this.setDefaultPicture()
    }
  }

}
