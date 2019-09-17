Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D838B4779
	for <lists+amd-gfx@lfdr.de>; Tue, 17 Sep 2019 08:25:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCD126E151;
	Tue, 17 Sep 2019 06:25:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680062.outbound.protection.outlook.com [40.107.68.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1C6F6E151
 for <amd-gfx@lists.freedesktop.org>; Tue, 17 Sep 2019 06:25:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IIhGX5AjAAhgdJyhyv9odmQu+20DKzfKspvqEy0CekYpia6aBFDmR2BcO1xpl6kF1iQttW/5mBdtHWojotwig5gK5oDO+cDCUIBfpcX3IYy4u8ArR+QIdAci0Me2Ln7Nq9e1WOLohar6e3reLb+j6dyGrg4++AwBqrcHTqtk67YbYZ6LuNho93IV49BcaG0AuBYF+CjdzgwN0rIkRrG66J+/NjFhhbrL7yOapns8yKxvBmZUxzW/tjDLsVo6RK5Oa7AdyVygKy0P8GzEdmHSquqMKN55e7o4AWVGpb9718WhJm7ZvKPJ45U6SN+oayNQRQu8RYlayY4YdjJSDxVUdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2SA/i+9g/KfiGKiLyR6m9jFJMgpIyfFzoJazYXk13zA=;
 b=ipiotZHD+s84CrYqMb1IKmFImhMKXO0lTIQOBs9VLm+ahl4MbfIhPe1s4s1CHmMD+LNzq5wn2NHuIk9q3aQIxuUT3tmeU5wn8LgUAyJu1+6TUcMB1Be24n/BS6GWA+PpqUjrIgdtJgpE0SYiF0rqxpkroIrMjJSRr2J49wn2l7N06v17Gcc6x6VS5lcBUZkDUrxFY+EkGlIDo++1p1Uy00I1Lw0I2ZSE5PjZaIhisxLi69nrf50LT4V+OVrjgJWtsssARoIT8r3RctSkjhLnU9YRT8Q5GsRDkgB+X4RVsGcjxBlabr4cmeTjpjEc9Xd/bNO/iAxuLQWvhy0kqunG1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB4158.namprd12.prod.outlook.com (10.255.224.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Tue, 17 Sep 2019 06:25:13 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0%3]) with mapi id 15.20.2263.023; Tue, 17 Sep 2019
 06:25:13 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Chen,
 Guchun" <Guchun.Chen@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Subject: [PATCH] drm/amdgpu: replace DRM_ERROR with DRM_WARN in
 ras_reserve_bad_pages
Thread-Topic: [PATCH] drm/amdgpu: replace DRM_ERROR with DRM_WARN in
 ras_reserve_bad_pages
