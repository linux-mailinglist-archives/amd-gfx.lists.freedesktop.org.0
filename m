Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A188FCE5
	for <lists+amd-gfx@lfdr.de>; Fri, 16 Aug 2019 10:00:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03C8E6EB16;
	Fri, 16 Aug 2019 08:00:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710042.outbound.protection.outlook.com [40.107.71.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 983C36EB16
 for <amd-gfx@lists.freedesktop.org>; Fri, 16 Aug 2019 07:59:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VXCpxyDZJIsapLcv4eUnOHd5eVbbpGa4/NSaw+xYqysdFwazFJXQY3hophSQIZdxZZ/i7Cm0KPN/Pi06KR4dIiivlScFu9OKStjGo6cjRQfS7VhCxwV5rZOcpButVb1OM7kl6f1q39p2WCmfZBKfMycdYnyJ0bx/JGB2ZQQCSmeoqytUCBQG9gmv2B/Q4gxGJZ3yhRS0OHn+Bhw+YFK7l0rpxKb5rNvVIkAI62Tm1NkJfQicdsxkh45L7kVLxLNpNNDsbo7RlKXUGVyLw1SPo36V9DECtTRBtC9GNPXGB4ivWOOCbzhuK7FX+uCJwB188O2RlSzk3BzXHxXhrgY7+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/FRf+FZRTZ4ID2e6fqifqnPtwDMA8ydYeImPeFWAWXk=;
 b=DwNT7kECDSmBEIy8Chs3mMtN8PuVofr3yv6AmdWoq8HOkIsTl16anG7e89+2Z8FRKDmTbCHpJyNtrSI016rMi8Guzch8b4iQBwkxONr0YwjrYVnnEDrongdaCHg2UszyBmP1iu9aHzhaSeRCe5oZ2Z5yA4PQve5h4e3L5VcftWWDGdcQTz/rcQIuhKq+apl4dWCCvGJrJSCbLMWGHSXmPEayAREwykLXQ+IRoO6wc927mnjYLGnTy8awjgt7r+9l0e1DvLOE3lT26STJyM0gO8jb9NeGmqGzr0WdlfCemiqeV1nvrQQpQlvO5DZLmn7m4GWARmPmK5zT++mWuKxi3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3358.namprd12.prod.outlook.com (20.178.241.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Fri, 16 Aug 2019 07:59:58 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::6cae:3314:7799:3077]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::6cae:3314:7799:3077%6]) with mapi id 15.20.2157.022; Fri, 16 Aug 2019
 07:59:58 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 3/4] drm/amd/powerplay: get bootup fclk value
Thread-Topic: [PATCH 3/4] drm/amd/powerplay: get bootup fclk value
Thread-Index: AQHVU/kSExAHw9GN00+uMFez1+NdSKb9W0IAgAAMaYA=
Date: Fri, 16 Aug 2019 07:59:57 +0000
Message-ID: <MN2PR12MB3344896B119B12D504E130C8E4AF0@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20190816060807.11922-1-evan.quan@amd.com>,
 <20190816060807.11922-3-evan.quan@amd.com>
 <MN2PR12MB3296E1EFA5B50EBA18CE1841A2AF0@MN2PR12MB3296.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB3296E1EFA5B50EBA18CE1841A2AF0@MN2PR12MB3296.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: af88af4e-037d-40bb-0851-08d7221fbb7c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3358; 
