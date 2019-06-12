Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E9B426D3
	for <lists+amd-gfx@lfdr.de>; Wed, 12 Jun 2019 14:59:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F0E58930C;
	Wed, 12 Jun 2019 12:59:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710045.outbound.protection.outlook.com [40.107.71.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9D018930C
 for <amd-gfx@lists.freedesktop.org>; Wed, 12 Jun 2019 12:59:37 +0000 (UTC)
Received: from CY4PR1201MB0102.namprd12.prod.outlook.com (10.172.77.148) by
 CY4PR1201MB0229.namprd12.prod.outlook.com (10.172.78.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.17; Wed, 12 Jun 2019 12:59:36 +0000
Received: from CY4PR1201MB0102.namprd12.prod.outlook.com
 ([fe80::318f:bfcc:e4d2:1af9]) by CY4PR1201MB0102.namprd12.prod.outlook.com
 ([fe80::318f:bfcc:e4d2:1af9%8]) with mapi id 15.20.1965.017; Wed, 12 Jun 2019
 12:59:36 +0000
From: "Zhu, James" <James.Zhu@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2] drm/amdgpu: explicitly set mmGDS_VMID0_BASE to 0
Thread-Topic: [PATCH v2] drm/amdgpu: explicitly set mmGDS_VMID0_BASE to 0
Thread-Index: AQHVIR6vPM0jVYCjyk2aeH6iXqDV6Q==
Date: Wed, 12 Jun 2019 12:59:35 +0000
Message-ID: <1560344364-20059-1-git-send-email-James.Zhu@amd.com>
References: <1560187603-16238-1-git-send-email-James.Zhu@amd.com>
In-Reply-To: <1560187603-16238-1-git-send-email-James.Zhu@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0050.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::27) To CY4PR1201MB0102.namprd12.prod.outlook.com
 (2603:10b6:910:1b::20)
