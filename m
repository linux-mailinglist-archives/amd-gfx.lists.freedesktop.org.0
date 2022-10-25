Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BAA60C4F8
	for <lists+amd-gfx@lfdr.de>; Tue, 25 Oct 2022 09:25:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6145510E185;
	Tue, 25 Oct 2022 07:25:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B663010E0DB
 for <amd-gfx@lists.freedesktop.org>; Tue, 25 Oct 2022 02:16:38 +0000 (UTC)
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.56])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MxFmv6qXjz15M3T;
 Tue, 25 Oct 2022 10:11:43 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 25 Oct 2022 10:16:35 +0800
Received: from [10.174.178.174] (10.174.178.174) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 25 Oct 2022 10:16:33 +0800
Subject: Re: [PATCH v2] kset: fix memory leak when kset_register() returns
 error
To: Luben Tuikov <luben.tuikov@amd.com>, <linux-kernel@vger.kernel.org>,
 <qemu-devel@nongnu.org>, <linux-f2fs-devel@lists.sourceforge.net>,
 <linux-erofs@lists.ozlabs.org>, <ocfs2-devel@oss.oracle.com>,
 <linux-mtd@lists.infradead.org>, <amd-gfx@lists.freedesktop.org>
References: <20221024121910.1169801-1-yangyingliang@huawei.com>
 <176ae1a1-9240-eef8-04e9-000d47646f4a@amd.com>
 <dcb8b35a-7d0d-cc00-41e3-6e66837c506f@amd.com>
From: Yang Yingliang <yangyingliang@huawei.com>
Message-ID: <26c8c125-453c-af32-a66c-2a37e964ce19@huawei.com>
Date: Tue, 25 Oct 2022 10:16:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <dcb8b35a-7d0d-cc00-41e3-6e66837c506f@amd.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 25 Oct 2022 07:24:58 +0000
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
Cc: alexander.deucher@amd.com, richard@nod.at, mst@redhat.com,
 gregkh@linuxfoundation.org, somlo@cmu.edu, chao@kernel.org,
 huangjianan@oppo.com, liushixin2@huawei.com, joseph.qi@linux.alibaba.com,
 jlbec@evilplan.org, hsiangkao@linux.alibaba.com, rafael@kernel.org,
 jaegeuk@kernel.org, akpm@linux-foundation.org, mark@fasheh.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Hi,

On 2022/10/25 5:25, Luben Tuikov wrote:
> On 2022-10-24 17:06, Luben Tuikov wrote:
>> On 2022-10-24 08:19, Yang Yingliang wrote:
>>> Inject fault while loading module, kset_register() may fail.
>>> If it fails, the name allocated by kobject_set_name() which
>>> is called before kset_register() is leaked, because refcount
>>> of kobject is hold in kset_init().
>> "is hold" --> "was set".
>>
>> Also, I'd say "which must be called" instead of "is", since
>> we cannot register kobj/kset without a name--the kobj code crashes,
>> and we want to make this clear. IOW, a novice user may wonder
>> where "is" it called, as opposed to learning that they "must"
>> call it to allocate/set a name, before calling kset_register().
>>
>> So, I'd say this:
>>
>> "If it fails, the name allocated by kobject_set_name() which must
>>   be called before a call to kset_regsiter() is leaked, since
>>   refcount of kobj was set in kset_init()."
> Actually, to be a bit more clear:
>
> "If kset_register() fails, the name allocated by kobject_set_name(),
>   namely kset.kobj.name, which must be called before a call to kset_register(),
>   may be leaked, if the caller doesn't explicitly free it, say by calling kset_put().
>
>   To mitigate this, we free the name in kset_register() when an error is encountered,
>   i.e. when kset_register() returns an error."
Thanks for you suggestion.
>
>>> As a kset may be embedded in a larger structure which needs
>>> be freed in release() function or error path in callers, we
>> Drop "As", start with "A kset". "which needs _to_ be".
>> Also please specify that the release is part of the ktype,
>> like this:
>>
>> "A kset may be embedded in a larger structure which needs to be
>>   freed in ktype.release() or error path in callers, we ..."
>>
>>> can not call kset_put() in kset_register(), or it will cause
>>> double free, so just call kfree_const() to free the name and
>>> set it to NULL.
>>>
>>> With this fix, the callers don't need to care about the name
>>> freeing and call an extra kset_put() if kset_register() fails.
>> This is unclear because you're *missing* a verb:
>> "and call an extra kset_put()".
>> Please add the proper verb _between_ "and call", something like,
>>
>> "With this fix, the callers don't need to care about freeing
>>   the name of the kset, and _can_ call kset_put() if kset_register() fails."
I was mean
the callers don't need to care about freeing the name of the kset and
the callers don't need to care about calling kset_put()

Thanks,
Yang
>>
>> Choose a proper verb here: can, should, cannot, should not, etc.
>>
>> We can do this because you set "kset.kobj.name to NULL, and this
>> is checked for in kobject_cleanup(). We just need to stipulate
>> whether they should/shouldn't have to call kset_put(), or can free the kset
>> and/or the embedding object themselves. This really depends
>> on how we want kset_register() to behave in the future, and on
>> user's own ktype.release implementation...
> Forgot "may", "may not".
>
> So, do we want to say "may call kset_put()", like:
>
> "With this fix, the callers need not care about freeing
>   the name of the kset, and _may_ call kset_put() if kset_register() fails."
>
> Or do we want to say "should" or even "must"--it really depends on
> what else is (would be) going on in kobj registration.
>
> Although, the user may have additional work to be done in the ktype.release()
> callback for the embedding object. It would be good to give them the freedom,
> i.e. "may", to call kset_put(). If that's not the case, this must be explicitly
> stipulated with the proper verb.
>
> Regards,
> Luben
>
> .
