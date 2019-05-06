Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3D215357
	for <lists+amd-gfx@lfdr.de>; Mon,  6 May 2019 20:03:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CC9289B97;
	Mon,  6 May 2019 18:03:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790080.outbound.protection.outlook.com [40.107.79.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AED589B97
 for <amd-gfx@lists.freedesktop.org>; Mon,  6 May 2019 18:03:03 +0000 (UTC)
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1123.namprd12.prod.outlook.com (10.168.226.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.10; Mon, 6 May 2019 18:03:01 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::bc5b:de68:25b7:d853]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::bc5b:de68:25b7:d853%12]) with mapi id 15.20.1856.012; Mon, 6 May 2019
 18:03:01 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: =?iso-8859-1?Q?Christian_K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dufresnep@gmail.com" <dufresnep@gmail.com>, "werner.lueckel@googlemail.com"
 <werner.lueckel@googlemail.com>
Subject: Re: [PATCH] drm/radeon: prefer lower reference dividers
Thread-Topic: [PATCH] drm/radeon: prefer lower reference dividers
Thread-Index: AQHVBDXOQW+mFw7cbEmDtpXQ4CTCLKZeY2mR
Date: Mon, 6 May 2019 18:03:01 +0000
Message-ID: <BN6PR12MB1809DC5F6CBF5B4A2FE9E7B6F7300@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190506180140.2733-1-christian.koenig@amd.com>
In-Reply-To: <20190506180140.2733-1-christian.koenig@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.84.143]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d3ef396a-e0ff-40c2-bf90-08d6d24d146a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1123; 
x-ms-traffictypediagnostic: BN6PR12MB1123:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <BN6PR12MB112314B0A54CB919B1818CAFF7300@BN6PR12MB1123.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2276;
x-forefront-prvs: 0029F17A3F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(376002)(136003)(366004)(346002)(39860400002)(396003)(189003)(199004)(66476007)(33656002)(316002)(7696005)(66556008)(8676002)(76176011)(8936002)(14444005)(105004)(256004)(110136005)(446003)(99286004)(2501003)(74316002)(7736002)(86362001)(66946007)(476003)(52536014)(2201001)(25786009)(6436002)(66446008)(64756008)(76116006)(68736007)(26005)(5660300002)(73956011)(11346002)(486006)(81166006)(81156014)(186003)(71190400001)(71200400001)(6246003)(6306002)(2906002)(55016002)(54896002)(3846002)(6116002)(9686003)(53936002)(229853002)(53546011)(6506007)(102836004)(66574012)(236005)(19627405001)(966005)(72206003)(606006)(66066001)(14454004)(478600001)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1123;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: itRhvGoAbfgyU/TJrgsH4soKzKfBNr0gJezjgWuHejQbaH1hy72cCsj5yG3E5XFHoug9CCzDENRshLo0dJU2vZ5otvI0a9pSwWl02GRUbvc3kzNdLd4Y7k9ljTSiKCkUJWHs2+6SEwL37PI8BSdGW9dm6GF3OLV4MO9zu+uwd7H9rR6pIktF8NuVyIe8BJnGAkh9ZzBWyJTTXBUvWjPRajL1ZQThw/QOKSOjmYVEpOuq6UjYMXcyG07k5xkrwE0ZuARI0AZaXqNZx+O+6wSB0Nlpf/AYGVe5KXIOLyuK3u66WX86onyhyunc+MY47zIDAtBqj2GrnPD9+a5FoOimtCqiQOetv8b7nz/Ppwt9gvsEtFLHH7OSEGj2w/tAB9MYggEgaN+ZPNSIT6+R1VymqiyBEE1wvjDWpsgYHXKkIzI=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3ef396a-e0ff-40c2-bf90-08d6d24d146a
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2019 18:03:01.5127 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1123
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2mHwsDpxDKV+Qx05H6IiE6T9FR8s106TJYV72oe5etM=;
 b=aYFSXXHDhr09AqY2QF8JJSoDPpK2HjF9JbGTYvpw0WjNNTvtEZr4SpLC+UqdIGHVXZRxZL0TpjqAaDfIJra6pdMtrjSRs4eds71g+RYnyblduPvmxiO+hZoyXoPLryFJisHUlklA7UK9eNsjsnoQkN0GIAU3xHB898zrtx0WlOk=
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
Content-Type: multipart/mixed; boundary="===============1920002441=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1920002441==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB1809DC5F6CBF5B4A2FE9E7B6F7300BN6PR12MB1809namp_"

