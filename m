Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B16B73C8
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Sep 2019 09:12:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E60D26F8EA;
	Thu, 19 Sep 2019 07:12:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740050.outbound.protection.outlook.com [40.107.74.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 398376F922
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 07:12:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BQBHNGGrANV1Q1ArFzoO5Qy3b/u1yudJ9yVpOaTW6Be3O/4aUl97W+ZGUgFv1Ed+H3jppXzpsOD7Bxf1fOTs7QvAbXg5Q4yW71ZoNEw4nO78MNV2JGZmDsnKGHIZloNUkiRhYuadN7r1YzgFOAR4ASF3PynjFoZwJAJDuPzL+JqQA2NfuFrb+JJwL2JGRyXUYRJte+5d4jBq8yMaDcBkkK6UxYKAtjPwUaLERJC+SiKBbasbTC2qCcDx+8LYLSL68eY02ao0M/KHi76vVF54MESAVT/BHHyAa0YBkMjHdKD7rFCCSe2soB7chZAT3vJfXw7LaJUPi1Gfn2eNx5UqLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mNwAglWmBFbXuljLSQm/Xo+Ln2QgshwYKKvLrPIWxGo=;
 b=VEndQZI1MNnZszOokUxciEaXGILyKjbAEvn1CUcHRaJTampSIcHRumyLmracMAj2geYZxLWA4ny/41KRf38y2r2hNEr8QoWqBgHFBSENBGmMipzScnV4PgeoqMKyLysiH2awCPCM3SB1RPn3Y6Zt3bWtKk67H73s4jcJJ8GfVMlZRof7I5AJkWF/Qb60QB4HS6Qb3fNxZsiUTgg800xPSd008y8+UEohRPABNV1mNOItB6JwktnLR2/lOxMFwzAW3bz/gMW5IberPRW028cnrSZcnqeyfAEeDLV9DQ3ZAPtVOrAzQmTky3BvvVwDnHOmSv0vBqpSZzYEpjSNCq0J1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB3440.namprd12.prod.outlook.com (20.178.244.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.18; Thu, 19 Sep 2019 07:12:44 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0%3]) with mapi id 15.20.2263.023; Thu, 19 Sep 2019
 07:12:44 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Chen,
 Guchun" <Guchun.Chen@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Subject: [PATCH 07/21] drm/amdgpu: add common mmhub member for adev
