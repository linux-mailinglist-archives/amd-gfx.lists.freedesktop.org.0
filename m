Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3EB78FBBA
	for <lists+amd-gfx@lfdr.de>; Fri, 16 Aug 2019 09:09:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DFEA6EAED;
	Fri, 16 Aug 2019 07:09:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770055.outbound.protection.outlook.com [40.107.77.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66C3B6EAED
 for <amd-gfx@lists.freedesktop.org>; Fri, 16 Aug 2019 07:09:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VQemGL4pBgk6hgWi0xSTjSUYQIxan9KtSCE+6J4MszT5F8P+UiIafETjDmNj98cLEiyc+bV7groMGEM75kmVAhU1ZEhWnYqSW1tuTvm76ltrnWGnBC3p4twAMtUEOB9pAVkN54xcPxmAbBzWt89h2xY3vh4bbU/jdeugWqMD6jX92b2oKe9cRP3Fkqd9vAWvq2n2dxn3tIIYfv60xoibcWdFDu78GlofRRF9+ETzu+5rsnb5ADdPoj6VW6JjRZnnUR1u7aXRfCsMXuJTKMNAu6T35zS8U3jlwRYf73Hautfo0F6wOXVxMjCU3BdfccgRTvhEAAtPtST7NLZQwjJ+mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gIEZm05PtdtFem14Vk0Wu2aJzr97Nzmx+blel4E4Tk4=;
 b=IWRbVr5f7qHhHqG9zXS0I5MnVTAct9taTm+qHzXfaYq/9O8vzo6y/2mEvdzSstG4Kqg5GD6mGpUCQvwz6/2WboPTXEWrHgk/mZbhBZ11NWETPpBo33BkByN6Ewz/GW9/hfRix3fgKISW9iyy/UF/4guQzVPk84mnFGTJ96x+hMtbFei8aaEldwIuEcxer+iS9rbJsnjuZt2avqOtw50/U2ga9aI/KrPlyakhUA7YhkCTsDrP8sVVjZalDXakrQGSNDb4YOcsqKLaxseF+dN0AKNf5Y0m0M40x8ugiWnziV+ofcVlg0etTV5upNuaS7QGG5/K2RvC4spDe/LR4IlHDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3117.namprd12.prod.outlook.com (20.178.244.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.16; Fri, 16 Aug 2019 07:09:55 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::7490:549a:479d:f716]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::7490:549a:479d:f716%6]) with mapi id 15.20.2178.016; Fri, 16 Aug 2019
 07:09:55 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 3/4] drm/amd/powerplay: get bootup fclk value
Thread-Topic: [PATCH 3/4] drm/amd/powerplay: get bootup fclk value
Thread-Index: AQHVU/kIZWhxNMbc/0G6avanEvNYQ6b9WUq4
Date: Fri, 16 Aug 2019 07:09:54 +0000
Message-ID: <MN2PR12MB3296E1EFA5B50EBA18CE1841A2AF0@MN2PR12MB3296.namprd12.prod.outlook.com>
References: <20190816060807.11922-1-evan.quan@amd.com>,
 <20190816060807.11922-3-evan.quan@amd.com>
