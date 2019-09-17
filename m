Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2C9B475D
	for <lists+amd-gfx@lfdr.de>; Tue, 17 Sep 2019 08:22:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70E736E14B;
	Tue, 17 Sep 2019 06:22:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam05on0614.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe51::614])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCB386E151
 for <amd-gfx@lists.freedesktop.org>; Tue, 17 Sep 2019 06:22:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kMK9jdibMnu1BL/GfJwoEW4XmfkjjFOr1GBM8gv6moUlE5EDCqD4mMeBMXfmsmK0J86RENg4ulNaSv+i58UQGl5UNqa8XWwZBMkbB9WNtQN6uERoDIws+kZfAy8YhHJ2Pr68LhGrUAWE/k4DKdem+gQ4lC/sNB4jegBpC8wUT3sB5/mQi9XHv20GhSHO/djyp2NCvBEnjN1mQF0eohFDUdHWDViYjIoamvtNJU6PDk1O1e432KHktXkVw43kOwfUkcLBWMOYfwfu8KYsMl+avBHvi8iFYoUOtEnkQvuMZ3107nkVgX1mKGhFTI6AH1c7I3bEiSJyTmbMecu27W4KZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AUqJ6hikSBizsFlwzzLbujWOt+rChqjWw8jQlyBIcpU=;
 b=RdstP+seC7GO5U4R0wfwvZcc/kJj9fbmYVK22VoV/2hsNe7FjUeDmEQ03ZolgeXRcMoz/jDcKNzdVnM+ZI7BgWkTJKwCBFb0lY3ElKLy9cTO7kdtBUeZdi489O/ClkUB6gnP+bcM6JjsTCXVZX4Hglbht9vJNTM/ugLqBim+4P+OQkjLyg4UK4pjj1UD7C84nH3Bj7sTUPpzn/ry2YWc693u+kzc08PK0GWtOJLF2NQvp+dSh/t86/OU+JSSXj5g0QA8OvEUNAatU8G6MY93G2mXHXGon/WQd4ORJ6G5Ngr+JWOUKrEIBAl0JAN5Smvkuj2rlpuWF8zdc0QYQV0dvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB3440.namprd12.prod.outlook.com (20.178.244.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.18; Tue, 17 Sep 2019 06:22:28 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0%3]) with mapi id 15.20.2263.023; Tue, 17 Sep 2019
 06:22:28 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Chen,
 Guchun" <Guchun.Chen@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: [PATCH] drm/amdgpu: use GPU PAGE SHIFT for umc retired page
