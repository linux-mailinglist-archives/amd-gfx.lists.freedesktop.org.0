Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A291437796
	for <lists+amd-gfx@lfdr.de>; Thu,  6 Jun 2019 17:16:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4422D89624;
	Thu,  6 Jun 2019 15:16:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690068.outbound.protection.outlook.com [40.107.69.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 600FE89624
 for <amd-gfx@lists.freedesktop.org>; Thu,  6 Jun 2019 15:16:01 +0000 (UTC)
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1268.namprd12.prod.outlook.com (10.168.226.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Thu, 6 Jun 2019 15:15:59 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::11ea:d6bc:d2fa:e6d]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::11ea:d6bc:d2fa:e6d%9]) with mapi id 15.20.1965.011; Thu, 6 Jun 2019
 15:15:59 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, "Liu, Monk"
 <Monk.Liu@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: FW: [PATCH] drm/ttm: fix ttm client driver (e.g. amdgpu) reload
 issue
Thread-Topic: FW: [PATCH] drm/ttm: fix ttm client driver (e.g. amdgpu) reload
 issue
Thread-Index: AQHVG2o1oK4ym/lSLEGLTLW9U8b33qaMqd8AgAA93wCAADu7gIAAOa2AgAFMU4CAABQI8A==
Date: Thu, 6 Jun 2019 15:15:59 +0000
Message-ID: <BN6PR12MB1809F73FCA1AC3CA8B91CD1AF7170@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <1559717076-25471-1-git-send-email-Monk.Liu@amd.com>
 <MN2PR12MB393308FE408E9E41EF0D615184160@MN2PR12MB3933.namprd12.prod.outlook.com>
 <8dbf96e5-056f-b2bb-b0d3-9376b92b0140@amd.com>
 <MN2PR12MB39334AC8143DDBC1AA7587E884160@MN2PR12MB3933.namprd12.prod.outlook.com>
 <bb88e890-84c4-5405-85c6-59f02d5a7a61@amd.com>,
 <1ef221b9-f29e-cbd2-488a-d5d0b349e45f@gmail.com>