x-originating-ip: [165.204.55.251]
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1154997c-5ebe-45fb-62d7-08d6ef35d1d4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CY4PR1201MB0229; 
x-ms-traffictypediagnostic: CY4PR1201MB0229:
x-microsoft-antispam-prvs: <CY4PR1201MB02290053594845268C9903FFE4EC0@CY4PR1201MB0229.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:168;
x-forefront-prvs: 0066D63CE6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(366004)(346002)(396003)(39860400002)(136003)(189003)(199004)(2616005)(66476007)(2351001)(486006)(73956011)(476003)(72206003)(6436002)(66556008)(36756003)(66066001)(64756008)(66446008)(66946007)(4326008)(71190400001)(71200400001)(52116002)(478600001)(86362001)(53936002)(316002)(2906002)(186003)(11346002)(446003)(76176011)(54906003)(305945005)(26005)(6916009)(7736002)(5640700003)(50226002)(81156014)(8936002)(102836004)(386003)(6506007)(14454004)(6486002)(99286004)(25786009)(8676002)(3846002)(5660300002)(2501003)(68736007)(81166006)(6512007)(14444005)(256004)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0229;
 H:CY4PR1201MB0102.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +yoYKsdz/0zDH9RVKCW3FnAWrKkzh0+6hNtycozepAtuGzwci0SiqLoUpdvesrBE+nV2q2CVlzKSTv9j0G8BGDLZrgj9zZTbtkqQMHGDue4D/S84LOYZaK+DxKv/JhgiS8DoTmLJ4yY84EjJUIE3rK4/5VMhJgN6yuTAIzemg4p2w3adjQMu05bABCCW/X12ZS/GkB8bvOFSQ3CFPAE4T4U3WfGvjKYUfjq7r756/qGCbGzq5K9shP/P0sFMfSMUsqW/hGzzLu04JAh+2dybs2hQ4Qzgo0tDumew07es+xXZr2ST3vESg04cXzyYfnpe+z67zP9XOsLxFKnWC7zvp0gINj6Ska1y0c67b7YG2iOF8G2ELynitAND3gOmQW9e0eAXiAanmUBod8G6jDMEdp8GrbpYnXEzecKSle7lxFM=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1154997c-5ebe-45fb-62d7-08d6ef35d1d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2019 12:59:36.1113 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jamesz@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0229
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jikUDh6BKhMrfgCgX1Lx3GrPZaUCGjMcO6DyO9R5U1M=;
 b=Q5hCO0ElLlS+rJAZVBHf4nuDwPlkSBf4knHFUQulkrHrKrDZK48NGArxaJegkk+hnOGqb8qeQMLACZ6CGteqLxtv2h6heIYCmlNCipw35i9sYtUR5nAdg5VMsTpkPjI0VpBwadaMdrVb6/qck0PQuikJjBMGklyPr1d4A3TZ+DE=
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
L2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYyB8IDM1ICsrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0t
LS0tLS0tDQogMSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygt
KQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y5XzAuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMNCmluZGV4IGJhMzZhMjguLjJl
MDU4YmYgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5j
DQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jDQpAQCAtMzA1LDYg
KzMwNSw3IEBAIHN0YXRpYyBpbnQgZ2Z4X3Y5XzBfZ2V0X2N1X2luZm8oc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYsDQogc3RhdGljIHVpbnQ2NF90IGdmeF92OV8wX2dldF9ncHVfY2xvY2tfY291
bnRlcihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7DQogc3RhdGljIHZvaWQgZ2Z4X3Y5XzBf
c2VsZWN0X3NlX3NoKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCB1MzIgc2VfbnVtLCB1MzIg
c2hfbnVtLCB1MzIgaW5zdGFuY2UpOw0KIHN0YXRpYyB2b2lkIGdmeF92OV8wX3JpbmdfZW1pdF9k
ZV9tZXRhKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZyk7DQorc3RhdGljIHU2NCBnZnhfdjlfMF9y
aW5nX2dldF9ycHRyX2NvbXB1dGUoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nKTsNCiANCiBzdGF0
aWMgdm9pZCBnZnhfdjlfMF9pbml0X2dvbGRlbl9yZWdpc3RlcnMoc3RydWN0IGFtZGdwdV9kZXZp
Y2UgKmFkZXYpDQogew0KQEAgLTM2MzAsMjUgKzM2MzEsMjAgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBzb2MxNV9yZWdfZW50cnkgc2VjX2RlZF9jb3VudGVyX3JlZ2lzdGVyc1tdID0gew0KICAgIHsg
U09DMTVfUkVHX0VOVFJZKEdDLCAwLCBtbVNRQ19FRENfQ05UMyksIDAsIDQsIDZ9LA0KIH07DQog
DQotDQogc3RhdGljIGludCBnZnhfdjlfMF9kb19lZGNfZ2RzX3dvcmthcm91bmRzKHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2KQ0KIHsNCiAJc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nID0gJmFk
ZXYtPmdmeC5jb21wdXRlX3JpbmdbMF07DQotCWludCByOw0KKwlpbnQgaSwgcjsNCiANCi0JciA9
IGFtZGdwdV9yaW5nX2FsbG9jKHJpbmcsIDE3KTsNCisJciA9IGFtZGdwdV9yaW5nX2FsbG9jKHJp
bmcsIDcpOw0KIAlpZiAocikgew0KIAkJRFJNX0VSUk9SKCJhbWRncHU6IEdEUyB3b3JrYXJvdW5k
cyBmYWlsZWQgdG8gbG9jayByaW5nICVzICglZCkuXG4iLA0KIAkJCXJpbmctPm5hbWUsIHIpOw0K
IAkJcmV0dXJuIHI7DQogCX0NCiANCi0JYW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgUEFDS0VUMyhQ
QUNLRVQzX1dSSVRFX0RBVEEsIDMpKTsNCi0JYW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgV1JJVEVf
REFUQV9FTkdJTkVfU0VMKDApIHwNCi0JCQkJV1JJVEVfREFUQV9EU1RfU0VMKDApKTsNCi0JYW1k
Z3B1X3Jpbmdfd3JpdGUocmluZywgU09DMTVfUkVHX09GRlNFVChHQywgMCwgbW1HRFNfVk1JRDBf
U0laRSkpOw0KLQlhbWRncHVfcmluZ193cml0ZShyaW5nLCAwKTsNCi0JYW1kZ3B1X3Jpbmdfd3Jp
dGUocmluZywgYWRldi0+Z2RzLmdkc19zaXplKTsNCisJV1JFRzMyX1NPQzE1KEdDLCAwLCBtbUdE
U19WTUlEMF9CQVNFLCAweDAwMDAwMDAwKTsNCisJV1JFRzMyX1NPQzE1KEdDLCAwLCBtbUdEU19W
TUlEMF9TSVpFLCBhZGV2LT5nZHMuZ2RzX3NpemUpOw0KIA0KIAlhbWRncHVfcmluZ193cml0ZShy
aW5nLCBQQUNLRVQzKFBBQ0tFVDNfRE1BX0RBVEEsIDUpKTsNCiAJYW1kZ3B1X3Jpbmdfd3JpdGUo
cmluZywgKFBBQ0tFVDNfRE1BX0RBVEFfQ1BfU1lOQyB8DQpAQCAtMzY2MiwxOCArMzY1OCwyMSBA
QCBzdGF0aWMgaW50IGdmeF92OV8wX2RvX2VkY19nZHNfd29ya2Fyb3VuZHMoc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYpDQogCWFtZGdwdV9yaW5nX3dyaXRlKHJpbmcsIFBBQ0tFVDNfRE1BX0RB
VEFfQ01EX1JBV19XQUlUIHwNCiAJCQkJYWRldi0+Z2RzLmdkc19zaXplKTsNCiANCi0JYW1kZ3B1
X3Jpbmdfd3JpdGUocmluZywgUEFDS0VUMyhQQUNLRVQzX1dSSVRFX0RBVEEsIDMpKTsNCi0JYW1k
Z3B1X3Jpbmdfd3JpdGUocmluZywgV1JJVEVfREFUQV9FTkdJTkVfU0VMKDApIHwNCi0JCQkJV1JJ
VEVfREFUQV9EU1RfU0VMKDApKTsNCi0JYW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgU09DMTVfUkVH
X09GRlNFVChHQywgMCwgbW1HRFNfVk1JRDBfU0laRSkpOw0KLQlhbWRncHVfcmluZ193cml0ZShy
aW5nLCAwKTsNCi0JYW1kZ3B1X3Jpbmdfd3JpdGUocmluZywgMHgwKTsNCi0NCiAJYW1kZ3B1X3Jp
bmdfY29tbWl0KHJpbmcpOw0KIA0KLQlyZXR1cm4gMDsNCi19DQorCWZvciAoaSA9IDA7IGkgPCBh
ZGV2LT51c2VjX3RpbWVvdXQ7IGkrKykgew0KKwkJaWYgKHJpbmctPndwdHIgPT0gZ2Z4X3Y5XzBf
cmluZ19nZXRfcnB0cl9jb21wdXRlKHJpbmcpKQ0KKwkJCWJyZWFrOw0KKwkJRFJNX1VERUxBWSgx
KTsNCisJfQ0KKw0KKwlpZiAoaSA+PSBhZGV2LT51c2VjX3RpbWVvdXQpDQorCQlyID0gLUVUSU1F
RE9VVDsNCisNCisJV1JFRzMyX1NPQzE1KEdDLCAwLCBtbUdEU19WTUlEMF9TSVpFLCAweDAwMDAw
MDAwKTsNCiANCisJcmV0dXJuIHI7DQorfQ0KIA0KIHN0YXRpYyBpbnQgZ2Z4X3Y5XzBfZG9fZWRj
X2dwcl93b3JrYXJvdW5kcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikNCiB7DQotLSANCjIu
Ny40DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFt
ZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
