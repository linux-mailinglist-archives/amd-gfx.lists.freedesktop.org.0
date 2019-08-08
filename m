Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 316C0866ED
	for <lists+amd-gfx@lfdr.de>; Thu,  8 Aug 2019 18:24:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C450C6E899;
	Thu,  8 Aug 2019 16:24:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-by2nam05on060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe52::60e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9DA46E899
 for <amd-gfx@lists.freedesktop.org>; Thu,  8 Aug 2019 16:23:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iowHktqzHe0u+xEyCZwXZDOeU9ulz85pwm7/qr84fkJlmudgOcMsUq4hy1ec7zokhpd3n5km80NOGVsqaG1RHDSrHOFU55nFvM1DBWPu/Wmtij4V+yLNc/ymhASAg6SPxeBDt1jR3fxqt/NhK2Lo50g4Oeg60kbJ0wlwO4QoKfQM88blNZYjWmTLimMw4kNjVpuKL5LSqJqusVlmppfS1LXU9xvrHI/gdG5V0uurmqrvR1ymqIlDC4UkwhSU7XncYPCPU3bbcFjSfY0JMnEkHYMj7MM25VGEe79ghBV3iaQu2MAwUeBUUZCJGKHSRV+S+415ZlqHNlGjKX97wcx4Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zsA8MkME+nLEsajA4kbzwy3GwkWEieE6tD65+IRA+Yk=;
 b=TtrIRIoqXNqol94A+9O9MbQnyxcivYjff6y2b2Xag4mEraCFwSCb0+kYyoYqWzVTOXdMXfR9mDGMTYTzHX1RBKMNfpwWJcUtwJF83bbU016rQpmyUL+9pcNgBvS8POqFDxKJDTZPet6q00ZIsImBT4tf+pFKEovxp+0fYmmCkcQ+42Oj/kgN9ut7VM1klIT8tUsuN43mwi0IxLPKvUG2LyyU0Ntju3n7Sl2K1I0PAMl2g0V/u/chVBk/YuTNu+dw4xghXQ4LpkqB8IF6ObwvOeXt+4X6c35lNhY+cHjmAh5ZXgX133lp0OiCqIXeN62ITQAxARrTcHQGOA88bfkVjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2500.namprd12.prod.outlook.com (52.132.11.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.14; Thu, 8 Aug 2019 16:23:58 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::718c:48e0:4e04:5543]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::718c:48e0:4e04:5543%7]) with mapi id 15.20.2157.015; Thu, 8 Aug 2019
 16:23:58 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Mirza, Jimshed" <Jimshed.Mirza@amd.com>
Subject: RE: [PATCH 1/5] drm/amdgpu: Extends amdgpu vm definitions
Thread-Topic: [PATCH 1/5] drm/amdgpu: Extends amdgpu vm definitions
Thread-Index: AQHVTMgrPTJV6Fs0ek65dn0x+UgRKabvXkUAgAIJ+RCAAATcmYAAA//A
Date: Thu, 8 Aug 2019 16:23:58 +0000
Message-ID: <BL0PR12MB2580C9220232DA47486E5E0080D70@BL0PR12MB2580.namprd12.prod.outlook.com>
References: <1565145062-16674-1-git-send-email-Oak.Zeng@amd.com>
 <3e4f2f68-8840-d85c-052e-fc54dbf45fd4@gmail.com>,
 <BL0PR12MB2580601F44DB50051768070080D70@BL0PR12MB2580.namprd12.prod.outlook.com>
 <BN6PR12MB1809D2F0A97155733CA3FC6EF7D70@BN6PR12MB1809.namprd12.prod.outlook.com>
