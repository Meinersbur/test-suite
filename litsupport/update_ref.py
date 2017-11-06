import lit.Test
import logging
import os
import shlex
import shutil


def _getStats(context):
    outfile = context.outfile

    refoutfile = context.refout
    if refoutfile is None and len(context.parsed_verifyscript) == 1:
      refoutfile = shlex.split(context.parsed_verifyscript[0])[-1]
 
    if refoutfile is None:
       logging.warning("No reference output path")
       return {}
    
    if not os.path.isfile(outfile):
       logging.error("output file does not exist")
       return {}

    if os.path.isfile(refoutfile):
       logging.warning("Overwriting reference output: {refoutfile}".format(refoutfile=refoutfile))
    else:
       logging.info("Writing reference output: {refoutfile}".format(refoutfile=refoutfile))
     
    shutil.copyfile(outfile, refoutfile)
    return {}


def mutatePlan(context, plan):
    plan.metric_collectors.append(_getStats)
