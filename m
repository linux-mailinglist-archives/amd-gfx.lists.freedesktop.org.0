Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AB786F8F
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 04:15:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10B946ECEF;
	Fri,  9 Aug 2019 02:15:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680043.outbound.protection.outlook.com [40.107.68.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01DF16ECEF
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 02:15:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nqffWFkyz3NPggDZ0se6WGOovkW7Cd8ZYYY3Z2PoXIMjJUKVFOl4bRU18o7BRcui3LLqmuo8O3qC2f4AD8wsCjxDWSCYDkHL0tQ6hEEoxfSVi2o/g0865qMHzW/vXjWj6fXxZfziUZsdJD2z0Rokx1Iqf7gS7WuL0AHk12VztJlHbhLeeTVkMNuhPt+i5qP1bf5rsjtrEpl+bDTDwBvs5JU7WxYFBJVAaEGkn8oTy/lpBuISi+t0ubIqrzoB1WWVP5IsZhdgSGuRP2L1p+jN9u7CTLDUdIAyVTHKV4HB8A3a4ZQVtYMVu78yLWua3T4TjjzoUldjyVX3FjfDe+Ue0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h2gamsiLxVkaOfTfNTPVLDaaZCdvDLEjLxj58uEuzOM=;
 b=ZJJGQlP1F1DACwQzrQh058Abb0Pw5lQhrwZIj+br0uszPQBw7+Lw4nioiypwvhZjePE6Jo82z15GSRirV25SwaeJTZd1CoJOPXZ2wp34DhLQTO6IRmT+nBtkT9rxIXPHBut9c+a7wuRtpwAu3FnE4EjBs2cgLEcfGDWnMI0fuO5HLP7yo7/fWdxCTHMZjIf4wkc0Nzg5OmItTyTbipaTYR5SFUZc0WXA2evCWzpIZcwchDhDDpTHcuOrjeg8sKJhgK0r3zKAaFr5JOgjGmpTqZBR/nx05irz8XQABELl0sWAgzviHyqMqNsqyRDrCfEcydm2mKXQeqys80Ta87YvUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2436.namprd12.prod.outlook.com (52.132.29.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Fri, 9 Aug 2019 02:15:46 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::718c:48e0:4e04:5543]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::718c:48e0:4e04:5543%7]) with mapi id 15.20.2157.015; Fri, 9 Aug 2019
 02:15:46 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 5/5] amd/amdgpu: Introduce new page mapping scheme for arcturus
Thread-Topic: [PATCH 5/5] amd/amdgpu: Introduce new page mapping scheme for
 arcturus
Thread-Index: AQHVTlhYULYLXQBvMUGv9m7HlvA6Xg==
Date: Fri, 9 Aug 2019 02:15:42 +0000
Message-ID: <1565316926-19516-5-git-send-email-Oak.Zeng@amd.com>
References: <1565316926-19516-1-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1565316926-19516-1-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0033.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::46) To BL0PR12MB2580.namprd12.prod.outlook.com
 (2603:10b6:207:3e::19)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 70adff07-816b-4819-0e8f-08d71c6f7ab9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR12MB2436; 
x-ms-traffictypediagnostic: BL0PR12MB2436:
x-microsoft-antispam-prvs: <BL0PR12MB2436A6A6A47B0E14960BBE3680D60@BL0PR12MB2436.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:883;
x-forefront-prvs: 01244308DF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(366004)(376002)(346002)(396003)(189003)(199004)(2616005)(14454004)(5660300002)(99286004)(305945005)(316002)(7736002)(478600001)(76176011)(6116002)(36756003)(386003)(6506007)(8936002)(2351001)(6486002)(53936002)(26005)(52116002)(186003)(3846002)(6916009)(54906003)(476003)(71200400001)(71190400001)(2906002)(102836004)(81156014)(6436002)(8676002)(256004)(86362001)(25786009)(11346002)(5640700003)(486006)(66066001)(66476007)(14444005)(81166006)(66446008)(6512007)(66946007)(6666004)(66556008)(64756008)(446003)(50226002)(2501003)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2436;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: EU/M1gOigXnBqOaIa3sK4DsAawwCzUcdtREjDAnfEtt1Ej8yrz8l8SXy/p1WLRorH61ZbCzHWY2gFtO4+n6NkdLhBRNdTaakOaU2Wa24sIkQGPz677bFQsfLgmnnyL+PUyr8gZmO8Edk/BOX0nnhFnRbNpAPe+HT8odlwhUQk0QKU9823BcZ4uQxp5XlRqO5SDuJlMWaj5fWmP/xeM7t/H2h9om3yUhpyYH9/30LniwJjAohNUjVSH2ks9EG9aquCA7IEQKbng/eRwPDEaVxQjCeOgHB7TUQheJ/irW9NinjCedpC2LIubjvmfsvCrqt48kbwsur5mPjXRJHxE4uk8CaP7gluFm9onKB50uRs8FGACcZZpSMHSUing2TNisjq14HuVT2iRVG62vc6SzH9u8owjcrBoG/MoTeYxyy8Fk=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70adff07-816b-4819-0e8f-08d71c6f7ab9
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2019 02:15:42.3879 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AtJ7XKv4iuqN5euslGTb/GbUrhcu6dF5Rsv7yEzaAY0jbXYKdngloXOa9xhlymvV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2436
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h2gamsiLxVkaOfTfNTPVLDaaZCdvDLEjLxj58uEuzOM=;
 b=bLctGseL2GRoTAm8OAqs+ctMWoaGPeYvGJ6v16MahpaTPn3lac8gGCi7ZqD/RSErxbtZy18STw/s3zq55KV7uKUr5oySm7qS9kJo+csmFGnEGe7vkrIgDzoHMPjxA6vLPFYzfl/1/jr8PUecIvgJFmu6+Sdnx8hnS4UQ9ypOBl4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Oak.Zeng@amd.com; 
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Zeng, Oak" <Oak.Zeng@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, "Keely,
 Sean" <Sean.Keely@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlIG5ldyBtZW1vcnkgbWFwcGluZyBzY2hlbWUgaXM6CkZvciB2cmFtOgpGaW5lLWdyYWluIGNv
