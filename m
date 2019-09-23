Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D59BB155
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Sep 2019 11:24:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B430E6E25B;
	Mon, 23 Sep 2019 09:24:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820072.outbound.protection.outlook.com [40.107.82.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D1F06E25B
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Sep 2019 09:24:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=juV7xh/HmY9LShDokeirv6MrEjx4RbPbtqQCnOdMux/l469lLfGBUj/fv98wxepI3hdyTw86RLslIC+JZXLjgIe+V/2GbNcpPVXMtWODYOz8DdWGZKnvNq8bJ0Jp/6Z3DGuMQT1kKrk44JRhncmc7CQa54hMzqwVaT6QtW1bODAIOoKXydSBwwuhcGh4ie3pGJglNgCEUqCn27JwvWCkvF/lk7H+HgUdeCD92Ur4X0K+I/3VbT47hhrWm1uoxwEgNcm5UCxQzNxIODPuyF1lBb61Z8/lATgRHcS4z40vV1L9vDvFAnJPSF8B3QLSeCFfASw0iEW6AJD0I3h7UcWWtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dI/6cYbMlJayU+5TkVzNJpx7jlojPJ8qDbxJm2uj2JQ=;
 b=HN4bErwSejVE77CkGmWBVjkRbvJUchrqtbUtuB5vi+/mjhktJjhMJD55F5C7TlS1Yyw5s2Z2YXXN+9ADrZgG0Ek+UPGVQ2fGEYtDFL6NjuVL8rzOanhvsg32SySoE4iL6zOS3M1iINSvqsw/Uwz44iDEMzwSBpXJCADGT65+H3H1OjADaw7LWZgcbOcXVvy8IFEbl5RirYMj8aafXD/iW/ri7J6QZY6HAYRx/xLB3ZjxvY43mWy9IG9RALmubyHycfU3TwhVZciZS+LfobyF1e7l4Lc4Wdyk4laJZEKZFbP4adKbEu+4AX1E8aHgxPqorbLSlWDZme7yIgDU7lCgag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3920.namprd12.prod.outlook.com (10.255.238.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.22; Mon, 23 Sep 2019 09:24:44 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::9929:92fb:f329:a911]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::9929:92fb:f329:a911%7]) with mapi id 15.20.2284.023; Mon, 23 Sep 2019
 09:24:44 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "Liang, Prike" <Prike.Liang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/5] drm/amd/powerplay: add interface for forcing and
 unforcing dpm limit value
Thread-Topic: [PATCH 2/5] drm/amd/powerplay: add interface for forcing and
 unforcing dpm limit value
Thread-Index: AQHVcerwGKyzIJqGdEat7zgcAuYm5Kc4/OmS
Date: Mon, 23 Sep 2019 09:24:44 +0000
Message-ID: <MN2PR12MB3296B07D1B1FD00D1817E2B7A2850@MN2PR12MB3296.namprd12.prod.outlook.com>
References: <1569228167-3120-1-git-send-email-Prike.Liang@amd.com>,
 <1569228167-3120-2-git-send-email-Prike.Liang@amd.com>