Thread-Topic: [PATCH] drm/amdgpu: use GPU PAGE SHIFT for umc retired page
Thread-Index: AQHVbSBHvxsMS8Vye0iELpc03jvuqg==
Date: Tue, 17 Sep 2019 06:22:28 +0000
Message-ID: <20190917062213.29480-1-tao.zhou1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR01CA0003.apcprd01.prod.exchangelabs.com
 (2603:1096:203:92::15) To MN2PR12MB3054.namprd12.prod.outlook.com
 (2603:10b6:208:d1::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8bbc0318-bfa8-487f-4ee4-08d73b3769e7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3440; 
x-ms-traffictypediagnostic: MN2PR12MB3440:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB34404CC9950BFAEA16E27ACBB08F0@MN2PR12MB3440.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:826;
x-forefront-prvs: 01630974C0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(376002)(396003)(346002)(136003)(189003)(199004)(2906002)(6116002)(86362001)(7736002)(3846002)(1076003)(4744005)(14444005)(256004)(305945005)(71200400001)(5660300002)(71190400001)(14454004)(316002)(66066001)(102836004)(6636002)(52116002)(486006)(6436002)(50226002)(476003)(2616005)(2501003)(6506007)(386003)(66476007)(66556008)(64756008)(99286004)(66946007)(186003)(66446008)(26005)(25786009)(8936002)(8676002)(81156014)(81166006)(6512007)(6486002)(478600001)(110136005)(36756003)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3440;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 31fAWwJDNmCPel15TPwwdTGPOCbSl3PsMQduE8ubnUcQBZ49hZXL4dKBdnEl6ePA7KdOpdHupVxuD8m5e0jeTlaIjcSzMsfKTDIdEpSHh8Fiige/KpluI1eDWzmW7BZIdUW3DwsIcoeVoPCQYzmzkaLMYTM3M2VhPJfFf4Y6pXZNpjnvcuVRIyGoBobko9JxdVnm1qoJip1gxT3gKXidUSlQX8jKrpE7pNekTvCcIo8UfdondUIvtM10rs+RWs6Oj97n3gI5i7ZA6DXMQtPU+W0HM5rYHP3z57APXROFrGIgcnTnGeXyw19DP5CNF/ozDZfVSGEMudgFck+lJjiC0Y5EHRbB4se5/oToLkrJw99gCkhBQImhNrWIkvCyLhphasOBH3JJha6Ykm+7Km5k63DENkkgiYW32CQ+hfYJyAw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bbc0318-bfa8-487f-4ee4-08d73b3769e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2019 06:22:28.8047 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UBrtPwFUMWiYCik5CNSrd9VewbJmGKCuKuAZ8iSkofnNezIuKE5tcBrxIOhMYIGo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3440
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AUqJ6hikSBizsFlwzzLbujWOt+rChqjWw8jQlyBIcpU=;
 b=UH+VvfNzBW7Kr87G1m6XS3BpT/s+65lwD8hJQw3++G64hG5aStVgv1ym2CYMuPMCDt1mpkr2seV6v2kJDe3Q3n5qUlGdWhhMNwJUnIZCtHfV9CxfUet8dsmE3T+ezWnIaeh9JHDdMr/aE2rO5MAKxNyOa04oKWHtI05cdaM9hrw=
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

dW1jIHJldGlyZWQgcGFnZSBiZWxvbmdzIHRvIHZyYW0gYW5kIGl0IHNob3VsZCBiZSBhbGlnbmVk
IHRvIGdwdSBwYWdlCnNpemUKClNpZ25lZC1vZmYtYnk6IFRhbyBaaG91IDx0YW8uemhvdTFAYW1k
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91bWNfdjZfMS5jIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdW1jX3Y2XzEuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L3VtY192Nl8xLmMKaW5kZXggMWMwZGEzMmMxNTYxLi40N2M0Yjk2YjE0ZDEg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3VtY192Nl8xLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdW1jX3Y2XzEuYwpAQCAtMjEzLDcgKzIxMyw3IEBA
IHN0YXRpYyB2b2lkIHVtY192Nl8xX3F1ZXJ5X2Vycm9yX2FkZHJlc3Moc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYsCiAJCQkJPT0gMSkgewogCQkJZXJyX3JlYy0+YWRkcmVzcyA9IGVycl9hZGRy
OwogCQkJLyogcGFnZSBmcmFtZSBhZGRyZXNzIGlzIHNhdmVkICovCi0JCQllcnJfcmVjLT5yZXRp
cmVkX3BhZ2UgPSByZXRpcmVkX3BhZ2UgPj4gUEFHRV9TSElGVDsKKwkJCWVycl9yZWMtPnJldGly
ZWRfcGFnZSA9IHJldGlyZWRfcGFnZSA+PiBBTURHUFVfR1BVX1BBR0VfU0hJRlQ7CiAJCQllcnJf
cmVjLT50cyA9ICh1aW50NjRfdClrdGltZV9nZXRfcmVhbF9zZWNvbmRzKCk7CiAJCQllcnJfcmVj
LT5lcnJfdHlwZSA9IEFNREdQVV9SQVNfRUVQUk9NX0VSUl9OT05fUkVDT1ZFUkFCTEU7CiAJCQll
cnJfcmVjLT5jdSA9IDA7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeA==
