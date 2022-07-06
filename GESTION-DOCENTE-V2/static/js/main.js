const BtnDisable = document.querySelectorAll('.btn-disable')

if(BtnDisable) {
    const btnArray = Array.from(BtnDisable);
    btnArray.forEach((btn) => {
      btn.addEventListener('click', (e) => {
        if(!confirm('¿ Estas seguro ?')){
          e.preventDefault();
        }
      });
    })
  }

