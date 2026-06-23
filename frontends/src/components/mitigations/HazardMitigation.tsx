
import axios from 'axios';
import React, { useEffect, useState } from 'react'
import BaseUrl from '../utils/api_provider/ApiProviders';

export default function HazardMitigation() {

  const[mitigation,setMitigation]=useState([])

      const fetchMitigation = async () => {
        try {
            const response = await axios.get(`${BaseUrl}/risks/get-by-hazard/${hadazardId}`)

            setMitigation(response.data);
            
        } catch (error) {
            console.log(error);
        }
    };

    useEffect(() => {
        fetchMitigation();
    }, []);

  return (
    <div>
      
    </div>
  )
}
