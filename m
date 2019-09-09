Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7C6AD2CA
	for <lists+amd-gfx@lfdr.de>; Mon,  9 Sep 2019 07:22:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 930288979F;
	Mon,  9 Sep 2019 05:22:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760044.outbound.protection.outlook.com [40.107.76.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 464F28979F
 for <amd-gfx@lists.freedesktop.org>; Mon,  9 Sep 2019 05:22:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MCgpFntObUh5HSlrLt0HuzDdJWaIDpyAdziogH07tt1GHOmACAUDF/5lwdQBnT2VQAalZgGRKQjK6Avb2TYpgpZTJDK2DKrgZfycsTITKx0Q3X2b4N4v4Y7nBr5oPqZD0mrB6YE0Ix6sRrFVyKTexWUXYNKwQOYUzHwfBcknUDWnbfcC2UifRdoGCyJ+bxofOIcm7Bavg1lXn6ooFTh/eo8ulQgM2BEhp0kpgjMp6z665yf+jsKd3Si8XmWpbOvNSNFzjuzQmjYcotqrlNjnBbOJzmnbUrVy9TKPDVbfGN8V7bSugGDZFTlL7b7WbOE/FHJXDTzHy+lSryZ2frDGfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qbwz6XTPP9yJ5S9e5HEPtvqnHay8eswFouQ3XrPrdus=;
 b=ex99m4/bpDy1qlk839VA1IO2DW9h27S6vl4Eq53ROed70BHTs4o2/Z+Jl3xkQKGHZmP+nh9V5nFo9kAt3XFjl/1RV2ps7w44xrNsR/P/O0nnboyHFIKoJdBFKMJL0lVs5cMZFHfieWGHZKSBUpTZ5V4J2Hb/mJEpXHEztuep2MYiIkpHZirRgADBaXH4+bnfmuwZUbRnZ24IByvLeqkxykwa74MaGWkPfqgsJwLNjriU+4JprFWxGo4LwdEpdOvzsXAkZPbwUncuRqlNHyHUFEhZSKZsbvSnUAOQSLTrwoUdurrcp13UxL5YyCOZ9FES0ksalk3fa+hO1bEVEdBsIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3536.namprd12.prod.outlook.com (20.179.83.19) by
 MN2PR12MB3744.namprd12.prod.outlook.com (10.255.236.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Mon, 9 Sep 2019 05:22:16 +0000
Received: from MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::ec87:49b5:712e:7d41]) by MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::ec87:49b5:712e:7d41%7]) with mapi id 15.20.2241.018; Mon, 9 Sep 2019
 05:22:16 +0000
From: "Liang, Prike" <Prike.Liang@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/powerplay: Add the interface for geting dpm current
 power state
Thread-Topic: [PATCH] drm/amd/powerplay: Add the interface for geting dpm
 current power state
