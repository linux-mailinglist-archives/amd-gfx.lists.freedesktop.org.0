Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DA84E473
	for <lists+amd-gfx@lfdr.de>; Fri, 21 Jun 2019 11:45:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 216896E85B;
	Fri, 21 Jun 2019 09:45:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710048.outbound.protection.outlook.com [40.107.71.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D90C46E85B
 for <amd-gfx@lists.freedesktop.org>; Fri, 21 Jun 2019 09:45:42 +0000 (UTC)
Received: from CH2PR12MB3831.namprd12.prod.outlook.com (52.132.245.141) by
 CH2PR12MB3800.namprd12.prod.outlook.com (52.132.245.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.13; Fri, 21 Jun 2019 09:45:41 +0000
Received: from CH2PR12MB3831.namprd12.prod.outlook.com
 ([fe80::3459:726f:43e7:a64c]) by CH2PR12MB3831.namprd12.prod.outlook.com
 ([fe80::3459:726f:43e7:a64c%4]) with mapi id 15.20.1987.014; Fri, 21 Jun 2019
 09:45:41 +0000
From: "Kim, Jonathan" <Jonathan.Kim@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu:  add sw_init to df_v1_7
Thread-Topic: [PATCH] drm/amdgpu:  add sw_init to df_v1_7
Thread-Index: AQHVKBYWSuS+hJfp2kyLUqe6OjfIXw==
Date: Fri, 21 Jun 2019 09:45:41 +0000
Message-ID: <20190621094526.96749-1-jonathan.kim@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0028.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::41) To CH2PR12MB3831.namprd12.prod.outlook.com
 (2603:10b6:610:29::13)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 63ff7eae-9bf9-4e55-03e9-08d6f62d38f2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CH2PR12MB3800; 
x-ms-traffictypediagnostic: CH2PR12MB3800:
x-microsoft-antispam-prvs: <CH2PR12MB3800D9071C2ACB3E3C56CF3185E70@CH2PR12MB3800.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:475;
x-forefront-prvs: 0075CB064E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(136003)(39850400004)(396003)(366004)(376002)(199004)(189003)(72206003)(14454004)(5640700003)(25786009)(6436002)(6486002)(6512007)(476003)(305945005)(478600001)(6916009)(66066001)(2501003)(86362001)(4326008)(2616005)(54906003)(486006)(7736002)(26005)(2906002)(2351001)(102836004)(5660300002)(66476007)(66556008)(316002)(52116002)(66946007)(6116002)(64756008)(3846002)(73956011)(68736007)(66446008)(6506007)(386003)(36756003)(81156014)(81166006)(256004)(8936002)(1076003)(99286004)(186003)(50226002)(8676002)(71190400001)(53936002)(71200400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB3800;
 H:CH2PR12MB3831.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Z0Y+q6CmXHWlB7LPpgfAixMf4xn1mT3JTmYxq/5AxrbuqY4hJlNT99vb0k2nZ923kKbg3YlTamSOzrh1Z24J9KfTAl2o6t7QADDvqt/jr5qjyQhD/AzkgvdDqVJ5MiBHtc7skGXypEFLAKX7l3n/7tD8YiBcl0XiTt3AXwR/8uQ83eqWP+SlC5BG7MXA6Cej/5edFJtNeUm5gIPAMVW/FL8bsN+1AZQ6WgnxKP+25rjoQ9lFn0JbTFFv5xT7CWSWRKCGHv7ZLMrld8wfMD/UvA51XbWybe0Pbf3qxp9dJevG5rNKJHIT+KMmgHKVAlRSXJsaRPRZ/UehH2zNMN1IexDtRQN0ZZYpQT5fsqwO6TLqOSh0asPUqTfyRWG1288dVThOWh4BWYsuQdW8y/XfmyDoJCT8AD9IXX7FVq8Qct8=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63ff7eae-9bf9-4e55-03e9-08d6f62d38f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2019 09:45:41.1448 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jokim@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3800
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zNikDulsjY7iELDwHc/Xk28YRKGKffm6xzpTsRKgkos=;
 b=vqruraJCdCAKHrdGUMyKoU4CmxVbUBNTw0eQvCrVA0IrR3onFKOtjAcdh8cwoMt5z2efjfNOUUxsPj+Ih9JMQ7Dhey6/LzSE7KZXaOQG0QUN7pZiiwOd6hctwQWjlqBe6k7QkUcMdoiXk1Qzj9cXCA+6qF2m6IPPom1VNwgPYTk=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Jonathan.Kim@amd.com; 
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
Cc: "Kim, Jonathan" <Jonathan.Kim@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

YWRkIGRmIHN3IGluaXQgdG8gZGYgMS43IGZ1bmN0aW9uIHRvIHByZXZlbnQgcmVncmVzc2lvbiBp
c3N1ZXMgb24gcHJlLXZlZ2EyMA0KcHJvZHVjdHMuDQoNCkNoYW5nZS1JZDogSTQ5NDEwMDNlYTRh
OTliYTBlYTczNmM3ZWNjODgwMDE0ODQyM2MzNzkNClNpZ25lZC1vZmYtYnk6IEpvbmF0aGFuIEtp
bSA8Sm9uYXRoYW4uS2ltQGFtZC5jb20+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9kZl92MV83LmMgfCA1ICsrKysrDQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQ0K
DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGZfdjFfNy5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGZfdjFfNy5jDQppbmRleCA5OTM1MzcxZGI3Y2UuLjMz
NWYyYzAyODc4ZiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RmX3Yx
XzcuYw0KKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGZfdjFfNy5jDQpAQCAtMzMs
NiArMzMsMTAgQEAgc3RhdGljIHZvaWQgZGZfdjFfN19pbml0IChzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldikNCiB7DQogfQ0KIA0KK3N0YXRpYyB2b2lkIGRmX3YxXzdfc3dfaW5pdChzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYWRldikNCit7DQorfQ0KKw0KIHN0YXRpYyB2b2lkIGRmX3YxXzdfZW5h
YmxlX2Jyb2FkY2FzdF9tb2RlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LA0KICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJvb2wgZW5hYmxlKQ0KIHsNCkBAIC0x
MTEsNiArMTE1LDcgQEAgc3RhdGljIHZvaWQgZGZfdjFfN19lbmFibGVfZWNjX2ZvcmNlX3Bhcl93
cl9ybXcoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsDQogDQogY29uc3Qgc3RydWN0IGFtZGdw
dV9kZl9mdW5jcyBkZl92MV83X2Z1bmNzID0gew0KIAkuaW5pdCA9IGRmX3YxXzdfaW5pdCwNCisJ
LnN3X2luaXQgPSBkZl92MV83X3N3X2luaXQsDQogCS5lbmFibGVfYnJvYWRjYXN0X21vZGUgPSBk
Zl92MV83X2VuYWJsZV9icm9hZGNhc3RfbW9kZSwNCiAJLmdldF9mYl9jaGFubmVsX251bWJlciA9
IGRmX3YxXzdfZ2V0X2ZiX2NoYW5uZWxfbnVtYmVyLA0KIAkuZ2V0X2hibV9jaGFubmVsX251bWJl
ciA9IGRmX3YxXzdfZ2V0X2hibV9jaGFubmVsX251bWJlciwNCi0tIA0KMi4xNy4xDQoNCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
