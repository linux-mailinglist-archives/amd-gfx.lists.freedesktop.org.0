Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 246CFAB349
	for <lists+amd-gfx@lfdr.de>; Fri,  6 Sep 2019 09:36:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9287A6E181;
	Fri,  6 Sep 2019 07:36:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760050.outbound.protection.outlook.com [40.107.76.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31FB56E181
 for <amd-gfx@lists.freedesktop.org>; Fri,  6 Sep 2019 07:36:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zz+3IaS8H+GMC+PuJ1qjnmJUJ2niWJO+Svd1uqvQbVpsK58tKYI4N5JyK+lUQHNUnx6cALUj+Eh5Ll6vpe+y1DEu1QJ20Sbm9uNQ90cX/EgKMtBdI1aTg9FESqgDeH2ISULiz6Lqc0ZOtuerN0aVgoHDh3N2HmBdwCpES4IqFVk8QOVAs243lelJY9Kjvh1p2jz0Y9vP0FN7sbxEBsSbqbKSrJ0CVa1eED2ZCGv1Q36SXofbdrsBWTohT1f2iX/BUnb1JAJBNzEnbT4w9yW+M6PLxbtWqxk8Y6Wf3t/r9Pl1TBTqsvc/amNwjBbjwToQWuCXEoQLjZ2sTR449EbZGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k4sBA/FDHXyuLXSxurVJJiIZvHLOzdu6Vw2hdI8bNUQ=;
 b=kw7jmES7uxIZiKV1IfPxEtejJSRbab5uqgmd5UDacy7/To75nOxi3xK/teO8zc4SCZQzmkLxx5dZMOXuB+VfZW1tGP/7qQmGCU4yf5bUsvb89VoabBcbkIvT2zOL77ciCqrnA+I+KmvTZvYqr4iacLTxTamcKt9JZOgCxyGuc66tXNXay5Zx6BiqA7TLlQMoW/yMsIltveNWScJc+arxNeFvzInL85QOe+LcR6xA6BLZXbeALlzuTZdyOb5ceTXpmHe5Vs+ZhjTmoCe62ZpzvQFMYZDYMd/dFV8b1a93Wi86mIjTUEFCI2LPB6guhb5jk6ONfUDLuCX7eLXqnK0FTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB2535.namprd12.prod.outlook.com (52.132.141.154) by
 DM5PR12MB1897.namprd12.prod.outlook.com (10.175.91.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.20; Fri, 6 Sep 2019 07:36:46 +0000
Received: from DM5PR12MB2535.namprd12.prod.outlook.com
 ([fe80::e56c:45ad:7bdb:cd11]) by DM5PR12MB2535.namprd12.prod.outlook.com
 ([fe80::e56c:45ad:7bdb:cd11%7]) with mapi id 15.20.2220.022; Fri, 6 Sep 2019
 07:36:46 +0000
From: "Yin, Tianci (Rico)" <Tianci.Yin@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: add navi14 PCI ID for work station SKU
Thread-Topic: [PATCH] drm/amdgpu: add navi14 PCI ID for work station SKU
Thread-Index: AQHVZIXVf5W6w4NLO0uoylXwixghUQ==
Date: Fri, 6 Sep 2019 07:36:46 +0000
Message-ID: <DM5PR12MB25355C78839E9472D67F354995BA0@DM5PR12MB2535.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ebacb282-f446-44a9-e6ac-08d7329cf8a6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(49563074)(7193020);
 SRVR:DM5PR12MB1897; 
x-ms-traffictypediagnostic: DM5PR12MB1897:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB18977BF7BF6809441F7B142395BA0@DM5PR12MB1897.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:506;
x-forefront-prvs: 0152EBA40F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(39860400002)(376002)(346002)(396003)(189003)(199004)(86362001)(54896002)(53936002)(3846002)(73894003)(6116002)(256004)(6436002)(91956017)(66616009)(4270600006)(19627405001)(66066001)(25786009)(76116006)(66446008)(486006)(2351001)(7736002)(9686003)(476003)(8676002)(5640700003)(71200400001)(55016002)(81166006)(71190400001)(99936001)(478600001)(105004)(14454004)(5660300002)(74316002)(6916009)(81156014)(54906003)(8936002)(6506007)(52536014)(26005)(2906002)(316002)(7696005)(102836004)(4326008)(99286004)(33656002)(66476007)(64756008)(66556008)(186003)(2501003)(66946007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1897;
 H:DM5PR12MB2535.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5dyuF0hyJBlJ8cTn4JAhcW+Ne8tYC9WtYT8IZgYIjCMQWdwt2TLKXNt5ccAOxerqaLV9bjcIy/wTUOyctaR0TZyyGWjVumFnwCzme19LP+hOy5OUwm+2g5BYX+QLJHLNSYeCDln57fHVdiV1KWLj1pMwtWO7QtjW0/uNvb9qyjjirtx1IlKZUATm/pBK/Jh0gXDr+Ag9FhMPqYxXNAi6og9uunYSb3mey598tbhZQur6YpfrRKw6YSM7IQIP6AK+wrQiR5Ry2e8kGFruU3mBowzhtnwa2qZtXtmtUoi1N3k=
Content-Type: multipart/mixed;
 boundary="_004_DM5PR12MB25355C78839E9472D67F354995BA0DM5PR12MB2535namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebacb282-f446-44a9-e6ac-08d7329cf8a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2019 07:36:46.2610 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C+62d0eOCMha67OXw/dvZL8ZMjR6ypz7+KoEj7hGnkq2froDt4QyqiUCfs8kWDiA5yhdREB9vtXAWba5gFc3wQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1897
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k4sBA/FDHXyuLXSxurVJJiIZvHLOzdu6Vw2hdI8bNUQ=;
 b=4WXCYeLeljNxjEuubvZ6DpMp6+LdH/Y55tKVUEcgaRI31u1Wg4XuNcY+/NOO/r405y5Fd6HZZP1z59Qvu3H8jfdCszbr1ZFVVN+VssJ65xYtTktRdNwQlUdId0cOKBV0hp+HORXdwPu3l3qe48FQ4wnc6RMw1rPm3LcP48v31eY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Tianci.Yin@amd.com; 
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
Cc: "Xu, Feifei" <Feifei.Xu@amd.com>, "Xiao, Jack" <Jack.Xiao@amd.com>, "Yuan,
 Xiaojie" <Xiaojie.Yuan@amd.com>, "Long, Gang" <Gang.Long@amd.com>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--_004_DM5PR12MB25355C78839E9472D67F354995BA0DM5PR12MB2535namp_
Content-Type: multipart/alternative;
	boundary="_000_DM5PR12MB25355C78839E9472D67F354995BA0DM5PR12MB2535namp_"

--_000_DM5PR12MB25355C78839E9472D67F354995BA0DM5PR12MB2535namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



--_000_DM5PR12MB25355C78839E9472D67F354995BA0DM5PR12MB2535namp_
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
<br>
</div>
</body>
</html>

--_000_DM5PR12MB25355C78839E9472D67F354995BA0DM5PR12MB2535namp_--

--_004_DM5PR12MB25355C78839E9472D67F354995BA0DM5PR12MB2535namp_
Content-Type: text/x-patch;
	name="0001-drm-amdgpu-add-navi14-PCI-ID-for-work-station-SKU.patch"
Content-Description:  0001-drm-amdgpu-add-navi14-PCI-ID-for-work-station-SKU.patch
Content-Disposition: attachment;
	filename="0001-drm-amdgpu-add-navi14-PCI-ID-for-work-station-SKU.patch";
	size=1092; creation-date="Fri, 06 Sep 2019 07:35:03 GMT";
	modification-date="Fri, 06 Sep 2019 07:35:03 GMT"
Content-Transfer-Encoding: base64

RnJvbSA2ZGEyNDUxYjEzOTE5MzljZjQ5NTE4ZDgyZDQyYzRkNTdiMzJhNTcxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiAiVGlhbmNpLllpbiIgPHRpYW5jaS55aW5AYW1kLmNvbT4KRGF0
ZTogVGh1LCA1IFNlcCAyMDE5IDE1OjI4OjU3ICswODAwClN1YmplY3Q6IFtQQVRDSF0gZHJtL2Ft
ZGdwdTogYWRkIG5hdmkxNCBQQ0kgSUQgZm9yIHdvcmsgc3RhdGlvbiBTS1UKCkFkZCB0aGUgbmF2
aTE0IFBDSSBkZXZpY2UgaWQuCgpDaGFuZ2UtSWQ6IEk5NmE4Yzg5MmJlY2FhOGRjYzdhZDU5ZGM4
MGQwNDdkM2Y3NTU3NzVmClNpZ25lZC1vZmYtYnk6IFRpYW5jaS5ZaW4gPHRpYW5jaS55aW5AYW1k
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgfCAyICsr
CiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2Rydi5jCmluZGV4IDVhN2Y5MjkuLjY5NzhkMTcgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKQEAgLTEwMjMsNiArMTAyMyw4IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgcGNpX2RldmljZV9pZCBwY2lpZGxpc3RbXSA9IHsKIAl7MHgxMDAyLCAweDczMUYs
IFBDSV9BTllfSUQsIFBDSV9BTllfSUQsIDAsIDAsIENISVBfTkFWSTEwfSwKIAkvKiBOYXZpMTQg
Ki8KIAl7MHgxMDAyLCAweDczNDAsIFBDSV9BTllfSUQsIFBDSV9BTllfSUQsIDAsIDAsIENISVBf
TkFWSTE0fSwKKwl7MHgxMDAyLCAweDczNDEsIFBDSV9BTllfSUQsIFBDSV9BTllfSUQsIDAsIDAs
IENISVBfTkFWSTE0fSwKKwl7MHgxMDAyLCAweDczNDcsIFBDSV9BTllfSUQsIFBDSV9BTllfSUQs
IDAsIDAsIENISVBfTkFWSTE0fSwKIAogCS8qIFJlbm9pciAqLwogCXsweDEwMDIsIDB4MTYzNiwg
UENJX0FOWV9JRCwgUENJX0FOWV9JRCwgMCwgMCwgQ0hJUF9SRU5PSVJ8QU1EX0lTX0FQVX0sCi0t
IAoyLjcuNAoK

--_004_DM5PR12MB25355C78839E9472D67F354995BA0DM5PR12MB2535namp_
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--_004_DM5PR12MB25355C78839E9472D67F354995BA0DM5PR12MB2535namp_--
