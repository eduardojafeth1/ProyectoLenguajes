#include <iostream>
using namespace std;

#pragma region Prototipos
bool esPrimo(int );
void fibonacci(int);
bool existeEnConjunto(int, int[],int);
int mcd(int, int);
#pragma endregion


int main() {
    int opcion;
    cout << "1. Es Primo" << endl;
    cout << "2. Fibonacci" << endl;
    cout << "3. Existe en Conjunto" << endl;
    cout << "4. MCD" << endl;
    cout << "Ingrese una opcion: ";
    cin >> opcion;

    switch (opcion) {
        case 1: {
            int num;
            cout << "Ingrese un numero: ";
            cin >> num;
            if (esPrimo(num)) {
                cout << "El numero es primo" << endl;
            } else {
                cout << "El numero no es primo" << endl;
            }
            break;
        }
        case 2: {
            int n;
            cout << "Ingrese la cantidad de numeros de fibonacci: ";
            cin >> n;
            fibonacci(n);
            break;
        }
        case 3: {
            int elemento, conjunto[] = {1, 2, 3, 4, 5}, tamanio = 5;
            cout << "Ingrese un elemento: ";
            cin >> elemento;
            if (existeEnConjunto(elemento, conjunto, tamanio)) {
                cout << "El elemento existe en el conjunto" << endl;
            } else {
                cout << "El elemento no existe en el conjunto" << endl;
            }
            break;
        }
        case 4: {
            int x, y;
            cout << "Ingrese el primer numero: ";
            cin >> x;
            cout << "Ingrese el segundo numero: ";
            cin >> y;
            cout << "El MCD es: " << mcd(x, y) << endl;
            break;
        }
        default:
            cout << "Opcion invalida" << endl;
    }

    return 0;
}

#pragma region Es Primo
bool esPrimo(int nPum) {
    if (nPum <= 1) {
        return false;
    }
    for (int i = 2; i < nPum; i++) {
        if (nPum % i == 0) {
            return false;
        }
    }
    return true;
}

#pragma endregion


#pragma region N numeros de fibonacci
void fibonacci(int pNum){
    int a = 0, b = 1;
    if (pNum<1){
        cout << "No hay numeros de fibonacci";
    }
    else if (pNum>=1){
        cout << a << endl;
        cout << b<< endl;
        for (int i=0;i<pNum-2;i++){
            b+=a;
            a=b-a;
            cout <<  b << endl;
        }

    }
    
}

#pragma endregion

#pragma region 
bool existeEnConjunto(int pElemento, int pConjunto[], int pTamanio) {
    for (int i = 0; i < pTamanio; i++) {
        if (pConjunto[i] == pElemento) {
            return true;
        }
    }
    return false;
}
#pragma endregion

#pragma region Minimo Comun Multiplo
int mcd(int x, int y) {

    if (y == 0 or x==0 ) {
        return x;  
    }
    return mcd(y, x % y);  
}
#pragma endregion