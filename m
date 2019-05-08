Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9864E17D8B
	for <lists+amd-gfx@lfdr.de>; Wed,  8 May 2019 17:51:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26C19897DC;
	Wed,  8 May 2019 15:51:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770057.outbound.protection.outlook.com [40.107.77.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17E17897EB
 for <amd-gfx@lists.freedesktop.org>; Wed,  8 May 2019 15:51:43 +0000 (UTC)
Received: from DM5PR12MB2456.namprd12.prod.outlook.com (52.132.141.37) by
 DM5PR12MB2533.namprd12.prod.outlook.com (52.132.141.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.21; Wed, 8 May 2019 15:51:41 +0000
Received: from DM5PR12MB2456.namprd12.prod.outlook.com
 ([fe80::c877:3a1:f536:96]) by DM5PR12MB2456.namprd12.prod.outlook.com
 ([fe80::c877:3a1:f536:96%3]) with mapi id 15.20.1856.012; Wed, 8 May 2019
 15:51:41 +0000
From: "Liu, Leo" <Leo.Liu@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 5/6] drm/amdgpu: check no_user_fence flag for engines
Thread-Topic: [PATCH 5/6] drm/amdgpu: check no_user_fence flag for engines
Thread-Index: AQHVBbXtmyGF1NpvSkm9dbGJbQ5VpA==
Date: Wed, 8 May 2019 15:51:41 +0000
Message-ID: <20190508155100.7810-5-leo.liu@amd.com>
References: <20190508155100.7810-1-leo.liu@amd.com>
In-Reply-To: <20190508155100.7810-1-leo.liu@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-clientproxiedby: YT1PR01CA0018.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::31)
 To DM5PR12MB2456.namprd12.prod.outlook.com
 (2603:10b6:4:b4::37)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2f5feb48-11d4-466d-133e-08d6d3cd100c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB2533; 
x-ms-traffictypediagnostic: DM5PR12MB2533:
x-microsoft-antispam-prvs: <DM5PR12MB2533AE01FC65CE93C56E7A67E5320@DM5PR12MB2533.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:431;
x-forefront-prvs: 0031A0FFAF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(136003)(366004)(39860400002)(346002)(376002)(199004)(189003)(53936002)(305945005)(72206003)(6916009)(66066001)(71200400001)(71190400001)(4326008)(256004)(25786009)(6116002)(3846002)(7736002)(316002)(8676002)(1076003)(81156014)(81166006)(4744005)(2351001)(86362001)(36756003)(5660300002)(478600001)(14454004)(50226002)(68736007)(8936002)(486006)(446003)(2501003)(11346002)(2616005)(476003)(6512007)(66946007)(66446008)(64756008)(66556008)(66476007)(2906002)(73956011)(102836004)(6506007)(386003)(6486002)(6436002)(52116002)(76176011)(5640700003)(186003)(26005)(99286004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2533;
 H:DM5PR12MB2456.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: oUKCO23KUw5QsfZPwMmhtPhVKuNxL5axv2SvL3uhvbRO4NGGQPEWtpe1xfn5CslG5B/YnAgA6Mr7Ea9Br13KR75vJBMbUEUHk+UPa+PrHay2f7Vrn9PpqkaI7ijfNqYWD7TUM9rglipAh29344FLR/3i42M7MNJV+HiEI2rJ6kRNCVjTFgrUN8r6zLSIAl/8MpjeaW//N291nAY46NMijQVnsxceVCF7v+O81aXrdTZBkpcnc5XQHXR2jBgPANyMzmhA9uYaMXDPBenPisItJcHlOzu6Hsgxqd1JN7KSNmj4m8fxhJQfQy4gyTW9AU5qVQvWaNghyCzGXZBMLde6J8r2m4j+U7nWuIzD5t/nZ0cdLQalR6IOn4UZJVmFkqdNL08a2OdysalPOOEbbqRbAaY9hwZVyUMNKpyzsLkaeNw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f5feb48-11d4-466d-133e-08d6d3cd100c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2019 15:51:41.3589 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2533
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cdIM/7ArUd4Bf9FKuaIL4Hcb44h9ee6vm4NZQZjCglw=;
 b=1q78tQzVil+WUW+08jRFN0ucRJ/+jSnl0RWfCdRs/DHBk3ijDRravRDnzzGr68SRahuJ7h7GYIm48crP0Q3vZ8VAEb80smea8B92EW297tQPAFNxL7hiXa9u/DB/a8P8o7IpuUHAYFRY7f/DG+Ke6Pg6bZ9CDmSGIG4S16ja5M4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Leo.Liu@amd.com; 
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
Cc: "Liu, Leo" <Leo.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VG8gcmVwbGFjZSBjaGVja2luZyByaW5nIHR5cGUgYW5kIG1ha2UgdGhlbSBnZW5lcmljDQoNClNp
Z25lZC1vZmYtYnk6IExlbyBMaXUgPGxlby5saXVAYW1kLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5jIHwgNiArKy0tLS0NCiAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfY3MuYw0KaW5kZXggZDBlMjIxYzhkOTQwLi5kNzJjYzU4M2ViZDEgMTAwNjQ0DQot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYw0KKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzLmMNCkBAIC0xMDA4LDExICsxMDA4LDkgQEAg
c3RhdGljIGludCBhbWRncHVfY3NfaWJfZmlsbChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwN
CiAJCWorKzsNCiAJfQ0KIA0KLQkvKiBVVkQgJiBWQ0UgZncgZG9lc24ndCBzdXBwb3J0IHVzZXIg
ZmVuY2VzICovDQorCS8qIE1NIGVuZ2luZSBkb2Vzbid0IHN1cHBvcnQgdXNlciBmZW5jZXMgKi8N
CiAJcmluZyA9IHRvX2FtZGdwdV9yaW5nKHBhcnNlci0+ZW50aXR5LT5ycS0+c2NoZWQpOw0KLQlp
ZiAocGFyc2VyLT5qb2ItPnVmX2FkZHIgJiYgKA0KLQkgICAgcmluZy0+ZnVuY3MtPnR5cGUgPT0g
QU1ER1BVX1JJTkdfVFlQRV9VVkQgfHwNCi0JICAgIHJpbmctPmZ1bmNzLT50eXBlID09IEFNREdQ
VV9SSU5HX1RZUEVfVkNFKSkNCisJaWYgKHBhcnNlci0+am9iLT51Zl9hZGRyICYmIHJpbmctPmZ1
bmNzLT5ub191c2VyX2ZlbmNlKQ0KIAkJcmV0dXJuIC1FSU5WQUw7DQogDQogCXJldHVybiBhbWRn
cHVfY3R4X3dhaXRfcHJldl9mZW5jZShwYXJzZXItPmN0eCwgcGFyc2VyLT5lbnRpdHkpOw0KLS0g
DQoyLjE3LjENCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