Thread-Index: AQHVZs6L8d1I3BsIPU+IKGq7TQkV7Q==
Date: Mon, 9 Sep 2019 05:22:16 +0000
Message-ID: <1568006521-7471-1-git-send-email-Prike.Liang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR04CA0011.apcprd04.prod.outlook.com
 (2603:1096:203:36::23) To MN2PR12MB3536.namprd12.prod.outlook.com
 (2603:10b6:208:104::19)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2825d57c-bd1e-438b-1858-08d734e5ad85
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3744; 
x-ms-traffictypediagnostic: MN2PR12MB3744:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB374490FA4761503114B3B00AFBB70@MN2PR12MB3744.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:813;
x-forefront-prvs: 01559F388D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(39850400004)(396003)(136003)(346002)(189003)(199004)(6116002)(486006)(53936002)(6512007)(6486002)(6436002)(6916009)(2501003)(5660300002)(14444005)(256004)(2906002)(54906003)(99286004)(71200400001)(71190400001)(52116002)(316002)(4326008)(26005)(476003)(102836004)(6506007)(386003)(478600001)(186003)(66946007)(2616005)(2351001)(36756003)(66476007)(66556008)(64756008)(66446008)(8676002)(86362001)(81166006)(81156014)(66066001)(7736002)(305945005)(25786009)(50226002)(8936002)(5640700003)(3846002)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3744;
 H:MN2PR12MB3536.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: JCxablwo4Ew5ZdX0tPUBH7dezoldt0ikUVzxzKA2f3wqrIVHVLpQqZuzfLp5yigM4KjkYdepGKuLnC0UBh7xond7HjZd+J/E98P/G3OkcQRSz4sXztDSIMjGuCMwXXi6loSK5ETugwYhQ6xReQt5ws9uLDeCv7MjKribHX8GTjtKedYz3ycrqjwEPjIaPoznW7BXGKSq17s3pIScmi1TjGzvj2lcAdTa0CioYwYmzUp5YAo/wxmyFMsIYvLuChbqFcHZT2OEvws0KCCjgg1M0xShWDJHY5c7fjfv50hek7uFUjSULR/io+6DkX74sUjlI9gjlp43vLgdDoHWQNVky8AwwJmu3NzlJIdZM5p8yBWam82VSN7SkeqDrQmGW7FFTf6Jug4CAk8nUynXBs966bOo9ToJnFqMSKX2amX5c9w=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2825d57c-bd1e-438b-1858-08d734e5ad85
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2019 05:22:16.2248 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v5ab02dvDKjRNCnjMjpCmTaj3NTQSQEoFlhixgvg9ljfMwsi28E8HVo4Tx9yAzJq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3744
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qbwz6XTPP9yJ5S9e5HEPtvqnHay8eswFouQ3XrPrdus=;
 b=FVFkONCnTGmQVRMXwDafV1GRD42Co57CKmlVP1Ze8Fe+sT0nen/YQh6Cojz1XgagjY46EdOBjVWE9nNL3NbsPUTPwvzF8SupJilTs5UiP/9iQM2LMTEpD4WdwSIN+TaXRDmQUZcJ2T6Ln1UZCkb1tMp2GQE+Jpys/GuMQy6fN2A=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Prike.Liang@amd.com; 
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
Cc: "Huang, Ray" <Ray.Huang@amd.com>, "Liang,
 Prike" <Prike.Liang@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>, "Feng,
 Kenneth" <Kenneth.Feng@amd.com>, "Liu, Aaron" <Aaron.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

