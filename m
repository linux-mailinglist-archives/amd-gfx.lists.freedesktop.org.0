Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2729631688
	for <lists+amd-gfx@lfdr.de>; Fri, 31 May 2019 23:19:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF716899E8;
	Fri, 31 May 2019 21:19:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770054.outbound.protection.outlook.com [40.107.77.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7974A899DE
 for <amd-gfx@lists.freedesktop.org>; Fri, 31 May 2019 21:19:08 +0000 (UTC)
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2497.namprd12.prod.outlook.com (52.132.11.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.18; Fri, 31 May 2019 21:19:06 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b%5]) with mapi id 15.20.1922.024; Fri, 31 May 2019
 21:19:06 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/4] drm/amdkfd: Only initialize sdma vm for sdma queues
Thread-Topic: [PATCH 2/4] drm/amdkfd: Only initialize sdma vm for sdma queues
Thread-Index: AQHVF/Z6u/xm9alULUC2aVTmWFZt/A==
Date: Fri, 31 May 2019 21:19:06 +0000
Message-ID: <1559337538-14249-2-git-send-email-Oak.Zeng@amd.com>
References: <1559337538-14249-1-git-send-email-Oak.Zeng@amd.com>
In-Reply-To: <1559337538-14249-1-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0042.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::19) To BL0PR12MB2580.namprd12.prod.outlook.com
 (2603:10b6:207:3e::19)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7f602045-1cdf-42ac-1236-08d6e60d9d17
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BL0PR12MB2497; 
x-ms-traffictypediagnostic: BL0PR12MB2497:
x-microsoft-antispam-prvs: <BL0PR12MB24970B94FD8749496185F4AE80190@BL0PR12MB2497.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1751;
x-forefront-prvs: 00540983E2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(376002)(136003)(366004)(346002)(39860400002)(189003)(199004)(52116002)(76176011)(26005)(25786009)(386003)(86362001)(2501003)(4326008)(2351001)(476003)(36756003)(8936002)(316002)(99286004)(5660300002)(68736007)(54906003)(6116002)(50226002)(72206003)(3846002)(14444005)(5640700003)(71200400001)(66446008)(14454004)(102836004)(66556008)(6486002)(478600001)(486006)(64756008)(11346002)(6506007)(6436002)(66476007)(2616005)(81156014)(66066001)(81166006)(2906002)(6916009)(8676002)(66946007)(73956011)(256004)(7736002)(71190400001)(446003)(6512007)(305945005)(186003)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2497;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tSWoQn3OF4KCVNnBx9AQMU61Mwb8SDYW9sxTFIyrC3FjfXIhuKUME3fKbCcJ7Dh8AE4Iff+BYTENKkM7mWCqY2du2Vf/kEuRhfWRkR6lbZuaM7pmGanlRMafoVLiDA+Qr28dQ3D8vQ9SGSDdZQhNw+Yjdr+IjE53ox2itENbBqv6aWLfdNVY/Gwk0LRat4CcpNap3zwfKh7C7Fv18qY+SVbxQoLgGzXQMiC1j28PygMfjtmycfjlCJWv3CTjIpk+xs6BVsGMSt3d3v2FTE+JIm3LUBlYzw+ftuTBxhoWBdWisOHUW6GHzw5IPr/VODhSHJJylHkoU+Vd0Il4yxmt7IFhA6J0h5krP08dowiV+l8Bm298d4nxyjIETU1BRelgCYnOPOO8/TdKpVEtrbOAx4gz+QGBohK0tO04q+CHfw4=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f602045-1cdf-42ac-1236-08d6e60d9d17
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2019 21:19:06.7550 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ozeng@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2497
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UDLOM+ZN3Ul5AzTS3cugNvH+7rEcyNRQe5HyJ1Ts3S0=;
 b=b7hfLWxqjYeW8JNr3KpVEZFRV9a7uQ6sj4gHfmVtzg+Uw+le43zAp/Qgvnd2nhH2ZRe0nWNOuLZFc4pQp+rj89t/GuSPT5sGZBRv3fRpVS8jHqFLP0A+rwmj0OKcIOdQRZvtuD1TrHZpjh5zINrHaG48EhmHY15ftarMK1VdzD4=
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
 Felix" <Felix.Kuehling@amd.com>, "Freehill, Chris" <Chris.Freehill@amd.com>,
 "Zeng, Oak" <Oak.Zeng@amd.com>, "Liu, Alex" <Alex.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RG9uJ3QgZG8gdGhlIHNhbWUgZm9yIGNvbXB1dGUgcXVldWVzDQoNCkNoYW5nZS1JZDogSWQ1Zjc0
M2NhMTBjMmI3NjE1OTBiZmUxOGNhYjJmODAyZDNjMDRkMmQNClNpZ25lZC1vZmYtYnk6IE9hayBa
ZW5nIDxPYWsuWmVuZ0BhbWQuY29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQv
a2ZkX2RldmljZV9xdWV1ZV9tYW5hZ2VyLmMgfCA0ICsrKy0NCiAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGtmZC9rZmRfZGV2aWNlX3F1ZXVlX21hbmFnZXIuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5jDQppbmRleCAxZjcwN2JiLi43
NDk0NGVjIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2Rldmlj
ZV9xdWV1ZV9tYW5hZ2VyLmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9k
ZXZpY2VfcXVldWVfbWFuYWdlci5jDQpAQCAtMTIzMCw3ICsxMjMwLDkgQEAgc3RhdGljIGludCBj
cmVhdGVfcXVldWVfY3BzY2goc3RydWN0IGRldmljZV9xdWV1ZV9tYW5hZ2VyICpkcW0sIHN0cnVj
dCBxdWV1ZSAqcSwNCiAJCXEtPnByb3BlcnRpZXMuaXNfZXZpY3RlZCA9IChxLT5wcm9wZXJ0aWVz
LnF1ZXVlX3NpemUgPiAwICYmDQogCQkJCQkgICAgcS0+cHJvcGVydGllcy5xdWV1ZV9wZXJjZW50
ID4gMCAmJg0KIAkJCQkJICAgIHEtPnByb3BlcnRpZXMucXVldWVfYWRkcmVzcyAhPSAwKTsNCi0J
ZHFtLT5hc2ljX29wcy5pbml0X3NkbWFfdm0oZHFtLCBxLCBxcGQpOw0KKwlpZiAocS0+cHJvcGVy
dGllcy50eXBlID09IEtGRF9RVUVVRV9UWVBFX1NETUEgfHwNCisJCXEtPnByb3BlcnRpZXMudHlw
ZSA9PSBLRkRfUVVFVUVfVFlQRV9TRE1BX1hHTUkpDQorCQlkcW0tPmFzaWNfb3BzLmluaXRfc2Rt
YV92bShkcW0sIHEsIHFwZCk7DQogCXEtPnByb3BlcnRpZXMudGJhX2FkZHIgPSBxcGQtPnRiYV9h
ZGRyOw0KIAlxLT5wcm9wZXJ0aWVzLnRtYV9hZGRyID0gcXBkLT50bWFfYWRkcjsNCiAJcmV0dmFs
ID0gbXFkX21nci0+aW5pdF9tcWQobXFkX21nciwgJnEtPm1xZCwgJnEtPm1xZF9tZW1fb2JqLA0K
LS0gDQoyLjcuNA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
