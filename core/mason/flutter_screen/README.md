# flutter_screen

Use inside the directory containing your screens, e.g. modules/presentation/screens/

mason make flutter_screen --name test --appBar true --bloc true

Options:\
--name (string) -> will be put in imports, class names etc., e.g. 'userWallet' will result in UserWalletScreen class being created\
--bloc (boolean) -> will generate bloc, events, state\
--appBar (boolean) -> will generate an appBar for your screen\
