#define REG_ADDR ((volatile unsigned int *)0x40000000)
//volatile tells compiler it can change outside program control
int main(){
    *REG_ADDR = 0xDEADBEEF;
    unsigned int val = *REG_ADDR;
    return 0;
}