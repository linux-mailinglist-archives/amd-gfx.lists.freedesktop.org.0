Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CADE711B4B
	for <lists+amd-gfx@lfdr.de>; Thu,  2 May 2019 16:22:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60B7B8924C;
	Thu,  2 May 2019 14:22:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740070.outbound.protection.outlook.com [40.107.74.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F9FB8924C
 for <amd-gfx@lists.freedesktop.org>; Thu,  2 May 2019 14:22:51 +0000 (UTC)
Received: from MWHPR12MB1311.namprd12.prod.outlook.com (10.169.205.136) by
 MWHPR12MB1471.namprd12.prod.outlook.com (10.172.55.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.11; Thu, 2 May 2019 14:22:49 +0000
Received: from MWHPR12MB1311.namprd12.prod.outlook.com
 ([fe80::755c:8135:708e:b345]) by MWHPR12MB1311.namprd12.prod.outlook.com
 ([fe80::755c:8135:708e:b345%12]) with mapi id 15.20.1856.008; Thu, 2 May 2019
 14:22:49 +0000
From: "StDenis, Tom" <Tom.StDenis@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/amdgpu: Add MEM_LOAD to amdgpu_pm_info debugfs file
Thread-Topic: [PATCH] drm/amd/amdgpu: Add MEM_LOAD to amdgpu_pm_info debugfs
 file
Thread-Index: AQHVAPKFFI/V0ZP6BEeAQBURfoIthw==
Date: Thu, 2 May 2019 14:22:49 +0000
Message-ID: <20190502142239.22322-1-tom.stdenis@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BL0PR0102CA0019.prod.exchangelabs.com
 (2603:10b6:207:18::32) To MWHPR12MB1311.namprd12.prod.outlook.com
 (2603:10b6:300:11::8)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [165.204.84.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 34144ff3-ae54-4c67-36ad-08d6cf09a76f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1471; 
x-ms-traffictypediagnostic: MWHPR12MB1471:
x-microsoft-antispam-prvs: <MWHPR12MB1471D7AC615B5C9D9BD3ED89F7340@MWHPR12MB1471.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:115;
x-forefront-prvs: 0025434D2D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(346002)(136003)(396003)(376002)(366004)(199004)(189003)(99286004)(66446008)(6512007)(66556008)(64756008)(66476007)(5660300002)(6916009)(81156014)(25786009)(3846002)(8936002)(53936002)(2351001)(7736002)(6116002)(305945005)(478600001)(186003)(2906002)(6506007)(6436002)(4326008)(6486002)(26005)(68736007)(72206003)(316002)(14454004)(50226002)(36756003)(102836004)(256004)(1076003)(71200400001)(2501003)(81166006)(86362001)(5640700003)(71190400001)(52116002)(66066001)(4744005)(486006)(66946007)(73956011)(2616005)(476003)(8676002)(386003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1471;
 H:MWHPR12MB1311.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: eyuAlc6EYNjs+CZK0P3Np/kWoWnZrIi5qFXUU+wilI2z6pLFTOZ0PRHfUkr1ZjmPmV8thd4bCORg5Qxl/XsV6hbKIPwIiZEAAwf/PBQV4o3+oVy8671wQX2VlfPHKEkD/keR0AzlGpqoWk0VcnIowdvDJpi1UN10Oq3+81sP0QfGpWL031ftQs0IfIIgWucDa0nWtXIxzSCUlPFVO2DpygepM/EHIyWTVTlX0BkEfb2JhFVzesAGGiISPnDWAoBgcn7rFnjby0YZKPZAf3TcWn7zkZX/vlpBpauDFGBxtGUamG61l0rt+LQAK52LG5bXt61Hkuh52wGSrDEZa1k9DvWX/2uaJd3BPv6lSl/gU5UjVzEPkSvURYs1c/juQzcFl1UkSNPcxSQkgPPJCye7gf24Bw707PMlRjDWquueDZk=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34144ff3-ae54-4c67-36ad-08d6cf09a76f
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2019 14:22:49.4966 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1471
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BSR8c3Ultbf02QVrLvGb1w1kG8TwwXnfD5cwhldyR64=;
 b=PImgxrqpFGTwJ1FROubNh1yjQKJ7ibDLM0Je3pOPSFQOUIf7LLTWbNq6LaW3FvNMYW+ZUcL4A13BpZnv64mlLbvHW6znQFlK40fUOqtJ91OJJ6hG4WWAQzGSjQgfE6NU0BnkgTWG4x8dIbA1s2YLQK6gkf+3tf/xdIojXr79XGk=
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

U2lnbmVkLW9mZi1ieTogVG9tIFN0IERlbmlzIDx0b20uc3RkZW5pc0BhbWQuY29tPg0KLS0tDQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BtLmMgfCA0ICsrKysNCiAxIGZpbGUg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfcG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9wbS5jDQppbmRleCA1ZTJkMDM5ZTA5YWQuLmUwNzg5ZjBmMjY3MCAxMDA2NDQNCi0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbS5jDQorKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfcG0uYw0KQEAgLTI5NTUsNiArMjk1NSwxMCBAQCBzdGF0aWMg
aW50IGFtZGdwdV9kZWJ1Z2ZzX3BtX2luZm9fcHAoc3RydWN0IHNlcV9maWxlICptLCBzdHJ1Y3Qg
YW1kZ3B1X2RldmljZSAqYQ0KIAkvKiBHUFUgTG9hZCAqLw0KIAlpZiAoIWFtZGdwdV9kcG1fcmVh
ZF9zZW5zb3IoYWRldiwgQU1ER1BVX1BQX1NFTlNPUl9HUFVfTE9BRCwgKHZvaWQgKikmdmFsdWUs
ICZzaXplKSkNCiAJCXNlcV9wcmludGYobSwgIkdQVSBMb2FkOiAldSAlJVxuIiwgdmFsdWUpOw0K
KwkvKiBNRU0gTG9hZCAqLw0KKwlpZiAoIWFtZGdwdV9kcG1fcmVhZF9zZW5zb3IoYWRldiwgQU1E
R1BVX1BQX1NFTlNPUl9NRU1fTE9BRCwgKHZvaWQgKikmdmFsdWUsICZzaXplKSkNCisJCXNlcV9w
cmludGYobSwgIk1FTSBMb2FkOiAldSAlJVxuIiwgdmFsdWUpOw0KKw0KIAlzZXFfcHJpbnRmKG0s
ICJcbiIpOw0KIA0KIAkvKiBTTUMgZmVhdHVyZSBtYXNrICovDQotLSANCjIuMjAuMQ0KDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxp
bmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
