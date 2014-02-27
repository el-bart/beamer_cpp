#include <thread>
#include <iostream>

using std::cout;
using std::endl;
using std::thread;
using std::this_thread::yield;

int a,b;
int x,y;

bool done;
int  answer;
int askComputer(void);

void thread1(void);
void thread2(void);

struct ThreadSafeQueue
{
  int pop();
  void push(int);
};
void thread2(ThreadSafeQueue& q);
template<typename T>
void process(T const&);
