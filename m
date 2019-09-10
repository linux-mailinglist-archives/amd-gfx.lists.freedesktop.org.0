Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA1FAE352
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2019 07:48:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D664089F07;
	Tue, 10 Sep 2019 05:48:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770081.outbound.protection.outlook.com [40.107.77.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B8A789F07
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 05:48:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IWv5ZzciCt8ijABMkSSWPax87T+8iNktwyWniyPJpR4AdpFEdjlpb9AZT0sH6u3BGFGky7awLNmYjd7iQXZcGjCOHQ1Njmhsbe4B1WXV9P2m1m2MxVUhb5bPDR/R6Z217z3TJFo+ipM58o3If5S5f0nbhcSWvWbsEjserUrp1yQrkaXhQ+D2Cd0A7XcBTcChLeIRP9AyaCrn6Lgobb5I3VuTUJS8Xon7lawONAb4yhlHoIgdod4GUUhiH0sCEF1KQ0S4ENjMfYn8eGJh/DgmNXxmZ2UBivvhnmGI0XLk7Xz6o7+Hrw3f3dZeSCRqF24L2isLp6ujasGJuh6lq/UrlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WqnZez6Z8tnbiT87+Alb5EHbcWCCfTu4ioeP1GxiBVs=;
 b=h62/lGecgsmAbYo8qDCmcKTl9Gb+voKaVEZoCFyKrbRYRs0+GPbRBg3zL/Wj1+dt7hwcvRAFHKT07GZ6wwCItZmiL/1UKBUFK8GKsKZiAYK8wYlAneQbvF72bDyCAz3Fzo4Mkqjc3Cy1l4volEdvfYjCFBaJIHQuMxt0oaoARSI6POJSe72aURF8+lhue17u61czCdQe2e5Y4IeLnd04hfKyM1A1y186rCzm5sDbjJb7ucaZPLpe7Y6QL2vr3bU3AKfAts+6/5Y903RobOQVrmyqp3ytE2PRRCLAotZF6MBsoxp9hwAbTVoD+bTEVJX7MtliSArBu9br1woqSH8lJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB2535.namprd12.prod.outlook.com (52.132.141.154) by
 DM5PR12MB2501.namprd12.prod.outlook.com (52.132.141.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Tue, 10 Sep 2019 05:48:01 +0000
Received: from DM5PR12MB2535.namprd12.prod.outlook.com
 ([fe80::e56c:45ad:7bdb:cd11]) by DM5PR12MB2535.namprd12.prod.outlook.com
 ([fe80::e56c:45ad:7bdb:cd11%7]) with mapi id 15.20.2263.005; Tue, 10 Sep 2019
 05:48:01 +0000
From: "Yin, Tianci (Rico)" <Tianci.Yin@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [Patch] drm/amdgpu: add navi14 PCI ID for WKS SKU Pro-XLM
Thread-Topic: [Patch] drm/amdgpu: add navi14 PCI ID for WKS SKU Pro-XLM
Thread-Index: AQHVZ5r2ezbIZh3BL0iOY3iIFNaDrA==
Date: Tue, 10 Sep 2019 05:48:01 +0000
Message-ID: <DM5PR12MB253551C08B1537C501DDF2C495B60@DM5PR12MB2535.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8d6e1fa3-066e-4ebb-1bc5-08d735b2716c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(49563074)(7193020);
 SRVR:DM5PR12MB2501; 
x-ms-traffictypediagnostic: DM5PR12MB2501:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB2501CC6589F92E6DBF23528495B60@DM5PR12MB2501.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:284;
x-forefront-prvs: 01565FED4C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(396003)(136003)(366004)(39860400002)(346002)(376002)(189003)(199004)(102836004)(105004)(52536014)(54896002)(2501003)(4270600006)(71200400001)(316002)(2351001)(486006)(476003)(99286004)(54906003)(7696005)(76116006)(91956017)(33656002)(19627405001)(5660300002)(73894003)(6916009)(55016002)(26005)(6436002)(256004)(53936002)(5640700003)(9686003)(81156014)(186003)(71190400001)(66066001)(14454004)(6506007)(8676002)(478600001)(8936002)(74316002)(2906002)(66556008)(66476007)(66616009)(3846002)(64756008)(66946007)(4326008)(25786009)(66446008)(86362001)(7736002)(6116002)(99936001)(81166006)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2501;
 H:DM5PR12MB2535.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1hnHBlpJ1JIU/Og0THkN7id1t4obsFZmUKALcB+8HZg6zk62cAbmUye5mdyCGp75rqMAB1fAY3Lv0CnUMkobZdv8C3Zbpaz4bNnLxnmQxeR9hSe5DDlDDAciGN47qkhxJEU0bzzD0p+jhrVYGRR4ybYm48gXW8qTtGnjxbhP4RAxneec0iVNsuhV/IQjiQnRrnkcqKNcQOB4LeDFqKoyAVLNyZ4Z9tkohRGD+P//rgDxOlnNJwOkrmxRqrIUEMvZ/KA7I4JaQZ6MBoF/MMcLpKF5V1RyYkhf8CzvghY3HDE=
Content-Type: multipart/mixed;
 boundary="_004_DM5PR12MB253551C08B1537C501DDF2C495B60DM5PR12MB2535namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d6e1fa3-066e-4ebb-1bc5-08d735b2716c
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2019 05:48:01.8626 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eXsXubc00KgQfHBTDxYLbsXWs0a151nFhvUFv7LTev9wQH7GOd5MbYTSTx8ebTVc2PQYyp8cqNxHF14rDzqgAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2501
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WqnZez6Z8tnbiT87+Alb5EHbcWCCfTu4ioeP1GxiBVs=;
 b=vsjBas+N/e+DO6TU//fk3Ewp5PNvxKXLD0XcuOUPTwBUaR3/PH4cjukgG85uQGzgB8Ru1gfEwU+hI4KYQVLKAknisZCLRCy7pjTkI22vKGjX5xcVuk4qbi/GsVWUOum40SNM8eMfmMBJUYrm0P4Xt9le8nyWeARLGlV77LHjzrg=
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
Cc: "Xu, Feifei" <Feifei.Xu@amd.com>, "Xiao, Jack" <Jack.Xiao@amd.com>, "Long,
 Gang" <Gang.Long@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--_004_DM5PR12MB253551C08B1537C501DDF2C495B60DM5PR12MB2535namp_
Content-Type: multipart/alternative;
	boundary="_000_DM5PR12MB253551C08B1537C501DDF2C495B60DM5PR12MB2535namp_"

--_000_DM5PR12MB253551C08B1537C501DDF2C495B60DM5PR12MB2535namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



--_000_DM5PR12MB253551C08B1537C501DDF2C495B60DM5PR12MB2535namp_
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

--_000_DM5PR12MB253551C08B1537C501DDF2C495B60DM5PR12MB2535namp_--

--_004_DM5PR12MB253551C08B1537C501DDF2C495B60DM5PR12MB2535namp_
Content-Type: text/x-patch;
	name="0001-drm-amdgpu-add-navi14-PCI-ID-for-WKS-SKU-Pro-XLM.patch"
Content-Description:  0001-drm-amdgpu-add-navi14-PCI-ID-for-WKS-SKU-Pro-XLM.patch
Content-Disposition: attachment;
	filename="0001-drm-amdgpu-add-navi14-PCI-ID-for-WKS-SKU-Pro-XLM.patch";
	size=1092; creation-date="Tue, 10 Sep 2019 05:47:37 GMT";
	modification-date="Tue, 10 Sep 2019 05:47:37 GMT"
Content-Transfer-Encoding: base64

RnJvbSA0MThlNmEwMjY1MGI1ZThkODlkOTFiM2RjZGUzZDUwNTY3MTMzMjYwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiAiVGlhbmNpLllpbiIgPHRpYW5jaS55aW5AYW1kLmNvbT4KRGF0
ZTogVHVlLCAxMCBTZXAgMjAxOSAxMzoyNDowNSArMDgwMApTdWJqZWN0OiBbUEFUQ0hdIGRybS9h
bWRncHU6IGFkZCBuYXZpMTQgUENJIElEIGZvciBXS1MgU0tVIFByby1YTE0KCmFkZCBuYXZpMTQg
UENJIElEIGZvciB3b3JrIHN0YXRpb24gU0tVIFByby1YTE0KCkNoYW5nZS1JZDogSTI4ODNmYzU1
YTAzYTU5OGEyYjNmODlhNWMxZmE0NDBkMGM1NTNkZWQKU2lnbmVkLW9mZi1ieTogVGlhbmNpLllp
biA8dGlhbmNpLnlpbkBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9kcnYuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCmluZGV4IDY5NzhkMTcuLmI0NWE1ZGMgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKQEAgLTEwMjUsNiArMTAyNSw3
IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCBwY2lpZGxpc3RbXSA9IHsKIAl7
MHgxMDAyLCAweDczNDAsIFBDSV9BTllfSUQsIFBDSV9BTllfSUQsIDAsIDAsIENISVBfTkFWSTE0
fSwKIAl7MHgxMDAyLCAweDczNDEsIFBDSV9BTllfSUQsIFBDSV9BTllfSUQsIDAsIDAsIENISVBf
TkFWSTE0fSwKIAl7MHgxMDAyLCAweDczNDcsIFBDSV9BTllfSUQsIFBDSV9BTllfSUQsIDAsIDAs
IENISVBfTkFWSTE0fSwKKwl7MHgxMDAyLCAweDczNEYsIFBDSV9BTllfSUQsIFBDSV9BTllfSUQs
IDAsIDAsIENISVBfTkFWSTE0fSwKIAogCS8qIFJlbm9pciAqLwogCXsweDEwMDIsIDB4MTYzNiwg
UENJX0FOWV9JRCwgUENJX0FOWV9JRCwgMCwgMCwgQ0hJUF9SRU5PSVJ8QU1EX0lTX0FQVX0sCi0t
IAoyLjcuNAoK

--_004_DM5PR12MB253551C08B1537C501DDF2C495B60DM5PR12MB2535namp_
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--_004_DM5PR12MB253551C08B1537C501DDF2C495B60DM5PR12MB2535namp_--
