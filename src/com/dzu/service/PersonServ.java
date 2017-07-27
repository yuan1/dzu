package com.dzu.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dzu.dao.AssessmentDao;
import com.dzu.dao.CarryDao;
import com.dzu.dao.CongressDao;
import com.dzu.dao.EducationDao;
import com.dzu.dao.EvaluationDao;
import com.dzu.dao.FamilyDao;
import com.dzu.dao.PersonDao;
import com.dzu.dao.PoliticalDao;
import com.dzu.dao.RelevantDao;
import com.dzu.dao.ResumeDao;
import com.dzu.dao.SituationDao;
import com.dzu.dao.SocialDao;
import com.dzu.dao.TaiwanfamilyDao;
import com.dzu.dao.TrainingDao;
import com.dzu.model.Assessment;
import com.dzu.model.Carry;
import com.dzu.model.Congress;
import com.dzu.model.Dept;
import com.dzu.model.Education;
import com.dzu.model.Evaluation;
import com.dzu.model.Family;
import com.dzu.model.Person;
import com.dzu.model.Political;
import com.dzu.model.Relevant;
import com.dzu.model.Resume;
import com.dzu.model.Situation;
import com.dzu.model.Social;
import com.dzu.model.Taiwanfamily;
import com.dzu.model.Training;
import com.dzu.util.ArrayUtil;
import com.dzu.util.BasicUtil;

/**
 * @ClassName: PersonSer
 * @Description: 人员信息业务处理
 * @author 德州学院 惠晓东-李明元
 * @date 2016年6月23日 下午11:28:24
 *
 */
@Service
public class PersonServ {
	@Resource
	private PersonDao personDao;
	@Resource
	private EducationDao eduDao;
	@Resource
	private ResumeDao resumeDao;
	@Resource
	private CongressDao congressDao;
	@Resource
	private PoliticalDao politiDao;
	@Resource
	private SituationDao situaDao;
	@Resource
	private RelevantDao relevantDao;
	@Resource
	private SocialDao sociaDao;
	@Resource
	private TrainingDao trainDao;
	@Resource
	private CarryDao carryDao;
	@Resource
	private AssessmentDao assessDao;
	@Resource
	private EvaluationDao evaluaDao;
	@Resource
	private TaiwanfamilyDao taiwanfamilyDao;
	@Resource
	private FamilyDao familyDao;
	@Resource
	private SymServ symServ;

	/**
	 * @param jtcyjzyshgx
	 * @param zhpjqk
	 * @param ndkhqk
	 * @param hjhsbzqk
	 * @param jwnlcjpxqk
	 * @param xrqtshzw
	 * @param xrygbmqk
	 * @param xrzwqk
	 * @param mqzgjzxapqk
	 * 			@param mqzgjrdapqk @param gzjl @param xlxx @param
	 *            personMessage @Title: addPerson @Description:
	 *            保存人员信息 @param @return 参数说明 @return boolean 返回类型 @throws
	 */
	public boolean addPerson(Person personMessage, List<Education> xlxx, List<Resume> gzjl, List<Congress> mqzgjrdapqk,
			List<Political> mqzgjzxapqk, List<Situation> xrzwqk, List<Relevant> xrygbmqk, List<Social> xrqtshzw,
			List<Training> jwnlcjpxqk, List<Carry> hjhsbzqk, List<Assessment> ndkhqk, List<Evaluation> zhpjqk,
			List<Family> jtcyjzyshgx,List<Taiwanfamily> qtryjtqk) {
		boolean val = false;
		String yearNow = BasicUtil.getCurrentYear();
		if (personExit(personMessage.getSfzhm(), yearNow)) {
			Dept dept = BasicUtil.getdept();
			personMessage.setDept(dept);
			personMessage.setYear(yearNow);
			personMessage.setType(1);
			personDao.save(personMessage);
			if (saveOneToMany(personMessage, xlxx, gzjl, mqzgjrdapqk, mqzgjzxapqk, xrzwqk, xrygbmqk, xrqtshzw,
					jwnlcjpxqk, hjhsbzqk, ndkhqk, zhpjqk, jtcyjzyshgx,qtryjtqk)) {
				val = true;
			}
		}
		return val;
	}