x-ms-traffictypediagnostic: MN2PR12MB3358:
x-ms-exchange-purlcount: 3
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3358EF175BBCA1989D1F90E2E4AF0@MN2PR12MB3358.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0131D22242
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39850400004)(366004)(376002)(136003)(346002)(199004)(189003)(81166006)(8936002)(8676002)(71190400001)(5660300002)(86362001)(229853002)(26005)(81156014)(14454004)(99286004)(110136005)(186003)(11346002)(478600001)(33656002)(6506007)(53546011)(102836004)(7696005)(52536014)(76176011)(446003)(486006)(476003)(316002)(236005)(966005)(3846002)(6116002)(74316002)(6436002)(256004)(790700001)(6306002)(9686003)(54896002)(25786009)(53936002)(66556008)(6246003)(76116006)(55016002)(66446008)(66946007)(66476007)(606006)(64756008)(71200400001)(7736002)(66066001)(2906002)(2501003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3358;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fRiPWo4/2tq0W6Sz0/7eujzimrrUxX2FhrD+1RgWjNJlB5EKwyqeUui5BW+dSYD3eo3jOlGKD4d4aIJVP75JEdFmisu38QpyjNUviKJ2oCAJlnxrGlLra/77xwiLYa/YU/nYL4T7OrCzLEJlTNVANzXX2h822yL1gVPDRG01dLnv53qHUffNe93+e/+JjNKTGDtSKjbub5tjUm9wjwKsv0zYTnfSWvV68ckiz5KYLxtq+Q5/dNvOJRb37chjWCZ7XcY+j/F+5al1gaRRKKCEl8Lu3vOzDP72k7lWbfM+hOC88OQfmUYdVtzo6nEKJd6hWhaglwROhuYGKrG304NqdG9qEJ3aKVfP3iM0FqXz2WLMsyOUyBycONgh/ztFclX9Ob5x/9gHcM7VCoPd9OXe9bqCvQHPtbWeJ0RVMzJ8u+Q=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af88af4e-037d-40bb-0851-08d7221fbb7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2019 07:59:57.9374 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hONcvHj5O7v37PalR0eQcNLWXv9a1GGqzmldU1EKJf3kuGGms0oeMW+2oceVe273
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3358
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/FRf+FZRTZ4ID2e6fqifqnPtwDMA8ydYeImPeFWAWXk=;
 b=bnEh+bIDbIpEjFms7XTPTK8GhK3MDy8r85e3RIYICBOMOMQBLrjgJ6T9lQWizIuz3rv437zsfWYgCzKxuqM6xRZoDqXBDvGOI+3DYwifMJRUzey2AVFWdxeFAKKo2fAVmGnok744oWwKmpHnkvpM1JbKCieCunWr4fRCCqiRrFM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Evan.Quan@amd.com; 
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
Content-Type: multipart/mixed; boundary="===============2028343620=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============2028343620==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB3344896B119B12D504E130C8E4AF0MN2PR12MB3344namp_"

--_000_MN2PR12MB3344896B119B12D504E130C8E4AF0MN2PR12MB3344namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Since smu_get_atom_data_table() was already used in smu_v11_0_get_vbios_boo=
tup_values(). We should get all our needed information at once.
Also, what smu_get_atom_data_table() does is to get the data table from vbi=
os. It's a time and resource cost job.
I do not think it's a good idea to call it again just to get some informati=
on we should already know.

Regards,
Evan
From: Wang, Kevin(Yang) <Kevin1.Wang@amd.com>
Sent: Friday, August 16, 2019 3:10 PM
To: Quan, Evan <Evan.Quan@amd.com>; amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH 3/4] drm/amd/powerplay: get bootup fclk value

i think we can use a function to retrieve this information without storing =
it separately.
likes:  ret =3D smu_get_atom_data_table(smu, index, &size, &frev, &crev,
                                      (uint8_t **)&header);
because these information is a generic information from atom_common_table_h=
eader.
and other function don't care it except in smu_v11_0_get_clk_info_from_vbio=
s.

Best Regards,
Kevin
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org<mailto:amd-gfx-bounces=
@lists.freedesktop.org>> on behalf of Evan Quan <evan.quan@amd.com<mailto:e=
van.quan@amd.com>>
Sent: Friday, August 16, 2019 2:08 PM
To: amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org> <am=
d-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>>
Cc: Quan, Evan <Evan.Quan@amd.com<mailto:Evan.Quan@amd.com>>
Subject: [PATCH 3/4] drm/amd/powerplay: get bootup fclk value

This is available with firmwareinfo table v3.2 or later.

Change-Id: I223edf3c616b9e3e2527c752214fef5ab53d1cea
Signed-off-by: Evan Quan <evan.quan@amd.com<mailto:evan.quan@amd.com>>
---
 .../gpu/drm/amd/powerplay/inc/amdgpu_smu.h    |  3 +++
 drivers/gpu/drm/amd/powerplay/smu_v11_0.c     | 21 +++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h b/drivers/gpu/d=
rm/amd/powerplay/inc/amdgpu_smu.h
index ca9b9ec39de8..2c16eb412954 100644
--- a/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h
+++ b/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h
@@ -222,6 +222,9 @@ struct smu_bios_boot_up_values
         uint16_t                        vdd_gfx;
         uint8_t                         cooling_id;
         uint32_t                        pp_table_id;
+       uint32_t                        format_revision;
+       uint32_t                        content_revision;
+       uint32_t                        fclk;
 };

 enum smu_table_id
diff --git a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c b/drivers/gpu/drm/am=
d/powerplay/smu_v11_0.c
index 4a51de4ff162..df7b65360ac7 100644
--- a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
+++ b/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
@@ -568,6 +568,9 @@ int smu_v11_0_get_vbios_bootup_values(struct smu_contex=
t *smu)
                 smu->smu_table.boot_values.pp_table_id =3D v_3_3->pplib_pp=
