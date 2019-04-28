Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BACEB59A
	for <lists+amd-gfx@lfdr.de>; Sun, 28 Apr 2019 09:44:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2CD289166;
	Sun, 28 Apr 2019 07:44:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810075.outbound.protection.outlook.com [40.107.81.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10A948913E
 for <amd-gfx@lists.freedesktop.org>; Sun, 28 Apr 2019 07:44:13 +0000 (UTC)
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (20.179.92.82) by
 BYAPR12MB2933.namprd12.prod.outlook.com (20.179.91.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.12; Sun, 28 Apr 2019 07:44:10 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::9118:73f2:809c:22c7]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::9118:73f2:809c:22c7%4]) with mapi id 15.20.1835.010; Sun, 28 Apr 2019
 07:44:10 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 10/27] drm/amdkfd: Allocate MQD trunk for HIQ and SDMA
Thread-Topic: [PATCH 10/27] drm/amdkfd: Allocate MQD trunk for HIQ and SDMA
Thread-Index: AQHU/ZYqlKrVKFZUj0+Koz7wAG4Wfw==
Date: Sun, 28 Apr 2019 07:44:10 +0000
Message-ID: <20190428074331.30107-11-Felix.Kuehling@amd.com>
References: <20190428074331.30107-1-Felix.Kuehling@amd.com>
In-Reply-To: <20190428074331.30107-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-mailer: git-send-email 2.17.1
x-clientproxiedby: YTXPR0101CA0015.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::28) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:133::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aab64d0e-759f-4007-e425-08d6cbad4d00
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB2933; 
x-ms-traffictypediagnostic: BYAPR12MB2933:
x-microsoft-antispam-prvs: <BYAPR12MB2933868F74A0BFB5F974D4A292380@BYAPR12MB2933.namprd12.prod.outlook.com>
x-forefront-prvs: 0021920B5A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(396003)(136003)(346002)(376002)(366004)(199004)(189003)(50226002)(81156014)(76176011)(54906003)(6512007)(4326008)(81166006)(8676002)(2616005)(3846002)(97736004)(186003)(8936002)(6116002)(6506007)(86362001)(36756003)(305945005)(6486002)(6436002)(7736002)(386003)(5640700003)(25786009)(11346002)(26005)(6916009)(1076003)(99286004)(256004)(5660300002)(2351001)(486006)(52116002)(2906002)(73956011)(71200400001)(2501003)(14454004)(53936002)(71190400001)(66476007)(66556008)(68736007)(66066001)(476003)(316002)(72206003)(102836004)(478600001)(64756008)(66946007)(66446008)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2933;
 H:BYAPR12MB3176.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: OalnAefuMhtmHqWUR+CXLmTxCQRNXr6z1KlKs3NJMmxEIezfpkxWSblDzeBF6kUSjkCadqKFrbr9qYlnKuwvaJ8V/+sM+ZfrzihLmd6Mr+ty7d2wuhDF3urDsrxD1puh1+5R3t1u/bo7jAyf9OcIbxe+D2c/0EWW53xLWQlNxBGBKhOBhVYWmKA2rhE8p5WAM1eftOK06hYJT3UeoTNIV6y7kibjZw4Co9PpN5IdgCU7rPoGu44Uxe9jeQOebUuMhtC8dIpDA2f9gW+/UFkeJFqMti7psVuYwGBwVywihQNBvt6FyOxLc/lpVIz/VZimBeFD7dJQBHR2Rq7kKof3aNzGJSjNdlyOs3T6ik7I2jqRNvH5neK8Nm13nTPGeWBC0UkcDBmNm0E/IL9d7xuEA/HU9J8B70s2gDgPyKAmuXI=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aab64d0e-759f-4007-e425-08d6cbad4d00
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2019 07:44:10.3900 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2933
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6gnMIja9P9W+HsR2rvUtmmb0TiXty0MrFGBPz2cFSAI=;
 b=dHlIfq7yJRzApzsF8menbZTrkuHCTyjMS5fvbSE+b2Rf0ChrzB14Fhm26kM5eXXUjp9n/Mm6azydhSqc7z7zJArcJqkd9+NOnebcJn5WbvHaDQLNz2WgQkZ2uGiGGzbQHJosCLDZMEHLsmiM+QPOI8G0xKi78sxmPE1iB94dy+g=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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
