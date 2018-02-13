"""test-suite/lit plugin to collect internal llvm json statistics.

This assumes the benchmarks were built with the -save-stats=obj flag."""
import json
import logging
import os
from collections import defaultdict


def _mergeStats(global_stats, statsfilename):
    try:
        f = open(statsfilename, "rt")
        stats = json.load(f)
    except Exception as e:
        logging.warning("Could not read '%s'", statsfilename, exc_info=e)
        return
    for (name, value) in stats.items():
        global_stats[name] += value


def _getStats(context):
    prefix = context.prefix
    outfile = context.outfile
    
    testpath = context.testfile 
    testdir,testfile = os.path.split(testpath)
    testbase,testext = os.path.splitext(testfile)
    if context.prefix is None:
      testname = testbase
    else:
      assert(testbase.startswith(context.prefix))
      testname = testbase[len(prefix):]

    assert(len(context.sources)>=1)   
    stats = defaultdict(lambda: 0.0)
    for source in context.sources:
      sourcedir,sourcefile = os.path.split(source)
      sourcerel = os.path.relpath(source, start=context.sourcedir)
      sourcerel = '/'.join('__' if s == '..' else s for s in sourcerel.split('/') )
      sourcereldir,_ = os.path.split(sourcerel)
      sourcebase,sourcext = os.path.splitext(sourcefile)

      statfile = os.path.join(testdir,'CMakeFiles',testbase + '.dir',sourcereldir,sourcebase+'.stats')
      if not os.path.isfile(statfile):
         logging.error("Statfile {statfile} not found".format(statfile=statfile))
         raise Exception("Statfile not found")
      _mergeStats(stats, statfile)
      
    result = dict()
    for (key, value) in stats.items():
        result[key] = value
    return result


def mutatePlan(context, plan):
    plan.metric_collectors.append(_getStats)
