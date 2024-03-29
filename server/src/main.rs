use actix_files as fs;
use actix_web::{middleware, App, HttpServer};

fn main() -> std::io::Result<()> {
    std::env::set_var("RUST_LOG", "actix_web=info");
    env_logger::init();

    HttpServer::new(|| {
        App::new()
            .wrap(middleware::Logger::default())
            .wrap(middleware::Compress::default())
            .service(
                fs::Files::new("/", "./../www/").index_file("index.html"),
            )
    })
        .bind("127.0.0.1:5555")?
        .run()
}