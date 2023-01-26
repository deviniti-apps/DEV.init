# flutter_remote_usecase

Use inside your main app directory (the one that contains the "modules" directory).

mason make flutter_remote_usecase --acceptsParam true --usecaseName get-doctor --returnsDomainModel true --domainModelName doctor --apiName doctor-backend

Options:\
--usecaseName (string) -> prefix for the usecase/remote actions to be created? (verb, e.g. getUser)?
--acceptsParam (boolean) -> whether this usecase/remote actions receive a parameter (like GetUserRequest)?
--returnsDomainModel (boolean) -> whether this usecase/remote actions return a domain model (true) or void (false)?
--domainModelName (string) -> may be skipped when returnsDomainModel is false. Domain model name. (noun, e.g. User)
--apiName (string) -> name of the underlying remote API class? (noun, e.g. User for a class named UserRestApi)\
