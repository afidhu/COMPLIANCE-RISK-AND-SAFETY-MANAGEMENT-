import { format } from 'date-fns';

export const dateFormater= (dateString:any)=>{
      const formattedDate = format(new Date(dateString), 'yyyy-MM-dd');
      return formattedDate;
}