aW1wbGVtZW50IHRoZSBzeXNmcyBwb3dlcl9kcG1fc3RhdGUKClNpZ25lZC1vZmYtYnk6IFByaWtl
IExpYW5nIDxQcmlrZS5MaWFuZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93
ZXJwbGF5L3Jlbm9pcl9wcHQuYyB8IDM0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwog
MSBmaWxlIGNoYW5nZWQsIDM0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL3Bvd2VycGxheS9yZW5vaXJfcHB0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bv
d2VycGxheS9yZW5vaXJfcHB0LmMKaW5kZXggYTVjZjg0Ni4uMmMyMmJhNCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvcmVub2lyX3BwdC5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L3Jlbm9pcl9wcHQuYwpAQCAtMjQ2LDYgKzI0NiwzOCBAQCBz
dGF0aWMgaW50IHJlbm9pcl9wcmludF9jbGtfbGV2ZWxzKHN0cnVjdCBzbXVfY29udGV4dCAqc211
LAogCXJldHVybiBzaXplOwogfQogCitzdGF0aWMgZW51bSBhbWRfcG1fc3RhdGVfdHlwZSByZW5v
aXJfZ2V0X2N1cnJlbnRfcG93ZXJfc3RhdGUoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpCit7CisJ
ZW51bSBhbWRfcG1fc3RhdGVfdHlwZSBwbV90eXBlOworCXN0cnVjdCBzbXVfZHBtX2NvbnRleHQg
KnNtdV9kcG1fY3R4ID0gJihzbXUtPnNtdV9kcG0pOworCisJaWYgKCFzbXVfZHBtX2N0eC0+ZHBt
X2NvbnRleHQgfHwKKwkgICAgIXNtdV9kcG1fY3R4LT5kcG1fY3VycmVudF9wb3dlcl9zdGF0ZSkK
KwkJcmV0dXJuIC1FSU5WQUw7CisKKwltdXRleF9sb2NrKCYoc211LT5tdXRleCkpOworCXN3aXRj
aCAoc211X2RwbV9jdHgtPmRwbV9jdXJyZW50X3Bvd2VyX3N0YXRlLT5jbGFzc2lmaWNhdGlvbi51
aV9sYWJlbCkgeworCWNhc2UgU01VX1NUQVRFX1VJX0xBQkVMX0JBVFRFUlk6CisJCXBtX3R5cGUg
PSBQT1dFUl9TVEFURV9UWVBFX0JBVFRFUlk7CisJCWJyZWFrOworCWNhc2UgU01VX1NUQVRFX1VJ
X0xBQkVMX0JBTExBTkNFRDoKKwkJcG1fdHlwZSA9IFBPV0VSX1NUQVRFX1RZUEVfQkFMQU5DRUQ7
CisJCWJyZWFrOworCWNhc2UgU01VX1NUQVRFX1VJX0xBQkVMX1BFUkZPUk1BTkNFOgorCQlwbV90
eXBlID0gUE9XRVJfU1RBVEVfVFlQRV9QRVJGT1JNQU5DRTsKKwkJYnJlYWs7CisJZGVmYXVsdDoK
KwkJaWYgKHNtdV9kcG1fY3R4LT5kcG1fY3VycmVudF9wb3dlcl9zdGF0ZS0+Y2xhc3NpZmljYXRp
b24uZmxhZ3MgJiBTTVVfU1RBVEVfQ0xBU1NJRklDQVRJT05fRkxBR19CT09UKQorCQkJcG1fdHlw
ZSA9IFBPV0VSX1NUQVRFX1RZUEVfSU5URVJOQUxfQk9PVDsKKwkJZWxzZQorCQkJcG1fdHlwZSA9
IFBPV0VSX1NUQVRFX1RZUEVfREVGQVVMVDsKKwkJYnJlYWs7CisJfQorCW11dGV4X3VubG9jaygm
KHNtdS0+bXV0ZXgpKTsKKworCXJldHVybiBwbV90eXBlOworfQorCiBzdGF0aWMgY29uc3Qgc3Ry
dWN0IHBwdGFibGVfZnVuY3MgcmVub2lyX3BwdF9mdW5jcyA9IHsKIAkuZ2V0X3NtdV9tc2dfaW5k
ZXggPSByZW5vaXJfZ2V0X3NtdV9tc2dfaW5kZXgsCiAJLmdldF9zbXVfdGFibGVfaW5kZXggPSBy
ZW5vaXJfZ2V0X3NtdV90YWJsZV9pbmRleCwKQEAgLTI1Myw2ICsyODUsOCBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IHBwdGFibGVfZnVuY3MgcmVub2lyX3BwdF9mdW5jcyA9IHsKIAkuc2V0X3Bvd2Vy
X3N0YXRlID0gTlVMTCwKIAkuZ2V0X2RwbV91Y2xrX2xpbWl0ZWQgPSByZW5vaXJfZ2V0X2RwbV91
Y2xrX2xpbWl0ZWQsCiAJLnByaW50X2Nsa19sZXZlbHMgPSByZW5vaXJfcHJpbnRfY2xrX2xldmVs
cywKKwkuZ2V0X2N1cnJlbnRfcG93ZXJfc3RhdGUgPSByZW5vaXJfZ2V0X2N1cnJlbnRfcG93ZXJf
c3RhdGUsCisKIH07CiAKIHZvaWQgcmVub2lyX3NldF9wcHRfZnVuY3Moc3RydWN0IHNtdV9jb250
ZXh0ICpzbXUpCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