In-Reply-To: <1569228167-3120-2-git-send-email-Prike.Liang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: df705fda-e060-4f1d-46ab-08d74007df07
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3920; 
x-ms-traffictypediagnostic: MN2PR12MB3920:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3920F4601451649E8476176DA2850@MN2PR12MB3920.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-forefront-prvs: 0169092318
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(39860400002)(136003)(366004)(376002)(189003)(199004)(55016002)(478600001)(229853002)(6506007)(102836004)(53546011)(7696005)(2501003)(110136005)(6246003)(76176011)(81156014)(186003)(446003)(8676002)(14454004)(19627405001)(26005)(81166006)(966005)(105004)(11346002)(99286004)(33656002)(25786009)(54906003)(4326008)(66066001)(8936002)(76116006)(7736002)(486006)(256004)(3846002)(6116002)(52536014)(14444005)(6436002)(5660300002)(71200400001)(66946007)(91956017)(66446008)(64756008)(66476007)(66556008)(71190400001)(74316002)(9686003)(6306002)(54896002)(2906002)(316002)(86362001)(236005)(606006)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3920;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: oUwUALjpndnNk1ajQVKCXd+hy7IkLd5FFCrtnVHRfL5klEHgE2FrygiSPcdadCFsBfCk7tAfn20G/yqLvJ3e6Pd0CUXYYlqhU15rmauulTbpajAK9BE0Xx6P/lT3/IcZE/5ViCP4PdPsfxQ7mNk9mEOj1VB5gWXFs7Uxas8Odc0Mxe+LFxcsBZkPE19v88QQw2f/9nD0utYwfFO8M3ihzftEkftP5pS+S2txCbi2J0NF5dltoyRPlqaxC++2gAiwsklRnSCd+Jizq/4TE2d4JrqIbZhg0KCmWjFaMnbawQVhZfmAvdYw1qPrwfgl5G2hQTqDcuNms6QBNtWm+yWdyhmSaZQvMbptLwHMwuBxR6U3hIfnWRNRl3vwn7H5bbkLVt9SFz4u+fTOK4NIGAgJohx9+bCZxE7uZI1FJwjgxCk=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df705fda-e060-4f1d-46ab-08d74007df07
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2019 09:24:44.5779 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zxPeFcoh5P+hDpttuuI08yTIF6Rlf9E92Lj1z//zFCYMDuwmX1R5PC+azbegLlyD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3920
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dI/6cYbMlJayU+5TkVzNJpx7jlojPJ8qDbxJm2uj2JQ=;
 b=ylKms3Ke4LbdXSlaiLaazNxAmArKqlSWAamFe/Qr2rK8cJiowJFV2FR5wsCo3YQxmX3wJS4i5FM8V1nUMGwMmHkTWAWJId1OdFMQY/WYupEqamw1/upM9ZIPG3fdtkYKJmstzCAS1tqbS3E15h7xxAcFzKgo3wkG0l9oTlI5Oys=
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
Cc: "arron.liu@amd.com" <arron.liu@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
 "Feng, Kenneth" <Kenneth.Feng@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>
Content-Type: multipart/mixed; boundary="===============1269875360=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1269875360==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB3296B07D1B1FD00D1817E2B7A2850MN2PR12MB3296namp_"

--_000_MN2PR12MB3296B07D1B1FD00D1817E2B7A2850MN2PR12MB3296namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

comment inline.
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Liang, P=
rike <Prike.Liang@amd.com>
Sent: Monday, September 23, 2019 4:43 PM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: arron.liu@amd.com <arron.liu@amd.com>; Huang, Ray <Ray.Huang@amd.com>; =
Liang, Prike <Prike.Liang@amd.com>; Quan, Evan <Evan.Quan@amd.com>; Feng, K=
enneth <Kenneth.Feng@amd.com>
Subject: [PATCH 2/5] drm/amd/powerplay: add interface for forcing and unfor=
cing dpm limit value

That's base function for forcing and unforcing dpm limit value.

Signed-off-by: Prike Liang <Prike.Liang@amd.com>
---
 drivers/gpu/drm/amd/powerplay/renoir_ppt.c | 62 ++++++++++++++++++++++++++=
++++
 1 file changed, 62 insertions(+)

diff --git a/drivers/gpu/drm/amd/powerplay/renoir_ppt.c b/drivers/gpu/drm/a=
md/powerplay/renoir_ppt.c
index 9311b6a..4bb7e1c 100644
--- a/drivers/gpu/drm/amd/powerplay/renoir_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/renoir_ppt.c
@@ -304,6 +304,66 @@ static int renoir_dpm_set_uvd_enable(struct smu_contex=
t *smu, bool enable)
         return ret;
 }

