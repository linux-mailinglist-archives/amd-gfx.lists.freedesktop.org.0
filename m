Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9382D98D95
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2019 10:25:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 258096EA9F;
	Thu, 22 Aug 2019 08:25:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680071.outbound.protection.outlook.com [40.107.68.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8D146EA9F
 for <amd-gfx@lists.freedesktop.org>; Thu, 22 Aug 2019 08:25:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MgY+57/jPPZ2m6Kyr86aCCJYD0Pj0lozZOwRXY65x5ceGX2oeYnX5GEbJ65qpIJj4pRb8qIrELSfJr9xBTnthQFwNHcbxd8igN3tcH12k3TGwlRVhnH1u/bNZGWcIaatNVxDkV21TekP2OKQFkNMj1IVJJ7O4jBCwo5gqZ83gNiQUndIM/0uKIR6J1vvpUffEuilbTMnO0CwAHsfev3OYbmMHnNNiBfN8UpOOmE35MoM4dCaurIeMVkFW97ngdtRYUeXxd0wev+D9BYRMpfQ5oMkd5GF9GNF5J2YaiUhaGdakKrAA5jjP8huHaAONUTuiBiceuvkQXrLHl/IVzzpPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d2RJe49m4uQCqTDQ6VT2OMb3PLK1o17vrm6Vxp3BpWY=;
 b=SXPEAM8GNXnJOIAgbjiJMz+I1J950DXG00s/DFpKzFZTzL5IhxiYpvF1n+nSFxWzWkfmCY+F+8OVe2+nlH4N/8Nrtnwb5MhKBtRVyc42NCeYyyMNIV3OVjZ8+y623GpdhXwW2uxNtHxnIiBRPwd2cy3yp8FN2V+6HEV7d3RZWzfkDfw7QT2LsiQ4mXnsNcveKEkCO5UHFaeTKcbpAD3LS2zsp8bh+GdJSu/CXJ/N1AYAjJ3PawASXJDGLDw4jVG6MvzqunLPQ8yfLPRAK6vuI82MW+9kV/BeGYaJ/p2SqBO8JCIuw4ENOzEvBT1gg7nN68s4jUCL/GCMGpuBBUYoLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB3718.namprd12.prod.outlook.com (52.132.244.84) by
 CH2PR12MB4071.namprd12.prod.outlook.com (20.180.17.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Thu, 22 Aug 2019 08:24:59 +0000
Received: from CH2PR12MB3718.namprd12.prod.outlook.com
 ([fe80::3d37:5989:ecd9:2383]) by CH2PR12MB3718.namprd12.prod.outlook.com
 ([fe80::3d37:5989:ecd9:2383%5]) with mapi id 15.20.2178.020; Thu, 22 Aug 2019
 08:24:59 +0000
From: "Min, Frank" <Frank.Min@amd.com>
To: "Zeng, Oak" <Oak.Zeng@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>
Subject: =?gb2312?B?tPC4tDogW1BBVENIIDIvM10gYW1kL2FtZGtmZDogYWRkIEFyY3R1cnVzIHZm?=
 =?gb2312?Q?_DID_support?=
Thread-Topic: [PATCH 2/3] amd/amdkfd: add Arcturus vf DID support
Thread-Index: AQHVVBD5Rbucu8HprUKIa5PK13CARqcG3ZCQ
Date: Thu, 22 Aug 2019 08:24:59 +0000
Message-ID: <CH2PR12MB371826317E0F21E4640E6E85E9A50@CH2PR12MB3718.namprd12.prod.outlook.com>
References: <1565945960-21236-1-git-send-email-Frank.Min@amd.com>
 <1565945960-21236-2-git-send-email-Frank.Min@amd.com>
In-Reply-To: <1565945960-21236-2-git-send-email-Frank.Min@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7abe2ca2-6034-4aa5-33e6-08d726da3911
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:CH2PR12MB4071; 
x-ms-traffictypediagnostic: CH2PR12MB4071:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR12MB4071000247FC03C39977A68BE9A50@CH2PR12MB4071.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1388;
x-forefront-prvs: 01371B902F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(366004)(396003)(136003)(39860400002)(199004)(189003)(33656002)(66066001)(81166006)(81156014)(6636002)(7696005)(316002)(11346002)(446003)(2906002)(8936002)(71190400001)(476003)(71200400001)(66556008)(25786009)(55016002)(64756008)(3846002)(66476007)(6116002)(66446008)(9686003)(76116006)(6436002)(14454004)(66946007)(6506007)(486006)(5660300002)(224303003)(53936002)(86362001)(99286004)(186003)(26005)(305945005)(2501003)(256004)(74316002)(7736002)(110136005)(478600001)(76176011)(52536014)(102836004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB4071;
 H:CH2PR12MB3718.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hyMoM2lro1emOUnW1kdNMT7I86ndTuVLWtKEu6H9qEIGbeuyHig6rnhC7LmKOioac4xQBhytd0lSFqjpFo6kP6VLd4TlHgO1Xlgr9O5eskIV6uFVBYtqEUTHXFPOTK+KlRrhBS73vRuic36vYHb21V+9XBRRhk/BPhNTbi4Gvz9ex+zdeH3PFaigufW/W5TFqSMvYx4iqxEvK9a6MFu0MlGA6jSiWOuAwzC0SP2gtu6zOJCkhfgSaEoqmcPCs1NyooCNJmLP94/ZU7LEdmd810YhOwa7ku4TyAAu9KEHT022lm/WJc0RSgXEXYV2VDqmrcKqbXHpCIMvXd0u/ZSuORp2bwimFoxw6HQ8PA0TucjOh49D3+92Ds0WFgQJPC47b+Q21i3hEGe0ncRiqepfX0t1PH891NvUfa7MKuADUS8=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7abe2ca2-6034-4aa5-33e6-08d726da3911
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2019 08:24:59.6880 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v0bp8gzk0vfbBIQ+qsPt+iyHGGhfNz6LQSqb1bT6Ffn1pWNtK4dsDZ/EMZC36hsd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4071
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d2RJe49m4uQCqTDQ6VT2OMb3PLK1o17vrm6Vxp3BpWY=;
 b=eeQNuqnCl00h6hPpBr3FgDdXRBcfn1lXIxl+ezJuqc4BcgHxBLIi7Ti9Q2lyOgh6YfJUcDP4kTOf+YdULeULu4G7YoVBmFE6xwKjE/U3VCm0pIOC3cjUhr+zIgxaZGuSQe26uPPVh36X44m1gCpBp+o4vTaB5+p3XDaXrTS2SHw=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Frank.Min@amd.com; 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGkgQWxleCwNCldvdWxkIHlvdSBwbGVhc2UgaGVscCB0byByZXZpZXcgdGhlIGtmZCBkaWQgYWRk
IHBhdGNoPw0KDQpCZXN0IFJlZ2FyZHMsDQpGcmFuaw0KDQotLS0tLemCruS7tuWOn+S7ti0tLS0t
DQrlj5Hku7bkuro6IEZyYW5rLk1pbiA8RnJhbmsuTWluQGFtZC5jb20+IA0K5Y+R6YCB5pe26Ze0
OiAyMDE55bm0OOaciDE25pelIDE2OjU5DQrmlLbku7bkuro6IGFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnDQrmioTpgIE6IE1pbiwgRnJhbmsgPEZyYW5rLk1pbkBhbWQuY29tPg0K5Li76aKY
OiBbUEFUQ0ggMi8zXSBhbWQvYW1ka2ZkOiBhZGQgQXJjdHVydXMgdmYgRElEIHN1cHBvcnQNCg0K
Q2hhbmdlLUlkOiBJODQyY2MzMWFiMDQwYjE3ZGNjNTc2NWUyNzVlNTQwMmRmNzg1YjM0YQ0KU2ln
bmVkLW9mZi1ieTogRnJhbmsuTWluIDxGcmFuay5NaW5AYW1kLmNvbT4NCi0tLQ0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2UuYyB8IDEgKw0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQv
a2ZkX2RldmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5jDQpp
bmRleCAzYjlmZTYyLi4zMmIxY2ZhIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRrZmQva2ZkX2RldmljZS5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRf
ZGV2aWNlLmMNCkBAIC00NzIsNiArNDcyLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBrZmRfZGV2
aWNlaWQgc3VwcG9ydGVkX2RldmljZXNbXSA9IHsNCiAJeyAweDczOEMsICZhcmN0dXJ1c19kZXZp
Y2VfaW5mbyB9LAkvKiBBcmN0dXJ1cyAqLw0KIAl7IDB4NzM4OCwgJmFyY3R1cnVzX2RldmljZV9p
bmZvIH0sCS8qIEFyY3R1cnVzICovDQogCXsgMHg3MzhFLCAmYXJjdHVydXNfZGV2aWNlX2luZm8g
fSwJLyogQXJjdHVydXMgKi8NCisJeyAweDczOTAsICZhcmN0dXJ1c19kZXZpY2VfaW5mbyB9LAkv
KiBBcmN0dXJ1cyB2ZiAqLw0KIAl7IDB4NzMxMCwgJm5hdmkxMF9kZXZpY2VfaW5mbyB9LAkvKiBO
YXZpMTAgKi8NCiAJeyAweDczMTIsICZuYXZpMTBfZGV2aWNlX2luZm8gfSwJLyogTmF2aTEwICov
DQogCXsgMHg3MzE4LCAmbmF2aTEwX2RldmljZV9pbmZvIH0sCS8qIE5hdmkxMCAqLw0KLS0gDQoy
LjcuNA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
