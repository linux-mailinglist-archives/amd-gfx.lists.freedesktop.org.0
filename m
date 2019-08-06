Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 997888387B
	for <lists+amd-gfx@lfdr.de>; Tue,  6 Aug 2019 20:19:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE6CC89BEC;
	Tue,  6 Aug 2019 18:19:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760070.outbound.protection.outlook.com [40.107.76.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 200DC89BEC
 for <amd-gfx@lists.freedesktop.org>; Tue,  6 Aug 2019 18:19:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GgHfQMZKMYqTlcgPzzzqYWIUm8FA3lRFSMeQQQOIJ5PTnmGbh9D4wLZ6B5Eg99vsUga3OuKa/9rMJrSJ+AbKrelZXpLkABRLH3JlN/uJi5KZFk61wrq5cgQe/STCJf1qXJYTb9dh9K9kb7ZX/QQxO2fefeStjzYxbdT5LwFVeLWDsZv/TMlK5wpfDVOl3GO2fM+vsfNR0GYl5yI91OieXeuDnsJ3WCyUBKiTqNdrwemd6OGigIkpkehbfT+a1tNNtYyIHsQoS6ZAtk4FCiUt3Zetb8RfHMkqt5lqbrySGLXOouMY4/zXKgGOzYA8WNyXAR3Gz+gufP9/iHBuDG9bcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Co+sNxvKCrC7H1KR9f5kZvaz/YgTHTWpl71euDmuMjM=;
 b=VN9mdiAPQEO7sN2WfaarLFEzqhZyu8yMpzk/yhcxO8cnUPjxVFb292wLj1jM6jLFzzw352hW+f6O2ksXobfH2zX9YB61FJB9L/Owb6OWp32YlLwP01p30DC+YeRZC6l72znbFYCjymJGqxHKLRTJEf1Gtcx2okJYqivM8/+XPhXCETiJQRy2+yxFV56yZM70scNUGHLzGeHsq3D/PNrLfXBYSh6ir/UGy4qmuy9sTd987WzpkQBexmKot4bl3KiwHkT3oms+IdpY8BoQYEHwTgPvrBUNtGh0xyQdwzO+X/v39Ch2ZLSJocWeJNJpcU+Wy0j5SsL72RS12aP+92WErg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM5PR1201MB0187.namprd12.prod.outlook.com (10.174.109.137) by
 DM5PR1201MB0090.namprd12.prod.outlook.com (10.174.105.140) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Tue, 6 Aug 2019 18:19:54 +0000
Received: from DM5PR1201MB0187.namprd12.prod.outlook.com
 ([fe80::f585:bab:f4b5:c09e]) by DM5PR1201MB0187.namprd12.prod.outlook.com
 ([fe80::f585:bab:f4b5:c09e%6]) with mapi id 15.20.2136.018; Tue, 6 Aug 2019
 18:19:54 +0000
From: "Pelloux-prayer, Pierre-eric" <Pierre-eric.Pelloux-prayer@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: fix gfx9 soft recovery
Thread-Topic: [PATCH] drm/amdgpu: fix gfx9 soft recovery
Thread-Index: AQHVTIOLOp2j3oTsZUOq7IjGbFPbvg==
Date: Tue, 6 Aug 2019 18:19:54 +0000
Message-ID: <20190806181951.17091-1-pierre-eric.pelloux-prayer@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0111.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::27) To DM5PR1201MB0187.namprd12.prod.outlook.com
 (2603:10b6:4:5b::9)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.23.0.rc1
