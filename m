Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FC927F08
	for <lists+amd-gfx@lfdr.de>; Thu, 23 May 2019 16:03:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E0F889998;
	Thu, 23 May 2019 14:03:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720072.outbound.protection.outlook.com [40.107.72.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F5D189998
 for <amd-gfx@lists.freedesktop.org>; Thu, 23 May 2019 14:03:49 +0000 (UTC)
Received: from DM6PR12MB3035.namprd12.prod.outlook.com (20.178.30.33) by
 DM6PR12MB3004.namprd12.prod.outlook.com (20.178.29.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.18; Thu, 23 May 2019 14:03:47 +0000
Received: from DM6PR12MB3035.namprd12.prod.outlook.com
 ([fe80::d0f1:5de8:3935:f1f3]) by DM6PR12MB3035.namprd12.prod.outlook.com
 ([fe80::d0f1:5de8:3935:f1f3%4]) with mapi id 15.20.1900.020; Thu, 23 May 2019
 14:03:47 +0000
From: "Mohan Marimuthu, Yogesh" <Yogesh.Mohanmarimuthu@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: sort probed modes before adding common modes
Thread-Topic: [PATCH] drm/amdgpu: sort probed modes before adding common modes
Thread-Index: AQHVEXBXKTL7oh7y002WbcrgKs1ang==
Date: Thu, 23 May 2019 14:03:47 +0000
Message-ID: <20190523140310.44773-1-yogesh.mohanmarimuthu@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MAXPR01CA0095.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::13) To DM6PR12MB3035.namprd12.prod.outlook.com
 (2603:10b6:5:118::33)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [165.204.156.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 59b6cb39-6ff8-428f-3161-08d6df8779ae
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3004; 
x-ms-traffictypediagnostic: DM6PR12MB3004:
x-microsoft-antispam-prvs: <DM6PR12MB30049FFA2813DC5E8C47E986FF010@DM6PR12MB3004.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 00462943DE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(366004)(376002)(346002)(39860400002)(396003)(189003)(199004)(50226002)(99286004)(36756003)(186003)(478600001)(52116002)(256004)(86362001)(14444005)(6506007)(386003)(102836004)(2906002)(476003)(71200400001)(71190400001)(2616005)(5660300002)(6486002)(8676002)(14454004)(8936002)(1076003)(2501003)(66066001)(25786009)(81166006)(81156014)(72206003)(3846002)(73956011)(305945005)(66946007)(64756008)(7736002)(66476007)(4326008)(66556008)(6512007)(486006)(6116002)(5640700003)(66446008)(2351001)(316002)(6916009)(53936002)(6436002)(68736007)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3004;
 H:DM6PR12MB3035.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6wLXhcY7oLPhuwpd2qRtQtrNjWQlmrA50Gdvftkj4OPcgukjnzFJxeO8F8FSbJCO654eXUYYWNTFiBeULMjyhq8d2t6tfxs0TFZJiUEfD06SFCPZuumFh7mUAl6UFQ9lnWJO7Nh5O8DK+WOIhzrXRZqKTSG7IxENPyfxhvZpQ9XmZSBYeWRdSe7dW4WQF1l/qWFGHFlezp55J7MEqLgSQEeqpRVa2TGvMVL/h7YfatPgEE0K16ED/pN/0d+YhvwYDpGuQ4K7Mc6q8sl3A0T9h4lOzreeMWyl2DZjfjEjuQZTgVzdBOe5SdMW3BYOQDJgPbfOz4vpYjT04U4D9ERS8XU+/U2wPLi2pD4jo6cC4nraa9xaondF5dZx/b/WXaA5+8jyrUz5w3jSRatxckg+q6VLOTwdUpuAH2CSDHgpGXE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59b6cb39-6ff8-428f-3161-08d6df8779ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2019 14:03:47.8229 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3004
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h039LNsL2C6Or/ddFg7TFoDenf3xYpKXbQ8btSiUq7s=;
 b=IZLtiCIOBsN2LpRXEtbRDFcMOmuqMG0DasZGKjxaRIZ650PvcDLSmO88Fdqf/xMzZQqkQSCeRfTUgwXmjovrzTn/rpAb4UzPSBmWB8nzbxeWAx2goWBb2LXCb/CKUR+eCykzV2j5qAMtsKcx74+qI9duHllgOtFvurpjPPYgMns=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Yogesh.Mohanmarimuthu@amd.com; 
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
Cc: "Mohan Marimuthu, Yogesh" <Yogesh.Mohanmarimuthu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W1doeV0NClRoZXJlIGFyZSBtb25pdG9ycyB3aGljaCBjYW4gaGF2ZSBtb3JlIHRoYW4gb25lIHBy
ZWZlcnJlZCBtb2RlDQpzZXQuIFRoZXJlIGFyZSBjaGFuY2VzIGluIHRoZXNlIG1vbml0b3JzIHRo
YXQgaWYgY29tbW9uIG1vZGVzIGFyZQ0KYWRkZWQgaW4gZnVuY3Rpb24gYW1kZ3B1X2RtX2Nvbm5l
Y3Rvcl9hZGRfY29tbW9uX21vZGVzKCksIHRoZXNlDQpjb21tb24gbW9kZXMgY2FuIGJlIGNhbGN1
bGF0ZWQgd2l0aCBkaWZmZXJlbnQgcHJlZmVycmVkIG1vZGUgdGhhbg0KdGhlIG9uZSB1c2VkIGlu
IGZ1bmN0aW9uIGRlY2lkZV9jcnRjX3RpbWluZ19mb3JfZHJtX2Rpc3BsYXlfbW9kZSgpLg0KVGhl
IHByZWZlcnJlZCBtb2RlIGNhbiBiZSBkaWZmZXJlbnQgYmVjYXVzZSBhZnRlciBjb21tb24gbW9k
ZXMNCmFyZSBhZGRlZCwgdGhlIG1vZGUgbGlzdCBpcyBzb3J0ZWQgYW5kIHRoaXMgY2hhbmdlcyB0
aGUgb3JkZXIgb2YNCnByZWZlcnJlZCBtb2RlcyBpbiB0aGUgbGlzdC4gVGhlIGZpcnN0IG1vZGUg
aW4gdGhlIGxpc3Qgd2l0aA0KcHJlZmVycmVkIGZsYWcgc2V0IGlzIHNlbGVjdGVkIGFzIHByZWZl
cnJlZCBtb2RlLiBEdWUgdG8gdGhpcyB0aGUNCnByZWZlcnJlZCBtb2RlIHNlbGVjdGVkIHZhcmll
cy4NCklmIHNhbWUgcHJlZmVycmVkIG1vZGUgaXMgbm90IHNlbGVjdGVkIGluIGNvbW1vbiBtb2Rl
IGNhbGN1bGF0aW9uDQphbmQgY3J0YyB0aW1pbmcsIHRoZW4gZHVyaW5nIG1vZGUgc2V0IGluc3Rl
YWQgb2Ygc2V0dGluZyBwcmVmZXJyZWQNCnRpbWluZywgY29tbW9uIG1vZGUgdGltaW5nIHdpbGwg
YmUgYXBwbGllZCB3aGljaCBjYW4gY2F1c2UgIm91dCBvZg0KcmFuZ2UiIG1lc3NhZ2UgaW4gdGhl
IG1vbml0b3Igd2l0aCBtb25pdG9yIGJsYW5raW5nIG91dC4NCg0KW0hvd10NClNvcnQgdGhlIG1v
ZGVzIGJlZm9yZSBhZGRpbmcgY29tbW9uIG1vZGVzLiBUaGUgc2FtZSBzb3J0aW5nIGZ1bmN0aW9u
DQppcyBjYWxsZWQgZHVyaW5nIGNvbW1vbiBtb2RlIGFkZGl0aW9uIGFuZCBkZWNpZGluZyBjcnRj
IHRpbWluZy4NCg0KU2lnbmVkLW9mZi1ieTogWW9nZXNoIE1vaGFuIE1hcmltdXRodSA8eW9nZXNo
Lm1vaGFubWFyaW11dGh1QGFtZC5jb20+DQpDaGFuZ2UtSWQ6IEk0ODAzNmE0NzZhZDYyMWRlMDIy
ZTJmZGE1ZTE4NjFlNzJlN2U4YzMwDQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
YW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgOSArKysrKysrKysNCiAxIGZpbGUgY2hhbmdlZCwgOSBp
bnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
YW1kZ3B1X2RtL2FtZGdwdV9kbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdw
dV9kbS9hbWRncHVfZG0uYw0KaW5kZXggNGExNzU1YmNlLi40MThlMzk1NmEgMTAwNjQ0DQotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jDQorKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jDQpAQCAt
NDY3Nyw2ICs0Njc3LDE1IEBAIHN0YXRpYyB2b2lkIGFtZGdwdV9kbV9jb25uZWN0b3JfZGRjX2dl
dF9tb2RlcyhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLA0KIAkJYW1kZ3B1X2RtX2Nv
bm5lY3Rvci0+bnVtX21vZGVzID0NCiAJCQkJZHJtX2FkZF9lZGlkX21vZGVzKGNvbm5lY3Rvciwg
ZWRpZCk7DQogDQorCQkvKiBzb3J0aW5nIHRoZSBwcm9iZWQgbW9kZXMgYmVmb3JlIGNhbGxpbmcg
ZnVuY3Rpb24NCisJCSAqIGFtZGdwdV9kbV9nZXRfbmF0aXZlX21vZGUoKSBzaW5jZSBFRElEIGNh
biBoYXZlDQorCQkgKiBtb3JlIHRoYW4gb25lIHByZWZlcnJlZCBtb2RlLiBUaGUgbW9kZXMgdGhh
dCBhcmUNCisJCSAqIGxhdGVyIGluIHRoZSBwcm9iZWQgbW9kZSBsaXN0IGNvdWxkIGJlIG9mIGhp
Z2hlcg0KKwkJICogYW5kIHByZWZlcnJlZCByZXNvbHV0aW9uLiBGb3IgZXhhbXBsZSwgMzg0MHgy
MTYwDQorCQkgKiByZXNvbHV0aW9uIGluIGJhc2UgRURJRCBwcmVmZXJyZWQgdGltaW5nIGFuZCA0
MDk2eDIxNjANCisJCSAqIHByZWZlcnJlZCByZXNvbHV0aW9uIGluIERJRCBleHRlbnNpb24gYmxv
Y2sgbGF0ZXIuDQorCQkgKi8NCisJCWRybV9tb2RlX3NvcnQoJmNvbm5lY3Rvci0+cHJvYmVkX21v
ZGVzKTsNCiAJCWFtZGdwdV9kbV9nZXRfbmF0aXZlX21vZGUoY29ubmVjdG9yKTsNCiAJfSBlbHNl
IHsNCiAJCWFtZGdwdV9kbV9jb25uZWN0b3ItPm51bV9tb2RlcyA9IDA7DQotLSANCjIuMTcuMQ0K
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
