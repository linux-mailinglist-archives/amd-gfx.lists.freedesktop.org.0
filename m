Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B15826077CA
	for <lists+amd-gfx@lfdr.de>; Fri, 21 Oct 2022 15:08:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8325F10E1F1;
	Fri, 21 Oct 2022 13:08:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B51510E669
 for <amd-gfx@lists.freedesktop.org>; Fri, 21 Oct 2022 09:56:29 +0000 (UTC)
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Mv09R6B5NzmVJg;
 Fri, 21 Oct 2022 17:51:39 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 17:56:21 +0800
Received: from [10.174.178.174] (10.174.178.174) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 17:56:20 +0800
Subject: Re: [PATCH 00/11] fix memory leak while kset_register() fails
To: Luben Tuikov <luben.tuikov@amd.com>, Greg KH <gregkh@linuxfoundation.org>
References: <20221021022102.2231464-1-yangyingliang@huawei.com>
 <d559793a-0ce4-3384-e74e-19855aa31f31@amd.com> <Y1IwLOUGayjT9p6d@kroah.com>
 <0591e66f-731a-5f81-fc9d-3a6d80516c65@huawei.com>
 <Y1JZ9IUPL6jZIQ8E@kroah.com>
 <f1210e20-d167-26c4-7aba-490d8fb7241e@huawei.com>
 <78f84006-955f-6209-1cae-024e4f199b97@amd.com>
From: Yang Yingliang <yangyingliang@huawei.com>
Message-ID: <9ee10048-f3fe-533b-5f00-8e5dd176808e@huawei.com>
Date: Fri, 21 Oct 2022 17:56:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <78f84006-955f-6209-1cae-024e4f199b97@amd.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 21 Oct 2022 13:08:22 +0000
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: chao@kernel.org, rafael@kernel.org, qemu-devel@nongnu.org, richard@nod.at,
 somlo@cmu.edu, mst@redhat.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-f2fs-devel@lists.sourceforge.net,
 liushixin2@huawei.com, joseph.qi@linux.alibaba.com,
 linux-mtd@lists.infradead.org, jlbec@evilplan.org, hsiangkao@linux.alibaba.com,
 alexander.deucher@amd.com, jaegeuk@kernel.org, akpm@linux-foundation.org,
 huangjianan@oppo.com, linux-erofs@lists.ozlabs.org, mark@fasheh.com,
 ocfs2-devel@oss.oracle.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>


On 2022/10/21 17:08, Luben Tuikov wrote:
> On 2022-10-21 04:59, Yang Yingliang wrote:
>> On 2022/10/21 16:36, Greg KH wrote:
>>> On Fri, Oct 21, 2022 at 04:24:23PM +0800, Yang Yingliang wrote:
>>>> On 2022/10/21 13:37, Greg KH wrote:
>>>>> On Fri, Oct 21, 2022 at 01:29:31AM -0400, Luben Tuikov wrote:
>>>>>> On 2022-10-20 22:20, Yang Yingliang wrote:
>>>>>>> The previous discussion link:
>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Flkml%2F0db486eb-6927-927e-3629-958f8f211194%40huawei.com%2FT%2F&amp;data=05%7C01%7Cluben.tuikov%40amd.com%7C74aa9b57192b406ef27408dab3429db4%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638019395979868103%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=RcK05cXm1J5%2BtYcLO2SMG7k6sjeymQzdBzMCDJSzfdE%3D&amp;reserved=0
>>>>>> The very first discussion on this was here:
>>>>>>
>>>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.spinics.net%2Flists%2Fdri-devel%2Fmsg368077.html&amp;data=05%7C01%7Cluben.tuikov%40amd.com%7C74aa9b57192b406ef27408dab3429db4%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638019395979868103%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=sHZ6kfLF8HxrNXV6%2FVjgdH%2BmQM4T3Zv0U%2FAwddT97cE%3D&amp;reserved=0
>>>>>>
>>>>>> Please use this link, and not the that one up there you which quoted above,
>>>>>> and whose commit description is taken verbatim from the this link.
>>>>>>
>>>>>>> kset_register() is currently used in some places without calling
>>>>>>> kset_put() in error path, because the callers think it should be
>>>>>>> kset internal thing to do, but the driver core can not know what
>>>>>>> caller doing with that memory at times. The memory could be freed
>>>>>>> both in kset_put() and error path of caller, if it is called in
>>>>>>> kset_register().
>>>>>> As I explained in the link above, the reason there's
>>>>>> a memory leak is that one cannot call kset_register() without
>>>>>> the kset->kobj.name being set--kobj_add_internal() returns -EINVAL,
>>>>>> in this case, i.e. kset_register() fails with -EINVAL.
>>>>>>
>>>>>> Thus, the most common usage is something like this:
>>>>>>
>>>>>> 	kobj_set_name(&kset->kobj, format, ...);
>>>>>> 	kset->kobj.kset = parent_kset;
>>>>>> 	kset->kobj.ktype = ktype;
>>>>>> 	res = kset_register(kset);
>>>>>>
>>>>>> So, what is being leaked, is the memory allocated in kobj_set_name(),
>>>>>> by the common idiom shown above. This needs to be mentioned in
>>>>>> the documentation, at least, in case, in the future this is absolved
>>>>>> in kset_register() redesign, etc.
>>>>> Based on this, can kset_register() just clean up from itself when an
>>>>> error happens?  Ideally that would be the case, as the odds of a kset
>>>>> being embedded in a larger structure is probably slim, but we would have
>>>>> to search the tree to make sure.
>>>> I have search the whole tree, the kset used in bus_register() - patch #3,
>>>> kset_create_and_add() - patch #4
>>>> __class_register() - patch #5,  fw_cfg_build_symlink() - patch #6 and
>>>> amdgpu_discovery.c - patch #10
>>>> is embedded in a larger structure. In these cases, we can not call
>>>> kset_put() in error path in kset_register()
>>> Yes you can as the kobject in the kset should NOT be controling the
>>> lifespan of those larger objects.
>>>
>>> If it is, please point out the call chain here as I don't think that
>>> should be possible.
>>>
>>> Note all of this is a mess because the kobject name stuff was added much
>>> later, after the driver model had been created and running for a while.
>>> We missed this error path when adding the dynamic kobject name logic,
>>> thank for looking into this.
>>>
>>> If you could test the patch posted with your error injection systems,
>>> that could make this all much simpler to solve.
>> The patch posted by Luben will cause double free in some cases.
> Yes, I figured this out in the other email and posted the scenario Greg
> was asking about.
>
> But I believe the question still stands if we can do kset_put()
> after a *failed* kset_register(), namely if more is being done than
> necessary, which is just to free the memory allocated by
> kobject_set_name().
The name memory is allocated in kobject_set_name() in caller,  and I 
think caller
free the memory that it allocated is reasonable, it's weird that some 
callers allocate
some memory and use function (kset_register) failed, then it free the 
memory allocated
in callers,  I think use kset_put()/kfree_const(name) in caller seems 
more reasonable.

Thanks,
Yang
>
> Regards,
> Luben
> .
