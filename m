Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7054260BBA0
	for <lists+amd-gfx@lfdr.de>; Mon, 24 Oct 2022 23:07:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AF3C10E7EE;
	Mon, 24 Oct 2022 21:07:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2071.outbound.protection.outlook.com [40.107.100.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 020DD10E07A
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Oct 2022 21:06:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BwFpyGI/vg1ynQvFCmS/0vbE0zDAGtjXDhzn2QD5hvOa29fRlWlrfGsHlqyIDgK2bLTIlmYIBGwEo7TNxRVaS0BA4oV85OsZ7EsgLsB7hDa6xxkmVCeDFyMCXkzqfSqIQb/aToJDkqnxvcIQi5ScJGLigYdlaEoTJiSSPs/jzj3vWnP8RdjbnkphK8dy6yfOg/4nZp2uFFRiC63LKyeU9zWUD+rqYeYDOtwWPX33ks1XR94OZKC9SP8NvkvwMKdMhHNhCpH7MZ+FmU5lGlzFWxARHeufL8uL6oXN+lhn/yLjdfle4DknyPUmp0Hko5uJ49lzqHkv/TcDdVSdlYqRSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dLLccEwirLag7KwKnC7g2Mt56umwACsyTTgOzVhJUsw=;
 b=QGaJsNmFcI4t3LCPVOqGGZX6sTXT0/0BpvZyViz2zzcisnd6Xcxsd3hxU604+0P8ib4aXhbzsA12ijh46qYAkbfr20lT3suvA1ilzTxpfSUQert9XzZxNGthK2oXsQYV+GKyC8lU9Ai7X6Ddgz99xqR+ouR69pmcuZxE5/B7sqtjBbogZGKaWiLf1o2Uc5i3hlGZoWplCXo1tfiFAaw6LAO25QcVHhQ5ST4tAQiNI86e59YEmtOaBXNsli4oBvRIMa8cyNrB5m5HfOBKr5gPtWzEht5SnPcrVXhpE3Bo3vFwUhFQlbIkw70HmRmk+E/Q94HXWMtBWHindFXWsSrsGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dLLccEwirLag7KwKnC7g2Mt56umwACsyTTgOzVhJUsw=;
 b=pyuiiBfOwXJ3PyHbToHC7w+gtt0/0xTcUxGCpOC7kzgdR3Ntn5j8eoXG8oULo708uxEaI0AxRdfNdSj6rC2RDuCNM0PnaP+kK8F9gtZhVOaReMVDiBbQ25LJj/olKb6n0jWFcFQdFjYcqkbk9uSsZLfUgrJ84mwu/0sdRu6u71o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 PH0PR12MB7096.namprd12.prod.outlook.com (2603:10b6:510:21d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Mon, 24 Oct
 2022 21:06:55 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::d309:77d2:93d8:2425]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::d309:77d2:93d8:2425%7]) with mapi id 15.20.5746.026; Mon, 24 Oct 2022
 21:06:55 +0000
Message-ID: <176ae1a1-9240-eef8-04e9-000d47646f4a@amd.com>
Date: Mon, 24 Oct 2022 17:06:52 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2] kset: fix memory leak when kset_register() returns
 error
Content-Language: en-CA
To: Yang Yingliang <yangyingliang@huawei.com>, linux-kernel@vger.kernel.org,
 qemu-devel@nongnu.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-erofs@lists.ozlabs.org, ocfs2-devel@oss.oracle.com,
 linux-mtd@lists.infradead.org, amd-gfx@lists.freedesktop.org
