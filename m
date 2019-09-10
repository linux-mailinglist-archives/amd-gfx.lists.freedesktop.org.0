Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56923AE626
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2019 10:59:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E33126E895;
	Tue, 10 Sep 2019 08:59:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760040.outbound.protection.outlook.com [40.107.76.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA07F6E895
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 08:59:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HLZG912Rs/T40HtXfsbuiQpZ4/RLiKyaoJy/ke+vpdTu3LRmDqdsetd3Pznx9E0IkgpjguX1wQukRPVntY+bJK/4q+JsvMhAElTQQC4soDJszE0nGigOUMASDg6E7DYMhSbYWvEbDxm6EY/PJzgeEPzhiaGCr89cok1vI3UP8aUcnjy11gjf+kewr1j36sDgUVBJPlQ66QI0/VNxLaJodMORT7Mep6BCCnbTG9fxNqn0zKzd0coJdglHdwteRJXIYn9Qqvnu7hkafNYYQkVaEYqR1xVAZkLbGCH5r85sx60o3zYWuaoUjVx4XmjqRilhZV0UlolwaVDCgxwrL9D9Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cIRh8gBwJ116vgRiCjTbn/Q6DNMlbmf70MobTXCoSms=;
 b=QJKTTkleAzEKLIt/u1/I9Q9ln3nWztwlxEFia7x6bxoep5yfj6Cjn8G6fgw9g19beyOCFRJ0j0GYo4cVWgg4gPAR9CWgedU3oI3CDKXT1MdJd1jrd5lyYiiN/oFRIGRihidVIuXphRFkv/Ghpecaz5ChQdP58Xpjodiyg0D5reqYTmh+P2ioGvQNn962kyCG7UDkEktU7av6H9GlEhM7IBYry21dVBcck3EjVbRP/6kdDIrhQ/yObZ0fITBWIPz99gHVIh8drInaaQan7UqbWkpG0AtPD5otS8jlKFx7vXvduQ1iYNk+ogdetET4fGHScWImzWF0fsNG1TKux/IV3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB2535.namprd12.prod.outlook.com (52.132.141.154) by
 DM5SPR01MB015.namprd12.prod.outlook.com (52.132.133.39) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.13; Tue, 10 Sep 2019 08:59:13 +0000
Received: from DM5PR12MB2535.namprd12.prod.outlook.com
 ([fe80::e56c:45ad:7bdb:cd11]) by DM5PR12MB2535.namprd12.prod.outlook.com
 ([fe80::e56c:45ad:7bdb:cd11%7]) with mapi id 15.20.2263.005; Tue, 10 Sep 2019
 08:59:13 +0000
From: "Yin, Tianci (Rico)" <Tianci.Yin@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [Patch] drm/amdgpu: fix CPDMA hang in PRT mode for VEGA10
Thread-Topic: [Patch] drm/amdgpu: fix CPDMA hang in PRT mode for VEGA10
Thread-Index: AQHVZ7Wzp+URZjuAJk27+/Puv7xiXw==
Date: Tue, 10 Sep 2019 08:59:13 +0000
Message-ID: <DM5PR12MB2535E7983EAD797B4349F96995B60@DM5PR12MB2535.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eb45c2a7-e059-4852-d06a-08d735cd26f0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(49563074)(7193020);
 SRVR:DM5SPR01MB015; 
x-ms-traffictypediagnostic: DM5SPR01MB015:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5SPR01MB015F60A3E9CD429D04ED81695B60@DM5SPR01MB015.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-forefront-prvs: 01565FED4C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(366004)(346002)(136003)(376002)(189003)(199004)(256004)(66946007)(66446008)(66476007)(66616009)(64756008)(66556008)(2906002)(73894003)(486006)(476003)(2351001)(102836004)(4270600006)(8936002)(19627405001)(478600001)(26005)(186003)(66066001)(105004)(53936002)(14454004)(5640700003)(9686003)(54896002)(55016002)(6506007)(25786009)(76116006)(91956017)(33656002)(3846002)(4326008)(6116002)(6916009)(71200400001)(7736002)(2501003)(54906003)(52536014)(7696005)(316002)(74316002)(81156014)(81166006)(99936001)(8676002)(86362001)(99286004)(6436002)(5660300002)(71190400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5SPR01MB015;
 H:DM5PR12MB2535.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: sefLpJLALqNY/cCmaQZU1BJWLha23r8PcQj29SY6e8lqCunaSUho9P+7ULm1ISi36ctB2p/boaUX5EYbpSI+RcHoWLHhWWHYZGGdc1OV9XynU+z9XzGWr17AC7Dpn/iDgcJ0Amyp1042JhyMLM875iXjLGdb//yYZeE2YmYwWjNBz0/IvPFRC826KIOH8XLdN8W79OF79jvn/HLrPhrjESqJV0e+5ET8uMTUGmF85n6w6obtIKmb0Vw48Dc4Z6sdxnCEhlueKb9ly7LSPC7h3OgrylOz8yfkFnl8+JQzJMQ=
Content-Type: multipart/mixed;
 boundary="_004_DM5PR12MB2535E7983EAD797B4349F96995B60DM5PR12MB2535namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb45c2a7-e059-4852-d06a-08d735cd26f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2019 08:59:13.2829 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OZRUt79ZbSJJRoVy745N5jcWio04m6cLQJ7PlIPc3XYQu1TMYTmcvS0sAgVOA9RvYZBwu3yZ3ZLVb2Qn34PWDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5SPR01MB015
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cIRh8gBwJ116vgRiCjTbn/Q6DNMlbmf70MobTXCoSms=;
 b=IPlAkOe6woEcV4EQU/47LAeeQ1DTlgjBlRhkqA9n2eFt5nSRkctwLF220HdpiByA8WyNaSWkD0Tk6IzanLwpdho1hBdkWiNg28b+qSTv3e5oHZOgFn103D6VMyL60Aff5iQUvfFHn3ZTCVYxW6uhJwvnUwADQd5fFa5xVYIqQNI=
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
Cc: "Xu, Feifei" <Feifei.Xu@amd.com>, "Long, Gang" <Gang.Long@amd.com>, "Zhou1,
 Tao" <Tao.Zhou1@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--_004_DM5PR12MB2535E7983EAD797B4349F96995B60DM5PR12MB2535namp_
Content-Type: multipart/alternative;
	boundary="_000_DM5PR12MB2535E7983EAD797B4349F96995B60DM5PR12MB2535namp_"

--_000_DM5PR12MB2535E7983EAD797B4349F96995B60DM5PR12MB2535namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



--_000_DM5PR12MB2535E7983EAD797B4349F96995B60DM5PR12MB2535namp_
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
<span><br>
</span>
</body>
</html>

--_000_DM5PR12MB2535E7983EAD797B4349F96995B60DM5PR12MB2535namp_--

--_004_DM5PR12MB2535E7983EAD797B4349F96995B60DM5PR12MB2535namp_
Content-Type: text/x-patch;
	name="0001-drm-amdgpu-fix-CPDMA-hang-in-PRT-mode-for-VEGA10.patch"
Content-Description:  0001-drm-amdgpu-fix-CPDMA-hang-in-PRT-mode-for-VEGA10.patch
Content-Disposition: attachment;
	filename="0001-drm-amdgpu-fix-CPDMA-hang-in-PRT-mode-for-VEGA10.patch";
	size=3280; creation-date="Tue, 10 Sep 2019 08:57:44 GMT";
	modification-date="Tue, 10 Sep 2019 08:57:44 GMT"
Content-Transfer-Encoding: base64

RnJvbSAzYmQyNzdkNWM5NTRkMWJiY2JiMGViZWMyODIxNmMzZjIzY2U4ZTdkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiAiVGlhbmNpLllpbiIgPHRpYW5jaS55aW5AYW1kLmNvbT4KRGF0
ZTogVHVlLCAxMCBTZXAgMjAxOSAxNjo1NDoxNCArMDgwMApTdWJqZWN0OiBbUEFUQ0hdIGRybS9h
bWRncHU6IGZpeCBDUERNQSBoYW5nIGluIFBSVCBtb2RlIGZvciBWRUdBMTAKCmFkZCBhbmRfbWFz
ayBzaW5jZSB0aGUgcHJvZ3JhbW1pbmcgbG9naWMgb2YgZ29sZGVuIHNldHRpbmcgY2hhbmdlZAoK
Q2hhbmdlLUlkOiBJZjM3NDRiZWI3NzljNTYyNTVjN2U3OTdlYjExNWJkNmU0NjIyMzdjNQpTaWdu
ZWQtb2ZmLWJ5OiBUaWFuY2kuWWluIDx0aWFuY2kueWluQGFtZC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYyB8IDE4ICsrKysrKysrKy0tLS0tLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYwppbmRleCA5MDM0OGZiMjkuLmI3NWVmODkgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYwpAQCAtNTEzLDkgKzUxMyw5IEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3Qgc29jMTVfcmVnX2dvbGRlbiBnb2xkZW5fc2V0dGluZ3NfZ2NfOV8wW10gPQog
CVNPQzE1X1JFR19HT0xERU5fVkFMVUUoR0MsIDAsIG1tVENQX0NIQU5fU1RFRVJfTE8sIDB4ZmZm
ZmZmZmYsIDB4YjVkM2YxOTcpLAogCVNPQzE1X1JFR19HT0xERU5fVkFMVUUoR0MsIDAsIG1tVkdU
X0NBQ0hFX0lOVkFMSURBVElPTiwgMHgzZmZmM2FmMywgMHgxOTIwMDAwMCksCiAJU09DMTVfUkVH
X0dPTERFTl9WQUxVRShHQywgMCwgbW1WR1RfR1NfTUFYX1dBVkVfSUQsIDB4MDAwMDBmZmYsIDB4
MDAwMDAzZmYpLAotCVNPQzE1X1JFR19HT0xERU5fVkFMVUUoR0MsIDAsIG1tQ1BfTUVDMV9GMzJf
SU5UX0RJUywgMHgwMDAwMDAwMCwgMHgwMDAwMDgwMCksCi0JU09DMTVfUkVHX0dPTERFTl9WQUxV
RShHQywgMCwgbW1DUF9NRUMyX0YzMl9JTlRfRElTLCAweDAwMDAwMDAwLCAweDAwMDAwODAwKSwK
LQlTT0MxNV9SRUdfR09MREVOX1ZBTFVFKEdDLCAwLCBtbUNQX0RFQlVHLCAweDAwMDAwMDAwLCAw
eDAwMDA4MDAwKQorCVNPQzE1X1JFR19HT0xERU5fVkFMVUUoR0MsIDAsIG1tQ1BfTUVDMV9GMzJf
SU5UX0RJUywgMHgwMDAwMDgwMCwgMHgwMDAwMDgwMCksCisJU09DMTVfUkVHX0dPTERFTl9WQUxV
RShHQywgMCwgbW1DUF9NRUMyX0YzMl9JTlRfRElTLCAweDAwMDAwODAwLCAweDAwMDAwODAwKSwK
KwlTT0MxNV9SRUdfR09MREVOX1ZBTFVFKEdDLCAwLCBtbUNQX0RFQlVHLCAweDAwMDA4MDAwLCAw
eDAwMDA4MDAwKQogfTsKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBzb2MxNV9yZWdfZ29sZGVuIGdv
bGRlbl9zZXR0aW5nc19nY185XzBfdmcxMFtdID0KQEAgLTU3OCw5ICs1NzgsOSBAQCBzdGF0aWMg
Y29uc3Qgc3RydWN0IHNvYzE1X3JlZ19nb2xkZW4gZ29sZGVuX3NldHRpbmdzX2djXzlfMVtdID0K
IAlTT0MxNV9SRUdfR09MREVOX1ZBTFVFKEdDLCAwLCBtbVZHVF9DQUNIRV9JTlZBTElEQVRJT04s
IDB4M2ZmZjNhZjMsIDB4MTkyMDAwMDApLAogCVNPQzE1X1JFR19HT0xERU5fVkFMVUUoR0MsIDAs
IG1tVkdUX0dTX01BWF9XQVZFX0lELCAweDAwMDAwZmZmLCAweDAwMDAwMGZmKSwKIAlTT0MxNV9S
RUdfR09MREVOX1ZBTFVFKEdDLCAwLCBtbVdEX1VUQ0wxX0NOVEwsIDB4MDgwMDAwMDAsIDB4MDgw
MDAwODApLAotCVNPQzE1X1JFR19HT0xERU5fVkFMVUUoR0MsIDAsIG1tQ1BfTUVDMV9GMzJfSU5U
X0RJUywgMHgwMDAwMDAwMCwgMHgwMDAwMDgwMCksCi0JU09DMTVfUkVHX0dPTERFTl9WQUxVRShH
QywgMCwgbW1DUF9NRUMyX0YzMl9JTlRfRElTLCAweDAwMDAwMDAwLCAweDAwMDAwODAwKSwKLQlT
T0MxNV9SRUdfR09MREVOX1ZBTFVFKEdDLCAwLCBtbUNQX0RFQlVHLCAweDAwMDAwMDAwLCAweDAw
MDA4MDAwKQorCVNPQzE1X1JFR19HT0xERU5fVkFMVUUoR0MsIDAsIG1tQ1BfTUVDMV9GMzJfSU5U
X0RJUywgMHgwMDAwMDgwMCwgMHgwMDAwMDgwMCksCisJU09DMTVfUkVHX0dPTERFTl9WQUxVRShH
QywgMCwgbW1DUF9NRUMyX0YzMl9JTlRfRElTLCAweDAwMDAwODAwLCAweDAwMDAwODAwKSwKKwlT
T0MxNV9SRUdfR09MREVOX1ZBTFVFKEdDLCAwLCBtbUNQX0RFQlVHLCAweDAwMDA4MDAwLCAweDAw
MDA4MDAwKQogfTsKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBzb2MxNV9yZWdfZ29sZGVuIGdvbGRl
bl9zZXR0aW5nc19nY185XzFfcnYxW10gPQpAQCAtNjcyLDkgKzY3Miw5IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3Qgc29jMTVfcmVnX2dvbGRlbiBnb2xkZW5fc2V0dGluZ3NfZ2NfOV8yXzFfdmcxMltd
ID0KIAlTT0MxNV9SRUdfR09MREVOX1ZBTFVFKEdDLCAwLCBtbVRDUF9DSEFOX1NURUVSX0hJLCAw
eGZmZmZmZmZmLCAweDAwMDAwMDAwKSwKIAlTT0MxNV9SRUdfR09MREVOX1ZBTFVFKEdDLCAwLCBt
bVRDUF9DSEFOX1NURUVSX0xPLCAweGZmZmZmZmZmLCAweDc2MzI1NDEwKSwKIAlTT0MxNV9SRUdf
R09MREVOX1ZBTFVFKEdDLCAwLCBtbVREX0NOVEwsIDB4MDFiZDlmMzMsIDB4MDEwMDAwMDApLAot
CVNPQzE1X1JFR19HT0xERU5fVkFMVUUoR0MsIDAsIG1tQ1BfTUVDMV9GMzJfSU5UX0RJUywgMHgw
MDAwMDAwMCwgMHgwMDAwMDgwMCksCi0JU09DMTVfUkVHX0dPTERFTl9WQUxVRShHQywgMCwgbW1D
UF9NRUMyX0YzMl9JTlRfRElTLCAweDAwMDAwMDAwLCAweDAwMDAwODAwKSwKLQlTT0MxNV9SRUdf
R09MREVOX1ZBTFVFKEdDLCAwLCBtbUNQX0RFQlVHLCAweDAwMDAwMDAwLCAweDAwMDA4MDAwKQor
CVNPQzE1X1JFR19HT0xERU5fVkFMVUUoR0MsIDAsIG1tQ1BfTUVDMV9GMzJfSU5UX0RJUywgMHgw
MDAwMDgwMCwgMHgwMDAwMDgwMCksCisJU09DMTVfUkVHX0dPTERFTl9WQUxVRShHQywgMCwgbW1D
UF9NRUMyX0YzMl9JTlRfRElTLCAweDAwMDAwODAwLCAweDAwMDAwODAwKSwKKwlTT0MxNV9SRUdf
R09MREVOX1ZBTFVFKEdDLCAwLCBtbUNQX0RFQlVHLCAweDAwMDA4MDAwLCAweDAwMDA4MDAwKQog
fTsKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBzb2MxNV9yZWdfZ29sZGVuIGdvbGRlbl9zZXR0aW5n
c19nY185XzRfMV9hcmN0W10gPQotLSAKMi43LjQKCg==

--_004_DM5PR12MB2535E7983EAD797B4349F96995B60DM5PR12MB2535namp_
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--_004_DM5PR12MB2535E7983EAD797B4349F96995B60DM5PR12MB2535namp_--
