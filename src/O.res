let flatMapFirst = fn =>
  Belt.Option.flatMap(_, value =>
    switch fn(value) {
    | None => None
    | Some(_) => Some(value)
    }
  )

type person = {name: string}

let x = Some({name: "Foo"})->Belt.Option.map(({name}) => name)