References: <20221024121910.1169801-1-yangyingliang@huawei.com>
From: Luben Tuikov <luben.tuikov@amd.com>
In-Reply-To: <20221024121910.1169801-1-yangyingliang@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0103.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::18) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|PH0PR12MB7096:EE_
X-MS-Office365-Filtering-Correlation-Id: d15c8167-25e9-4aa3-2010-08dab603ae59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n88SRHGC6kCwBMW0y1WIY25xo1kkfdlAsQMTZreR03bmLExJ9j+DunTo09a2bCsY/OaRD4eoUBGFIYw1/townl5jB6AMnZf2hOHZv7CNmwqMqT/uyKEnlNzOAD/8XmUKma8oJZf8z7t59ZIQw52WuctmM0n84GrkETvVF/cWRB3w2HjaRGQ0khykBpKFsgyJ1KvXMvLYwktJctXU8gQ1XB7/6EdgJxEDCepdjQXajUjHGaeiednRXc9V2/fos1gCeQzqtOz0qLQBXeAy/ueTTmyjpZoydcppFMNmbXcVd5il4v+QcK/gCdmO5AYPme03i5ZHp30cNH0cnbOo2OqlEm505vN17KnbBgHmVi+2QXL7dz0crWI3oXZcYWE133O91sfegG50n/O0vYZQ+Uyw746qO2Pxwb5f+ICZ1HxLCRlSCxZpqrWntNo8sLLtYfzf5IIW4iO3T19HI8QtIO2wMcXF5eu4BAlh9FGvZ+wz7QXH3W2+DLlq7psPC/+sDf9aEyk5FNGHMJrbHfGArc821eg2KNTQWgJU+0f3aJwgqwOBhZc2u6mU8dRj8pxSiBnw4olC0qGVNpMd8f3bss3MMb6MhVMcuPTKvflfe90PiTYbyvlKi5OGb8BIOfef0eocN6MAUgJe7qTW7YZE599uluf14n5uzv9YyVSR7MZYLW+DAsnpqt1pY8Pgi1/JgwwLrJzhVwHbCQo0xsYH9O0fJTS21CwSYl+X7eGvvkvBKusTo2+8ExWLGe9CcrFau+O+VmavMLYUYnRuuWPnz2xKeRDVcNjdGWLxUMIP+2FOy9Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(39860400002)(376002)(396003)(366004)(451199015)(31696002)(66476007)(8936002)(4326008)(66946007)(2906002)(4001150100001)(8676002)(86362001)(41300700001)(316002)(5660300002)(66556008)(44832011)(7416002)(186003)(38100700002)(83380400001)(6486002)(478600001)(6666004)(2616005)(53546011)(6506007)(6512007)(26005)(31686004)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEM5NFRTeHdYTExnOXZlRXBZaDY2amNRUUNaTVp3K0tCeENDeXlUZjZCc01U?=
 =?utf-8?B?Z29yckVrdmkzL2c4Z3VkVStxNk1STjF3UjA0aExkUTJhUGMrNnViWGQzTFp1?=
 =?utf-8?B?TU5mb3BodE5XY2VaOFVpYkx1emtQamp2U3JZRXlQWVdMVGNSbXRkUmJGNUlz?=
 =?utf-8?B?WDdyaE9ERDNqUTBaTFdXOENvVXR2dUYrZW5qeGhWUmRKSHZWMGE5eElBVllV?=
 =?utf-8?B?RUVsUUNXN0QxeEdJRzdDcklXSFMzdjRJRXJKRkRtRnA5TVZveUhENnJVL0xD?=
 =?utf-8?B?eklta0hGUWh5dWJSQ1AvYVlGZmYwT3NqQUZPSGNHcE8zY1FnMndsT2dTTWhn?=
 =?utf-8?B?bGEyVjRWRW9vSFhidFowcENMUjhYNWZNaXZlalFXQ2JpYi95UHMzeERldWIy?=
 =?utf-8?B?RjBQVXNXUGQySHFpM2pMREFVNFZsc3RQdUNFYURXMEZlY20zdWs2blU1UWY2?=
 =?utf-8?B?NVd0bFdHUTBLQXBkVVdVQTR3YWFidlN1V3RTRFVSaWlWTHVrRjl4MkdwdVR2?=
 =?utf-8?B?eFluOU9Ic1ZiSUtRODFtdGpiMzlxMkVGSDVmOXVXbXFCTXFaczc5amZTaUph?=
 =?utf-8?B?MzdGeGU0RTZrRjYwakxuUitxK2ZzQldURm5MbFJLZldXMml0d3dhRUVBeXdp?=
 =?utf-8?B?QWt5Q2NnN3E0ZGRuanhqKy9JK1h5a0ROc1BtSEtEb3A5MXhTdktjdldwSFJC?=
 =?utf-8?B?NnRGYWpxejVvYjI4NVVZaXZmVmZwLzE1QUdZL3FsTG84clJKL29KcEhTaWlV?=
 =?utf-8?B?U0ZCRmZybGpTZ0VuY0Fud1QraXIybTY5RTFqdHhSWXpFWE8yRG16eDRVMUFW?=
 =?utf-8?B?TWdRbzNrYm1KSW9vQmRqTXQ2S0poYlNVSmx1dGdpb29FeVpHRldVMGJNckxH?=
 =?utf-8?B?bFhBQXorb3NhVjM5T09jWE1GbUE1K2hIODJwbWFab3BxWVREcnY2dXZiNUxz?=
 =?utf-8?B?TC9ncWcvZFJoVXpjSVkzcklwNlNlMmpqbEFYZ3dQWndpdlphVUt3S0ZZdmdN?=
 =?utf-8?B?N1R6VUN4TE55N3Byak5Xb3FOUXhGN3lwUkdwTUovU2MvTlpSVUZ3b2xxNnQr?=
 =?utf-8?B?RGxQaDkrSmdFWkxRRGRHKzEvS3dhZ3BoVGxEK0ZVNS9TdWpIUGU1ZFhmNVlm?=
 =?utf-8?B?THBuT1RJNFBkbjNRMEZQNHdOTEJxSmFKSHBaVVlJT2xrbEZwQzdueFZiWGw1?=
 =?utf-8?B?NjNTYThHcWN6N0w2UU1uRDcvNkFzcEx0Z3VyUklSV1M3M29RS05lUDZBQkla?=
 =?utf-8?B?YjMzV0JKTW15VGJaRVREd0U1NTRLN3YyUlFnR0lHa21VVlRGSkxWd2FwOU95?=
 =?utf-8?B?OXJnWlM5d2R6UUJqOU5IcDhIKzJtbDZWOVBVUTQrYVorNFFLOUNvdmpZK3Ir?=
 =?utf-8?B?U0VzK09iYWJwUG1zZW92OFJnYTVIbjlkeGVNTnExcXVnSmRmOEFHc2RIUFFq?=
 =?utf-8?B?QjhsUWViMmVtRXhmSzJITzFSLzlvbHFNWlljbzlKajQ4VHZFM21zVkYrL1R0?=
 =?utf-8?B?emU4MEszbFhDcEdramtJMXdPZ24rT3Mzek9HZ3dBRXRybG1HQlZmQStQTGlW?=
 =?utf-8?B?REZRQUUvR0xIY2V5NmFPaEdKT2QzQ1lBcHNEcXVEUG9LcmJFZzZjMXFta0g4?=
 =?utf-8?B?VUMvcHhyYUV0VlBnZXA0YUJ5NkYramFMUStFTGJVdzVXWVFVMWV2VWIyV21K?=
 =?utf-8?B?b0FtYnNjdklobG5zUEdLSEhjZU1GcUVGdER5QlVSNUZDREhLYWpUSXNhdEVE?=
 =?utf-8?B?QzkwdzdvN0xybFhnT1hDN3ZOWnJhSitYL1dOM0htYmpZZFNhQVVWYytKRThJ?=
 =?utf-8?B?UHI4OEo4Q0RRVG5ZeDA3Q3FzN1pjM0M3TExGUUR2WGVoT1RBR2ZTRnZxL0lH?=
 =?utf-8?B?UWcwWFE3YzE3ck5Gbkg0OWEyQUtUdEF5eVkxbk5CSCsvd284V2NoUjBiTGts?=
 =?utf-8?B?emNjcXFyRVhsZWFhaXQwTXNkZ3lSd29jN25rQytOWHVyRXVRSTNLRjBBT3dY?=
 =?utf-8?B?UUFSZUdYakp5Szk0ZWdaL3picFBFU0tUNUpXSGNtanRBdk93TTY5OVFTWDlN?=
 =?utf-8?B?dWtPYzQwVkloZlhPMUozbUtoVjVXeWpGdFdzdi9uM21Jc1J4Y2hDM1RwWHgz?=
 =?utf-8?Q?kReKTSY/tyQ73s2+gReAeXZb/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d15c8167-25e9-4aa3-2010-08dab603ae59
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 21:06:55.4298 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jpkJEfnBXOgO+C+akL174x+tvWHVHfPzQLPW0EI5xi4WIghTsZPemWY/uSY546ZV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7096
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