In-Reply-To: <1ef221b9-f29e-cbd2-488a-d5d0b349e45f@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.51.161.233]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0cf4dcbf-4b4b-4f1c-ad81-08d6ea91e1d2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1268; 
x-ms-traffictypediagnostic: BN6PR12MB1268:
x-ms-exchange-purlcount: 4
x-microsoft-antispam-prvs: <BN6PR12MB1268E6D0626ACAC274615C04F7170@BN6PR12MB1268.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 00603B7EEF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(396003)(376002)(366004)(346002)(39860400002)(13464003)(189003)(199004)(606006)(102836004)(7736002)(478600001)(229853002)(33656002)(11346002)(72206003)(54896002)(9686003)(6116002)(74316002)(8936002)(66946007)(6506007)(446003)(25786009)(53546011)(19627405001)(256004)(6436002)(55016002)(236005)(105004)(71190400001)(6306002)(76176011)(66556008)(966005)(110136005)(186003)(26005)(14454004)(99286004)(71200400001)(7696005)(86362001)(52536014)(76116006)(6246003)(3846002)(81156014)(53936002)(14444005)(66066001)(66446008)(81166006)(64756008)(5660300002)(66574012)(73956011)(476003)(68736007)(2501003)(8676002)(2906002)(316002)(486006)(66476007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1268;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vXkTLNyPGytm8zWxKrhSvum1/FUKxqN2trCwYpTLxUvkhLOgTzLVVxXnWCVpcIE4llv3YxH6bRmywN3xcboj6mqp4Tz2CFGq32PuMnDZC9N+957bLyYLo1ocuYYfItUcweulCtIu8I7Z1CfSRA0VLUuvqsvK3DKyRHHoYsrvXo2mvJVD0O94mJSHA8SMkhrgJtDlEi91+BJOOIsxgVfevZIPjCPQXAcIGsY2KPFaatBzqlP9EOb0HcwLQPltlnBhXzLzCY/qFEJgTYHl9CiEZ+SeV99DUaoPwqckQkHvU0OfUdK/6qAqMgQqkI56OGxUF5kF+RgYDH4YiwsOoqAPTC5GQ0gF1qiNWYlwBZK3zkFW6EGUMGYzg9GHmiSDcv0nhgSVmc9LNUwB4MdWY1jreRWaQEezAT8071cV1CoqD7Q=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cf4dcbf-4b4b-4f1c-ad81-08d6ea91e1d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2019 15:15:59.8481 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: adeucher@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1268
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GGe7kfXfEZ2gUo3gjj8pynstQGoQvvC6ofSqWv0D+L8=;
 b=QS0Uu9x0sR4nXw+AfVlcDnIIv3hMiScEX2jcHzsjVM+X13b6feJMU9L3W2v67UjCi4hP6pwxnwrFbkD637BZVPdW2OfScI9xpBR5XTVbMn6SvXnG+2pW8nVVIB2D/Msq5d1uGjALCgCSqe3qdXQqUVnMCrZjq84vdTVFgGqCL9M=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Alexander.Deucher@amd.com; 
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1266127080=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1266127080==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB1809F73FCA1AC3CA8B91CD1AF7170BN6PR12MB1809namp_"

--_000_BN6PR12MB1809F73FCA1AC3CA8B91CD1AF7170BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

It's upstream:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3Dbd4264112f93045704731850c5e4d85db981cd85
and in drm-next:
https://cgit.freedesktop.org/drm/drm/commit/?id=3Dbd4264112f93045704731850c=
5e4d85db981cd85
and in amd-staging-drm-next:
https://cgit.freedesktop.org/~agd5f/linux/commit/?h=3Damd-staging-drm-next&=
id=3Dbd4264112f93045704731850c5e4d85db981cd85

Where are you seeing it missing?

Alex
________________________________
From: Christian K?nig <ckoenig.leichtzumerken@gmail.com>
Sent: Thursday, June 6, 2019 10:00 AM
To: Koenig, Christian; Liu, Monk; amd-gfx@lists.freedesktop.org; Deucher, A=
lexander
Subject: Re: FW: [PATCH] drm/ttm: fix ttm client driver (e.g. amdgpu) reloa=
d issue

It is part of amd-staging-drm-next and has Alex Signed-of by tag.

So it should definitely be upstream, Alex any idea why that patch isn't
in drm-next?

Christian.

Am 05.06.19 um 20:10 schrieb Koenig, Christian:
> Mhm, looks like that somehow got dropped during rebase.
>
> Going to dig up where that actually ended up tomorrow.
>
> Christian.
>
> Am 05.06.19 um 16:44 schrieb Liu, Monk:
>> Strange, I get the latest "drm-next" branch and didn't see the change la=
nded ....
>>
>> /Monk
>>
>> -----Original Message-----
>> From: Koenig, Christian
>> Sent: Wednesday, June 5, 2019 7:11 PM
>> To: Liu, Monk <Monk.Liu@amd.com>; amd-gfx@lists.freedesktop.org
>> Subject: Re: FW: [PATCH] drm/ttm: fix ttm client driver (e.g. amdgpu) re=
load issue
>>
>> This should already be fixed by patch "drm/ttm: fix re-init of global st=
ructures".
>>
>> Christian.
>>
>> Am 05.06.19 um 09:29 schrieb Liu, Monk:
>>> -----Original Message-----
>>> From: Monk Liu <Monk.Liu@amd.com>
>>> Sent: Wednesday, June 5, 2019 2:45 PM
>>> To: amd-gfx@lists.freedesktop.org
>>> Cc: Liu, Monk <Monk.Liu@amd.com>
>>> Subject: [PATCH] drm/ttm: fix ttm client driver (e.g. amdgpu) reload
>>> issue
>>>
>>> need to clear bo glob and mem glob during their release otherwise their=
 member value would be wrongly used in the next glob init stage and lead to=
 wild pointer access problems:
>>>
>>> 1) kobj.state_initialized is 1
>>> 2) ttm_bo_glob.bo_count isn't cleared and referenced via it
>>>       on member "swap_lru" would hit out of bound array accessing
>>>       bug
>>>
>>> Signed-off-by: Monk Liu <Monk.Liu@amd.com>
>>> ---
>>>     drivers/gpu/drm/ttm/ttm_bo.c     | 2 ++
>>>     drivers/gpu/drm/ttm/ttm_memory.c | 8 ++++++++
>>>     2 files changed, 10 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
>>> b/drivers/gpu/drm/ttm/ttm_bo.c index c7de667..6434eac 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>>> @@ -1604,6 +1604,8 @@ static void ttm_bo_global_kobj_release(struct kob=
ject *kobj)
>>>              container_of(kobj, struct ttm_bo_global, kobj);
>>>
>>>      __free_page(glob->dummy_read_page);
>>> +
>>> +   memset(glob, 0, sizeof(*glob));
>>>     }
>>>
>>>     static void ttm_bo_global_release(void) diff --git
>>> a/drivers/gpu/drm/ttm/ttm_memory.c b/drivers/gpu/drm/ttm/ttm_memory.c
>>> index 8617958..7128bbf 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_memory.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_memory.c
>>> @@ -229,9 +229,17 @@ static const struct sysfs_ops ttm_mem_global_ops =
=3D {
>>>      .store =3D &ttm_mem_global_store,
>>>     };
>>>
>>> +void ttm_mem_glob_kobj_release(struct kobject *kobj) {
>>> +   struct ttm_mem_global *glob =3D container_of(kobj, struct
>>> +ttm_mem_global, kobj);
>>> +
>>> +   memset(glob, 0, sizeof(*glob));
>>> +}
>>> +
>>>     static struct kobj_type ttm_mem_glob_kobj_type =3D {
>>>      .sysfs_ops =3D &ttm_mem_global_ops,
>>>      .default_attrs =3D ttm_mem_global_attrs,
>>> +   .release =3D ttm_mem_glob_kobj_release,
>>>     };
>>>
>>>     static bool ttm_zones_above_swap_target(struct ttm_mem_global *glob=
,
>>> --
>>> 2.7.4
>>>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx


--_000_BN6PR12MB1809F73FCA1AC3CA8B91CD1AF7170BN6PR12MB1809namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
It's upstream:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g=
it/commit/?id=3Dbd4264112f93045704731850c5e4d85db981cd85" id=3D"LPlnk109861=
">https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Dbd4264112f93045704731850c5e4d85db981cd85</a></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
and in drm-next:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<a href=3D"https://cgit.freedesktop.org/drm/drm/commit/?id=3Dbd4264112f9304=
5704731850c5e4d85db981cd85" id=3D"LPlnk491710">https://cgit.freedesktop.org=
/drm/drm/commit/?id=3Dbd4264112f93045704731850c5e4d85db981cd85</a></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
and in amd-staging-drm-next:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<a href=3D"https://cgit.freedesktop.org/~agd5f/linux/commit/?h=3Damd-stagin=
g-drm-next&amp;id=3Dbd4264112f93045704731850c5e4d85db981cd85" id=3D"LPlnk78=
0545">https://cgit.freedesktop.org/~agd5f/linux/commit/?h=3Damd-staging-drm=
-next&amp;id=3Dbd4264112f93045704731850c5e4d85db981cd85</a></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Where are you seeing it missing?</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Alex<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Christian K&ouml;nig =
&lt;ckoenig.leichtzumerken@gmail.com&gt;<br>
<b>Sent:</b> Thursday, June 6, 2019 10:00 AM<br>
<b>To:</b> Koenig, Christian; Liu, Monk; amd-gfx@lists.freedesktop.org; Deu=
cher, Alexander<br>
<b>Subject:</b> Re: FW: [PATCH] drm/ttm: fix ttm client driver (e.g. amdgpu=
) reload issue</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">It is part of amd-staging-drm-next and has Alex Si=
gned-of by tag.<br>
<br>
So it should definitely be upstream, Alex any idea why that patch isn't <br=
>
in drm-next?<br>
<br>
Christian.<br>
<br>
Am 05.06.19 um 20:10 schrieb Koenig, Christian:<br>
&gt; Mhm, looks like that somehow got dropped during rebase.<br>
&gt;<br>
&gt; Going to dig up where that actually ended up tomorrow.<br>
&gt;<br>
&gt; Christian.<br>
&gt;<br>
&gt; Am 05.06.19 um 16:44 schrieb Liu, Monk:<br>
&gt;&gt; Strange, I get the latest &quot;drm-next&quot; branch and didn't s=
ee the change landed ....<br>
&gt;&gt;<br>
&gt;&gt; /Monk<br>
&gt;&gt;<br>
&gt;&gt; -----Original Message-----<br>
&gt;&gt; From: Koenig, Christian<br>
&gt;&gt; Sent: Wednesday, June 5, 2019 7:11 PM<br>
&gt;&gt; To: Liu, Monk &lt;Monk.Liu@amd.com&gt;; amd-gfx@lists.freedesktop.=
org<br>
&gt;&gt; Subject: Re: FW: [PATCH] drm/ttm: fix ttm client driver (e.g. amdg=
pu) reload issue<br>
&gt;&gt;<br>
&gt;&gt; This should already be fixed by patch &quot;drm/ttm: fix re-init o=
f global structures&quot;.<br>
&gt;&gt;<br>
&gt;&gt; Christian.<br>
&gt;&gt;<br>
&gt;&gt; Am 05.06.19 um 09:29 schrieb Liu, Monk:<br>
&gt;&gt;&gt; -----Original Message-----<br>
&gt;&gt;&gt; From: Monk Liu &lt;Monk.Liu@amd.com&gt;<br>
&gt;&gt;&gt; Sent: Wednesday, June 5, 2019 2:45 PM<br>
&gt;&gt;&gt; To: amd-gfx@lists.freedesktop.org<br>
&gt;&gt;&gt; Cc: Liu, Monk &lt;Monk.Liu@amd.com&gt;<br>
&gt;&gt;&gt; Subject: [PATCH] drm/ttm: fix ttm client driver (e.g. amdgpu) =
reload<br>
&gt;&gt;&gt; issue<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; need to clear bo glob and mem glob during their release otherw=
ise their member value would be wrongly used in the next glob init stage an=
d lead to wild pointer access problems:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; 1) kobj.state_initialized is 1<br>
&gt;&gt;&gt; 2) ttm_bo_glob.bo_count isn't cleared and referenced via it<br=
>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; on member &quot;swap_lru&q=
uot; would hit out of bound array accessing<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bug<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: Monk Liu &lt;Monk.Liu@amd.com&gt;<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/ttm/ttm_bo.c&nbsp;&nbs=
p;&nbsp;&nbsp; | 2 &#43;&#43;<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; drivers/gpu/drm/ttm/ttm_memory.c | 8 &=
#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; 2 files changed, 10 insertions(&#43;)<=
br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; diff --git a/drivers/gpu/drm/ttm/ttm_bo.c<br>
&gt;&gt;&gt; b/drivers/gpu/drm/ttm/ttm_bo.c index c7de667..6434eac 100644<b=
r>
&gt;&gt;&gt; --- a/drivers/gpu/drm/ttm/ttm_bo.c<br>
&gt;&gt;&gt; &#43;&#43;&#43; b/drivers/gpu/drm/ttm/ttm_bo.c<br>
&gt;&gt;&gt; @@ -1604,6 &#43;1604,8 @@ static void ttm_bo_global_kobj_relea=
se(struct kobject *kobj)<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; container_of(kobj, struct ttm_bo_global, kobj);<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; <br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __free_page(glob-&gt;dummy_read_=
page);<br>
&gt;&gt;&gt; &#43;<br>
&gt;&gt;&gt; &#43;&nbsp;&nbsp; memset(glob, 0, sizeof(*glob));<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; <br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; static void ttm_bo_global_release(void=
) diff --git<br>
&gt;&gt;&gt; a/drivers/gpu/drm/ttm/ttm_memory.c b/drivers/gpu/drm/ttm/ttm_m=
emory.c<br>
&gt;&gt;&gt; index 8617958..7128bbf 100644<br>
&gt;&gt;&gt; --- a/drivers/gpu/drm/ttm/ttm_memory.c<br>
&gt;&gt;&gt; &#43;&#43;&#43; b/drivers/gpu/drm/ttm/ttm_memory.c<br>
&gt;&gt;&gt; @@ -229,9 &#43;229,17 @@ static const struct sysfs_ops ttm_mem=
_global_ops =3D {<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .store =3D &amp;ttm_mem_global_s=
tore,<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; };<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; <br>
&gt;&gt;&gt; &#43;void ttm_mem_glob_kobj_release(struct kobject *kobj) {<br=
>
&gt;&gt;&gt; &#43;&nbsp;&nbsp; struct ttm_mem_global *glob =3D container_of=
(kobj, struct<br>
&gt;&gt;&gt; &#43;ttm_mem_global, kobj);<br>
&gt;&gt;&gt; &#43;<br>
&gt;&gt;&gt; &#43;&nbsp;&nbsp; memset(glob, 0, sizeof(*glob));<br>
&gt;&gt;&gt; &#43;}<br>
&gt;&gt;&gt; &#43;<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; static struct kobj_type ttm_mem_glob_k=
obj_type =3D {<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .sysfs_ops =3D &amp;ttm_mem_glob=
al_ops,<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .default_attrs =3D ttm_mem_globa=
l_attrs,<br>
&gt;&gt;&gt; &#43;&nbsp;&nbsp; .release =3D ttm_mem_glob_kobj_release,<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; };<br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; <br>
&gt;&gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; static bool ttm_zones_above_swap_targe=
t(struct ttm_mem_global *glob,<br>
&gt;&gt;&gt; --<br>
&gt;&gt;&gt; 2.7.4<br>
&gt;&gt;&gt;<br>
&gt; _______________________________________________<br>
&gt; amd-gfx mailing list<br>
&gt; amd-gfx@lists.freedesktop.org<br>
&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">htt=
ps://lists.freedesktop.org/mailman/listinfo/amd-gfx</a><br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_BN6PR12MB1809F73FCA1AC3CA8B91CD1AF7170BN6PR12MB1809namp_--

--===============1266127080==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1266127080==--