aGVyZW5jeTogbG9jYWwgQ0MgYW5kIHJlbW90ZSBVQywgd2l0aCBzbm9vcC4KQ29hcnNlLWdyYWlu
IGNvaGVyZW5jeTogbG9jYWwgUlcgYW5kIHJlbW90ZSBVQywgd2l0aCBzbm9vcC4KRm9yIGhvc3Qg
bWVtb3J5IChub3QgY2hhbmdlZCkKRmluZS1ncmFpbiBjb2hlcmVuY3k6IFVDCkNvYXJzZS1ncmFp
biBjb2hlcmVuY3k6IE5DCgpDaGFuZ2UtSWQ6IEk2YTA3MTI0OWY5NTNjYmVkODEzYmZkOTUzYjZh
MmUwODI2ZjU0Zjg2ClNpZ25lZC1vZmYtYnk6IE9hayBaZW5nIDxPYWsuWmVuZ0BhbWQuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192Nl8wLmMgfCAgMSArCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jIHwgNDcgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKy0KIDIgZmlsZXMgY2hhbmdlZCwgNDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192Nl8w
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjZfMC5jCmluZGV4IDJiMmFmNmEu
LjUxZGFlN2YgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192Nl8w
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3Y2XzAuYwpAQCAtNDIwLDYg
KzQyMCw3IEBAIHN0YXRpYyB1aW50MzJfdCBnbWNfdjZfMF9nZXRfdm1fbWFwcGluZ19mbGFncyhz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAogCXJldHVybiBtYXBwaW5nX2ZsYWdzOwogfQor
CiBzdGF0aWMgdm9pZCBnbWNfdjZfMF9zZXRfZmF1bHRfZW5hYmxlX2RlZmF1bHQoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYsCiAJCQkJCSAgICAgIGJvb2wgdmFsdWUpCiB7CmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvZ21jX3Y5XzAuYwppbmRleCA4ZmFlYWQzLi4yZjc0MmUzIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2dtY192OV8wLmMKQEAgLTY0Niw2ICs2NDYsMzUgQEAgc3RhdGljIHVp
bnQzMl90IGdtY192OV8wX2dldF92bV9tYXBwaW5nX2ZsYWdzKHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2LAogCXJldHVybiBtYXBwaW5nX2ZsYWdzOwogfQogCitzdGF0aWMgdWludDMyX3QgZ21j
X3Y5XzBfYXJjdHVydXNfZ2V0X3ZtX21hcHBpbmdfZmxhZ3Moc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYsCisJCQkJdWludDMyX3QgYWxsb2NfZmxhZ3MsIGJvb2wgcmVtb3RlX21hcHBpbmcpCit7
CisJdWludDMyX3QgbWFwcGluZ19mbGFncyA9IEFNREdQVV9WTV9QQUdFX1JFQURBQkxFOworCisJ
aWYgKGFsbG9jX2ZsYWdzICYgQUxMT0NfTUVNX0ZMQUdTX1dSSVRBQkxFKQorCQltYXBwaW5nX2Zs
YWdzIHw9IEFNREdQVV9WTV9QQUdFX1dSSVRFQUJMRTsKKwlpZiAoYWxsb2NfZmxhZ3MgJiBBTExP
Q19NRU1fRkxBR1NfRVhFQ1VUQUJMRSkKKwkJbWFwcGluZ19mbGFncyB8PSBBTURHUFVfVk1fUEFH
RV9FWEVDVVRBQkxFOworCisJaWYgKChhbGxvY19mbGFncyAmIEFMTE9DX01FTV9GTEFHU19WUkFN
KSkgeworCQlpZiAoIXJlbW90ZV9tYXBwaW5nKSB7CisJCQlpZiAoYWxsb2NfZmxhZ3MgJiBBTExP
Q19NRU1fRkxBR1NfQ09IRVJFTlQpCisJCQkJbWFwcGluZ19mbGFncyB8PSBBTURHUFVfVk1fTVRZ
UEVfQ0M7CisJCQllbHNlCisJCQkJbWFwcGluZ19mbGFncyB8PSBBTURHUFVfVk1fTVRZUEVfUlc7
CisJCX0gZWxzZSB7CisJCQltYXBwaW5nX2ZsYWdzIHw9IEFNREdQVV9WTV9NVFlQRV9VQzsKKwkJ
CW1hcHBpbmdfZmxhZ3MgfD0gQU1ER1BVX1ZNX1BBR0VfSU5WQUxJREFURV9QUk9CRTsKKwkJfQor
CX0gZWxzZSB7CisJCWlmIChhbGxvY19mbGFncyAmIEFMTE9DX01FTV9GTEFHU19DT0hFUkVOVCkK
KwkJCW1hcHBpbmdfZmxhZ3MgfD0gQU1ER1BVX1ZNX01UWVBFX1VDOworCQllbHNlCisJCQltYXBw
aW5nX2ZsYWdzIHw9IEFNREdQVV9WTV9NVFlQRV9OQzsKKwl9CisKKwlyZXR1cm4gbWFwcGluZ19m
bGFnczsKK30KIAogc3RhdGljIGNvbnN0IHN0cnVjdCBhbWRncHVfZ21jX2Z1bmNzIGdtY192OV8w
X2dtY19mdW5jcyA9IHsKIAkuZmx1c2hfZ3B1X3RsYiA9IGdtY192OV8wX2ZsdXNoX2dwdV90bGIs
CkBAIC02NTYsOSArNjg1LDI1IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYW1kZ3B1X2dtY19mdW5j
cyBnbWNfdjlfMF9nbWNfZnVuY3MgPSB7CiAJLmdldF92bV9tYXBwaW5nX2ZsYWdzID0gZ21jX3Y5
XzBfZ2V0X3ZtX21hcHBpbmdfZmxhZ3MKIH07CiAKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgYW1kZ3B1
X2dtY19mdW5jcyBnbWNfdjlfMF9hcmN0dXJ1c19nbWNfZnVuY3MgPSB7CisJLmZsdXNoX2dwdV90
bGIgPSBnbWNfdjlfMF9mbHVzaF9ncHVfdGxiLAorCS5lbWl0X2ZsdXNoX2dwdV90bGIgPSBnbWNf
djlfMF9lbWl0X2ZsdXNoX2dwdV90bGIsCisJLmVtaXRfcGFzaWRfbWFwcGluZyA9IGdtY192OV8w
X2VtaXRfcGFzaWRfbWFwcGluZywKKwkuZ2V0X3ZtX3B0ZV9mbGFncyA9IGdtY192OV8wX2dldF92
bV9wdGVfZmxhZ3MsCisJLmdldF92bV9wZGUgPSBnbWNfdjlfMF9nZXRfdm1fcGRlLAorCS5nZXRf
dm1fbWFwcGluZ19mbGFncyA9IGdtY192OV8wX2FyY3R1cnVzX2dldF92bV9tYXBwaW5nX2ZsYWdz
Cit9OworCiBzdGF0aWMgdm9pZCBnbWNfdjlfMF9zZXRfZ21jX2Z1bmNzKHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2KQogewotCWFkZXYtPmdtYy5nbWNfZnVuY3MgPSAmZ21jX3Y5XzBfZ21jX2Z1
bmNzOworCXN3aXRjaChhZGV2LT5hc2ljX3R5cGUpIHsKKwljYXNlIENISVBfQVJDVFVSVVM6CisJ
CWFkZXYtPmdtYy5nbWNfZnVuY3MgPSAmZ21jX3Y5XzBfYXJjdHVydXNfZ21jX2Z1bmNzOworCQli
cmVhazsKKwlkZWZhdWx0OgorCQlhZGV2LT5nbWMuZ21jX2Z1bmNzID0gJmdtY192OV8wX2dtY19m
dW5jczsKKwkJYnJlYWs7CisJfQogfQogCiBzdGF0aWMgdm9pZCBnbWNfdjlfMF9zZXRfdW1jX2Z1
bmNzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQotLSAKMi43LjQKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
