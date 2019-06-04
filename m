Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B618833D50
	for <lists+amd-gfx@lfdr.de>; Tue,  4 Jun 2019 04:52:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4144C89388;
	Tue,  4 Jun 2019 02:52:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750082.outbound.protection.outlook.com [40.107.75.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E28AA89286
 for <amd-gfx@lists.freedesktop.org>; Tue,  4 Jun 2019 02:52:45 +0000 (UTC)
Received: from BL0PR12MB2580.namprd12.prod.outlook.com (52.132.27.147) by
 BL0PR12MB2402.namprd12.prod.outlook.com (52.132.11.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Tue, 4 Jun 2019 02:52:44 +0000
Received: from BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b]) by BL0PR12MB2580.namprd12.prod.outlook.com
 ([fe80::24a0:610c:5b5c:9b9b%5]) with mapi id 15.20.1943.018; Tue, 4 Jun 2019
 02:52:44 +0000
From: "Zeng, Oak" <Oak.Zeng@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/6] drm/amdkfd: Only initialize sdma vm for sdma queues
Thread-Topic: [PATCH 1/6] drm/amdkfd: Only initialize sdma vm for sdma queues
Thread-Index: AQHVGoCVCyHKawUV+U+UpPqXgV2qHQ==
Date: Tue, 4 Jun 2019 02:52:43 +0000
Message-ID: <1559616755-13116-1-git-send-email-Oak.Zeng@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0039.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::16) To BL0PR12MB2580.namprd12.prod.outlook.com
 (2603:10b6:207:3e::19)
x-mailer: git-send-email 2.7.4
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: be66455c-25c2-406d-a2aa-08d6e897b762
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BL0PR12MB2402; 
x-ms-traffictypediagnostic: BL0PR12MB2402:
x-microsoft-antispam-prvs: <BL0PR12MB2402033EAF09CA57F420F1FD80150@BL0PR12MB2402.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1751;
x-forefront-prvs: 0058ABBBC7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(346002)(396003)(39860400002)(376002)(366004)(189003)(199004)(66066001)(68736007)(2351001)(8676002)(305945005)(53936002)(26005)(72206003)(7736002)(476003)(2616005)(14444005)(256004)(81156014)(4326008)(86362001)(25786009)(386003)(6506007)(102836004)(2501003)(186003)(6916009)(5640700003)(36756003)(52116002)(8936002)(6512007)(6436002)(316002)(71200400001)(71190400001)(2906002)(54906003)(50226002)(478600001)(3846002)(6116002)(486006)(6486002)(5660300002)(64756008)(14454004)(66556008)(66446008)(81166006)(99286004)(66946007)(66476007)(73956011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2402;
 H:BL0PR12MB2580.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6To2hRV4zwI5GuGvN5PlY9LZY43HceEEI/ZJD5jlXTfF4JdsO/O1BkykOCG8ACVgp4lNI6H1wvA6y9lf61uZuH5J8XZ5hSTogPMqr81k6lYnU+XQr7r+UImjmvyA8AY6tMOBVZMcMXjZgGhIHeeYkn03xiq5JyqTaitReZ/vkfAMauDnR8ObVCMryv4veqO3/19qS3toMshs5n951aBVRxdIsoDMCkz8b463J94PrCcWvs+50fdeUXqFGKYJuahqLVgvLmVbiriKZBrDAJU0hE5m6XZkaH8fpXDqeY+Pfapl30LN51nOctDD2dyCo8KYrspOazD1/JSSYosR+0CHqiUfTZWpzKq8fzesw+rXq/EYPg6lgdDbGIlVmipwt8YmMCv/TGYVu78CCHxeEUPuKCPt/OuB4zUj0SZCyUyeObM=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be66455c-25c2-406d-a2aa-08d6e897b762
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2019 02:52:43.8781 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ozeng@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2402
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y/d+s/Q+gNVsYSglodmkm7QIfUNLVAstFfinkdGlUME=;
 b=FwNbmdnQon6MhXXuBYlDW6DS8Wp9EvGgMAAYd9tP06HmCUpEM0WQp+wlASWIcg/IOSAD+fCgh3supPHYMGBVplOQBjThl8XnJJTTJ0mivg+d0h67blX71SmgIfebxO2UQ/CK3uGEEepLWfTgkuRVmrkz8h3d2HhsNgg2ifkqaC0=
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Zeng, Oak" <Oak.Zeng@amd.com>
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
bS9hbWQvYW1ka2ZkL2tmZF9kZXZpY2VfcXVldWVfbWFuYWdlci5jDQppbmRleCBlY2UzNWM3Li5l
NWNiZjIxIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2Rldmlj
ZV9xdWV1ZV9tYW5hZ2VyLmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9k
ZXZpY2VfcXVldWVfbWFuYWdlci5jDQpAQCAtMTIwNiw3ICsxMjA2LDkgQEAgc3RhdGljIGludCBj
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
