package org.openbiz.process;

import java.math.BigDecimal;

public class LAR_SaldoBalance 
{
	private BigDecimal debe=new BigDecimal(0);
	private BigDecimal haber= new BigDecimal(0);

	public BigDecimal getDebe() {
		return debe;
	}

	public void setDebe(BigDecimal debe) {
		if (debe==null)
			debe=new BigDecimal(0);
		this.debe = debe;
	}

	public BigDecimal getHaber() {
		return haber;
	}

	public void setHaber(BigDecimal haber) {
		if (haber==null)
			haber=new BigDecimal(0);
		this.haber = haber;
	}
	
	public void addSaldo(LAR_SaldoBalance saldoC)
	{
		setDebe(this.debe.add(saldoC.getDebe()));
		setHaber(this.haber.add(saldoC.getHaber()));
	}
	public void addDebe(BigDecimal debe) {
		if (debe!=null)
			this.debe = this.debe.add(debe);
	}
	public void addHaber(BigDecimal haber) {
		if (haber!=null)
		this.haber = this.haber.add(haber);
	}
	
	@Override
	public String toString() {
		return "Debe\t\tHaber\n"+getDebe()+"\t"+getHaber();
	}
}

