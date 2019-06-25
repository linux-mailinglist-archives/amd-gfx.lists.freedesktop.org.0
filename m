Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52ED152964
	for <lists+amd-gfx@lfdr.de>; Tue, 25 Jun 2019 12:25:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E296F6E0CA;
	Tue, 25 Jun 2019 10:25:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810074.outbound.protection.outlook.com [40.107.81.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F6946E0CA
 for <amd-gfx@lists.freedesktop.org>; Tue, 25 Jun 2019 10:25:41 +0000 (UTC)
Received: from MN2PR12MB3312.namprd12.prod.outlook.com (20.179.83.160) by
 MN2PR12MB3277.namprd12.prod.outlook.com (20.179.82.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Tue, 25 Jun 2019 10:25:39 +0000
Received: from MN2PR12MB3312.namprd12.prod.outlook.com
 ([fe80::842b:e55b:7196:50f5]) by MN2PR12MB3312.namprd12.prod.outlook.com
 ([fe80::842b:e55b:7196:50f5%6]) with mapi id 15.20.2008.017; Tue, 25 Jun 2019
 10:25:39 +0000
From: "Cui, Flora" <Flora.Cui@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/amdgpu: fix scheduler timeout calc
Thread-Topic: [PATCH v2] drm/amdgpu: fix scheduler timeout calc
Thread-Index: AQHVKzp2dcoa3Bsw+UiWEOtivzzdFqasKdw1
Date: Tue, 25 Jun 2019 10:25:39 +0000
Message-ID: <MN2PR12MB3312C7875A7F2E1791572934FAE30@MN2PR12MB3312.namprd12.prod.outlook.com>
References: <1561455804-9644-1-git-send-email-flora.cui@amd.com>
In-Reply-To: <1561455804-9644-1-git-send-email-flora.cui@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2409:891e:6a20:27b6:a51f:3b18:bf4c:281d]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b89901df-4dd8-49dc-9349-08d6f9577833
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3277; 
x-ms-traffictypediagnostic: MN2PR12MB3277:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB3277D306CB5D41CDAABD2E70FAE30@MN2PR12MB3277.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0079056367
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(136003)(376002)(346002)(366004)(396003)(189003)(199004)(45080400002)(72206003)(52536014)(102836004)(229853002)(478600001)(316002)(2906002)(236005)(53936002)(68736007)(46003)(76176011)(7696005)(6246003)(53546011)(14454004)(86362001)(6506007)(66946007)(11346002)(25786009)(476003)(74316002)(66556008)(66476007)(6436002)(2501003)(486006)(5660300002)(5640700003)(73956011)(7736002)(6916009)(76116006)(91956017)(6116002)(6306002)(256004)(81166006)(81156014)(8676002)(54896002)(8936002)(9686003)(14444005)(99286004)(2351001)(71200400001)(71190400001)(66446008)(64756008)(55016002)(606006)(186003)(33656002)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3277;
 H:MN2PR12MB3312.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: sWGIQqtU4wNnXiFX3vuIoDqLU2UKyuvoVZMpkgX689yW20bJBzuxhLYN492vX55Qx9vIUqdrX64pymj/k+PXtRWRg55krgcTgJUVMitzBmrMlFQZYD6evChFpXi0ESdcf1d06DnZoKBrX1SrR+P2ffQqiHhdoft+DtKXrG4qjVY6MMKi2Fh3gpxFc7oLRNs5X78/6YGlTnK1nL4L7ojqLy8D6XG08Z1eEf6sydQTcHpmUwJt9qhDQht03T0pE0nCoafw0Lij+KWP56s/xIbV6ldQctGL+w1n+ZKMA5X4Qf4mz2LI+czWuaX1jXclDT9dDNx60vbqnpkZlIF+JvCSO4Zy7LKBvJPPCG44gkzFaY3VWr7BH7fD2eVCYdZZ5D8mFbgCDKcZIBqnB/VPx9Gw6Pl71IdiSSh2F9vl0f4Qd7A=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b89901df-4dd8-49dc-9349-08d6f9577833
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2019 10:25:39.2241 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fcui@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3277
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vo1utjDUzcwlDNHmYEGcz7+8EEyL3iIWV7E7cMfX6OY=;
 b=pkaS1xb4hbN/cXLEr9EteXheunaaZgx5ZQWo2G0gpq5koTiZNKJDM/ezU1JDwQFpoD8B+0WDH87G5f+rSpyJkGmXCDbmmyVSrIGdXlPJROHupeVotJ6DqRfxURb3+quR3J3dpxzLa2g2Ait8hc40V3+BEkVfFdfHVVB0NiPJi1M=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Flora.Cui@amd.com; 
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
Content-Type: multipart/mixed; boundary="===============1811559942=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1811559942==
Content-Language: en-GB
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB3312C7875A7F2E1791572934FAE30MN2PR12MB3312namp_"

--_000_MN2PR12MB3312C7875A7F2E1791572934FAE30MN2PR12MB3312namp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

cGxlYXNlIGlnbm9yZSB0aGlzIG1haWwuIEknbGwgcHJlcGFyZSB2MyBwYXRjaCB0byBzaW1wbGlm
eSBjb2RlIGxvZ2ljLg0KDQq78cihIE91dGxvb2sgZm9yIEFuZHJvaWQ8aHR0cHM6Ly9ha2EubXMv
Z2hlaTM2Pg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KRnJvbTogQ3VpLCBG
bG9yYQ0KU2VudDogVHVlc2RheSwgSnVuZSAyNSwgMjAxOSA1OjQzOjM4IFBNDQpUbzogYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBDdWksIEZsb3JhDQpTdWJqZWN0OiBbUEFUQ0gg
djJdIGRybS9hbWRncHU6IGZpeCBzY2hlZHVsZXIgdGltZW91dCBjYWxjDQoNCnNjaGVkdWxlciB0
aW1lb3V0IGlzIGluIGppZmZpZXMNCnYyOiBtb3ZlIHRpbWVvdXQgY2hlY2sgdG8gYW1kZ3B1X2Rl
dmljZV9nZXRfam9iX3RpbWVvdXRfc2V0dGluZ3MgYWZ0ZXINCnBhcnNpbmcgdGhlIHZhbHVlICYg
YWRkIG5lZ2F0aXZlIHZhbHVlIGNoZWNrDQoNCkNoYW5nZS1JZDogSTI2NzA4YzE2M2RiOTQzZmY4
ZDkzMGRkODFiY2FiNGI0YjlkODRlYjINClNpZ25lZC1vZmYtYnk6IEZsb3JhIEN1aSA8ZmxvcmEu
Y3VpQGFtZC5jb20+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2
LmMgfCA2ICsrKysrLQ0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9k
cnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYw0KaW5kZXggN2Nm
NmFiMC4uNzIwNmQwZCAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9kcnYuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5j
DQpAQCAtMTMwMCw3ICsxMzAwLDcgQEAgaW50IGFtZGdwdV9kZXZpY2VfZ2V0X2pvYl90aW1lb3V0
X3NldHRpbmdzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KICAgICAgICAgICogQnkgZGVm
YXVsdCB0aW1lb3V0IGZvciBub24gY29tcHV0ZSBqb2JzIGlzIDEwMDAwLg0KICAgICAgICAgICog
QW5kIHRoZXJlIGlzIG5vIHRpbWVvdXQgZW5mb3JjZWQgb24gY29tcHV0ZSBqb2JzLg0KICAgICAg
ICAgICovDQotICAgICAgIGFkZXYtPmdmeF90aW1lb3V0ID0gYWRldi0+c2RtYV90aW1lb3V0ID0g
YWRldi0+dmlkZW9fdGltZW91dCA9IDEwMDAwOw0KKyAgICAgICBhZGV2LT5nZnhfdGltZW91dCA9
IGFkZXYtPnNkbWFfdGltZW91dCA9IGFkZXYtPnZpZGVvX3RpbWVvdXQgPSBtc2Vjc190b19qaWZm
aWVzKDEwMDAwKTsNCiAgICAgICAgIGFkZXYtPmNvbXB1dGVfdGltZW91dCA9IE1BWF9TQ0hFRFVM
RV9USU1FT1VUOw0KDQogICAgICAgICBpZiAoc3RybmxlbihpbnB1dCwgQU1ER1BVX01BWF9USU1F
T1VUX1BBUkFNX0xFTlRIKSkgew0KQEAgLTEzMTQsNiArMTMxNCwxMCBAQCBpbnQgYW1kZ3B1X2Rl
dmljZV9nZXRfam9iX3RpbWVvdXRfc2V0dGluZ3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYp
DQogICAgICAgICAgICAgICAgICAgICAgICAgaWYgKHRpbWVvdXQgPD0gMCkgew0KICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgaW5kZXgrKzsNCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGNvbnRpbnVlOw0KKyAgICAgICAgICAgICAgICAgICAgICAgfSBlbHNlIGlmICgo
bG9uZyltc2Vjc190b19qaWZmaWVzKHRpbWVvdXQpIDwgMCkgew0KKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB0aW1lb3V0ID0gTUFYX1NDSEVEVUxFX1RJTUVPVVQ7DQorICAgICAgICAg
ICAgICAgICAgICAgICB9IGVsc2Ugew0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0
aW1lb3V0ID0gbXNlY3NfdG9famlmZmllcyh0aW1lb3V0KTsNCiAgICAgICAgICAgICAgICAgICAg
ICAgICB9DQoNCiAgICAgICAgICAgICAgICAgICAgICAgICBzd2l0Y2ggKGluZGV4KyspIHsNCi0t
DQoyLjcuNA0KDQo=

--_000_MN2PR12MB3312C7875A7F2E1791572934FAE30MN2PR12MB3312namp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<div>
<div dir=3D"auto" style=3D"direction:ltr; margin:0; padding:0; font-family:=
sans-serif; font-size:11pt; color:black">
please ignore this mail. I'll prepare v3 patch to simplify code logic.<br>
<br>
</div>
<div dir=3D"auto" style=3D"direction:ltr; margin:0; padding:0; font-family:=
sans-serif; font-size:11pt; color:black">
<span id=3D"x_OutlookSignature">
<div dir=3D"auto" style=3D"direction:ltr; margin:0; padding:0; font-family:=
sans-serif; font-size:11pt; color:black">
=BB=F1=C8=A1 <a href=3D"https://aka.ms/ghei36">Outlook for Android</a></div=
>
</span><br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Cui, Flora<br>
<b>Sent:</b> Tuesday, June 25, 2019 5:43:38 PM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org<br>
<b>Cc:</b> Cui, Flora<br>
<b>Subject:</b> [PATCH v2] drm/amdgpu: fix scheduler timeout calc</font>
<div>&nbsp;</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:11pt;">
<div class=3D"PlainText">scheduler timeout is in jiffies<br>
v2: move timeout check to amdgpu_device_get_job_timeout_settings after<br>
parsing the value &amp; add negative value check<br>
<br>
Change-Id: I26708c163db943ff8d930dd81bcab4b4b9d84eb2<br>
Signed-off-by: Flora Cui &lt;flora.cui@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 6 &#43;&#43;&#43;&#43;&#43;=
-<br>
&nbsp;1 file changed, 5 insertions(&#43;), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_drv.c<br>
index 7cf6ab0..7206d0d 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c<br>
@@ -1300,7 &#43;1300,7 @@ int amdgpu_device_get_job_timeout_settings(struct=
 amdgpu_device *adev)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * By default timeout=
 for non compute jobs is 10000.<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * And there is no ti=
meout enforced on compute jobs.<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;gfx_timeout =3D adev-&gt;sdm=
a_timeout =3D adev-&gt;video_timeout =3D 10000;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;gfx_timeout =3D adev-&gt=
;sdma_timeout =3D adev-&gt;video_timeout =3D msecs_to_jiffies(10000);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;compute_timeout =
=3D MAX_SCHEDULE_TIMEOUT;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strnlen(input, AMDGPU_=
MAX_TIMEOUT_PARAM_LENTH)) {<br>
@@ -1314,6 &#43;1314,10 @@ int amdgpu_device_get_job_timeout_settings(struc=
t amdgpu_device *adev)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (t=
imeout &lt;=3D 0) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; index&#43;&#43;;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else if ((=
long)msecs_to_jiffies(timeout) &lt; 0) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; timeout =3D MAX_SCHEDULE_TIMEOUT;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; timeout =3D msecs_to_jiffies(timeout);<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switc=
h (index&#43;&#43;) {<br>
-- <br>
2.7.4<br>
<br>
</div>
</span></font>
</body>
</html>

--_000_MN2PR12MB3312C7875A7F2E1791572934FAE30MN2PR12MB3312namp_--

--===============1811559942==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1811559942==--
