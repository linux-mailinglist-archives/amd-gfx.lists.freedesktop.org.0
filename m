Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 932C3E3D6
	for <lists+amd-gfx@lfdr.de>; Mon, 29 Apr 2019 15:35:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE98788427;
	Mon, 29 Apr 2019 13:35:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680053.outbound.protection.outlook.com [40.107.68.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08E1B88427
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Apr 2019 13:35:34 +0000 (UTC)
Received: from DM5PR12MB1371.namprd12.prod.outlook.com (10.168.239.22) by
 DM5PR12MB1771.namprd12.prod.outlook.com (10.175.90.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.12; Mon, 29 Apr 2019 13:35:32 +0000
Received: from DM5PR12MB1371.namprd12.prod.outlook.com
 ([fe80::39d2:385d:79d5:56fb]) by DM5PR12MB1371.namprd12.prod.outlook.com
 ([fe80::39d2:385d:79d5:56fb%7]) with mapi id 15.20.1835.010; Mon, 29 Apr 2019
 13:35:32 +0000
From: "Lin, Amber" <Amber.Lin@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, "Russell, Kent"
 <Kent.Russell@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Messinger,
 Ori" <Ori.Messinger@amd.com>
Subject: Re: print firmware versions on amdgpu sysfs
Thread-Topic: print firmware versions on amdgpu sysfs
Thread-Index: AQHU/DpbGKOfvdp+B0OnZkn1qil2G6ZOni2AgAAmnmCABE8NgIAAFIWA
Date: Mon, 29 Apr 2019 13:35:32 +0000
Message-ID: <940a48aa-33c1-55a6-2bf1-a794aa0e746b@amd.com>
References: <355c6cb6-ccf7-ef6f-4f34-0e978b9effe2@amd.com>
 <CY4PR12MB18136C9A3F7719CFD0C50D60F73E0@CY4PR12MB1813.namprd12.prod.outlook.com>
 <BN6PR12MB1618CE8C21ED572094D9BB10853E0@BN6PR12MB1618.namprd12.prod.outlook.com>
 <d6c60e91-4311-069b-0612-03337830481d@gmail.com>
In-Reply-To: <d6c60e91-4311-069b-0612-03337830481d@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: QB1PR01CA0022.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:2d::35) To DM5PR12MB1371.namprd12.prod.outlook.com
 (2603:10b6:3:78::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 20c27b44-e470-4c05-0230-08d6cca78cf9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1771; 
x-ms-traffictypediagnostic: DM5PR12MB1771:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM5PR12MB177133BC07C93C42FE3A89B1E1390@DM5PR12MB1771.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0022134A87
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(376002)(136003)(39860400002)(346002)(366004)(189003)(199004)(68736007)(26005)(6436002)(102836004)(486006)(66066001)(6486002)(7736002)(186003)(31696002)(54896002)(2906002)(6306002)(2501003)(446003)(386003)(110136005)(11346002)(476003)(53546011)(36756003)(6506007)(4326008)(53936002)(6512007)(236005)(2616005)(31686004)(6636002)(6246003)(97736004)(5660300002)(8936002)(81156014)(81166006)(25786009)(8676002)(316002)(229853002)(14454004)(6116002)(256004)(3846002)(72206003)(966005)(478600001)(52116002)(76176011)(99286004)(93886005)(66946007)(64756008)(66446008)(66556008)(66476007)(73956011)(606006)(71190400001)(71200400001)(86362001)(19627405001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1771;
 H:DM5PR12MB1371.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: eUREp8uq8+Qbi9Q8yBqeajvc93tc14CqJjMDJflGp7pAqXgbQkTjnZcdQWqhY5KS7D8MuxicxPtyhJBUjL+92p6S7a5JEmnDNhFWUJfHNJ5eKaGT4Y/hBBE0Ddfbn6wT+H+bFFwxvVPyTAg4toTnTQBnC64Iz7pn0IENG3W4Bhsi9B6/CEihoCEDpBdVyk2KPi5BeJG1xmf9Xvjpc8No6eE0oBS+jrNkgwr9zSt3KMdlXC8SmQDwf73aR1Yv6IKpafnsjST7XDYs3n9A4GHp7lZfWlOuUvHnVlC3Ej6PjXpIk47Aw/Cxt18henB48aIvc4b6zbsQA1ekXaOQPl4EEbvnGEcpZO//teQSxDHJH/6N77YP2alDrFjAnYkeinUzyL7z/QqHcoQ3N1Eso2PsMPS4k2oLnlMXUmZc1zl9q2A=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20c27b44-e470-4c05-0230-08d6cca78cf9
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2019 13:35:32.0371 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1771
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rzckHqGl8Oarn7h5AyE9ykufoegAwzn6EdpELxpdY3o=;
 b=pi5r3c+pFqe/Ff745fa/PuMObNKP1dBYl8wP3qyIFO2BUal7rL48VunhH47cKOHulpWWMVkq/GwQU0XOpIF7d3byqyp2/ez2ZpICP0CX031TERHgpkwhSDteDBPdisypyQndIk8DqQM+TsoczvwWeQ5rmKJVzWwHPQzyRvmVkb8=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Amber.Lin@amd.com; 
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
Cc: "Freehill, Chris" <Chris.Freehill@amd.com>
Content-Type: multipart/mixed; boundary="===============0432631378=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0432631378==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_940a48aa33c155a62bf1a794aa0e746bamdcom_"

--_000_940a48aa33c155a62bf1a794aa0e746bamdcom_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Thank you Alex and Christian for the feedback. Ori will try to add ioctl in=
to SMI CLI to retrieve firmware versions.

Amber

On 2019-04-29 8:22 a.m., Christian K=F6nig wrote:
We just need to keep in mind that sysfs has more restrictions than debugfs.

E.g. one value per file, backward compatibility etc...

Apart from that I don't see any reason to not do it in sysfs.

Christian.

Am 26.04.19 um 20:35 schrieb Russell, Kent:
The main reasoning and use case for sysfs would be the SMI CLI, since unfor=
tunately there is no ioctl support in there.

Kent

KENT RUSSELL
Sr. Software Engineer | Linux Compute Kernel
1 Commerce Valley Drive East
Markham, ON L3T 7X6
O +(1) 289-695-2122 | Ext 72122
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org><mailto:amd-gfx-bounce=
s@lists.freedesktop.org> on behalf of Deucher, Alexander <Alexander.Deucher=
@amd.com><mailto:Alexander.Deucher@amd.com>
Sent: Friday, April 26, 2019 12:18:22 PM
To: Lin, Amber; amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesk=
top.org>
Cc: Freehill, Chris
Subject: Re: print firmware versions on amdgpu sysfs

We also expose the firmware versions via ioctl which is what the UMDs uses.=
  If you'd prefer it in sysfs, we could do that too.

Alex

________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org><mailto:amd-gfx-bounce=
s@lists.freedesktop.org> on behalf of Lin, Amber <Amber.Lin@amd.com><mailto=
:Amber.Lin@amd.com>
Sent: Friday, April 26, 2019 10:14 AM
To: amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>
Cc: Freehill, Chris
Subject: print firmware versions on amdgpu sysfs

Hi Alex,

Currently we retrieve firmware versions from /sys/kernel/debug but this
requires debugfs being enabled and superuser privilege. Do you see a
concern we add firmware versions to amdgpu sysfs at
/sys/class/drm/cardX/device like vbios_version?

Regards,
Amber
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>
https://lists.freedesktop.org/mailman/listinfo/amd-gfx



_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>
https://lists.freedesktop.org/mailman/listinfo/amd-gfx



--_000_940a48aa33c155a62bf1a794aa0e746bamdcom_
Content-Type: text/html; charset="Windows-1252"
Content-ID: <69B9F77A6402CB44B0D2879DBDA24030@namprd12.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
</head>
<body text=3D"#000000" bgcolor=3D"#FFFFFF">
Thank you Alex and Christian for the feedback. Ori will try to add ioctl in=
to SMI CLI to retrieve firmware versions.<br>
<br>
Amber<br>
<br>
<div class=3D"moz-cite-prefix">On 2019-04-29 8:22 a.m., Christian K=F6nig w=
rote:<br>
</div>
<blockquote type=3D"cite" cite=3D"mid:d6c60e91-4311-069b-0612-03337830481d@=
gmail.com">
<div class=3D"moz-cite-prefix">We just need to keep in mind that sysfs has =
more restrictions than debugfs.<br>
<br>
E.g. one value per file, backward compatibility etc...<br>
<br>
Apart from that I don't see any reason to not do it in sysfs.<br>
<br>
Christian. <br>
<br>
Am 26.04.19 um 20:35 schrieb Russell, Kent:<br>
</div>
<blockquote type=3D"cite" cite=3D"mid:BN6PR12MB1618CE8C21ED572094D9BB10853E=
0@BN6PR12MB1618.namprd12.prod.outlook.com">
The main reasoning and use case for sysfs would be the SMI CLI, since unfor=
tunately there is no ioctl support in there.
<br>
<br>
Kent<br>
<br>
KENT RUSSELL<br>
Sr. Software Engineer | Linux Compute Kernel<br>
1 Commerce Valley Drive East<br>
Markham, ON L3T 7X6<br>
O &#43;(1) 289-695-2122 | Ext 72122<br>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size:11pt" face=
=3D"Calibri, sans-serif" color=3D"#000000"><b>From:</b> amd-gfx
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:amd-gfx-bounces@lists.fre=
edesktop.org" moz-do-not-send=3D"true">
&lt;amd-gfx-bounces@lists.freedesktop.org&gt;</a> on behalf of Deucher, Ale=
xander <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:Alexander.Deucher@=
amd.com" moz-do-not-send=3D"true">
&lt;Alexander.Deucher@amd.com&gt;</a><br>
<b>Sent:</b> Friday, April 26, 2019 12:18:22 PM<br>
<b>To:</b> Lin, Amber; <a class=3D"moz-txt-link-abbreviated" href=3D"mailto=
:amd-gfx@lists.freedesktop.org" moz-do-not-send=3D"true">
amd-gfx@lists.freedesktop.org</a><br>
<b>Cc:</b> Freehill, Chris<br>
<b>Subject:</b> Re: print firmware versions on amdgpu sysfs</font>
<div>&nbsp;</div>
</div>
<style type=3D"text/css" style=3D"display:none">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;
            font-size:12pt; color:rgb(0,0,0)">
We also expose the firmware versions via ioctl which is what the UMDs uses.=
&nbsp; If you'd prefer it in sysfs, we could do that too.<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;
            font-size:12pt; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;
            font-size:12pt; color:rgb(0,0,0)">
Alex</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;
            font-size:12pt; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size:11pt" face=
=3D"Calibri, sans-serif" color=3D"#000000"><b>From:</b> amd-gfx
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:amd-gfx-bounces@lists.fre=
edesktop.org" moz-do-not-send=3D"true">
&lt;amd-gfx-bounces@lists.freedesktop.org&gt;</a> on behalf of Lin, Amber <=
a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:Amber.Lin@amd.com" moz-do-=
not-send=3D"true">
&lt;Amber.Lin@amd.com&gt;</a><br>
<b>Sent:</b> Friday, April 26, 2019 10:14 AM<br>
<b>To:</b> <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:amd-gfx@lis=
ts.freedesktop.org" moz-do-not-send=3D"true">
amd-gfx@lists.freedesktop.org</a><br>
<b>Cc:</b> Freehill, Chris<br>
<b>Subject:</b> print firmware versions on amdgpu sysfs</font>
<div>&nbsp;</div>
</div>
<div class=3D"x_BodyFragment"><font size=3D"2"><span style=3D"font-size:11p=
t">
<div class=3D"x_PlainText">Hi Alex,<br>
<br>
Currently we retrieve firmware versions from /sys/kernel/debug but this <br=
>
requires debugfs being enabled and superuser privilege. Do you see a <br>
concern we add firmware versions to amdgpu sysfs at <br>
/sys/class/drm/cardX/device like vbios_version?<br>
<br>
Regards,<br>
Amber<br>
_______________________________________________<br>
amd-gfx mailing list<br>
<a class=3D"moz-txt-link-abbreviated" href=3D"mailto:amd-gfx@lists.freedesk=
top.org" moz-do-not-send=3D"true">amd-gfx@lists.freedesktop.org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx" moz-do-n=
ot-send=3D"true">https://lists.freedesktop.org/mailman/listinfo/amd-gfx</a>=
</div>
</span></font></div>
</div>
<br>
<fieldset class=3D"mimeAttachmentHeader"></fieldset>
<pre class=3D"moz-quote-pre" wrap=3D"">____________________________________=
___________
amd-gfx mailing list
<a class=3D"moz-txt-link-abbreviated" href=3D"mailto:amd-gfx@lists.freedesk=
top.org" moz-do-not-send=3D"true">amd-gfx@lists.freedesktop.org</a>
<a class=3D"moz-txt-link-freetext" href=3D"https://lists.freedesktop.org/ma=
ilman/listinfo/amd-gfx" moz-do-not-send=3D"true">https://lists.freedesktop.=
org/mailman/listinfo/amd-gfx</a></pre>
</blockquote>
<br>
</blockquote>
<br>
</body>
</html>

--_000_940a48aa33c155a62bf1a794aa0e746bamdcom_--

--===============0432631378==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0432631378==--
