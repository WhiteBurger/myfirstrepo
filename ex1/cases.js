const fac = (n) =>{
    return (n != 1) ? n * fac(n - 1) : 1;
};
  



const permutation = (n,r)=>{
    return fac(n)/fac(n-r);
};

const combination = (n,r)=>{
    return fac(n)/(fac(n-r)*fac(r));
};


const multiPermutation = (n,r)=>{
    return (n**r);
};

const multiCombination = (n,r)=>{
    return combination(n+r-1,r)
};


module.exports = {
    permutation,   
    combination,
    multiPermutation,
    multiCombination,
};