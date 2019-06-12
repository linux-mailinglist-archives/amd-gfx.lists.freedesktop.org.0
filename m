Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E44B242713
	for <lists+amd-gfx@lfdr.de>; Wed, 12 Jun 2019 15:11:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 323B48936B;
	Wed, 12 Jun 2019 13:11:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810084.outbound.protection.outlook.com [40.107.81.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD8A88936B
 for <amd-gfx@lists.freedesktop.org>; Wed, 12 Jun 2019 13:11:15 +0000 (UTC)
Received: from CY4PR1201MB0102.namprd12.prod.outlook.com (10.172.77.148) by
 CY4PR1201MB2549.namprd12.prod.outlook.com (10.172.121.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.14; Wed, 12 Jun 2019 13:11:14 +0000
Received: from CY4PR1201MB0102.namprd12.prod.outlook.com
 ([fe80::318f:bfcc:e4d2:1af9]) by CY4PR1201MB0102.namprd12.prod.outlook.com
 ([fe80::318f:bfcc:e4d2:1af9%8]) with mapi id 15.20.1965.017; Wed, 12 Jun 2019
 13:11:14 +0000
From: "Zhu, James" <James.Zhu@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v3] drm/amdgpu: explicitly set mmGDS_VMID0_BASE to 0
Thread-Topic: [PATCH v3] drm/amdgpu: explicitly set mmGDS_VMID0_BASE to 0
Thread-Index: AQHVISBPgmOcyZxUVkyALKSo2Go/6A==
Date: Wed, 12 Jun 2019 13:11:14 +0000
Message-ID: <1560345067-20838-1-git-send-email-James.Zhu@amd.com>
References: <1560187603-16238-1-git-send-email-James.Zhu@amd.com>
In-Reply-To: <1560187603-16238-1-git-send-email-James.Zhu@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YT1PR01CA0017.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::30)
 To CY4PR1201MB0102.namprd12.prod.outlook.com
 (2603:10b6:910:1b::20)
x-originating-ip: [165.204.55.251]
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 001dba8d-0c93-42e4-ebe7-08d6ef377232
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CY4PR1201MB2549; 
x-ms-traffictypediagnostic: CY4PR1201MB2549:
x-microsoft-antispam-prvs: <CY4PR1201MB254985477E1728A189CEC429E4EC0@CY4PR1201MB2549.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:168;
x-forefront-prvs: 0066D63CE6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(376002)(396003)(136003)(39860400002)(366004)(189003)(199004)(386003)(14444005)(36756003)(54906003)(8676002)(478600001)(53936002)(446003)(72206003)(8936002)(256004)(81166006)(6916009)(81156014)(2616005)(186003)(11346002)(7736002)(66066001)(50226002)(2906002)(486006)(26005)(102836004)(6506007)(5660300002)(4326008)(476003)(6436002)(25786009)(6512007)(305945005)(14454004)(2501003)(86362001)(68736007)(6116002)(73956011)(66946007)(316002)(71190400001)(99286004)(2351001)(6486002)(64756008)(66556008)(3846002)(52116002)(66446008)(66476007)(71200400001)(5640700003)(76176011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB2549;
 H:CY4PR1201MB0102.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: BTZiPCw9XDfDMRfcn58hy2ca8U5pB3PFjwk2AOJQYKod4uQCCfs0u4TzyZpj5FMMxgnp/DD6p/355hY9GBzilAHE3/w//4t9O4p9hVJJmuQdaJXK91erAGwWJlzD0ZZIp5+h33pz+bCfyBvPAc7TwuN59TZvLtCbGmRyQGXLMJv7GXtUS/qB5ypQaM+DQL14KGYOukQCuzIHqUSoAtsBSWvXElS7wF8OVmQyPXlcyxwjJ2MKvh5YFZycIyNQnmIVKfNSAv/oRFGtMztn5qfXCI5ln0iB7dWdkHqIyxLAvWBog+EQUIt5u6p7HsF17NFglUvDuqDY5s0yzPigEIjaHtF47MZZ7ghTImQOyhZdPSyVJu+KE24K6j2TzzObG57kP9JWZsZALUyLvzJNGTaLLswMoljIla5Ui8S8TjpHcGE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 001dba8d-0c93-42e4-ebe7-08d6ef377232
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2019 13:11:14.1386 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jamesz@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2549
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xV1ZJcln9FfLGMKK5aAzS/G3nLbq/S2G8dMChitHNBU=;
 b=MHXSKQbIpkpgo1lqrROev59nprGxfx4bkT1AP3dFo7gQ3X/2hFTwUS6Kqu5eZR7zbCCe4sG7ZPDcjlMhSPxZvPcIzKiGaC6JLo/K1l3lrof6j0r8qfxDQ/2rsdjyeTG3dxzg1slQTO9oFnI8p0E54b3KvGy2ZQUI98v+jXN61Fo=
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
 "ckoenig.leichtzumerken@gmail.com" <ckoenig.leichtzumerken@gmail.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Zhu,
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
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMNCmluZGV4IGJhMzZhMjguLjIx
NWE0YTAgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5j
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
cmluZ19nZXRfcnB0cl9jb21wdXRlKHJpbmcpKQ0KKwkJCWJyZWFrOw0KKwkJdWRlbGF5KDEpOw0K
Kwl9DQorDQorCWlmIChpID49IGFkZXYtPnVzZWNfdGltZW91dCkNCisJCXIgPSAtRVRJTUVET1VU
Ow0KKw0KKwlXUkVHMzJfU09DMTUoR0MsIDAsIG1tR0RTX1ZNSUQwX1NJWkUsIDB4MDAwMDAwMDAp
Ow0KIA0KKwlyZXR1cm4gcjsNCit9DQogDQogc3RhdGljIGludCBnZnhfdjlfMF9kb19lZGNfZ3By
X3dvcmthcm91bmRzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KIHsNCi0tIA0KMi43LjQN
Cg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
