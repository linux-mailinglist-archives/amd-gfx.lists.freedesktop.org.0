Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3628934954
	for <lists+amd-gfx@lfdr.de>; Tue,  4 Jun 2019 15:49:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EE14898F5;
	Tue,  4 Jun 2019 13:49:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690053.outbound.protection.outlook.com [40.107.69.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC4FD8991D
 for <amd-gfx@lists.freedesktop.org>; Tue,  4 Jun 2019 13:49:24 +0000 (UTC)
Received: from MWHPR12MB1311.namprd12.prod.outlook.com (10.169.206.148) by
 MWHPR12MB1535.namprd12.prod.outlook.com (10.172.50.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Tue, 4 Jun 2019 13:49:22 +0000
Received: from MWHPR12MB1311.namprd12.prod.outlook.com
 ([fe80::d9ab:90d0:c292:60a8]) by MWHPR12MB1311.namprd12.prod.outlook.com
 ([fe80::d9ab:90d0:c292:60a8%8]) with mapi id 15.20.1943.018; Tue, 4 Jun 2019
 13:49:22 +0000
From: "StDenis, Tom" <Tom.StDenis@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/amdgpu: remove vram_page_split kernel option
Thread-Topic: [PATCH] drm/amd/amdgpu: remove vram_page_split kernel option
Thread-Index: AQHVGtxQJWn7T8TzH0mo3c9pnT98+Q==
Date: Tue, 4 Jun 2019 13:49:22 +0000
Message-ID: <20190604134905.9172-1-tom.stdenis@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BN6PR03CA0067.namprd03.prod.outlook.com
 (2603:10b6:404:4c::29) To MWHPR12MB1311.namprd12.prod.outlook.com
 (2603:10b6:300:13::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.21.0
x-originating-ip: [165.204.84.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 575fcca9-d2bc-4094-1b06-08d6e8f3729f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MWHPR12MB1535; 
x-ms-traffictypediagnostic: MWHPR12MB1535:
x-microsoft-antispam-prvs: <MWHPR12MB153573579A2CBA697BD2B623F7150@MWHPR12MB1535.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 0058ABBBC7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(376002)(39860400002)(396003)(346002)(366004)(199004)(189003)(73956011)(66946007)(66476007)(26005)(66556008)(64756008)(66446008)(52116002)(305945005)(186003)(2351001)(68736007)(2501003)(36756003)(6916009)(476003)(2616005)(86362001)(71200400001)(478600001)(71190400001)(66066001)(2906002)(6486002)(5640700003)(3846002)(8676002)(102836004)(7736002)(81166006)(5660300002)(14454004)(81156014)(6436002)(4326008)(72206003)(6512007)(53936002)(8936002)(6506007)(50226002)(99286004)(25786009)(14444005)(1076003)(386003)(6116002)(256004)(316002)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1535;
 H:MWHPR12MB1311.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: RlqBVx+IXf34vZb/wfltjoxOLaxXuGhj5mPGPCp5uJWflgbAlHka0TnI6OsrDAucGgIJQzpB1xcUok1PRFgWLubwDPjh9Opy04lYdS0i1JkMOBweNqrNBGiJHfQxXORsYjDm9gX6p6HRUfhReWSm0h4iOkWUCqXQcjgtn3UYKCSTB4M0tiyYG7CT5IZ+gYm434o+tUyRLtYM+PhHaesF1VlFi8q8qj0+g2W+4efbBQPiueJL66YAg229FsGZb6fRUo+tmZJqy1Mq2AgWI6rY0vSXM6ScEWdskLfueOSYZ6fCxXzm4egQW9yk55qFLjwHLhJgHWSppwZS3A65l0dOWPLN6PLshUYBUgBXn8C4K0apxNN4hfRSCQmKkaX5NfoDYjPceVhIcFGwgMsc2dDq5OEcgQNai5Lra0GVHl6FxEc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 575fcca9-d2bc-4094-1b06-08d6e8f3729f
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2019 13:49:22.2725 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tstdenis@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1535
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vYJLCebRrt+Dq5NI72moGK+P4jhxYZZz2oHaZwAjzG8=;
 b=xO55m29aJLbqHIiAi6ua/AquWSzV7JSc+ElkQqI1IvDaE9Qa8vPLquj4WOl34RVRhcW96l/J+f3ZaQ7+lDTLeA3PpYOqwulqZtv4TUDcVZj32MWp+KcPIM8oHniw6V5I2xjJYdHxsVD823saBUu9fgAvCnRdMhQCnXS2yzVHYzs=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Tom.StDenis@amd.com; 
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
Cc: "StDenis, Tom" <Tom.StDenis@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyBvcHRpb24gaXMgbm8gbG9uZ2VyIG5lZWRlZC4gIFRoZSBkZWZhdWx0IGNvZGUgcGF0aHMN
CmFyZSBub3cgdGhlIG9ubHkgb3B0aW9uLg0KDQpTaWduZWQtb2ZmLWJ5OiBUb20gU3QgRGVuaXMg
PHRvbS5zdGRlbmlzQGFtZC5jb20+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHUuaCAgICAgICAgICB8IDEgLQ0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9kZXZpY2UuYyAgIHwgNyAtLS0tLS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2Rydi5jICAgICAgfCA4IC0tLS0tLS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3ZyYW1fbWdyLmMgfCA3ICstLS0tLS0NCiA0IGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAyMiBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdS5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgN
CmluZGV4IDE5YTAwMjgyZTM0Yy4uZTU0ZjMxODY1ZjYwIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdS5oDQpAQCAtMTQyLDcgKzE0Miw2IEBAIGV4dGVybiB1aW50IGFtZGdwdV9zZG1h
X3BoYXNlX3F1YW50dW07DQogZXh0ZXJuIGNoYXIgKmFtZGdwdV9kaXNhYmxlX2N1Ow0KIGV4dGVy
biBjaGFyICphbWRncHVfdmlydHVhbF9kaXNwbGF5Ow0KIGV4dGVybiB1aW50IGFtZGdwdV9wcF9m
ZWF0dXJlX21hc2s7DQotZXh0ZXJuIGludCBhbWRncHVfdnJhbV9wYWdlX3NwbGl0Ow0KIGV4dGVy
biBpbnQgYW1kZ3B1X25nZzsNCiBleHRlcm4gaW50IGFtZGdwdV9wcmltX2J1Zl9wZXJfc2U7DQog
ZXh0ZXJuIGludCBhbWRncHVfcG9zX2J1Zl9wZXJfc2U7DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2RldmljZS5jDQppbmRleCBkMDBmZDVkZDMwN2EuLmVmN2Q5OWViZTkyZCAx
MDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYw0K
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jDQpAQCAtOTcz
LDEzICs5NzMsNiBAQCBzdGF0aWMgaW50IGFtZGdwdV9kZXZpY2VfY2hlY2tfYXJndW1lbnRzKHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQ0KIA0KIAlhbWRncHVfZGV2aWNlX2NoZWNrX2Jsb2Nr
X3NpemUoYWRldik7DQogDQotCWlmIChhbWRncHVfdnJhbV9wYWdlX3NwbGl0ICE9IC0xICYmIChh
bWRncHVfdnJhbV9wYWdlX3NwbGl0IDwgMTYgfHwNCi0JICAgICFpc19wb3dlcl9vZl8yKGFtZGdw
dV92cmFtX3BhZ2Vfc3BsaXQpKSkgew0KLQkJZGV2X3dhcm4oYWRldi0+ZGV2LCAiaW52YWxpZCBW
UkFNIHBhZ2Ugc3BsaXQgKCVkKVxuIiwNCi0JCQkgYW1kZ3B1X3ZyYW1fcGFnZV9zcGxpdCk7DQot
CQlhbWRncHVfdnJhbV9wYWdlX3NwbGl0ID0gMTAyNDsNCi0JfQ0KLQ0KIAlyZXQgPSBhbWRncHVf
ZGV2aWNlX2dldF9qb2JfdGltZW91dF9zZXR0aW5ncyhhZGV2KTsNCiAJaWYgKHJldCkgew0KIAkJ
ZGV2X2VycihhZGV2LT5kZXYsICJpbnZhbGlkIGxvY2t1cF90aW1lb3V0IHBhcmFtZXRlciBzeW50
YXhcbiIpOw0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9k
cnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYw0KaW5kZXggMWYz
OGQ2ZmMxZmUzLi5lZjIyYTJhMjU0NDggMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfZHJ2LmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9kcnYuYw0KQEAgLTEwOCw3ICsxMDgsNiBAQCBpbnQgYW1kZ3B1X3ZtX2ZyYWdtZW50X3Np
emUgPSAtMTsNCiBpbnQgYW1kZ3B1X3ZtX2Jsb2NrX3NpemUgPSAtMTsNCiBpbnQgYW1kZ3B1X3Zt
X2ZhdWx0X3N0b3AgPSAwOw0KIGludCBhbWRncHVfdm1fZGVidWcgPSAwOw0KLWludCBhbWRncHVf
dnJhbV9wYWdlX3NwbGl0ID0gNTEyOw0KIGludCBhbWRncHVfdm1fdXBkYXRlX21vZGUgPSAtMTsN
CiBpbnQgYW1kZ3B1X2V4cF9od19zdXBwb3J0ID0gMDsNCiBpbnQgYW1kZ3B1X2RjID0gLTE7DQpA
QCAtMzQyLDEzICszNDEsNiBAQCBtb2R1bGVfcGFyYW1fbmFtZWQodm1fZGVidWcsIGFtZGdwdV92
bV9kZWJ1ZywgaW50LCAwNjQ0KTsNCiBNT0RVTEVfUEFSTV9ERVNDKHZtX3VwZGF0ZV9tb2RlLCAi
Vk0gdXBkYXRlIHVzaW5nIENQVSAoMCA9IG5ldmVyIChkZWZhdWx0IGV4Y2VwdCBmb3IgbGFyZ2Ug
QkFSKExCKSksIDEgPSBHcmFwaGljcyBvbmx5LCAyID0gQ29tcHV0ZSBvbmx5IChkZWZhdWx0IGZv
ciBMQiksIDMgPSBCb3RoIik7DQogbW9kdWxlX3BhcmFtX25hbWVkKHZtX3VwZGF0ZV9tb2RlLCBh
bWRncHVfdm1fdXBkYXRlX21vZGUsIGludCwgMDQ0NCk7DQogDQotLyoqDQotICogRE9DOiB2cmFt
X3BhZ2Vfc3BsaXQgKGludCkNCi0gKiBPdmVycmlkZSB0aGUgbnVtYmVyIG9mIHBhZ2VzIGFmdGVy
IHdlIHNwbGl0IFZSQU0gYWxsb2NhdGlvbnMgKGRlZmF1bHQgNTEyLCAtMSA9IGRpc2FibGUpLiBU
aGUgZGVmYXVsdCBpcyA1MTIuDQotICovDQotTU9EVUxFX1BBUk1fREVTQyh2cmFtX3BhZ2Vfc3Bs
aXQsICJOdW1iZXIgb2YgcGFnZXMgYWZ0ZXIgd2Ugc3BsaXQgVlJBTSBhbGxvY2F0aW9ucyAoZGVm
YXVsdCA1MTIsIC0xID0gZGlzYWJsZSkiKTsNCi1tb2R1bGVfcGFyYW1fbmFtZWQodnJhbV9wYWdl
X3NwbGl0LCBhbWRncHVfdnJhbV9wYWdlX3NwbGl0LCBpbnQsIDA0NDQpOw0KLQ0KIC8qKg0KICAq
IERPQzogZXhwX2h3X3N1cHBvcnQgKGludCkNCiAgKiBFbmFibGUgZXhwZXJpbWVudGFsIGh3IHN1
cHBvcnQgKDEgPSBlbmFibGUpLiBUaGUgZGVmYXVsdCBpcyAwIChkaXNhYmxlZCkuDQpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZyYW1fbWdyLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdnJhbV9tZ3IuYw0KaW5kZXggZWM5ZWEzZmRi
YjRhLi40Zjc3YTYwNTZhM2IgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfdnJhbV9tZ3IuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3ZyYW1fbWdyLmMNCkBAIC0yODQsMTQgKzI4NCw5IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3Zy
YW1fbWdyX25ldyhzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1hbiwNCiAJaWYgKCFscGZu
KQ0KIAkJbHBmbiA9IG1hbi0+c2l6ZTsNCiANCi0JaWYgKHBsYWNlLT5mbGFncyAmIFRUTV9QTF9G
TEFHX0NPTlRJR1VPVVMgfHwNCi0JICAgIGFtZGdwdV92cmFtX3BhZ2Vfc3BsaXQgPT0gLTEpIHsN
CisJaWYgKHBsYWNlLT5mbGFncyAmIFRUTV9QTF9GTEFHX0NPTlRJR1VPVVMpIHsNCiAJCXBhZ2Vz
X3Blcl9ub2RlID0gfjB1bDsNCiAJCW51bV9ub2RlcyA9IDE7DQotCX0gZWxzZSB7DQotCQlwYWdl
c19wZXJfbm9kZSA9IG1heCgodWludDMyX3QpYW1kZ3B1X3ZyYW1fcGFnZV9zcGxpdCwNCi0JCQkJ
ICAgICBtZW0tPnBhZ2VfYWxpZ25tZW50KTsNCi0JCW51bV9ub2RlcyA9IERJVl9ST1VORF9VUCht
ZW0tPm51bV9wYWdlcywgcGFnZXNfcGVyX25vZGUpOw0KIAl9DQogDQogCW5vZGVzID0ga3ZtYWxs
b2NfYXJyYXkobnVtX25vZGVzLCBzaXplb2YoKm5vZGVzKSwNCi0tIA0KMi4yMS4wDQoNCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
