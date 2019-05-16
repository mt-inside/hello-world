extern crate gotham;
extern crate reqwest;

use gotham::state::State;

pub fn greet_handler(state: State) -> (State, String) {
    let name = reqwest::get("http://namer:8080").unwrap().text().unwrap();
    let reply = format!("Hello {}!", name);

    (state, reply)
}

pub fn main() {
    let addr = "0.0.0.0:8080";
    println!("Listening for requests at http://{}", addr);
    gotham::start(addr, || Ok(greet_handler))
}