In-Reply-To: <BN6PR12MB1809D2F0A97155733CA3FC6EF7D70@BN6PR12MB1809.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: Jimshed.Mirza@amd.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.228.209.96]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 086d93c3-6e4a-4641-a25f-08d71c1cd0d9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR12MB2500; 
x-ms-traffictypediagnostic: BL0PR12MB2500:
x-ms-exchange-purlcount: 3
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR12MB2500068E16DD5E69E083C96880D70@BL0PR12MB2500.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 012349AD1C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(396003)(39860400002)(366004)(13464003)(199004)(189003)(110136005)(446003)(478600001)(53936002)(54896002)(6306002)(86362001)(9686003)(55016002)(71200400001)(4326008)(64756008)(71190400001)(66446008)(8936002)(256004)(81156014)(66556008)(33656002)(81166006)(74316002)(14444005)(6246003)(53546011)(6506007)(790700001)(236005)(66476007)(76176011)(52536014)(66066001)(5660300002)(7696005)(229853002)(6436002)(14454004)(102836004)(606006)(26005)(2906002)(11346002)(476003)(6636002)(66946007)(966005)(486006)(7736002)(186003)(76116006)(66574012)(316002)(3846002)(6116002)(54906003)(8676002)(2501003)(25786009)(99286004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2500;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: rkWzY16a73WBuD/BMVr34kX2WxvhyygDzkznrTdjMx7IyjbIBGIuO11GSKEWDqtu7EsG2Ocq+EtKiddkv6zbkKklAtErdD2Pdyj96yqNoHANGGpfMDzdMIQ0nN4OVuzlUt1Qim/vBE5wE/xZyaKM1JNlibshxBGP0F8+/LL7QaQJaCz+oJaJVNBs8v6xnH1deilQOhK8wLJAsBFxGpJBCYCxw1ygKvbTBdCgzBSPdX0EosajqEfPAACi1tXhwLumZa5kSpUbNTORc6Pq0kNvzuO8tQrwT2hYuUWQEmgzmgGbeNPpKSzxrWQ7IuxORUGX9Bbi6VHUMiPBRjnl7yexG3WwI7vP2Cr5YvchCYUUpV0F44bgSNEmVaLktV2ASWh1SZX3h+jWwd2LJKpropmGTEcTF8MgjpaROSASdCXkFOo=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 086d93c3-6e4a-4641-a25f-08d71c1cd0d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2019 16:23:58.1302 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VA+IxEd20bQ2nhROa659N2W5GSMi3v73MuRtJZxkEZ3O/+cQPyHUPZhnaT8IdMnl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2500
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zsA8MkME+nLEsajA4kbzwy3GwkWEieE6tD65+IRA+Yk=;
 b=YoMxhVq9ORZ1GsqEY7wYW/wsuvUsQYwOFYsCRv/BEFk1pne1nbVCg40FkGLDaofe3qran5QUc7fTe/a/SdR5a8dVHsp+n0CazOmNHobYfna92vydsIdHhpl0noNXM/6n4CmlYYd6M5ISNSgjyDanEKB4C6FOLU0HSUD2p13aq7M=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Oak.Zeng@amd.com; 
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Keely,
 Sean" <Sean.Keely@amd.com>
Content-Type: multipart/mixed; boundary="===============1317560450=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1317560450==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BL0PR12MB2580C9220232DA47486E5E0080D70BL0PR12MB2580namp_"

--_000_BL0PR12MB2580C9220232DA47486E5E0080D70BL0PR12MB2580namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

+@Mirza, Jimshed<mailto:Jimshed.Mirza@amd.com>: do we have the ability to s=
noop another GPU's cache, in a multiple GPU system?

Regards,
Oak

From: Deucher, Alexander <Alexander.Deucher@amd.com>
Sent: Thursday, August 8, 2019 12:10 PM
To: Zeng, Oak <Oak.Zeng@amd.com>; Koenig, Christian <Christian.Koenig@amd.c=
om>; amd-gfx@lists.freedesktop.org
Cc: Kuehling, Felix <Felix.Kuehling@amd.com>; Keely, Sean <Sean.Keely@amd.c=
om>
Subject: Re: [PATCH 1/5] drm/amdgpu: Extends amdgpu vm definitions

The snoop bit is for snooping the CPU cache by the GPU when doing system me=
mory mappings.

Alex
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org<mailto:amd-gfx-bounces=
@lists.freedesktop.org>> on behalf of Zeng, Oak <Oak.Zeng@amd.com<mailto:Oa=
k.Zeng@amd.com>>
Sent: Thursday, August 8, 2019 12:02 PM
To: Koenig, Christian <Christian.Koenig@amd.com<mailto:Christian.Koenig@amd=
.com>>; amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>=
 <amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>>
Cc: Kuehling, Felix <Felix.Kuehling@amd.com<mailto:Felix.Kuehling@amd.com>>=
; Keely, Sean <Sean.Keely@amd.com<mailto:Sean.Keely@amd.com>>
Subject: RE: [PATCH 1/5] drm/amdgpu: Extends amdgpu vm definitions

Hi Christian,

My understanding of the snoop bit (C bit in the PTE definition) is to probe=
 remote gpu's L2 cache after this gpu write remote gpu's vram. Is this corr=
ect? I am still checking this point with HW engineer.

If this is correct, then the snooping (or probing) is a way to maintain cer=
tain cache coherency when one memory is access by two masters (for example =
two gpu). With existing AMDGPU_VM_ definitions in amdgpu_drm.h, how does a =
user implement the request like: I want a trunk of vram physically in a rem=
ote gpu, I want to access it in a uncached way (AMDGPU_VM_MTYPE_UC) but I w=
ant to probe remote gpu's cache when I modify this vram.

From PTE's definition, both C bit and mtype and R/W/X bits are just flags t=
o enable user to program page access behavior. Any detail reason why we sho=
uldn't expose the snoop bit?

Regards,
Oak

-----Original Message-----
From: Christian K=F6nig <ckoenig.leichtzumerken@gmail.com<mailto:ckoenig.le=
ichtzumerken@gmail.com>>
Sent: Wednesday, August 7, 2019 4:42 AM
To: Zeng, Oak <Oak.Zeng@amd.com<mailto:Oak.Zeng@amd.com>>; amd-gfx@lists.fr=
eedesktop.org<mailto:amd-gfx@lists.freedesktop.org>
Cc: Kuehling, Felix <Felix.Kuehling@amd.com<mailto:Felix.Kuehling@amd.com>>=
; Koenig, Christian <Christian.Koenig@amd.com<mailto:Christian.Koenig@amd.c=
om>>; Keely, Sean <Sean.Keely@amd.com<mailto:Sean.Keely@amd.com>>
Subject: Re: [PATCH 1/5] drm/amdgpu: Extends amdgpu vm definitions

Am 07.08.19 um 04:31 schrieb Zeng, Oak:
> Add definition of all supported mtypes. The RW mtype is recently
> introduced for arcturus. Also add definition for the
> cachable/snoopable bit, which will be used later in this series.
>
> Change-Id: I96fc9bb4b6b1e62bdc10b600d8aaa6a802128d6d
> Signed-off-by: Oak Zeng <Oak.Zeng@amd.com<mailto:Oak.Zeng@amd.com>>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h | 9 +++++++--
>   include/uapi/drm/amdgpu_drm.h          | 4 ++++
>   2 files changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> index 2eda3a8..7a77477 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> @@ -80,8 +80,13 @@ struct amdgpu_bo_list_entry;
>   #define AMDGPU_PTE_MTYPE_VG10(a)    ((uint64_t)(a) << 57)
>   #define AMDGPU_PTE_MTYPE_VG10_MASK  AMDGPU_PTE_MTYPE_VG10(3ULL)
>
> -#define AMDGPU_MTYPE_NC 0
> -#define AMDGPU_MTYPE_CC 2
> +enum amdgpu_mtype {
> +     AMDGPU_MTYPE_NC =3D 0,
> +     AMDGPU_MTYPE_WC =3D 1,
> +     AMDGPU_MTYPE_CC =3D 2,
> +     AMDGPU_MTYPE_UC =3D 3,
> +     AMDGPU_MTYPE_RW =3D 4,
> +};
>
>   #define AMDGPU_PTE_DEFAULT_ATC  (AMDGPU_PTE_SYSTEM      \
>                                   | AMDGPU_PTE_SNOOPED    \
> diff --git a/include/uapi/drm/amdgpu_drm.h
> b/include/uapi/drm/amdgpu_drm.h index ca97b68..2889663 100644
> --- a/include/uapi/drm/amdgpu_drm.h
> +++ b/include/uapi/drm/amdgpu_drm.h
> @@ -503,6 +503,10 @@ struct drm_amdgpu_gem_op {
>   #define AMDGPU_VM_MTYPE_CC          (3 << 5)
>   /* Use UC MTYPE instead of default MTYPE */
>   #define AMDGPU_VM_MTYPE_UC          (4 << 5)
> +/* Use RW MTYPE instead of default MTYPE */
> +#define AMDGPU_VM_MTYPE_RW           (5 << 5)

> +/* Cacheable/snoopable */
> +#define AMDGPU_VM_PAGE_SNOOPED               (1 << 9)

That's a rather big NAK. Cache snooping is not something userspace is allow=
ed to be aware of.

Christian.

>
>   struct drm_amdgpu_gem_va {
>        /** GEM object handle */

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BL0PR12MB2580C9220232DA47486E5E0080D70BL0PR12MB2580namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
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
	{font-family:"\@DengXian";
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
	margin:1.0in 1.0in 1.0in 1.0in;}
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
<p class=3D"MsoNormal">&#43;<a id=3D"OWAAM94D75218BDAB4D8080182546162D8937"=
 href=3D"mailto:Jimshed.Mirza@amd.com"><span style=3D"font-family:&quot;Cal=
ibri&quot;,sans-serif;text-decoration:none">@Mirza, Jimshed</span></a>: do =
we have the ability to snoop another GPU&#8217;s cache, in a
 multiple GPU system?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Oak<o:p></o:p></p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> Deucher, Alexander &lt;Alexander.Deuche=
r@amd.com&gt; <br>
<b>Sent:</b> Thursday, August 8, 2019 12:10 PM<br>
<b>To:</b> Zeng, Oak &lt;Oak.Zeng@amd.com&gt;; Koenig, Christian &lt;Christ=
ian.Koenig@amd.com&gt;; amd-gfx@lists.freedesktop.org<br>
<b>Cc:</b> Kuehling, Felix &lt;Felix.Kuehling@amd.com&gt;; Keely, Sean &lt;=
Sean.Keely@amd.com&gt;<br>
<b>Subject:</b> Re: [PATCH 1/5] drm/amdgpu: Extends amdgpu vm definitions<o=
:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">The sno=
op bit is for snooping the CPU cache by the GPU when doing system memory ma=
ppings.<o:p></o:p></span></p>
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
<hr size=3D"2" width=3D"98%" align=3D"center">
</div>
<div id=3D"divRplyFwdMsg">
<p class=3D"MsoNormal"><b><span style=3D"color:black">From:</span></b><span=
 style=3D"color:black"> amd-gfx &lt;<a href=3D"mailto:amd-gfx-bounces@lists=
.freedesktop.org">amd-gfx-bounces@lists.freedesktop.org</a>&gt; on behalf o=
f Zeng, Oak &lt;<a href=3D"mailto:Oak.Zeng@amd.com">Oak.Zeng@amd.com</a>&gt=
;<br>
<b>Sent:</b> Thursday, August 8, 2019 12:02 PM<br>
<b>To:</b> Koenig, Christian &lt;<a href=3D"mailto:Christian.Koenig@amd.com=
">Christian.Koenig@amd.com</a>&gt;;
<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.=
org</a> &lt;<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.=
freedesktop.org</a>&gt;<br>
<b>Cc:</b> Kuehling, Felix &lt;<a href=3D"mailto:Felix.Kuehling@amd.com">Fe=
lix.Kuehling@amd.com</a>&gt;; Keely, Sean &lt;<a href=3D"mailto:Sean.Keely@=
amd.com">Sean.Keely@amd.com</a>&gt;<br>
<b>Subject:</b> RE: [PATCH 1/5] drm/amdgpu: Extends amdgpu vm definitions</=
span> <o:p>
</o:p></p>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
</div>
<div>
<div>
<p class=3D"MsoNormal">Hi Christian,<br>
<br>
My understanding of the snoop bit (C bit in the PTE definition) is to probe=
 remote gpu's L2 cache after this gpu write remote gpu's vram. Is this corr=
ect? I am still checking this point with HW engineer.<br>
<br>
If this is correct, then the snooping (or probing) is a way to maintain cer=
tain cache coherency when one memory is access by two masters (for example =
two gpu). With existing AMDGPU_VM_ definitions in amdgpu_drm.h, how does a =
user implement the request like:
 I want a trunk of vram physically in a remote gpu, I want to access it in =
a uncached way (AMDGPU_VM_MTYPE_UC) but I want to probe remote gpu's cache =
when I modify this vram.<br>
<br>
From PTE's definition, both C bit and mtype and R/W/X bits are just flags t=
o enable user to program page access behavior. Any detail reason why we sho=
uldn't expose the snoop bit?<br>
<br>
Regards,<br>
Oak<br>
<br>
-----Original Message-----<br>
From: Christian K=F6nig &lt;<a href=3D"mailto:ckoenig.leichtzumerken@gmail.=
com">ckoenig.leichtzumerken@gmail.com</a>&gt;
<br>
Sent: Wednesday, August 7, 2019 4:42 AM<br>
To: Zeng, Oak &lt;<a href=3D"mailto:Oak.Zeng@amd.com">Oak.Zeng@amd.com</a>&=
gt;; <a href=3D"mailto:amd-gfx@lists.freedesktop.org">
amd-gfx@lists.freedesktop.org</a><br>
Cc: Kuehling, Felix &lt;<a href=3D"mailto:Felix.Kuehling@amd.com">Felix.Kue=
hling@amd.com</a>&gt;; Koenig, Christian &lt;<a href=3D"mailto:Christian.Ko=
enig@amd.com">Christian.Koenig@amd.com</a>&gt;; Keely, Sean &lt;<a href=3D"=
mailto:Sean.Keely@amd.com">Sean.Keely@amd.com</a>&gt;<br>
Subject: Re: [PATCH 1/5] drm/amdgpu: Extends amdgpu vm definitions<br>
<br>
Am 07.08.19 um 04:31 schrieb Zeng, Oak:<br>
&gt; Add definition of all supported mtypes. The RW mtype is recently <br>
&gt; introduced for arcturus. Also add definition for the <br>
&gt; cachable/snoopable bit, which will be used later in this series.<br>
&gt;<br>
&gt; Change-Id: I96fc9bb4b6b1e62bdc10b600d8aaa6a802128d6d<br>
&gt; Signed-off-by: Oak Zeng &lt;<a href=3D"mailto:Oak.Zeng@amd.com">Oak.Ze=
ng@amd.com</a>&gt;<br>
&gt; ---<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h | 9 &#43;&#43;&#43;=
&#43;&#43;&#43;&#43;--<br>
&gt;&nbsp;&nbsp; include/uapi/drm/amdgpu_drm.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; | 4 &#43;&#43;&#43;&#43;<br>
&gt;&nbsp;&nbsp; 2 files changed, 11 insertions(&#43;), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h <br>
&gt; b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h<br>
&gt; index 2eda3a8..7a77477 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h<br>
&gt; @@ -80,8 &#43;80,13 @@ struct amdgpu_bo_list_entry;<br>
&gt;&nbsp;&nbsp; #define AMDGPU_PTE_MTYPE_VG10(a)&nbsp;&nbsp;&nbsp; ((uint6=
4_t)(a) &lt;&lt; 57)<br>
&gt;&nbsp;&nbsp; #define AMDGPU_PTE_MTYPE_VG10_MASK&nbsp; AMDGPU_PTE_MTYPE_=
VG10(3ULL)<br>
&gt;&nbsp;&nbsp; <br>
&gt; -#define AMDGPU_MTYPE_NC 0<br>
&gt; -#define AMDGPU_MTYPE_CC 2<br>
&gt; &#43;enum amdgpu_mtype {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; AMDGPU_MTYPE_NC =3D 0,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; AMDGPU_MTYPE_WC =3D 1,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; AMDGPU_MTYPE_CC =3D 2,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; AMDGPU_MTYPE_UC =3D 3,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; AMDGPU_MTYPE_RW =3D 4,<br>
&gt; &#43;};<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; #define AMDGPU_PTE_DEFAULT_ATC&nbsp; (AMDGPU_PTE_SYSTEM&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | AMDGPU_PTE_SNO=
OPED&nbsp;&nbsp;&nbsp; \<br>
&gt; diff --git a/include/uapi/drm/amdgpu_drm.h <br>
&gt; b/include/uapi/drm/amdgpu_drm.h index ca97b68..2889663 100644<br>
&gt; --- a/include/uapi/drm/amdgpu_drm.h<br>
&gt; &#43;&#43;&#43; b/include/uapi/drm/amdgpu_drm.h<br>
&gt; @@ -503,6 &#43;503,10 @@ struct drm_amdgpu_gem_op {<br>
&gt;&nbsp;&nbsp; #define AMDGPU_VM_MTYPE_CC&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; (3 &lt;&lt; 5)<br>
&gt;&nbsp;&nbsp; /* Use UC MTYPE instead of default MTYPE */<br>
&gt;&nbsp;&nbsp; #define AMDGPU_VM_MTYPE_UC&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; (4 &lt;&lt; 5)<br>
&gt; &#43;/* Use RW MTYPE instead of default MTYPE */<br>
&gt; &#43;#define AMDGPU_VM_MTYPE_RW&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; (5 &lt;&lt; 5)<br>
<br>
&gt; &#43;/* Cacheable/snoopable */<br>
&gt; &#43;#define AMDGPU_VM_PAGE_SNOOPED&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (1 &lt;&lt; 9)<br>
<br>
That's a rather big NAK. Cache snooping is not something userspace is allow=
ed to be aware of.<br>
<br>
Christian.<br>
<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; struct drm_amdgpu_gem_va {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /** GEM object handle */<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.=
org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a><o:p></o:p></p>
</div>
</div>
</div>
</body>
</html>

--_000_BL0PR12MB2580C9220232DA47486E5E0080D70BL0PR12MB2580namp_--

--===============1317560450==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1317560450==--
