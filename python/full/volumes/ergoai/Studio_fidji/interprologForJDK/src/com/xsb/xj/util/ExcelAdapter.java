package com.xsb.xj.util;
// grabbed from http://www.javaworld.com/javatips/jw-javatip77.html?083099txt
// modified for XJ
import java.awt.Component;
import java.awt.Toolkit;
import java.awt.datatransfer.Clipboard;
import java.awt.datatransfer.StringSelection;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;

import javax.swing.JComponent;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.KeyStroke;
import javax.swing.table.TableCellRenderer;
import javax.swing.text.JTextComponent;

/**
 * ExcelAdapter enables Copy-Paste Clipboard functionality on JTables.
 * The clipboard data format used by the adapter is compatible with
 * the clipboard format used by Excel. This provides for clipboard
 * interoperability between enabled JTables and Excel.
 * http://www.javaworld.com/javatips/jw-javatip77.html?083099txt
 */
public class ExcelAdapter implements ActionListener
   {
   private Clipboard system;
   private StringSelection stsel;
   private JTable jTable1 ;

   /**
    * The Excel Adapter is constructed with a
    * JTable on which it enables Copy-Paste and acts
    * as a Clipboard listener.
    */

	public ExcelAdapter(JTable myJTable){
		jTable1 = myJTable;
		KeyStroke copy = KeyStroke.getKeyStroke(KeyEvent.VK_C,Toolkit.getDefaultToolkit().getMenuShortcutKeyMask() /* Mac too!*/,false);
	
	      // Identifying the copy KeyStroke user can modify this
	      // to copy on some other Key combination.
		KeyStroke paste = KeyStroke.getKeyStroke(KeyEvent.VK_V,Toolkit.getDefaultToolkit().getMenuShortcutKeyMask(),false);
	
	      // Identifying the Paste KeyStroke user can modify this
	      //to copy on some other Key combination.
	
		jTable1.registerKeyboardAction(this,"Copy",copy,JComponent.WHEN_FOCUSED);
		jTable1.registerKeyboardAction(this,"Paste",paste,JComponent.WHEN_FOCUSED);
	    system = Toolkit.getDefaultToolkit().getSystemClipboard();
	}

   /**
    * Public Accessor methods for the Table on which this adapter acts.
    */
	public JTable getJTable() {return jTable1;}

	public void setJTable(JTable jTable1) {this.jTable1=jTable1;}

   /**
    * This method is activated on the Keystrokes we are listening to
    * in this implementation. Here it listens for Copy and Paste ActionCommands.
    * Selections comprising non-adjacent cells result in invalid selection and

    * then copy action cannot be performed.
    * Paste is done by aligning the upper left corner of the selection with the
    * 1st element in the current selection of the JTable.
    */
	public void actionPerformed(ActionEvent e){
		if (e.getActionCommand().compareTo("Copy")==0){
			StringBuffer sbf=new StringBuffer();
	
            int numcols;
            int[] colsselected; 
	        int numrows=jTable1.getSelectedRowCount();
	        int[] rowsselected=jTable1.getSelectedRows();
                 
            if(jTable1.getCellSelectionEnabled()){
				 // the user can select separate cells in the row
				 numcols=jTable1.getSelectedColumnCount();
				 colsselected=jTable1.getSelectedColumns();
            } else {
				 // the user can only select the whole row (not separate cells) 
				 // jTable1.getSelectedColumns() somehow does not give correct values then
				 numcols=jTable1.getColumnCount();
				 colsselected = new int[numcols];
				 for(int i=0; i < numcols; i++){
					 colsselected[i] = i;
				 }
            }
	
	         // Check to ensure we have selected only a contiguous block of
	         // cells
	         if (!((numrows-1==rowsselected[rowsselected.length-1]-rowsselected[0] &&
	                numrows==rowsselected.length) &&
		(numcols-1==colsselected[colsselected.length-1]-colsselected[0] &&
	                numcols==colsselected.length))){
	            JOptionPane.showMessageDialog(null, "Invalid Copy Selection",
	                                          "Invalid Copy Selection",
	                                          JOptionPane.ERROR_MESSAGE);
	            return;
	         }
			 
			for(int k=0; k < numcols; k++) {
				sbf.append(jTable1.getColumnName(k));
				if(k<numcols -1) 
					sbf.append("\t");
			}
			sbf.append("\n");
			for (int i=0;i<numrows;i++) {
	            for (int j=0;j<numcols;j++){
					/*sbf.append(jTable1.getValueAt(rowsselected[i],colsselected[j]));
	               	if (j<numcols-1) sbf.append("\t");
	            	}*/
					TableCellRenderer renderer = jTable1.getCellRenderer(rowsselected[i],colsselected[j]);
                    Component cellComponent = 
                        renderer.getTableCellRendererComponent(jTable1,jTable1.getValueAt(rowsselected[i],colsselected[j]),
                                                                      true,true,rowsselected[i],colsselected[j]);
                    if(cellComponent instanceof JTextComponent){
                         sbf.append(((JTextComponent)cellComponent).getText());
                    } else if(cellComponent instanceof JLabel){
                         sbf.append(((JLabel)cellComponent).getText());
                    } else {
                        sbf.append(cellComponent); // for the rest, they better implement the toString() method
                    }
	               	if (j<numcols-1) sbf.append("\t");
	            }
	            sbf.append("\n");
			}
	        stsel = new StringSelection(sbf.toString());
	        system = Toolkit.getDefaultToolkit().getSystemClipboard();
	        system.setContents(stsel,stsel);
		}  else if (e.getActionCommand().compareTo("Paste")==0){
	          JOptionPane.showMessageDialog(null, "Paste not supported",
	                                          "Paste not supported",
	                                          JOptionPane.ERROR_MESSAGE);
			  return;
			  /*
	          System.out.println("Trying to Paste");
	          int startRow=(jTable1.getSelectedRows())[0];
	          int startCol=(jTable1.getSelectedColumns())[0];
	          try
	          {
	             String trstring= (String)(system.getContents(this).getTransferData(DataFlavor.stringFlavor));
	
	             System.out.println("String is:"+trstring);
	             StringTokenizer st1=new StringTokenizer(trstring,"\n");
	             for(int i=0;st1.hasMoreTokens();i++)
	             {
	                rowstring=st1.nextToken();
	                StringTokenizer st2=new StringTokenizer(rowstring,"\t");
	
	                for(int j=0;st2.hasMoreTokens();j++)
	                {
	                   value=(String)st2.nextToken();
	                   if (startRow+i< jTable1.getRowCount() &&
	                       startCol+j< jTable1.getColumnCount())
	                      jTable1.setValueAt(value,startRow+i,startCol+j);
	                   System.out.println("Putting "+ value+"at row="+startRow+i+"column="+startCol+j);
	               }
	            }
	         }
	         catch(Exception ex){ex.printStackTrace();}
			*/
		}
	}
}
