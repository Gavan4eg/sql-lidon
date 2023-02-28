SELECT ura.DatTim_,
       ura.clinic_,
       ura.fio_schedule_,
       ura.description_,
       ura.suma_,
       ura.of_cost_,
       gr.Uniq,
       gr.level,
       gr.post,
       gr.role,
       ura.rrr

FROM (select cast(date_format(s.period, '%Y.%m.%d %H') as datetime) AS DatTim_,
             kl.clinic                                              AS clinic_,
             em.fio_schedule                                        AS fio_schedule_,
             a.description                                          AS description_,

             s.price                                                AS suma_,
             s.amount_of_costs                                      AS of_cost_,
             s.Uniq                                                 AS rrr
      from _salecsv as s

               left join nomenclatures as n on n.ref_key = s.nomenklatura_key
               left join analytic_salaries as a on a.ref_key = n.analytics_key
               left join gs_clinics as kl on kl.ref_key = s.organization_key
               left join gs_employee as em on em.ref_key = s.employee
      where a.description is null) AS ura

         LEFT join _zpgraf_level as gr
                   on ura.clinic_ = gr.Klinic and ura.fio_schedule_ = gr.sotr AND ura.DatTim_ >= gr.DTStart and
                      ura.DatTim_ < gr.DTEnd and gr.DSm >= '2023-01-01' asdfsa

lexa

lexa end alex
from ukraine