	/**
	 * @Title: personExit @Description: 校验是否已存在 @param @param sfzh @param @param
	 *         year @param @return 参数说明 @return boolean 返回类型 @throws
	 */
	public boolean personExit(String sfzh, String year) {
		boolean val = false;
		List<Person> listPerson = personDao.findAll(new String[] { "sfzhm", "year" }, "id asc", sfzh, year);
		if (listPerson.size() > 0) {
			val = false;
		} else {
			val = true;
		}
		return val;
	}

	/**
	 * @Title: personExit @Description: 修改校验是否已存在 @param @param
	 *         sfzh @param @param year @param @return 参数说明 @return boolean
	 *         返回类型 @throws
	 */
	public boolean updatePersonExit(String sfzh, String year) {
		boolean val = false;
		List<Person> listPerson = personDao.findAll(new String[] { "sfzhm", "year" }, "id asc", sfzh, year);
		if (listPerson.size() == 1 || listPerson.size() == 0) {
			val = true;
		}
		return val;
	}

	/**
	 * @Title: sbPersonExit @Description: TODO(这里用一句话描述这个方法的作用) @param @param
	 *         sfzh @param @param year @param @return 参数说明 @return List<Person>
	 *         返回类型 @throws
	 */
	public List<Person> sbPersonExit(String sfzh, String year) {
		List<Person> listPerson = new ArrayList<Person>();
		try {
			listPerson = personDao.findAll(new String[] { "sfzhm", "year" }, "id asc", sfzh, year);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (listPerson.size() > 0) {
			return listPerson;
		} else {
			return null;
		}
	}

	/**
	 * @Title: getPersonList @Description: 分页获取当年全部人员信息 @param @param
	 *         pageIndex @param @param count @param @return 参数说明 @return List
	 *         <Person> 返回类型 @throws
	 */
	public List<Person> getPersonList(int pageIndex, int count) {
		return personDao.getByParmeterOnPage(pageIndex, count, new String[] { "year" },
				" convert(dept.dept_name)asc,convert(xm) asc ", BasicUtil.getCurrentYear());
	}

	public long getPersonCount() {
		return personDao.getCount();
	}

	/**
	 * @Title: getPersonById @Description: 通过id获取人员 @param @param
	 *         per_id @param @return 参数说明 @return Object 返回类型 @throws
	 */
	public Person getPersonById(int per_id) {
		return personDao.getById(per_id);
	}

	/**
	 * @Title: delOldMany @Description: 删除原有的一对多的多信息 @param @param
	 *         pid @param @param year 参数说明 @return void 返回类型 @throws
	 */
	public void delOldMany(int pid, String year) {
		try {
			eduDao.deleteOldMessage(pid, year);
			resumeDao.deleteOldMessage(pid, year);
			congressDao.deleteOldMessage(pid, year);
			politiDao.deleteOldMessage(pid, year);
			situaDao.deleteOldMessage(pid, year);
			relevantDao.deleteOldMessage(pid, year);
			sociaDao.deleteOldMessage(pid, year);
			trainDao.deleteOldMessage(pid, year);
			carryDao.deleteOldMessage(pid, year);
			assessDao.deleteOldMessage(pid, year);
			evaluaDao.deleteOldMessage(pid, year);
			familyDao.deleteOldMessage(pid, year);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @param qtryjtqk 
	 * @param qtryjtqk 
	 * @param tbtsjbxx 
	 * @Title: saveOneToMany @Description: 保存一对多中的多信息 @param @param
	 *         personMessage @param @param xlxx @param @param gzjl @param @param
	 *         mqzgjrdapqk @param @param mqzgjzxapqk @param @param
	 *         xrzwqk @param @param xrygbmqk @param @param
	 *         xrqtshzw @param @param jwnlcjpxqk @param @param
	 *         hjhsbzqk @param @param ndkhqk @param @param zhpjqk @param @param
	 *         jtcyjzyshgx @param @return 参数说明 @return boolean 返回类型 @throws
	 */
	public boolean saveOneToMany(Person personMessage, List<Education> xlxx, List<Resume> gzjl,
			List<Congress> mqzgjrdapqk, List<Political> mqzgjzxapqk, List<Situation> xrzwqk, List<Relevant> xrygbmqk,
			List<Social> xrqtshzw, List<Training> jwnlcjpxqk, List<Carry> hjhsbzqk, List<Assessment> ndkhqk,
			List<Evaluation> zhpjqk, List<Family> jtcyjzyshgx, List<Taiwanfamily> qtryjtqk) {
		boolean val = false;
		try {
			if(qtryjtqk!=null){
				for(Taiwanfamily fam:qtryjtqk){
					if( fam!=null){
						if (!fam.getCsny().equals("") || !fam.getCw().equals("") || !fam.getGzdwjzw().equals("")
								|| !fam.getXm().equals("") || !fam.getZzmm().equals("")) {
							fam.setYear(personMessage.getYear());
							fam.setTaiwan(personMessage.getTbtsjbxx());
							taiwanfamilyDao.save(fam);
						}
					}
				}
			}
			if (xlxx != null) {
				for (Education edu : xlxx) {
					if (edu != null) {
						if (!edu.getByyxjzy().equals("") || !edu.getJssj().equals("") || !edu.getKssj().equals("")
								|| !edu.getQdxl().equals("") || !edu.getShxw().equals("")
								|| !edu.getType().equals("")) {
							edu.setPerson(personMessage);
							edu.setYear(personMessage.getYear());
							eduDao.save(edu);
						}
					}
				}
			}
			if (gzjl != null) {
				for (Resume resu : gzjl) {
					if (resu != null) {
						if (!resu.getGzdwjzw().equals("") || !resu.getJssj().equals("") || !resu.getKssj().equals("")) {
							resu.setPerson(personMessage);
							resu.setYear(personMessage.getYear());
							resumeDao.save(resu);
						}
					}
				}
			}
			if (mqzgjrdapqk != null) {
				for (Congress congr : mqzgjrdapqk) {
					if (congr != null) {
						if (!congr.getApsj().equals("") || !congr.getApzw().equals("") || !congr.getBz().equals("")
								|| !congr.getGjrdzzmc().equals("") || !congr.getJc().equals("")
								|| !congr.getZzjb().equals("")) {
							congr.setPerson(personMessage);
							congr.setYear(personMessage.getYear());
							congressDao.save(congr);
						}
					}
				}
			}
			if (mqzgjzxapqk != null) {
				for (Political pol : mqzgjzxapqk) {
					if (pol != null) {
						if (!pol.getApjb().equals("") || !pol.getApsj().equals("") || !pol.getApzw().equals("")
								|| !pol.getGjzxzzmc().equals("") || !pol.getJc().equals("")
								|| !pol.getZzjb().equals("")) {
							pol.setYear(personMessage.getYear());
							pol.setPerson(personMessage);
							politiDao.save(pol);
						}
					}
				}
			}
			if (xrzwqk != null) {
				for (Situation sit : xrzwqk) {
					if (sit != null) {
						if (!sit.getApzw().equals("") || !sit.getRzjssj().equals("") || !sit.getRzkssj().equals("")
								|| !sit.getZzmc().equals("")) {
							sit.setYear(personMessage.getYear());
							sit.setPerson(personMessage);
							situaDao.save(sit);
						}
					}
				}
			}
			if (xrygbmqk != null) {
				for (Relevant rele : xrygbmqk) {
					if (rele != null) {
						if (!rele.getJssj().equals("") || !rele.getKssj().equals("") || !rele.getPqbm().equals("")
								|| !rele.getTyrymc().equals("") || !rele.getTyrymc().equals("")) {
							rele.setYear(personMessage.getYear());
							rele.setPerson(personMessage);
							relevantDao.save(rele);
						}
					}
				}
			}
			if (xrqtshzw != null) {
				for (Social soc : xrqtshzw) {
					if (soc != null) {
						if (!soc.getApzw().equals("") || !soc.getRzjssj().equals("") || !soc.getRzkssj().equals("")
								|| !soc.getZzmc().equals("")) {
							soc.setYear(personMessage.getYear());
							soc.setPerson(personMessage);
							sociaDao.save(soc);
						}
					}
				}
			}
			if (jwnlcjpxqk != null) {
				for (Training tra : jwnlcjpxqk) {
					if (tra != null) {
						if (!tra.getBcmc().equals("") || !tra.getJssj().equals("") || !tra.getKssj().equals("")
								|| !tra.getPxyx().equals("") || !tra.getZbdw().equals("")) {
							tra.setYear(personMessage.getYear());
							tra.setPerson(personMessage);
							trainDao.save(tra);
						}
					}
				}
			}
			if (hjhsbzqk != null) {
				for (Carry carr : hjhsbzqk) {
					if (carr != null) {
						if (!carr.getHjhsbzmc().equals("") || !carr.getSjsj().equals("")
								|| !carr.getXydw().equals("")) {
							carr.setYear(personMessage.getYear());
							carr.setPerson(personMessage);
							carryDao.save(carr);
						}
					}
				}
			}
			if (ndkhqk != null) {
				for (Assessment assess : ndkhqk) {
					if (assess != null) {
						if (!assess.getKhjg().equals("") || !assess.getSj().equals("")) {
							assess.setYear(personMessage.getYear());
							assess.setPerson(personMessage);
							assessDao.save(assess);
						}
					}
				}
			}
			if (zhpjqk != null) {
				for (Evaluation eval : zhpjqk) {
					if (eval != null) {
						if (!eval.getPjdw().equals("") || !eval.getPjsj().equals("") || !eval.getZhpjjg().equals("")) {
							eval.setYear(personMessage.getYear());
							eval.setPerson(personMessage);
							evaluaDao.save(eval);
						}
					}
				}
			}
			if (jtcyjzyshgx != null) {
				for (Family fam : jtcyjzyshgx) {
					if (fam != null) {
						if (!fam.getCsny().equals("") || !fam.getCw().equals("") || !fam.getGzdwjzw().equals("")
								|| !fam.getXm().equals("") || !fam.getZzmm().equals("")) {
							fam.setYear(personMessage.getYear());
							fam.setPerson(personMessage);
							familyDao.save(fam);
						}
					}
				}
			}
			val = true;

		} catch (Exception e) {
			e.printStackTrace();
			val = false;
		}
		return val;
	}

	/**
	 * @param qtryjtqk 
	 * @param tbtsjbxx 
	 * @Title: updatPersonDo @Description: 更新人员信息 @param @param
	 *         personMessage @param @param xlxx @param @param gzjl @param @param
	 *         mqzgjrdapqk @param @param mqzgjzxapqk @param @param
	 *         xrzwqk @param @param xrygbmqk @param @param
	 *         xrqtshzw @param @param jwnlcjpxqk @param @param
	 *         hjhsbzqk @param @param ndkhqk @param @param zhpjqk @param @param
	 *         jtcyjzyshgx @param @return 参数说明 @return boolean 返回类型 @throws
	 */
	public boolean updatPersonDo(Person personMessage, List<Education> xlxx, List<Resume> gzjl,
			List<Congress> mqzgjrdapqk, List<Political> mqzgjzxapqk, List<Situation> xrzwqk, List<Relevant> xrygbmqk,
			List<Social> xrqtshzw, List<Training> jwnlcjpxqk, List<Carry> hjhsbzqk, List<Assessment> ndkhqk,
			List<Evaluation> zhpjqk, List<Family> jtcyjzyshgx, List<Taiwanfamily> qtryjtqk) {
		boolean val = false;
		if (updatePersonExit(personMessage.getSfzhm(), personMessage.getYear())) {
			personDao.delete(personMessage.getId());
			personDao.save(personMessage);
			if (saveOneToMany(personMessage, xlxx, gzjl, mqzgjrdapqk, mqzgjzxapqk, xrzwqk, xrygbmqk, xrqtshzw,
					jwnlcjpxqk, hjhsbzqk, ndkhqk, zhpjqk, jtcyjzyshgx,qtryjtqk)) {
				val = true;
			}
		}
		return val;
	}

	/**
	 * @Title: delPerson @Description: 删除人员信息 @param @param pid @param @return
	 *         参数说明 @return boolean 返回类型 @throws
	 */
	public boolean delPerson(int pid) {
		boolean val = false;
		Person per = personDao.getById(pid);
		try {
			personDao.delete(per.getId());
			val = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return val;
	}

	public boolean personSB(Integer[] pids, int type) {
		for (Integer i : pids) {
			personDao.getById(i).setType(type);
		}
		return true;
	}

	public Integer[] getPersonBySearch(List<String> search) {
		Integer[] intt = personDao.getPersonBySearch(search);
		Integer[] intu = intt;
		Integer[] intv = intt;
		if (!search.get(9).equals("")) {
			intu = congressDao.getCongressIds(BasicUtil.getCurrentYear(), Integer.parseInt(search.get(9)), 0);
		}
		if (!search.get(10).equals("")) {
			intv = politiDao.getPoliticalIds(BasicUtil.getCurrentYear(), Integer.parseInt(search.get(10)), 0, 0);
		}
		Integer[] i = ArrayUtil.getPids(intt, intu, intv);
		if (i == null || i.length == 0)
			return new Integer[] { 0 };
		else
			return i;
	}

	public String sbSavePerson(List<Person> listPserson) {
		try{
		int updatePersonCount = 0;
		int savePersonCount = 0;
		for (Person person : listPserson) {
			Dept d = symServ.getDeptMess(person.getDept().getId());
			person.setDept(d);
//			Person pep = new Person(person.getXm(), person.getXb(), person.getCsny(), person.getMz(), person.getJg(),
//					person.getGj(), person.getCjgzsj(), person.getDydp(), person.getDydpjrsj(), person.getDedp(),
//					person.getDedpjrsj(), person.getSczp(), person.getZjlb(), person.getHwlxjl(), person.getHwlxjlgb(),
//					person.getShxjc(), person.getRylb(), person.getLrdw(), person.getSfzhm(), person.getFzdwjzw(),
//					person.getXrjb(), person.getRxzsj(), person.getRtjsj(), person.getZyjszc(), person.getZcjb(),
//					person.getZyzzbx(), person.getZycjhshyx(), person.getTbts(), person.getTbtsjbxx(),
//					person.getTxdz(), person.getYzbm(), person.getBgdh(), person.getSjhm(), person.getDzxx(),
//					person.getWxhm(), person.getQqhm(), person.getBz(), d, person.getType(), person.getYear());
			List<Person> listSbPerson = sbPersonExit(person.getSfzhm(), person.getYear());
			if (listSbPerson == null) {
//				if (saveOneToMany(pep, pep.getXlxx(), pep.getGzjl(), pep.getMqzgjrdapqk(), pep.getMqzgjzxapqk(),
//						pep.getXrzwqk(), pep.getXrygbmqk(), pep.getXrqtshzw(), pep.getJwnlcjpxqk(), pep.getHjhsbzqk(),
//						pep.getNdkhqk(), pep.getZhpjqk(), pep.getJtcyjzyshgx())) {
//				}
				savePersonCount = savePersonCount + 1;
			} else {
				for (Person pe : listSbPerson) {
					personDao.delete(pe.getId());
				}
//				if (saveOneToMany(pep, pep.getXlxx(), pep.getGzjl(), pep.getMqzgjrdapqk(), pep.getMqzgjzxapqk(),
//						pep.getXrzwqk(), pep.getXrygbmqk(), pep.getXrqtshzw(), pep.getJwnlcjpxqk(), pep.getHjhsbzqk(),
//						pep.getNdkhqk(), pep.getZhpjqk(), pep.getJtcyjzyshgx())) {
//				}
				updatePersonCount = updatePersonCount + 1;
			}
			personDao.save(person);
		}
		System.out.println(updatePersonCount+"-------------");
		System.out.println(savePersonCount+"-------------");
		return "更新'" + updatePersonCount + "'人，新增'" + savePersonCount + "'人";
		}catch(Exception e){
			e.printStackTrace();
			return "";
		}
	}
}