table_id;
         }

+       smu->smu_table.boot_values.format_revision =3D header->format_revis=
ion;
+       smu->smu_table.boot_values.content_revision =3D header->content_rev=
ision;
+
         return 0;
 }

@@ -647,6 +650,24 @@ static int smu_v11_0_get_clk_info_from_vbios(struct sm=
u_context *smu)
         output =3D (struct atom_get_smu_clock_info_output_parameters_v3_1 =
*)&input;
         smu->smu_table.boot_values.dclk =3D le32_to_cpu(output->atom_smu_o=
utputclkfreq.smu_clock_freq_hz) / 10000;

+       if ((smu->smu_table.boot_values.format_revision =3D=3D 3) &&
+           (smu->smu_table.boot_values.content_revision >=3D 2)) {
+               memset(&input, 0, sizeof(input));
+               input.clk_id =3D SMU11_SYSPLL1_0_FCLK_ID;
+               input.syspll_id =3D SMU11_SYSPLL1_2_ID;
+               input.command =3D GET_SMU_CLOCK_INFO_V3_1_GET_CLOCK_FREQ;
+               index =3D get_index_into_master_table(atom_master_list_of_c=
ommand_functions_v2_1,
+                                                   getsmuclockinfo);
+
+               ret =3D amdgpu_atom_execute_table(adev->mode_info.atom_cont=
ext, index,
+                                               (uint32_t *)&input);
+               if (ret)
+                       return -EINVAL;
+
+               output =3D (struct atom_get_smu_clock_info_output_parameter=
s_v3_1 *)&input;
+               smu->smu_table.boot_values.fclk =3D le32_to_cpu(output->ato=
m_smu_outputclkfreq.smu_clock_freq_hz) / 10000;
+       }
+
         return 0;
 }

--
2.22.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_MN2PR12MB3344896B119B12D504E130C8E4AF0MN2PR12MB3344namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:SimSun;
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
<p class=3D"MsoNormal">Since smu_get_atom_data_table() was already used in =
smu_v11_0_get_vbios_bootup_values(). We should get all our needed informati=
on at once.<o:p></o:p></p>
<p class=3D"MsoNormal">Also, what smu_get_atom_data_table() does is to get =
the data table from vbios. It&#8217;s a time and resource cost job.<o:p></o=
:p></p>
<p class=3D"MsoNormal">I do not think it&#8217;s a good idea to call it aga=
in just to get some information we should already know.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Evan<o:p></o:p></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> Wang, Kevin(Yang) &lt;Kevin1.Wang@amd.c=
om&gt; <br>
<b>Sent:</b> Friday, August 16, 2019 3:10 PM<br>
<b>To:</b> Quan, Evan &lt;Evan.Quan@amd.com&gt;; amd-gfx@lists.freedesktop.=
org<br>
<b>Subject:</b> Re: [PATCH 3/4] drm/amd/powerplay: get bootup fclk value<o:=
p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">i think=
 we can use a function to retrieve this information without storing it sepa=
rately.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">likes:&=
nbsp;<i>&nbsp;ret =3D smu_get_atom_data_table(smu, index, &amp;size, &amp;f=
rev, &amp;crev,&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (uint8_t **)&amp;=
header);&nbsp;&nbsp;</i><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">because=
 these information is a generic information from atom_common_table_header.<=
o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">and oth=
er function don't care it except in&nbsp;smu_v11_0_get_clk_info_from_vbios.=
<o:p></o:p></span></p>
</div>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
</div>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Best Re=
gards,<br>
Kevin<o:p></o:p></span></p>
</div>
<div class=3D"MsoNormal" align=3D"center" style=3D"text-align:center">
<hr size=3D"2" width=3D"98%" align=3D"center">
</div>
<div id=3D"divRplyFwdMsg">
<p class=3D"MsoNormal"><b><span style=3D"color:black">From:</span></b><span=
 style=3D"color:black"> amd-gfx &lt;<a href=3D"mailto:amd-gfx-bounces@lists=
