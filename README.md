# Discount Doctors
By [Nicole Glasgow](http://blog.nicoleglasgow.org/) and [Stephanie Datu](http://blog.stephdatu.com)

## A Reverse Auction Application
**Discount Doctors** provides access to quality medical providers at an affordable price that you decide! Our network of local doctors allows you to find the best services at the best prices. If you're insurance won't cover something, or you don't have it at all, we're here to help!

## Installation

GitHub fork or clone our repo.

Run the following command to install and run:

```console
bundle install
rake db:setup
rake db:seed
rake
```

## Usage

The site allows you to login either as a Patient or a Doctor. Since this is still in development, we currently have seed data that you can use to test the functionality. You can log in through a patient, make a Service Request which will only be viewable by the requester and doctors. If you test it and log in as another patient, you will not see anyone else's requests. Likewise, if you login as a doctor, you will see all available service requests. As a doctor, you have the capability to bid on requests, and view competitor's requests.

```erb
doctor1 = Doctor.create(email: "doctor1@ra.com", password: "password")
doctor1.confirm!
doctor2 = Doctor.create(email: "doctor2@ra.com", password: "password")
doctor2.confirm!

patient1 = Patient.create(email: "patient1@ra.com", password: "password")
patient1.confirm!
patient2 = Patient.create(email: "patient2@ra.com", password: "password")
patient2.confirm!
```

### Known Issues

**This is still in development mode**

If you discover any bugs, feel free to create an issue on GitHub fork and
send us a pull request.

## Authors

* [Nicole Glasgow](http://blog.nicoleglasgow.org/)
* [Stephanie Datu](http://blog.stephdatu.com)