x-originating-ip: [109.190.135.109]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: deec25cb-7a4b-4ab3-67fd-08d71a9aadfa
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR1201MB0090; 
x-ms-traffictypediagnostic: DM5PR1201MB0090:
x-microsoft-antispam-prvs: <DM5PR1201MB00909F11B664405300BAA0B58DD50@DM5PR1201MB0090.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:849;
x-forefront-prvs: 0121F24F22
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(136003)(376002)(39860400002)(396003)(189003)(199004)(81156014)(81166006)(8676002)(6116002)(3846002)(4326008)(186003)(6916009)(486006)(26005)(476003)(7736002)(86362001)(2616005)(68736007)(2351001)(2501003)(316002)(50226002)(305945005)(66066001)(8936002)(2906002)(102836004)(6512007)(99286004)(71190400001)(71200400001)(1076003)(14454004)(52116002)(66946007)(53936002)(256004)(14444005)(6436002)(55236004)(6486002)(4744005)(386003)(5660300002)(5640700003)(64756008)(25786009)(66446008)(66556008)(6506007)(36756003)(66476007)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR1201MB0090;
 H:DM5PR1201MB0187.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Ph3s0n3Y05GRLOIMJhzNeIxsRhsJiQ5xEC/T6xXftLax894/tUlcLY8cReW+wEOwnKxpH9bitT7lULhFt8MGLaiMszulbwJylsjPVFrPnmgmd9ePK15FjUbnz/4m5gzZc4m2m9Is0DTUh7IFDLU/rdwdSdFJ1gLYgJ7YJ2nVJAICIyOUjR/8Idcx36Kg4uUpA4IWrTATd14oG989n4ieRS2FyUc84d7JOGwlEA0Utm2L5f12eEWJ5a7bBK3oPg8X/YCsn60sE/RyjciyoHVGrFIdbTYwn9AnfRUAzbazfKriRpOxjW5iZ7MdamAtt7phQ+6TzjRoq6nBoQy+rY/XTtwnJN6o1kpNxWHwpJbPbDJFTRf4LM0nWvCD9+4rHrDsxfdOmg2WHwm2tLt4xe0i6kaLYGrWIGwCAo+rh7Aj9Kg=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: deec25cb-7a4b-4ab3-67fd-08d71a9aadfa
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2019 18:19:54.5707 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ppelloux@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0090
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Co+sNxvKCrC7H1KR9f5kZvaz/YgTHTWpl71euDmuMjM=;
 b=QGaCY8eCI4W3cMKIPwEgZAdgZcWZalkkf3VC8+RUWuHMwmwAiVk0V3fPRScV9ggZtGcJ6h+6TlKRFpYerZmEd4sSxbL8wlcW+hOCUZ4NLllHzhFJN8Urfx/uEDTn8+n+V35fcNA9DQObgeVkcGrK3sHTKsEu1OVH94+sUg7sAZk=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Pierre-eric.Pelloux-prayer@amd.com; 
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
Cc: "Pelloux-prayer, Pierre-eric" <Pierre-eric.Pelloux-prayer@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlIFNPQzE1X1JFR19PRkZTRVQoKSBtYWNybyB3YXNuJ3QgdXNlZCwgbWFraW5nIHRoZSBzb2Z0
IHJlY292ZXJ5IGZhaWwuCgpTaWduZWQtb2ZmLWJ5OiBQaWVycmUtRXJpYyBQZWxsb3V4LVByYXll
ciA8cGllcnJlLWVyaWMucGVsbG91eC1wcmF5ZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9nZnhfdjlfMC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvZ2Z4X3Y5XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMK
aW5kZXggYmNkMDMwMWVlZTFlLi5mZjg3ZjZlYTVjZDYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2dmeF92OV8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvZ2Z4X3Y5XzAuYwpAQCAtNTM3NSw3ICs1Mzc1LDcgQEAgc3RhdGljIHZvaWQgZ2Z4X3Y5XzBf
cmluZ19zb2Z0X3JlY292ZXJ5KHN0cnVjdCBhbWRncHVfcmluZyAqcmluZywgdW5zaWduZWQgdm1p
ZCkKIAl2YWx1ZSA9IFJFR19TRVRfRklFTEQodmFsdWUsIFNRX0NNRCwgTU9ERSwgMHgwMSk7CiAJ
dmFsdWUgPSBSRUdfU0VUX0ZJRUxEKHZhbHVlLCBTUV9DTUQsIENIRUNLX1ZNSUQsIDEpOwogCXZh
bHVlID0gUkVHX1NFVF9GSUVMRCh2YWx1ZSwgU1FfQ01ELCBWTV9JRCwgdm1pZCk7Ci0JV1JFRzMy
KG1tU1FfQ01ELCB2YWx1ZSk7CisJV1JFRzMyKFNPQzE1X1JFR19PRkZTRVQoR0MsIDAsIG1tU1Ff
Q01EKSwgdmFsdWUpOwogfQogCiBzdGF0aWMgdm9pZCBnZnhfdjlfMF9zZXRfZ2Z4X2VvcF9pbnRl
cnJ1cHRfc3RhdGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCi0tIAoyLjIzLjAucmMxCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
