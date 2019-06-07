Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1979387B4
	for <lists+amd-gfx@lfdr.de>; Fri,  7 Jun 2019 12:13:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E957A89CF7;
	Fri,  7 Jun 2019 10:13:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760084.outbound.protection.outlook.com [40.107.76.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BF6F89CF7
 for <amd-gfx@lists.freedesktop.org>; Fri,  7 Jun 2019 10:13:12 +0000 (UTC)
Received: from MN2PR12MB3933.namprd12.prod.outlook.com (10.255.238.94) by
 MN2PR12MB3072.namprd12.prod.outlook.com (20.178.240.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Fri, 7 Jun 2019 10:13:10 +0000
Received: from MN2PR12MB3933.namprd12.prod.outlook.com
 ([fe80::1c86:c8e7:b7e:ae61]) by MN2PR12MB3933.namprd12.prod.outlook.com
 ([fe80::1c86:c8e7:b7e:ae61%6]) with mapi id 15.20.1965.011; Fri, 7 Jun 2019
 10:13:10 +0000
From: "Liu, Monk" <Monk.Liu@amd.com>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: FW: [PATCH] drm/ttm: fix ttm client driver (e.g. amdgpu) reload
 issue
Thread-Topic: FW: [PATCH] drm/ttm: fix ttm client driver (e.g. amdgpu) reload
 issue
Thread-Index: AQHVG2oudZY69HM9mkCE8kosxqR2paaMqc8AgAA95QCAADukUIAAOcKAgAFMX4CAABUwgIABPWIg
Date: Fri, 7 Jun 2019 10:13:10 +0000
Message-ID: <MN2PR12MB3933F61914F154BA5822BB0784100@MN2PR12MB3933.namprd12.prod.outlook.com>
References: <1559717076-25471-1-git-send-email-Monk.Liu@amd.com>
 <MN2PR12MB393308FE408E9E41EF0D615184160@MN2PR12MB3933.namprd12.prod.outlook.com>
 <8dbf96e5-056f-b2bb-b0d3-9376b92b0140@amd.com>
 <MN2PR12MB39334AC8143DDBC1AA7587E884160@MN2PR12MB3933.namprd12.prod.outlook.com>
 <bb88e890-84c4-5405-85c6-59f02d5a7a61@amd.com>,
 <1ef221b9-f29e-cbd2-488a-d5d0b349e45f@gmail.com>
 <BN6PR12MB1809F73FCA1AC3CA8B91CD1AF7170@BN6PR12MB1809.namprd12.prod.outlook.com>
In-Reply-To: <BN6PR12MB1809F73FCA1AC3CA8B91CD1AF7170@BN6PR12MB1809.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 90c786b2-1c75-4ce3-53e1-08d6eb30be3e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3072; 
x-ms-traffictypediagnostic: MN2PR12MB3072:
x-ms-exchange-purlcount: 6
x-microsoft-antispam-prvs: <MN2PR12MB3072C0B62084F372408133E084100@MN2PR12MB3072.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0061C35778
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(39860400002)(346002)(376002)(396003)(136003)(189003)(199004)(13464003)(8676002)(8936002)(606006)(229853002)(33656002)(2501003)(81156014)(68736007)(81166006)(7736002)(236005)(476003)(790700001)(3846002)(6116002)(74316002)(25786009)(2906002)(55016002)(6306002)(6436002)(6246003)(54896002)(66476007)(66556008)(64756008)(66446008)(73956011)(66946007)(9686003)(76116006)(5660300002)(53936002)(52536014)(102836004)(66066001)(66574012)(14444005)(256004)(71200400001)(71190400001)(26005)(478600001)(186003)(72206003)(486006)(14454004)(53546011)(11346002)(446003)(966005)(316002)(110136005)(86362001)(76176011)(6506007)(99286004)(7696005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3072;
 H:MN2PR12MB3933.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hNDcdJJnzT4l8cGPzuDLG+D5e/wo/AMC0pxOR2RA8ttZcX1bWSDU6KT9QBXrBEYKKZnIk7uWnP2m3NQ/cj+C7KhcQrv0fX+zXLDNugVH4Sk/itDJHc8gqrapklKpuhvPk33ueDVM7t5l334dosm/r+JKOiL/npHvKHigmBsmjRuoiUToCr0J5G/FbZRxec8Pkuer688iul7VKKzzg3kyDC6LakzpzgBg726g8V2+ttlC82xXBONGZd2t3rpky9+jLIvZd2A7YOwwgU6/wt/Z1t+Ars20zn4SyMfafcFbBcydMZYDdPuxg2mx3GOtzueyb274Zi7Qt1ETJnLqGw17IcshixnKI982w8vA1XUKWaDanUj/9kSRrEWt+1aWPxf/EtBeHm9mqIm2FMKJtF5r/0B2NwUvidMpLUgvmuKYYsU=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90c786b2-1c75-4ce3-53e1-08d6eb30be3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2019 10:13:10.0438 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jyliu@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3072
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3l/a6BchDaTwBybASI95P8/AJhjqVp4DDt6WwFaldMk=;
 b=Gt5/iLS/cBAns/7X+K9mw8+js5OAaac1NXbup0WEQk/RXFs+mvx4nvjQq6SwlZzNcpqiqOZkL+MHVRc2SnKV8/S+kaKGCEbqQIbR39GKS1+4CZLB/uH9sXtH12umL6Aqi91hWlMg6x+Gf4QIckDDXBvoOV4d1Nqjfc2jJCVO68Y=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Monk.Liu@amd.com; 
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
Content-Type: multipart/mixed; boundary="===============0633981499=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0633981499==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB3933F61914F154BA5822BB0784100MN2PR12MB3933namp_"

--_000_MN2PR12MB3933F61914F154BA5822BB0784100MN2PR12MB3933namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Oh I know why,

My fix is to modify kobj_type's member "release" while upstream is doing th=
e different way, but both of the way shall fix the issue

Thanks

/Monk

From: Deucher, Alexander
Sent: Thursday, June 6, 2019 11:16 PM
To: Koenig, Christian <Christian.Koenig@amd.com>; Liu, Monk <Monk.Liu@amd.c=
om>; amd-gfx@lists.freedesktop.org
Subject: Re: FW: [PATCH] drm/ttm: fix ttm client driver (e.g. amdgpu) reloa=
d issue

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
From: Christian K=F6nig <ckoenig.leichtzumerken@gmail.com<mailto:ckoenig.le=
ichtzumerken@gmail.com>>
Sent: Thursday, June 6, 2019 10:00 AM
To: Koenig, Christian; Liu, Monk; amd-gfx@lists.freedesktop.org<mailto:amd-=
gfx@lists.freedesktop.org>; Deucher, Alexander
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
>> To: Liu, Monk <Monk.Liu@amd.com<mailto:Monk.Liu@amd.com>>; amd-gfx@lists=
.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>
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
>>> From: Monk Liu <Monk.Liu@amd.com<mailto:Monk.Liu@amd.com>>
>>> Sent: Wednesday, June 5, 2019 2:45 PM
>>> To: amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>
>>> Cc: Liu, Monk <Monk.Liu@amd.com<mailto:Monk.Liu@amd.com>>
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
>>> Signed-off-by: Monk Liu <Monk.Liu@amd.com<mailto:Monk.Liu@amd.com>>
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
> amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_MN2PR12MB3933F61914F154BA5822BB0784100MN2PR12MB3933namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle20
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Oh I know why,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">My fix is to modify kobj_type&#8217;s member &#8220;=
release&#8221; while upstream is doing the different way, but both of the w=
ay shall fix the issue<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">/Monk<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> Deucher, Alexander <br>
<b>Sent:</b> Thursday, June 6, 2019 11:16 PM<br>
<b>To:</b> Koenig, Christian &lt;Christian.Koenig@amd.com&gt;; Liu, Monk &l=
t;Monk.Liu@amd.com&gt;; amd-gfx@lists.freedesktop.org<br>
<b>Subject:</b> Re: FW: [PATCH] drm/ttm: fix ttm client driver (e.g. amdgpu=
) reload issue<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">It's up=
stream:<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><a href=
=3D"https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?id=3Dbd4264112f93045704731850c5e4d85db981cd85">https://git.kernel.org/p=
ub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=3Dbd4264112f930457047=
31850c5e4d85db981cd85</a><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">and in =
drm-next:<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><a href=
=3D"https://cgit.freedesktop.org/drm/drm/commit/?id=3Dbd4264112f93045704731=
850c5e4d85db981cd85">https://cgit.freedesktop.org/drm/drm/commit/?id=3Dbd42=
64112f93045704731850c5e4d85db981cd85</a><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">and in =
amd-staging-drm-next:<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><a href=
=3D"https://cgit.freedesktop.org/~agd5f/linux/commit/?h=3Damd-staging-drm-n=
ext&amp;id=3Dbd4264112f93045704731850c5e4d85db981cd85">https://cgit.freedes=
ktop.org/~agd5f/linux/commit/?h=3Damd-staging-drm-next&amp;id=3Dbd4264112f9=
3045704731850c5e4d85db981cd85</a><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Where a=
re you seeing it missing?<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Alex<o:=
p></o:p></span></p>
</div>
<div class=3D"MsoNormal" align=3D"center" style=3D"text-align:center">
<hr size=3D"3" width=3D"98%" align=3D"center">
</div>
<div id=3D"divRplyFwdMsg">
<p class=3D"MsoNormal"><b><span style=3D"color:black">From:</span></b><span=
 style=3D"color:black"> Christian K=F6nig &lt;<a href=3D"mailto:ckoenig.lei=
chtzumerken@gmail.com">ckoenig.leichtzumerken@gmail.com</a>&gt;<br>
<b>Sent:</b> Thursday, June 6, 2019 10:00 AM<br>
<b>To:</b> Koenig, Christian; Liu, Monk; <a href=3D"mailto:amd-gfx@lists.fr=
eedesktop.org">
amd-gfx@lists.freedesktop.org</a>; Deucher, Alexander<br>
<b>Subject:</b> Re: FW: [PATCH] drm/ttm: fix ttm client driver (e.g. amdgpu=
) reload issue</span>
<o:p></o:p></p>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
</div>
<div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">It is part of amd-sta=
ging-drm-next and has Alex Signed-of by tag.<br>
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
&gt;&gt; To: Liu, Monk &lt;<a href=3D"mailto:Monk.Liu@amd.com">Monk.Liu@amd=
.com</a>&gt;; <a href=3D"mailto:amd-gfx@lists.freedesktop.org">
amd-gfx@lists.freedesktop.org</a><br>
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
&gt;&gt;&gt; From: Monk Liu &lt;<a href=3D"mailto:Monk.Liu@amd.com">Monk.Li=
u@amd.com</a>&gt;<br>
&gt;&gt;&gt; Sent: Wednesday, June 5, 2019 2:45 PM<br>
&gt;&gt;&gt; To: <a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@l=
ists.freedesktop.org</a><br>
&gt;&gt;&gt; Cc: Liu, Monk &lt;<a href=3D"mailto:Monk.Liu@amd.com">Monk.Liu=
@amd.com</a>&gt;<br>
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
&gt;&gt;&gt; Signed-off-by: Monk Liu &lt;<a href=3D"mailto:Monk.Liu@amd.com=
">Monk.Liu@amd.com</a>&gt;<br>
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
&gt; <a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedes=
ktop.org</a><br>
&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">htt=
ps://lists.freedesktop.org/mailman/listinfo/amd-gfx</a><o:p></o:p></p>
</div>
</div>
</div>
</body>
</html>

--_000_MN2PR12MB3933F61914F154BA5822BB0784100MN2PR12MB3933namp_--

--===============0633981499==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0633981499==--
