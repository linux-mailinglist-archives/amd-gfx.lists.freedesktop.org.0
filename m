Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 597893BDC1
	for <lists+amd-gfx@lfdr.de>; Mon, 10 Jun 2019 22:48:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D37F890AD;
	Mon, 10 Jun 2019 20:48:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690055.outbound.protection.outlook.com [40.107.69.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 056B4890A9
 for <amd-gfx@lists.freedesktop.org>; Mon, 10 Jun 2019 20:48:41 +0000 (UTC)
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2579.namprd12.prod.outlook.com (52.132.27.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.15; Mon, 10 Jun 2019 20:48:39 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::991:7474:933e:d61]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::991:7474:933e:d61%4]) with mapi id 15.20.1965.017; Mon, 10 Jun 2019
 20:48:39 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/amdkfd: Initialize HSA_CAP_ATS_PRESENT capability in
 topology codes
Thread-Topic: [PATCH 1/2] drm/amdkfd: Initialize HSA_CAP_ATS_PRESENT
 capability in topology codes
Thread-Index: AQHVH83hqzPvNroasUKFWS4+jNr7AQ==
Date: Mon, 10 Jun 2019 20:48:39 +0000
Message-ID: <1560199712-15472-1-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0010.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::23) To BL0PR12MB2580.namprd12.prod.outlook.com
 (2603:10b6:207:3e::19)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ceacd6b1-05ec-4eef-39c7-08d6ede5041a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR12MB2579; 
x-ms-traffictypediagnostic: BL0PR12MB2579:
x-microsoft-antispam-prvs: <BL0PR12MB2579ACE4FC5A9E6AA2DE722A80130@BL0PR12MB2579.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0064B3273C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(136003)(376002)(396003)(346002)(366004)(199004)(189003)(99286004)(68736007)(2616005)(81166006)(305945005)(7736002)(476003)(26005)(8936002)(81156014)(186003)(54906003)(8676002)(50226002)(102836004)(6506007)(72206003)(386003)(86362001)(14454004)(52116002)(6512007)(486006)(478600001)(5660300002)(2351001)(66066001)(71190400001)(5640700003)(66446008)(316002)(71200400001)(53936002)(6116002)(66946007)(66476007)(64756008)(3846002)(6486002)(6436002)(6916009)(2906002)(25786009)(256004)(2501003)(66556008)(73956011)(36756003)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2579;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kP1SCriJXpAkG15vYr5bkqEETjGVjAv+KrUH4S2IhYp7YN0oSWZqmiu/MXPDR5h+eeVNSfewzKn5sfs2iTPA3V445jFopeFrGqPorFTWdiLEAL0nFGbQJ4q6MbwUKFwfbOPir8e6CkibnRl81PE2uERLyTNexlB+Hfaj4dmI9NTs0UcalQd0BvKbX/2dr7gnFzAucwSw6fuaoJcWDhwkjboBGCEPQM4H3yi9HJl2wt/0Rf5lfsXddng35MhkiNQwUD6jGdDiuIehqNIJVwcs+emc2rJeI2sMxo5rtOrjVKP41M7cj5LnHbtiab9IZ3EV3N+P3qTV2jU1r3qtyYdmKRNbxUXu1CPG4bZXu7rGPL/PEdSQdRXQh03GC+ZktJKP/HdeFWWN+AgdRQZVuwhtyjin1framUDmVWTLu5wg834=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ceacd6b1-05ec-4eef-39c7-08d6ede5041a
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2019 20:48:39.4793 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ozeng@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2579
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h9t+KvdT4O4v9yIaJUY2mgvUre/f5N+Wjq0sUAVDF/k=;
 b=vsY9UFj0+nYSveLywJoNzbYV/0nz++9edt67lDiYMb8tU3PNR5KDQEl0HF/NGiMWj1tcMG1LcJfTJH+2QL0LK5UofnIChWLc+EYgonMBKTGoiYPSVJl/SdfPgTQKrWPup80VfBUPuyUmg6rUw1kfX8vHY0zl4jTDim4X57tx1yg=
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
Cc: "Zhao, Yong" <Yong.Zhao@amd.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, "Zeng, Oak" <Oak.Zeng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