Thread-Index: AQHVbSCpRnXut+ezvEiOIBHKn2ZPqg==
Date: Tue, 17 Sep 2019 06:25:13 +0000
Message-ID: <20190917062458.29589-1-tao.zhou1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0P153CA0013.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:18::25) To MN2PR12MB3054.namprd12.prod.outlook.com
 (2603:10b6:208:d1::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bdf52532-e678-4dd5-b248-08d73b37cbda
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB4158; 
x-ms-traffictypediagnostic: MN2PR12MB4158:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB4158B65D13DFD985FA64D195B08F0@MN2PR12MB4158.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 01630974C0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(39860400002)(366004)(376002)(136003)(189003)(199004)(3846002)(71190400001)(71200400001)(6506007)(14454004)(478600001)(64756008)(4326008)(81166006)(256004)(2501003)(25786009)(316002)(81156014)(66446008)(66946007)(66476007)(66556008)(99286004)(8676002)(14444005)(110136005)(66066001)(6436002)(386003)(5660300002)(6512007)(52116002)(36756003)(305945005)(50226002)(6636002)(2616005)(7736002)(6486002)(6116002)(102836004)(1076003)(2906002)(186003)(476003)(26005)(86362001)(8936002)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4158;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Q62lA8tLuYH723Ca7FyVPXzxXb7DqmQPFwzv9O0IpmDGhYFMyhKfzZx0ceHgCVIIYxL36+GtqTCovhg9i55LbHmjiBRMl8ivo4uvpBD8HuVY84mBlLdOLz2IerWixok4Srju5KER2bgDc4h/H2Yvu0m3mArB7+DZAgInzToMayPfKP39v06UHgxdqLEc8VRX4EniHAvsYnBV0GdTuCySzp3TFo5W4H9DFhZckQt7ouy8xmvt7cRpqgq4GI3e+vvy1S8zOqTapjVaGC0r0CNnbYaD0w+wkrd+8TrCLRSCjx7v9c6I5M7BbVcF/FyjzODNgumtzfFWlBLFQqSGKwKPjaYfaC29loC50/Dd+8V01EJ4GOJxlkpJ1GahQgkejHpPQo/Ix9UoVz0F5V3ir7Nvhd/nTkzb3foJdYryVc3kUIk=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdf52532-e678-4dd5-b248-08d73b37cbda
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2019 06:25:13.1908 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nsNLZi9n0mnlXexWMG3P9x51JInjOVZPRemfAn4/3z0dP5iJW01/B/7WJhTd4t6l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4158
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2SA/i+9g/KfiGKiLyR6m9jFJMgpIyfFzoJazYXk13zA=;
 b=AAmSDY8d3xaut30+v1DLi2CAmrLdNUBLP/0JF5hR+q5GrL2Va2xX3YtuIkg5OUZ2RCwrv8H0EAjUeGme1dhltqZ+XCBXQKqufu8h4oFKov6GybUkQPp2buYGG8h7wbzDQp0T7WoV+zXGs2jZY5Ep5m6peUMejC6KzwOKKeaGSf0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Tao.Zhou1@amd.com; 
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
Cc: "Zhou1, Tao" <Tao.Zhou1@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhlcmUgYXJlIHR3byBjYXNlcyBvZiByZXNlcnZlIGVycm9yIHNob3VsZCBiZSBpZ25vcmVkOgox
KSBhIHJhcyBiYWQgcGFnZSBoYXMgYmVlbiBhbGxvY2F0ZWQgKHVzZWQgYnkgc29tZW9uZSk7CjIp
IGEgcmFzIGJhZCBwYWdlIGhhcyBiZWVuIHJlc2VydmVkIChkdXBsaWNhdGUgZXJyb3IgaW5qZWN0
aW9uIGZvciBvbmUgcGFnZSk7CgpEUk1fRVJST1IgaXMgdW5uZWNlc3NhcnkgZm9yIHRoZSBmYWls
dXJlIG9mIGJhZCBwYWdlIHJlc2VydmUKClNpZ25lZC1vZmYtYnk6IFRhbyBaaG91IDx0YW8uemhv
dTFAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMg
fCA3ICsrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMKaW5kZXggNzllNWU1YmU4
YjM0Li41ZjYyM2RhZjUwNzggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9yYXMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFz
LmMKQEAgLTE0MDksMTAgKzE0MDksMTUgQEAgaW50IGFtZGdwdV9yYXNfcmVzZXJ2ZV9iYWRfcGFn
ZXMoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJZm9yIChpID0gZGF0YS0+bGFzdF9yZXNl
cnZlZDsgaSA8IGRhdGEtPmNvdW50OyBpKyspIHsKIAkJYnAgPSBkYXRhLT5icHNbaV0ucmV0aXJl
ZF9wYWdlOwogCisJCS8qIFRoZXJlIGFyZSB0d28gY2FzZXMgb2YgcmVzZXJ2ZSBlcnJvciBzaG91
bGQgYmUgaWdub3JlZDoKKwkJICogMSkgYSByYXMgYmFkIHBhZ2UgaGFzIGJlZW4gYWxsb2NhdGVk
ICh1c2VkIGJ5IHNvbWVvbmUpOworCQkgKiAyKSBhIHJhcyBiYWQgcGFnZSBoYXMgYmVlbiByZXNl
cnZlZCAoZHVwbGljYXRlIGVycm9yIGluamVjdGlvbgorCQkgKiAgICBmb3Igb25lIHBhZ2UpOwor
CQkgKi8KIAkJaWYgKGFtZGdwdV9ib19jcmVhdGVfa2VybmVsX2F0KGFkZXYsIGJwIDw8IFBBR0Vf
U0hJRlQsIFBBR0VfU0laRSwKIAkJCQkJICAgICAgIEFNREdQVV9HRU1fRE9NQUlOX1ZSQU0sCiAJ
CQkJCSAgICAgICAmYm8sIE5VTEwpKQotCQkJRFJNX0VSUk9SKCJSQVMgRVJST1I6IHJlc2VydmUg
dnJhbSAlbGx4IGZhaWxcbiIsIGJwKTsKKwkJCURSTV9XQVJOKCJSQVMgV0FSTjogcmVzZXJ2ZSB2
cmFtIGZvciByZXRpcmVkIHBhZ2UgJWxseCBmYWlsXG4iLCBicCk7CiAKIAkJZGF0YS0+YnBzX2Jv
W2ldID0gYm87CiAJCWRhdGEtPmxhc3RfcmVzZXJ2ZWQgPSBpICsgMTsKLS0gCjIuMTcuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