+static int renoir_force_dpm_limit_value(struct smu_context *smu, bool high=
est)
+{
+       int ret =3D 0, i =3D 0;
+       uint32_t min_freq, max_freq, force_freq;
+       enum smu_clk_type clk_type;
+
+       enum smu_clk_type clks[] =3D {
+               SMU_GFXCLK,
+               SMU_MCLK,
+               SMU_SOCCLK,
+       };
+
+       for (i =3D 0; i < ARRAY_SIZE(clks); i++) {
+               clk_type =3D clks[i];
+               ret =3D smu_get_dpm_freq_range(smu, clk_type, &min_freq, &m=
ax_freq);
+               if (ret)
+                       return ret;
+
+               force_freq =3D highest ? max_freq : min_freq;
+               ret =3D smu_set_soft_freq_range(smu, clk_type, force_freq, =
force_freq);
[kevin]:
this api is depend on message "SetSoftMaxByFreq" and "SetSoftMinByFreq".
the apu has this message? and have you verify it?
+               if (ret)
+                       return ret;
+       }
+
+       return ret;
+}
+
+static int renoir_unforce_dpm_levels(struct smu_context *smu) {
+
+       int ret =3D 0, i =3D 0;
+       uint32_t min_freq, max_freq;
+       enum smu_clk_type clk_type;
+
+       struct clk_feature_map {
+               enum smu_clk_type clk_type;
+               uint32_t        feature;
+       } clk_feature_map[] =3D {
+               {SMU_GFXCLK, SMU_FEATURE_DPM_GFXCLK_BIT},
+               {SMU_MCLK,   SMU_FEATURE_DPM_UCLK_BIT},
+               {SMU_SOCCLK, SMU_FEATURE_DPM_SOCCLK_BIT},
+       };
+
+       for (i =3D 0; i < ARRAY_SIZE(clk_feature_map); i++) {
+               if (!smu_feature_is_enabled(smu, clk_feature_map[i].feature=
))
+                   continue;
+
+               clk_type =3D clk_feature_map[i].clk_type;
+
+               ret =3D smu_get_dpm_freq_range(smu, clk_type, &min_freq, &m=
ax_freq);
+               if (ret)
+                       return ret;
+
+               ret =3D smu_set_soft_freq_range(smu, clk_type, min_freq, ma=
x_freq);
+               if (ret)
+                       return ret;
+       }
+
+       return ret;
+}
+
 static const struct pptable_funcs renoir_ppt_funcs =3D {
         .get_smu_msg_index =3D renoir_get_smu_msg_index,
         .get_smu_table_index =3D renoir_get_smu_table_index,
@@ -313,6 +373,8 @@ static const struct pptable_funcs renoir_ppt_funcs =3D =
{
         .print_clk_levels =3D renoir_print_clk_levels,
         .get_current_power_state =3D renoir_get_current_power_state,
         .dpm_set_uvd_enable =3D renoir_dpm_set_uvd_enable,
+       .force_dpm_limit_value =3D renoir_force_dpm_limit_value,
+       .unforce_dpm_levels =3D renoir_unforce_dpm_levels,
 };

 void renoir_set_ppt_funcs(struct smu_context *smu)
--
2.7.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_MN2PR12MB3296B07D1B1FD00D1817E2B7A2850MN2PR12MB3296namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
comment inline.</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Liang, Prike &lt;Prike.Liang@=
amd.com&gt;<br>
<b>Sent:</b> Monday, September 23, 2019 4:43 PM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> arron.liu@amd.com &lt;arron.liu@amd.com&gt;; Huang, Ray &lt;Ray.=
Huang@amd.com&gt;; Liang, Prike &lt;Prike.Liang@amd.com&gt;; Quan, Evan &lt=
;Evan.Quan@amd.com&gt;; Feng, Kenneth &lt;Kenneth.Feng@amd.com&gt;<br>
<b>Subject:</b> [PATCH 2/5] drm/amd/powerplay: add interface for forcing an=
d unforcing dpm limit value</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">That's base function for forcing and unforcing dpm=
 limit value.<br>
<br>
Signed-off-by: Prike Liang &lt;Prike.Liang@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/powerplay/renoir_ppt.c | 62 &#43;&#43;&#43;&#43;&=
#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&=
#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<br>
&nbsp;1 file changed, 62 insertions(&#43;)<br>
<br>
diff --git a/drivers/gpu/drm/amd/powerplay/renoir_ppt.c b/drivers/gpu/drm/a=
md/powerplay/renoir_ppt.c<br>
index 9311b6a..4bb7e1c 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/renoir_ppt.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/renoir_ppt.c<br>
@@ -304,6 &#43;304,66 @@ static int renoir_dpm_set_uvd_enable(struct smu_co=
ntext *smu, bool enable)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&#43;static int renoir_force_dpm_limit_value(struct smu_context *smu, bool =
highest)<br>
&#43;{<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0, i =3D 0;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t min_freq, max_freq, forc=
e_freq;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum smu_clk_type clk_type;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum smu_clk_type clks[] =3D {<br=
>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; SMU_GFXCLK,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; SMU_MCLK,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; SMU_SOCCLK,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; ARRAY_SIZE(c=
lks); i&#43;&#43;) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; clk_type =3D clks[i];<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; ret =3D smu_get_dpm_freq_range(smu, clk_type, &amp;min_freq,=
 &amp;max_freq);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (ret)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<=