TW92ZSBIU0FfQ0FQX0FUU19QUkVTRU5UIGluaXRpYWxpemF0aW9uIGxvZ2ljIGZyb20ga2ZkIGlv
bW11IGNvZGVzIHRvDQprZmQgdG9wb2xvZ3kgY29kZXMuIFRoaXMgcmVtb3ZlcyBrZmRfaW9tbXVf
ZGV2aWNlX2luaXQncyBkZXBlbmRlbmN5DQpvbiBrZmRfdG9wb2xvZ3lfYWRkX2RldmljZS4gQWxz
byByZW1vdmUgZHVwbGljYXRlIGNvZGUgc2V0dGluZyB0aGUNCnNhbWUuDQoNCkNoYW5nZS1JZDog
STJiZjNjMDAwZDQ3OTViNDFhZmUxYjM5ZmU2Nzk2NzdjMWY4NmJmYmUNClNpZ25lZC1vZmYtYnk6
IE9hayBaZW5nIDxPYWsuWmVuZ0BhbWQuY29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRrZmQva2ZkX2lvbW11LmMgICAgfCAxMCArLS0tLS0tLS0tDQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRrZmQva2ZkX3RvcG9sb2d5LmMgfCAgNiArKysrKy0NCiAyIGZpbGVzIGNoYW5nZWQsIDYg
aW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGtmZC9rZmRfaW9tbXUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2Zk
L2tmZF9pb21tdS5jDQppbmRleCAwMTQ5NDc1Li41ZjM1ZGYyIDEwMDY0NA0KLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2lvbW11LmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1ka2ZkL2tmZF9pb21tdS5jDQpAQCAtNjYsMTYgKzY2LDggQEAgaW50IGtmZF9pb21tdV9k
ZXZpY2VfaW5pdChzdHJ1Y3Qga2ZkX2RldiAqa2ZkKQ0KIA0KIAl0b3BfZGV2ID0ga2ZkX3RvcG9s
b2d5X2RldmljZV9ieV9pZChrZmQtPmlkKTsNCiANCi0JLyoNCi0JICogT3ZlcndyaXRlIEFUUyBj
YXBhYmlsaXR5IGFjY29yZGluZyB0byBuZWVkc19pb21tdV9kZXZpY2UgdG8gZml4DQotCSAqIHBv
dGVudGlhbCBtaXNzaW5nIGNvcnJlc3BvbmRpbmcgYml0IGluIENSQVQgb2YgQklPUy4NCi0JICov
DQotCWlmICgha2ZkLT5kZXZpY2VfaW5mby0+bmVlZHNfaW9tbXVfZGV2aWNlKSB7DQotCQl0b3Bf
ZGV2LT5ub2RlX3Byb3BzLmNhcGFiaWxpdHkgJj0gfkhTQV9DQVBfQVRTX1BSRVNFTlQ7DQorCWlm
ICgha2ZkLT5kZXZpY2VfaW5mby0+bmVlZHNfaW9tbXVfZGV2aWNlKQ0KIAkJcmV0dXJuIDA7DQot
CX0NCi0NCi0JdG9wX2Rldi0+bm9kZV9wcm9wcy5jYXBhYmlsaXR5IHw9IEhTQV9DQVBfQVRTX1BS
RVNFTlQ7DQogDQogCWlvbW11X2luZm8uZmxhZ3MgPSAwOw0KIAllcnIgPSBhbWRfaW9tbXVfZGV2
aWNlX2luZm8oa2ZkLT5wZGV2LCAmaW9tbXVfaW5mbyk7DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRrZmQva2ZkX3RvcG9sb2d5LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGtmZC9rZmRfdG9wb2xvZ3kuYw0KaW5kZXggZDI0MWE4Ni4uMWMxODRiMyAxMDA2NDQNCi0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF90b3BvbG9neS5jDQorKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfdG9wb2xvZ3kuYw0KQEAgLTEzMzAsNiArMTMzMCwxMSBA
QCBpbnQga2ZkX3RvcG9sb2d5X2FkZF9kZXZpY2Uoc3RydWN0IGtmZF9kZXYgKmdwdSkNCiAJCSAg
ICAgZGV2LT5ncHUtPmRldmljZV9pbmZvLT5hc2ljX2ZhbWlseSk7DQogCX0NCiANCisJaWYgKGRl
di0+Z3B1LT5kZXZpY2VfaW5mby0+bmVlZHNfaW9tbXVfZGV2aWNlKQ0KKwkJZGV2LT5ub2RlX3By
b3BzLmNhcGFiaWxpdHkgfD0gSFNBX0NBUF9BVFNfUFJFU0VOVDsNCisJZWxzZQ0KKwkJZGV2LT5u
b2RlX3Byb3BzLmNhcGFiaWxpdHkgJj0gfkhTQV9DQVBfQVRTX1BSRVNFTlQ7DQorDQogCS8qIEZp
eCBlcnJvcnMgaW4gQ1ogQ1JBVC4NCiAJICogc2ltZF9jb3VudDogQ2Fycml6byBDUkFUIHJlcG9y
dHMgd3Jvbmcgc2ltZF9jb3VudCwgcHJvYmFibHkNCiAJICoJCWJlY2F1c2UgaXQgZG9lc24ndCBj
b25zaWRlciBtYXNrZWQgb3V0IENVcw0KQEAgLTEzNDAsNyArMTM0NSw2IEBAIGludCBrZmRfdG9w
b2xvZ3lfYWRkX2RldmljZShzdHJ1Y3Qga2ZkX2RldiAqZ3B1KQ0KIAkJZGV2LT5ub2RlX3Byb3Bz
LnNpbWRfY291bnQgPQ0KIAkJCWN1X2luZm8uc2ltZF9wZXJfY3UgKiBjdV9pbmZvLmN1X2FjdGl2
ZV9udW1iZXI7DQogCQlkZXYtPm5vZGVfcHJvcHMubWF4X3dhdmVzX3Blcl9zaW1kID0gMTA7DQot
CQlkZXYtPm5vZGVfcHJvcHMuY2FwYWJpbGl0eSB8PSBIU0FfQ0FQX0FUU19QUkVTRU5UOw0KIAl9
DQogDQogCWN0eCA9IGFtZGdwdV9yYXNfZ2V0X2NvbnRleHQoKHN0cnVjdCBhbWRncHVfZGV2aWNl
ICopKGRldi0+Z3B1LT5rZ2QpKTsNCi0tIA0KMi43LjQNCg0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4