Cc: "Zeng, Oak" <Oak.Zeng@amd.com>, "Kuehling, Felix" <Felix.Kuehling@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogT2FrIFplbmcgPG96ZW5nQGFtZC5jb20+DQoNCk1FQyBGVyBmb3Igc29tZSBuZXcgYXNp
YyByZXF1aXJlcyBhbGwgU0RNQSBNUURzIHRvIGJlIGluIGEgY29udGludW91cw0KdHJ1bmsgb2Yg
bWVtb3J5IHJpZ2h0IGFmdGVyIEhJUSBNUUQuIEFkZCBhIGZpZWxkIGluIGRldmljZSBxdWV1ZSBt
YW5hZ2VyDQp0byBob2xkIHRoZSBISVEvU0RNQSBNUUQgbWVtb3J5IG9iamVjdCBhbmQgYWxsb2Nh
dGUgTVFEIHRydW5rIG9uIGRldmljZQ0KcXVldWUgbWFuYWdlciBpbml0aWFsaXphdGlvbi4NCg0K
U2lnbmVkLW9mZi1ieTogT2FrIFplbmcgPG96ZW5nQGFtZC5jb20+DQpSZXZpZXdlZC1ieTogRmVs
aXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+DQpTaWduZWQtb2ZmLWJ5OiBGZWxp
eCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4NCi0tLQ0KIC4uLi9kcm0vYW1kL2Ft
ZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuYyB8IDMyICsrKysrKysrKysrKysrKysrKysN
CiAuLi4vZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmggfCAgMSArDQog
MiBmaWxlcyBjaGFuZ2VkLCAzMyBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5jDQppbmRleCAwNjM2
MjVjMzY0NmIuLmUyZGUyNDZkNjgxYiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuYw0KQEAgLTE2MjAsNiArMTYyMCwy
NSBAQCBzdGF0aWMgaW50IGluaXRfbXFkX21hbmFnZXJzKHN0cnVjdCBkZXZpY2VfcXVldWVfbWFu
YWdlciAqZHFtKQ0KIA0KIAlyZXR1cm4gLUVOT01FTTsNCiB9DQorDQorLyogQWxsb2NhdGUgb25l
IGhpcSBtcWQgKEhXUykgYW5kIGFsbCBTRE1BIG1xZCBpbiBhIGNvbnRpbnVvdXMgdHJ1bmsqLw0K
K3N0YXRpYyBpbnQgYWxsb2NhdGVfaGlxX3NkbWFfbXFkKHN0cnVjdCBkZXZpY2VfcXVldWVfbWFu
YWdlciAqZHFtKQ0KK3sNCisJaW50IHJldHZhbDsNCisJc3RydWN0IGtmZF9kZXYgKmRldiA9IGRx
bS0+ZGV2Ow0KKwlzdHJ1Y3Qga2ZkX21lbV9vYmogKm1lbV9vYmogPSAmZHFtLT5oaXFfc2RtYV9t
cWQ7DQorCXVpbnQzMl90IHNpemUgPSBkcW0tPm1xZF9tZ3JzW0tGRF9NUURfVFlQRV9TRE1BXS0+
bXFkX3NpemUgKg0KKwkJZGV2LT5kZXZpY2VfaW5mby0+bnVtX3NkbWFfZW5naW5lcyAqDQorCQlk
ZXYtPmRldmljZV9pbmZvLT5udW1fc2RtYV9xdWV1ZXNfcGVyX2VuZ2luZSArDQorCQlkcW0tPm1x
ZF9tZ3JzW0tGRF9NUURfVFlQRV9ISVFdLT5tcWRfc2l6ZTsNCisNCisJcmV0dmFsID0gYW1kZ3B1
X2FtZGtmZF9hbGxvY19ndHRfbWVtKGRldi0+a2dkLCBzaXplLA0KKwkJJihtZW1fb2JqLT5ndHRf
bWVtKSwgJihtZW1fb2JqLT5ncHVfYWRkciksDQorCQkodm9pZCAqKSYobWVtX29iai0+Y3B1X3B0
ciksIHRydWUpOw0KKw0KKwlyZXR1cm4gcmV0dmFsOw0KK30NCisNCiBzdHJ1Y3QgZGV2aWNlX3F1
ZXVlX21hbmFnZXIgKmRldmljZV9xdWV1ZV9tYW5hZ2VyX2luaXQoc3RydWN0IGtmZF9kZXYgKmRl
dikNCiB7DQogCXN0cnVjdCBkZXZpY2VfcXVldWVfbWFuYWdlciAqZHFtOw0KQEAgLTE3MjksNiAr
MTc0OCwxMSBAQCBzdHJ1Y3QgZGV2aWNlX3F1ZXVlX21hbmFnZXIgKmRldmljZV9xdWV1ZV9tYW5h
Z2VyX2luaXQoc3RydWN0IGtmZF9kZXYgKmRldikNCiAJaWYgKGluaXRfbXFkX21hbmFnZXJzKGRx
bSkpDQogCQlnb3RvIG91dF9mcmVlOw0KIA0KKwlpZiAoYWxsb2NhdGVfaGlxX3NkbWFfbXFkKGRx
bSkpIHsNCisJCXByX2VycigiRmFpbGVkIHRvIGFsbG9jYXRlIGhpcSBzZG1hIG1xZCB0cnVuayBi
dWZmZXJcbiIpOw0KKwkJZ290byBvdXRfZnJlZTsNCisJfQ0KKw0KIAlpZiAoIWRxbS0+b3BzLmlu
aXRpYWxpemUoZHFtKSkNCiAJCXJldHVybiBkcW07DQogDQpAQCAtMTczNyw5ICsxNzYxLDE3IEBA
IHN0cnVjdCBkZXZpY2VfcXVldWVfbWFuYWdlciAqZGV2aWNlX3F1ZXVlX21hbmFnZXJfaW5pdChz
dHJ1Y3Qga2ZkX2RldiAqZGV2KQ0KIAlyZXR1cm4gTlVMTDsNCiB9DQogDQordm9pZCBkZWFsbG9j
YXRlX2hpcV9zZG1hX21xZChzdHJ1Y3Qga2ZkX2RldiAqZGV2LCBzdHJ1Y3Qga2ZkX21lbV9vYmog
Km1xZCkNCit7DQorCVdBUk4oIW1xZCwgIk5vIGhpcSBzZG1hIG1xZCB0cnVuayB0byBmcmVlIik7
DQorDQorCWFtZGdwdV9hbWRrZmRfZnJlZV9ndHRfbWVtKGRldi0+a2dkLCBtcWQtPmd0dF9tZW0p
Ow0KK30NCisNCiB2b2lkIGRldmljZV9xdWV1ZV9tYW5hZ2VyX3VuaW5pdChzdHJ1Y3QgZGV2aWNl
X3F1ZXVlX21hbmFnZXIgKmRxbSkNCiB7DQogCWRxbS0+b3BzLnVuaW5pdGlhbGl6ZShkcW0pOw0K
KwlkZWFsbG9jYXRlX2hpcV9zZG1hX21xZChkcW0tPmRldiwgJmRxbS0+aGlxX3NkbWFfbXFkKTsN
CiAJa2ZyZWUoZHFtKTsNCiB9DQogDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRrZmQva2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuaA0KaW5kZXggYTVlZjdhNjY1MGE1Li4zNzQy
ZmQzNDBlYzMgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGV2
aWNlX3F1ZXVlX21hbmFnZXIuaA0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2Zk
X2RldmljZV9xdWV1ZV9tYW5hZ2VyLmgNCkBAIC0xOTcsNiArMTk3LDcgQEAgc3RydWN0IGRldmlj
ZV9xdWV1ZV9tYW5hZ2VyIHsNCiAJLyogaHcgZXhjZXB0aW9uICAqLw0KIAlib29sCQkJaXNfaHdz
X2hhbmc7DQogCXN0cnVjdCB3b3JrX3N0cnVjdAlod19leGNlcHRpb25fd29yazsNCisJc3RydWN0
IGtmZF9tZW1fb2JqCWhpcV9zZG1hX21xZDsNCiB9Ow0KIA0KIHZvaWQgZGV2aWNlX3F1ZXVlX21h
bmFnZXJfaW5pdF9jaWsoDQotLSANCjIuMTcuMQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