br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; force_freq =3D highest ? max_freq : min_freq;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; ret =3D smu_set_soft_freq_range(smu, clk_type, force_freq, f=
orce_freq);</div>
<div class=3D"PlainText">[kevin]:</div>
<div class=3D"PlainText">this api is depend on message &quot;SetSoftMaxByFr=
eq&quot; and &quot;SetSoftMinByFreq&quot;.</div>
<div class=3D"PlainText">the apu has this message? and have you verify it?<=
/div>
<div class=3D"PlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<=
br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&#43;}<br>
&#43;<br>
&#43;static int renoir_unforce_dpm_levels(struct smu_context *smu) {<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0, i =3D 0;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t min_freq, max_freq;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum smu_clk_type clk_type;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct clk_feature_map {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; enum smu_clk_type clk_type;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; uint32_t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; feature;<=
br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } clk_feature_map[] =3D {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; {SMU_GFXCLK, SMU_FEATURE_DPM_GFXCLK_BIT},<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; {SMU_MCLK,&nbsp;&nbsp; SMU_FEATURE_DPM_UCLK_BIT},<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; {SMU_SOCCLK, SMU_FEATURE_DPM_SOCCLK_BIT},<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; ARRAY_SIZE(c=
lk_feature_map); i&#43;&#43;) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (!smu_feature_is_enabled(smu, clk_feature_map[i].feature)=
)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; clk_type =3D clk_feature_map[i].clk_type;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; ret =3D smu_get_dpm_freq_range(smu, clk_type, &amp;min_freq,=
 &amp;max_freq);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (ret)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<=
br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; ret =3D smu_set_soft_freq_range(smu, clk_type, min_freq, max=
_freq);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (ret)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<=
br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&#43;}<br>
&#43;<br>
&nbsp;static const struct pptable_funcs renoir_ppt_funcs =3D {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_smu_msg_index =3D ren=
oir_get_smu_msg_index,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_smu_table_index =3D r=
enoir_get_smu_table_index,<br>
@@ -313,6 &#43;373,8 @@ static const struct pptable_funcs renoir_ppt_funcs =
=3D {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .print_clk_levels =3D reno=
ir_print_clk_levels,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_current_power_state =
=3D renoir_get_current_power_state,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dpm_set_uvd_enable =3D re=
noir_dpm_set_uvd_enable,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .force_dpm_limit_value =3D renoir=
_force_dpm_limit_value,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .unforce_dpm_levels =3D renoir_un=
force_dpm_levels,<br>
&nbsp;};<br>
&nbsp;<br>
&nbsp;void renoir_set_ppt_funcs(struct smu_context *smu)<br>
-- <br>
2.7.4<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</body>
</html>

--_000_MN2PR12MB3296B07D1B1FD00D1817E2B7A2850MN2PR12MB3296namp_--

--===============1269875360==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1269875360==--
