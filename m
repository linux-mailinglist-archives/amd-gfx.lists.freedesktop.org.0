Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D953BAF1
	for <lists+amd-gfx@lfdr.de>; Mon, 10 Jun 2019 19:26:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F98F89168;
	Mon, 10 Jun 2019 17:26:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740042.outbound.protection.outlook.com [40.107.74.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3E3189168
 for <amd-gfx@lists.freedesktop.org>; Mon, 10 Jun 2019 17:26:52 +0000 (UTC)
Received: from CY4PR1201MB0102.namprd12.prod.outlook.com (10.172.77.148) by
 CY4PR1201MB0200.namprd12.prod.outlook.com (10.172.78.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.17; Mon, 10 Jun 2019 17:26:50 +0000
Received: from CY4PR1201MB0102.namprd12.prod.outlook.com
 ([fe80::318f:bfcc:e4d2:1af9]) by CY4PR1201MB0102.namprd12.prod.outlook.com
 ([fe80::318f:bfcc:e4d2:1af9%8]) with mapi id 15.20.1965.017; Mon, 10 Jun 2019
 17:26:50 +0000
From: "Zhu, James" <James.Zhu@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: explicitly set mmGDS_VMID0_BASE to 0
Thread-Topic: [PATCH] drm/amdgpu: explicitly set mmGDS_VMID0_BASE to 0
Thread-Index: AQHVH7Gw9zH9agXakUyWdIlJNZp1eQ==
Date: Mon, 10 Jun 2019 17:26:50 +0000
Message-ID: <1560187603-16238-1-git-send-email-James.Zhu@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTBPR01CA0001.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::14) To CY4PR1201MB0102.namprd12.prod.outlook.com
 (2603:10b6:910:1b::20)
x-originating-ip: [165.204.55.251]
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 08fc2b94-054f-4551-47ed-08d6edc8d259
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CY4PR1201MB0200; 
x-ms-traffictypediagnostic: CY4PR1201MB0200:
x-microsoft-antispam-prvs: <CY4PR1201MB0200BF5B34786B06124BF06DE4130@CY4PR1201MB0200.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:168;
x-forefront-prvs: 0064B3273C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(346002)(376002)(396003)(136003)(39860400002)(199004)(189003)(7736002)(36756003)(2501003)(478600001)(72206003)(53936002)(305945005)(8936002)(66066001)(256004)(25786009)(6116002)(8676002)(2616005)(316002)(3846002)(81166006)(186003)(26005)(14454004)(81156014)(68736007)(14444005)(6512007)(476003)(64756008)(386003)(6506007)(66446008)(99286004)(52116002)(4326008)(50226002)(66476007)(2906002)(2351001)(486006)(66556008)(6436002)(5660300002)(5640700003)(71200400001)(6916009)(73956011)(71190400001)(86362001)(54906003)(102836004)(66946007)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0200;
 H:CY4PR1201MB0102.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: C6nNLKwZ9ujVd2pgM/G13vU5E8+SvkoLIKGeqcZTtJozeRMjpruuEhY8ohtCqIVqyZyb/ksXdzdsSqXdwihwzVR5xsfyfnf0nesFBulUKWpM15OPFLkPNS4TGmQaaHuxAJu4PDHsccnb2pRxtz3/hrdNBRGWdctyXy5vIOd0c+fXSn7ey0G/vPjzbdI3T0RAKs6wWl/0EMfbo6p1eTh8HOnL6/uflqWIIr//LwJp4QTbNKmtsz6QyrGUVLId9YdvVyHGPZlsPIPq7uveJ88C1k2q1UPWn9tdOxvHZ7UebesRHsBnLKqspgUvWkdvfMOb/+1pEaf1MmgwFwKUxpv4CdNozIMxUycB1e8+xsVhFqgkY3eiFXOkolygYDaTnoVoom2rKd4it6l1bD1y27oB9eGir3kFyC1CA+SLFak+vz0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08fc2b94-054f-4551-47ed-08d6edc8d259
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2019 17:26:50.1495 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jamesz@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0200
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Pt0JRM2DCfLbBgk5vQKneRAjlH4wtBAY/gc3AdK/Q8=;
 b=igyW4pnJuA07FYDrMSrtpJ/KJVSFDEyjXlynK1MKzT59nMDeHtp21v+KEPfHH5R3GYDmqnktxMXqjjcci/+wt3XbhTaw5V4aUOc02w37NvkxO0QLYpZlHdplYVomSq6f7plY7ly8I8dmrqu4ZSrv8RJvq9lEkYKDxviC3DuSGNQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=James.Zhu@amd.com; 
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
Cc: "Shamis, Leonid" <Leonid.Shamis@amd.com>,
 "ckoenig.leichtzumerken@gmail.com" <ckoenig.leichtzumerken@gmail.com>, "Zhu,
 James" <James.Zhu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RXhwbGljaXRseSBzZXQgbW1HRFNfVk1JRDBfQkFTRSB0byAwLiBBbHNvIHVwZGF0ZQ0KR0RTX1ZN
SUQwX0JBU0UvX1NJWkUgd2l0aCBkaXJlY3QgcmVnaXN0ZXIgd3JpdGVzLg0KDQpTaWduZWQtb2Zm
LWJ5OiBKYW1lcyBaaHUgPEphbWVzLlpodUBhbWQuY29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYyB8IDMzICsrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0t
LS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAxOCBkZWxldGlvbnMoLSkN
Cg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jDQppbmRleCBiYTM2YTI4Li43OGM3
OWU5IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYw0K
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYw0KQEAgLTMwNSw2ICsz
MDUsNyBAQCBzdGF0aWMgaW50IGdmeF92OV8wX2dldF9jdV9pbmZvKHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2LA0KIHN0YXRpYyB1aW50NjRfdCBnZnhfdjlfMF9nZXRfZ3B1X2Nsb2NrX2NvdW50
ZXIoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOw0KIHN0YXRpYyB2b2lkIGdmeF92OV8wX3Nl
bGVjdF9zZV9zaChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdTMyIHNlX251bSwgdTMyIHNo
X251bSwgdTMyIGluc3RhbmNlKTsNCiBzdGF0aWMgdm9pZCBnZnhfdjlfMF9yaW5nX2VtaXRfZGVf
bWV0YShzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcpOw0KK3N0YXRpYyB1NjQgZ2Z4X3Y5XzBfcmlu
Z19nZXRfcnB0cl9jb21wdXRlKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZyk7DQogDQogc3RhdGlj
IHZvaWQgZ2Z4X3Y5XzBfaW5pdF9nb2xkZW5fcmVnaXN0ZXJzKHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2KQ0KIHsNCkBAIC0zNjMwLDI1ICszNjMxLDIwIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
c29jMTVfcmVnX2VudHJ5IHNlY19kZWRfY291bnRlcl9yZWdpc3RlcnNbXSA9IHsNCiAgICB7IFNP
QzE1X1JFR19FTlRSWShHQywgMCwgbW1TUUNfRURDX0NOVDMpLCAwLCA0LCA2fSwNCiB9Ow0KIA0K
LQ0KIHN0YXRpYyBpbnQgZ2Z4X3Y5XzBfZG9fZWRjX2dkc193b3JrYXJvdW5kcyhzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldikNCiB7DQogCXN0cnVjdCBhbWRncHVfcmluZyAqcmluZyA9ICZhZGV2
LT5nZnguY29tcHV0ZV9yaW5nWzBdOw0KLQlpbnQgcjsNCisJaW50IGksIHI7DQogDQotCXIgPSBh
bWRncHVfcmluZ19hbGxvYyhyaW5nLCAxNyk7DQorCXIgPSBhbWRncHVfcmluZ19hbGxvYyhyaW5n
LCA3KTsNCiAJaWYgKHIpIHsNCiAJCURSTV9FUlJPUigiYW1kZ3B1OiBHRFMgd29ya2Fyb3VuZHMg
ZmFpbGVkIHRvIGxvY2sgcmluZyAlcyAoJWQpLlxuIiwNCiAJCQlyaW5nLT5uYW1lLCByKTsNCiAJ
CXJldHVybiByOw0KIAl9DQogDQotCWFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIFBBQ0tFVDMoUEFD
S0VUM19XUklURV9EQVRBLCAzKSk7DQotCWFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIFdSSVRFX0RB
VEFfRU5HSU5FX1NFTCgwKSB8DQotCQkJCVdSSVRFX0RBVEFfRFNUX1NFTCgwKSk7DQotCWFtZGdw
dV9yaW5nX3dyaXRlKHJpbmcsIFNPQzE1X1JFR19PRkZTRVQoR0MsIDAsIG1tR0RTX1ZNSUQwX1NJ
WkUpKTsNCi0JYW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgMCk7DQotCWFtZGdwdV9yaW5nX3dyaXRl
KHJpbmcsIGFkZXYtPmdkcy5nZHNfc2l6ZSk7DQorCVdSRUczMl9TT0MxNShHQywgMCwgbW1HRFNf
Vk1JRDBfQkFTRSwgMHgwMDAwMDAwMCk7DQorCVdSRUczMl9TT0MxNShHQywgMCwgbW1HRFNfVk1J
RDBfU0laRSwgYWRldi0+Z2RzLmdkc19zaXplKTsNCiANCiAJYW1kZ3B1X3Jpbmdfd3JpdGUocmlu
ZywgUEFDS0VUMyhQQUNLRVQzX0RNQV9EQVRBLCA1KSk7DQogCWFtZGdwdV9yaW5nX3dyaXRlKHJp
bmcsIChQQUNLRVQzX0RNQV9EQVRBX0NQX1NZTkMgfA0KQEAgLTM2NjIsMTggKzM2NTgsMTkgQEAg
c3RhdGljIGludCBnZnhfdjlfMF9kb19lZGNfZ2RzX3dvcmthcm91bmRzKHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2KQ0KIAlhbWRncHVfcmluZ193cml0ZShyaW5nLCBQQUNLRVQzX0RNQV9EQVRB
X0NNRF9SQVdfV0FJVCB8DQogCQkJCWFkZXYtPmdkcy5nZHNfc2l6ZSk7DQogDQotCWFtZGdwdV9y
aW5nX3dyaXRlKHJpbmcsIFBBQ0tFVDMoUEFDS0VUM19XUklURV9EQVRBLCAzKSk7DQotCWFtZGdw
dV9yaW5nX3dyaXRlKHJpbmcsIFdSSVRFX0RBVEFfRU5HSU5FX1NFTCgwKSB8DQotCQkJCVdSSVRF
X0RBVEFfRFNUX1NFTCgwKSk7DQotCWFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIFNPQzE1X1JFR19P
RkZTRVQoR0MsIDAsIG1tR0RTX1ZNSUQwX1NJWkUpKTsNCi0JYW1kZ3B1X3Jpbmdfd3JpdGUocmlu
ZywgMCk7DQotCWFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIDB4MCk7DQotDQogCWFtZGdwdV9yaW5n
X2NvbW1pdChyaW5nKTsNCiANCi0JcmV0dXJuIDA7DQotfQ0KKwlmb3IgKGkgPSAwOyAoaSA8IGFk
ZXYtPnVzZWNfdGltZW91dCkgJiYNCisJCQkocmluZy0+d3B0ciAhPSBnZnhfdjlfMF9yaW5nX2dl
dF9ycHRyX2NvbXB1dGUocmluZykpOyBpKyspDQorCQlEUk1fVURFTEFZKDEpOw0KKw0KKwlpZiAo
aSA+PSBhZGV2LT51c2VjX3RpbWVvdXQpDQorCQlyID0gLUVUSU1FRE9VVDsNCisNCisJV1JFRzMy
X1NPQzE1KEdDLCAwLCBtbUdEU19WTUlEMF9TSVpFLCAweDAwMDAwMDAwKTsNCiANCisJcmV0dXJu
IHI7DQorfQ0KIA0KIHN0YXRpYyBpbnQgZ2Z4X3Y5XzBfZG9fZWRjX2dwcl93b3JrYXJvdW5kcyhz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCiB7DQotLSANCjIuNy40DQoNCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