On 2022-10-24 08:19, Yang Yingliang wrote:
> Inject fault while loading module, kset_register() may fail.
> If it fails, the name allocated by kobject_set_name() which
> is called before kset_register() is leaked, because refcount
> of kobject is hold in kset_init().

"is hold" --> "was set".

Also, I'd say "which must be called" instead of "is", since
we cannot register kobj/kset without a name--the kobj code crashes,
and we want to make this clear. IOW, a novice user may wonder
where "is" it called, as opposed to learning that they "must"
call it to allocate/set a name, before calling kset_register().

So, I'd say this:

"If it fails, the name allocated by kobject_set_name() which must
 be called before a call to kset_regsiter() is leaked, since
 refcount of kobj was set in kset_init()."

> 
> As a kset may be embedded in a larger structure which needs
> be freed in release() function or error path in callers, we

Drop "As", start with "A kset". "which needs _to_ be".
Also please specify that the release is part of the ktype,
like this:

"A kset may be embedded in a larger structure which needs to be
 freed in ktype.release() or error path in callers, we ..."

> can not call kset_put() in kset_register(), or it will cause
> double free, so just call kfree_const() to free the name and
> set it to NULL.
> 
> With this fix, the callers don't need to care about the name
> freeing and call an extra kset_put() if kset_register() fails.

