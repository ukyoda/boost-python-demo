#ifndef KTYM_PYC_KLASS_H
#define KTYM_PYC_KLASS_H

class myclass {
public:
  myclass();
  ~myclass();
  int getVal() const;
protected:
  int val = 10;
};

#endif
