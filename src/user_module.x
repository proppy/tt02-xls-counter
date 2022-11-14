proc Counter {
  output_producer: chan<u8> out;

  init {
    u8:0
  }
  
  config(output_producer: chan<u8> out) {
    (output_producer,)
  }

  next(tok: token, state: u8) {
    let tok = send(tok, output_producer, state);
    state+u8:1
  }
}

#[test_proc]
proc Tester {
  counter_c: chan<u8> in;
  terminator: chan<bool> out;

  init { () }

  config(terminator: chan<bool> out) {
    let (counter_p, counter_c) = chan<u8>;
    spawn Counter(counter_p);
    (counter_c, terminator)
  }

  next(tok: token, state: ()) {
    let (tok, count) = recv(tok, counter_c);
    let (tok, count) = recv(tok, counter_c);

    let tok = send(tok, terminator, true);
    ()
  }
}