This is unclear because you're *missing* a verb:
"and call an extra kset_put()".
Please add the proper verb _between_ "and call", something like,

"With this fix, the callers don't need to care about freeing
 the name of the kset, and _can_ call kset_put() if kset_register() fails."

Choose a proper verb here: can, should, cannot, should not, etc.

We can do this because you set "kset.kobj.name to NULL, and this
is checked for in kobject_cleanup(). We just need to stipulate
whether they should/shouldn't have to call kset_put(), or can free the kset
and/or the embedding object themselves. This really depends
on how we want kset_register() to behave in the future, and on
user's own ktype.release implementation...

> 
> Suggested-by: Luben Tuikov <luben.tuikov@amd.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
> v1 -> v2:
>   Free name inside of kset_register() instead of calling kset_put()
>   in drivers.
> ---
>  lib/kobject.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/kobject.c b/lib/kobject.c
> index a0b2dbfcfa23..3409a89c81e5 100644
> --- a/lib/kobject.c
> +++ b/lib/kobject.c
> @@ -834,6 +834,9 @@ EXPORT_SYMBOL_GPL(kobj_sysfs_ops);
>  /**
>   * kset_register() - Initialize and add a kset.
>   * @k: kset.
> + *
> + * NOTE: On error, the kset.kobj.name allocated by() kobj_set_name()
> + * which is called before kset_register() in caller need be freed.
>   */
>  int kset_register(struct kset *k)
>  {
> @@ -844,8 +847,11 @@ int kset_register(struct kset *k)
>  
>  	kset_init(k);
>  	err = kobject_add_internal(&k->kobj);
> -	if (err)
> +	if (err) {
> +		kfree_const(k->kobj.name);
> +		k->kobj.name = NULL;
>  		return err;
> +	}

This looks good. It's good you set kset.kobj.name to NULL, so that
recovery/free paths don't get confused. Waiting for v3.

(I guess this is no different than what we currently do in kobject_cleanup(),
 so I see it as safe, no-surprises implementation.)

Regards,
Luben