In-Reply-To: <20190816060807.11922-3-evan.quan@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 844aebae-e23d-407c-31e5-08d72218bd80
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3117; 
x-ms-traffictypediagnostic: MN2PR12MB3117:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3117E6E234AF0BF58D37AE6DA2AF0@MN2PR12MB3117.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 0131D22242
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(366004)(39860400002)(346002)(396003)(189003)(199004)(6436002)(86362001)(55016002)(52536014)(486006)(66066001)(8676002)(966005)(6246003)(71200400001)(71190400001)(476003)(9686003)(229853002)(256004)(316002)(105004)(606006)(6306002)(2501003)(236005)(110136005)(53936002)(54896002)(11346002)(99286004)(446003)(81166006)(53546011)(81156014)(6506007)(6116002)(33656002)(7696005)(478600001)(3846002)(76176011)(19627405001)(91956017)(186003)(64756008)(102836004)(66446008)(5660300002)(76116006)(2906002)(66946007)(66556008)(74316002)(66476007)(14454004)(25786009)(8936002)(26005)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3117;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: bHg7RHTSbcK8iWluQVBBLmIDfYCrwmcOcgN8UEUL7UdIXb7j9QORtI0BJX+A9rSfsHmkKW2B+W59qjjiacSjPNTPxnRQnWN5qieDkvp1fzwX9wAkH9+E2QVKW6VWZlAgeX06igY4jZEcj+jdsoYXN9VXKv0A0Jp32ZRcfibo172H5G+x3AH1jU5KRVsDnSv1/9yw70ZJ+Lv2TTk0ob9krAuK/heOPvRE59E8E2ef99b3zv6FnMNy7Q8/jvq9SDnvzmdsi46mEICGQSPFuHT+h3CCOxkwMB6J0JeIlvm3YUF5uFgvsmzk4czgxTjvAQvCAmQAG7WjVLrDfiInZwa/vGNYX8RA7p2K1Al+MuRHGe2rBI1rpy6csCzJdqVkUDUjs9OvmX31wwK67/D7tYmR26dBoFKJVx/zJnf8HYFQBdI=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 844aebae-e23d-407c-31e5-08d72218bd80
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2019 07:09:54.9009 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5oHFigrNVkLqXk8OV0I5aKmU6Ag1OdidjzfrEXvSgNa8PHH7I96ZMPYVqbtfCcRf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3117
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gIEZm05PtdtFem14Vk0Wu2aJzr97Nzmx+blel4E4Tk4=;
 b=q4wPEOfWCBVGcWc31+Crp19M1MfY3wiZVxUcc1q5DUuk6FiDY5NRK12pBJB6zYRGEN/R+KpUBzfeVfm3GolOvRHqMrR+I/L/UG6AfNHQNZ7Mxq+f8oy/5ql6cBUQB42Pl6ZRRfaheMP4tWsEBYZyAcyNRS/K587MMoZTf7YQVo4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kevin1.Wang@amd.com; 
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
Content-Type: multipart/mixed; boundary="===============0645801247=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0645801247==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB3296E1EFA5B50EBA18CE1841A2AF0MN2PR12MB3296namp_"

--_000_MN2PR12MB3296E1EFA5B50EBA18CE1841A2AF0MN2PR12MB3296namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

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
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Evan Qua=
n <evan.quan@amd.com>
Sent: Friday, August 16, 2019 2:08 PM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Quan, Evan <Evan.Quan@amd.com>
Subject: [PATCH 3/4] drm/amd/powerplay: get bootup fclk value

This is available with firmwareinfo table v3.2 or later.

Change-Id: I223edf3c616b9e3e2527c752214fef5ab53d1cea
Signed-off-by: Evan Quan <evan.quan@amd.com>
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
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_MN2PR12MB3296E1EFA5B50EBA18CE1841A2AF0MN2PR12MB3296namp_
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
i think we can use a function to retrieve this information without storing =
it separately.<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
likes:&nbsp;<i><span>&nbsp;ret =3D smu_get_atom_data_table(smu, index, &amp=
;size, &amp;frev, &amp;crev,&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<br>
</span><span>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (uin=
t8_t **)&amp;header);&nbsp;&nbsp;</span></i></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span>because these information is a generic information from atom_common_t=
able_header.</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span>and other function don't care it except in&nbsp;smu_v11_0_get_clk_inf=
o_from_vbios.</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<div><br>
</div>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Best Regards,<br>
Kevin</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Evan Quan &lt;evan.quan@amd.c=
om&gt;<br>
<b>Sent:</b> Friday, August 16, 2019 2:08 PM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Quan, Evan &lt;Evan.Quan@amd.com&gt;<br>
<b>Subject:</b> [PATCH 3/4] drm/amd/powerplay: get bootup fclk value</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">This is available with firmwareinfo table v3.2 or =
later.<br>
<br>
Change-Id: I223edf3c616b9e3e2527c752214fef5ab53d1cea<br>
Signed-off-by: Evan Quan &lt;evan.quan@amd.com&gt;<br>
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
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</body>
</html>

--_000_MN2PR12MB3296E1EFA5B50EBA18CE1841A2AF0MN2PR12MB3296namp_--

--===============0645801247==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0645801247==--
