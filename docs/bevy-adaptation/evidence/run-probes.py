import pathlib,subprocess,concurrent.futures,json,time,sys,os
root=pathlib.Path('/tmp/superpowers-adaptation-evidence'); variant=sys.argv[1]; work=pathlib.Path(sys.argv[2]); prompt=(root/'suite-prompt.txt').read_text(); out=root/variant;out.mkdir(exist_ok=True)
def run(n):
 start=time.monotonic();env=dict(os.environ,CODEX_HOME=str(root/'home'))
 with (out/f'{n}.jsonl').open('w') as log,(out/f'{n}.stderr').open('w') as err:
  try:r=subprocess.run(['codex','exec','--skip-git-repo-check','--ephemeral','--sandbox','read-only','--json','--output-last-message',str(out/f'{n}.answer.md'),'-'],input=prompt,text=True,stdout=log,stderr=err,cwd=work,env=env,timeout=240);code=r.returncode
  except subprocess.TimeoutExpired: code=124
 (out/f'{n}.receipt.json').write_text(json.dumps({'variant':variant,'rep':n,'exit':code,'elapsed_seconds':round(time.monotonic()-start,3)})+'\n');print(variant,n,code,flush=True)
with concurrent.futures.ThreadPoolExecutor(max_workers=2) as ex:list(ex.map(run,range(1,6)))
