extern crate gotham;
extern crate reqwest;

use gotham::state::State;

pub fn greet_handler(state: State) -> (State, String) {
    let greeting = reqwest::get("http://translator.default.global:8080")
        .unwrap()
        .text()
        .unwrap();
    let name = reqwest::get("http://namer.default.global:8080")
        .unwrap()
        .text()
        .unwrap();
    let reply = format!("{} {}!\n", greeting, name);

    (state, reply)
}

pub fn main() {
    let addr = "0.0.0.0:8080";
    println!("Listening for requests at http://{}", addr);
    gotham::start(addr, || Ok(greet_handler))
}