Thread-Topic: [PATCH 07/21] drm/amdgpu: add common mmhub member for adev
Thread-Index: AQHVbrmi2mwW2ek6s0KCEqZb5Ha1QA==
Date: Thu, 19 Sep 2019 07:12:44 +0000
Message-ID: <20190919071115.16552-8-tao.zhou1@amd.com>
References: <20190919071115.16552-1-tao.zhou1@amd.com>
In-Reply-To: <20190919071115.16552-1-tao.zhou1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK0PR03CA0092.apcprd03.prod.outlook.com
 (2603:1096:203:72::32) To MN2PR12MB3054.namprd12.prod.outlook.com
 (2603:10b6:208:d1::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8d02eb0b-b162-4b8c-9062-08d73cd0c456
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3440; 
x-ms-traffictypediagnostic: MN2PR12MB3440:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3440FF81D977CA95BFC02C3FB0890@MN2PR12MB3440.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:346;
x-forefront-prvs: 016572D96D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(346002)(366004)(39860400002)(136003)(199004)(189003)(25786009)(66066001)(14454004)(256004)(478600001)(6512007)(4326008)(2906002)(66946007)(66446008)(64756008)(316002)(66556008)(66476007)(6436002)(6116002)(110136005)(3846002)(6486002)(99286004)(6636002)(76176011)(2501003)(52116002)(1076003)(36756003)(5660300002)(446003)(2616005)(11346002)(476003)(305945005)(7736002)(26005)(102836004)(486006)(386003)(6506007)(186003)(8676002)(71190400001)(86362001)(71200400001)(8936002)(81156014)(50226002)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3440;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: MYQLzJvRxKIbPNqhQikFqILoba49wkM+wmH+BNcg8B/2FnZfHV4ET+7pFhZIYgIT1eFcAwhiKRdag0E6ngYsFIdVzRS6YdT9+6QqvNN9hEa/KBb9ICF+f/cgbnBQRuXVwYbrhSlxtJQnkgpI9HvfhWy9PVJ022cxCZqcmnH6BSJtl6kmifIVaQRdBEO559oN5M3DTSs7DmVgAUR7raos2VCaBCfSQMLopGv8YQmDzLdP4jZSyqfKtvyeakjj9CSFkxHsRTiwscngqsHIeCzxDY2QvjeO7hEebB24NWDfkDjwoj1Zu7I259bfb91KIv+w/tdo/dD4brM2rOsFbrad2NH09HGK/6bYIx9SHq4rnOr92aG4RUNZC/D/JTzwveIP1F6S9lVRtuuamofmNataIdU0n6RIjRPXyUs3wFVe5sU=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d02eb0b-b162-4b8c-9062-08d73cd0c456
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2019 07:12:44.6492 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C2NcnI2Slzlgi1XhSB8gx/zEk77QoQmr9yGeGJHVWQSiQxMtSZIOS4mSB+waeTic
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3440
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mNwAglWmBFbXuljLSQm/Xo+Ln2QgshwYKKvLrPIWxGo=;
 b=dZKKOpLj2tSl0xnSTvkle1GEA9ajUOxEdSBggL7cTOtykgfXE2rlhNtcDWOokYieje1LZTetF8yLNq1fVB4MdwqZRt9r7ccintjOWgFc9m++NcdSorp645ELNR/4szB8ndnfK5yyJ+dhu8ZE498OWe07S9SvXSpjgVH3e2hjNO8=
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

cHV0IG1taHViX2Z1bmNzIGFuZCByYXNfaWYgcG9pbnRlciBpbnRvIG1taHViIHN0cnVjdAoKU2ln
bmVkLW9mZi1ieTogVGFvIFpob3UgPHRhby56aG91MUBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oICAgICAgIHwgMyArKysKIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9tbWh1Yi5oIHwgNSArKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA4IGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHUuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oCmluZGV4IDZmZjAyYmI2
MDE0MC4uOTU5NGVhZWJjZmQxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHUuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaApAQCAt
ODc3LDYgKzg3Nyw5IEBAIHN0cnVjdCBhbWRncHVfZGV2aWNlIHsKIAkvKiBuYmlvICovCiAJc3Ry
dWN0IGFtZGdwdV9uYmlvCQluYmlvOwogCisJLyogbW1odWIgKi8KKwlzdHJ1Y3QgYW1kZ3B1X21t
aHViCQltbWh1YjsKKwogCS8qIGdmeCAqLwogCXN0cnVjdCBhbWRncHVfZ2Z4CQlnZng7CiAKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9tbWh1Yi5oIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X21taHViLmgKaW5kZXggNjg1ZTU0ZTU4NzAw
Li5hNzMzODk4YzdkNTUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9tbWh1Yi5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9tbWh1
Yi5oCkBAIC0yOCw2ICsyOCwxMSBAQCBzdHJ1Y3QgYW1kZ3B1X21taHViX2Z1bmNzIHsKIAkJCQkJ
dm9pZCAqcmFzX2Vycm9yX3N0YXR1cyk7CiB9OwogCitzdHJ1Y3QgYW1kZ3B1X21taHViIHsKKwlz
dHJ1Y3QgcmFzX2NvbW1vbl9pZiAqcmFzX2lmOworCWNvbnN0IHN0cnVjdCBhbWRncHVfbW1odWJf
ZnVuY3MgKmZ1bmNzOworfTsKKwogaW50IGFtZGdwdV9tbWh1Yl9yYXNfbGF0ZV9pbml0KHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2KTsKIAogI2VuZGlmCi0tIAoyLjE3LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