--_000_BN6PR12MB1809DC5F6CBF5B4A2FE9E7B6F7300BN6PR12MB1809namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Acked-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Christia=
n K=F6nig <ckoenig.leichtzumerken@gmail.com>
Sent: Monday, May 6, 2019 2:01 PM
To: amd-gfx@lists.freedesktop.org; dufresnep@gmail.com; werner.lueckel@goog=
lemail.com
Subject: [PATCH] drm/radeon: prefer lower reference dividers

[CAUTION: External Email]

Instead of the closest reference divider prefer the lowest,
this fixes flickering issues on HP Compaq nx9420.

Bugs: https://bugs.freedesktop.org/show_bug.cgi?id=3D108514
Suggested-by:  Paul Dufresne <dufresnep@gmail.com>
Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
---
 drivers/gpu/drm/radeon/radeon_display.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/rade=
on/radeon_display.c
index 9d3ac8b981da..d8e2d7b3b836 100644
--- a/drivers/gpu/drm/radeon/radeon_display.c
+++ b/drivers/gpu/drm/radeon/radeon_display.c
@@ -921,12 +921,12 @@ static void avivo_get_fb_ref_div(unsigned nom, unsign=
ed den, unsigned post_div,
        ref_div_max =3D max(min(100 / post_div, ref_div_max), 1u);

        /* get matching reference and feedback divider */
-       *ref_div =3D min(max(DIV_ROUND_CLOSEST(den, post_div), 1u), ref_div=
_max);
+       *ref_div =3D min(max(den/post_div, 1u), ref_div_max);
        *fb_div =3D DIV_ROUND_CLOSEST(nom * *ref_div * post_div, den);

        /* limit fb divider to its maximum */
        if (*fb_div > fb_div_max) {
-               *ref_div =3D DIV_ROUND_CLOSEST(*ref_div * fb_div_max, *fb_d=
iv);
+               *ref_div =3D (*ref_div * fb_div_max)/(*fb_div);
                *fb_div =3D fb_div_max;
        }
 }
--
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB1809DC5F6CBF5B4A2FE9E7B6F7300BN6PR12MB1809namp_
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
Acked-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Christian K=F6nig &lt;ckoenig=
.leichtzumerken@gmail.com&gt;<br>
<b>Sent:</b> Monday, May 6, 2019 2:01 PM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org; dufresnep@gmail.com; werner.lueck=
el@googlemail.com<br>
<b>Subject:</b> [PATCH] drm/radeon: prefer lower reference dividers</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">[CAUTION: External Email]<br>
<br>
Instead of the closest reference divider prefer the lowest,<br>
this fixes flickering issues on HP Compaq nx9420.<br>
<br>
Bugs: <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108514">htt=
ps://bugs.freedesktop.org/show_bug.cgi?id=3D108514</a><br>
Suggested-by:&nbsp; Paul Dufresne &lt;dufresnep@gmail.com&gt;<br>
Signed-off-by: Christian K=F6nig &lt;christian.koenig@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/radeon/radeon_display.c | 4 &#43;&#43;--<br>
&nbsp;1 file changed, 2 insertions(&#43;), 2 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/rade=
on/radeon_display.c<br>
index 9d3ac8b981da..d8e2d7b3b836 100644<br>
--- a/drivers/gpu/drm/radeon/radeon_display.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/radeon/radeon_display.c<br>
@@ -921,12 &#43;921,12 @@ static void avivo_get_fb_ref_div(unsigned nom, un=
signed den, unsigned post_div,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ref_div_max =3D max(min(100 / po=
st_div, ref_div_max), 1u);<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* get matching reference and fe=
edback divider */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *ref_div =3D min(max(DIV_ROUND_CLOSES=
T(den, post_div), 1u), ref_div_max);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *ref_div =3D min(max(den/post_div=
, 1u), ref_div_max);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *fb_div =3D DIV_ROUND_CLOSEST(no=
m * *ref_div * post_div, den);<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* limit fb divider to its maxim=
um */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (*fb_div &gt; fb_div_max) {<b=
r>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; *ref_div =3D DIV_ROUND_CLOSEST(*ref_div * fb_div_max, *fb_div);<=
br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; *ref_div =3D (*ref_div * fb_div_max)/(*fb_div);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; *fb_div =3D fb_div_max;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;}<br>
--<br>
2.17.1<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a><br>
</div>
</span></font></div>
</body>
</html>

--_000_BN6PR12MB1809DC5F6CBF5B4A2FE9E7B6F7300BN6PR12MB1809namp_--

--===============1920002441==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1920002441==--