.freedesktop.org">amd-gfx-bounces@lists.freedesktop.org</a>&gt; on behalf o=
f Evan Quan &lt;<a href=3D"mailto:evan.quan@amd.com">evan.quan@amd.com</a>&=
gt;<br>
<b>Sent:</b> Friday, August 16, 2019 2:08 PM<br>
<b>To:</b> <a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.f=
reedesktop.org</a> &lt;<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd=
-gfx@lists.freedesktop.org</a>&gt;<br>
<b>Cc:</b> Quan, Evan &lt;<a href=3D"mailto:Evan.Quan@amd.com">Evan.Quan@am=
d.com</a>&gt;<br>
<b>Subject:</b> [PATCH 3/4] drm/amd/powerplay: get bootup fclk value</span>=
 <o:p>
</o:p></p>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
</div>
<div>
<div>
<p class=3D"MsoNormal">This is available with firmwareinfo table v3.2 or la=
ter.<br>
<br>
Change-Id: I223edf3c616b9e3e2527c752214fef5ab53d1cea<br>
Signed-off-by: Evan Quan &lt;<a href=3D"mailto:evan.quan@amd.com">evan.quan=
@amd.com</a>&gt;<br>
---<br>
&nbsp;.../gpu/drm/amd/powerplay/inc/amdgpu_smu.h&nbsp;&nbsp;&nbsp; |&nbsp; =
3 &#43;&#43;&#43;<br>
&nbsp;drivers/gpu/drm/amd/powerplay/smu_v11_0.c&nbsp;&nbsp;&nbsp;&nbsp; | 2=
1 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#4=
3;&#43;&#43;&#43;&#43;<br>
&nbsp;2 files changed, 24 insertions(&#43;)<br>
<br>
diff --git a/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h b/drivers/gpu/d=
rm/amd/powerplay/inc/amdgpu_smu.h<br>
index ca9b9ec39de8..2c16eb412954 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h<br>
@@ -222,6 &#43;222,9 @@ struct smu_bios_boot_up_values<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint16_t&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vdd_gfx;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint8_t&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cooling_id;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pp_table_id;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; format_revision;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; content_revision;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fclk;<br>
&nbsp;};<br>
&nbsp;<br>
&nbsp;enum smu_table_id<br>
diff --git a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c b/drivers/gpu/drm/am=
d/powerplay/smu_v11_0.c<br>
index 4a51de4ff162..df7b65360ac7 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/smu_v11_0.c<br>
@@ -568,6 &#43;568,9 @@ int smu_v11_0_get_vbios_bootup_values(struct smu_co=
ntext *smu)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; smu-&gt;smu_table.boot_values.pp_table_id =3D v_3_3-&=
gt;pplib_pptable_id;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu-&gt;smu_table.boot_values.for=
mat_revision =3D header-&gt;format_revision;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu-&gt;smu_table.boot_values.con=
tent_revision =3D header-&gt;content_revision;<br>
&#43;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&nbsp;}<br>
&nbsp;<br>
@@ -647,6 &#43;650,24 @@ static int smu_v11_0_get_clk_info_from_vbios(struc=
t smu_context *smu)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; output =3D (struct atom_ge=
t_smu_clock_info_output_parameters_v3_1 *)&amp;input;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu-&gt;smu_table.boot_val=
ues.dclk =3D le32_to_cpu(output-&gt;atom_smu_outputclkfreq.smu_clock_freq_h=
z) / 10000;<br>
&nbsp;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((smu-&gt;smu_table.boot_value=
s.format_revision =3D=3D 3) &amp;&amp;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (smu-&gt;=
smu_table.boot_values.content_revision &gt;=3D 2)) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; memset(&amp;input, 0, sizeof(input));<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; input.clk_id =3D SMU11_SYSPLL1_0_FCLK_ID;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; input.syspll_id =3D SMU11_SYSPLL1_2_ID;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; input.command =3D GET_SMU_CLOCK_INFO_V3_1_GET_CLOCK_FREQ;<br=
>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; index =3D get_index_into_master_table(atom_master_list_of_co=
mmand_functions_v2_1,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; getsmuclockinfo);<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; ret =3D amdgpu_atom_execute_table(adev-&gt;mode_info.atom_co=
ntext, index,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (uint32_t *)&amp;i=
nput);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (ret)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -EINV=
AL;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; output =3D (struct atom_get_smu_clock_info_output_parameters=
_v3_1 *)&amp;input;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; smu-&gt;smu_table.boot_values.fclk =3D le32_to_cpu(output-&g=
t;atom_smu_outputclkfreq.smu_clock_freq_hz) / 10000;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&nbsp;}<br>
&nbsp;<br>
-- <br>
2.22.0<br>
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
</div>
</body>
</html>

--_000_MN2PR12MB3344896B119B12D504E130C8E4AF0MN2PR12MB3344namp_--

--===============2028343620==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============2028343620==--
