Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBE3D3809
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 05:50:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C0DC6EB94;
	Fri, 11 Oct 2019 03:50:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700078.outbound.protection.outlook.com [40.107.70.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D60506EB94
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 03:50:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BIvJkii9ocaK+LkbcNJqd79aaAkj33PaA0Ix5LeM7G6G4OMLOyng1uz7wpnzsKcK8Bs+LSeHOX8QpuzagO7sSPl7gE5uwNHFwrE5grhuuzM9Osny7ByjNDgujEPzltBqut/0hhdgz6oo2a7LSUxWFj9yHi4y2bGoc+bbwSrxJxE7Pcxg3rUUFl//qE0hgt7rkoo4LYubq/HN20Ngeh9E6EPASQp6vqLf1KyjRZACczh2FqOO8nJMdg3OAiJsOtheDHYVSIDvRAuuhOv0oZCfd1gkQVVM3uuuKt2alaN4lQVqqEXsr9TfIXDMdAJsVS52b9dpWCJkcHq2aAymaSF6WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l/P7Qt+glpbOsLNkjF50XOAT0AXBxXl2aHcnGmSkurk=;
 b=ehhEnLHWcSd/YPTjY2qsDZY2znr8cr3S09iZi4vJi078FBbB5Su5AfgGJFGKVv/uZJ+QsoY3U0jSnMHlaNTeP4zYoq+rx5Nnvrzd0TNZVPn6cKD25AnKNEGq6bIviAUsrXxZRh7hOBkC0n1eHQRTHqv4ImmCXz1RTAohTlWQyMxGr0s1zoc2HYtg9z/+RdYaXaVM3S9heW4y5hic5ojEuIUj56OdNXnN0a308/r/ZnzgfUGDZY5ciSH2e1iQcUVaFMhQevHSV7Oe2T5Q5SqL+x7tsvRrgN+ll1aYFT5Erl53qzA3vtxl854GdFbRBgAd6LrNGemvmja7IfbmFNE05w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from CH2PR12CA0001.namprd12.prod.outlook.com (2603:10b6:610:57::11)
 by BL0PR12MB2818.namprd12.prod.outlook.com (2603:10b6:208:37::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.21; Fri, 11 Oct
 2019 03:50:47 +0000
Received: from BY2NAM03FT028.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::203) by CH2PR12CA0001.outlook.office365.com
 (2603:10b6:610:57::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16 via Frontend
 Transport; Fri, 11 Oct 2019 03:50:47 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT028.mail.protection.outlook.com (10.152.84.238) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Fri, 11 Oct 2019 03:50:46 +0000
Received: from rico-code.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Thu, 10 Oct 2019
 22:50:45 -0500
From: Tianci Yin <tianci.yin@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/8] drm/amdgpu: add a generic fb accessing helper function
Date: Fri, 11 Oct 2019 11:50:27 +0800
Message-ID: <20191011035033.24935-2-tianci.yin@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011035033.24935-1-tianci.yin@amd.com>
References: <20191011035033.24935-1-tianci.yin@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(39860400002)(136003)(346002)(428003)(199004)(189003)(14444005)(1076003)(316002)(16586007)(70586007)(70206006)(305945005)(4326008)(2906002)(5660300002)(81156014)(8676002)(81166006)(126002)(486006)(478600001)(53416004)(44832011)(36756003)(47776003)(50466002)(50226002)(6666004)(476003)(336012)(48376002)(426003)(446003)(11346002)(2616005)(86362001)(76176011)(51416003)(7696005)(54906003)(2351001)(8936002)(356004)(6916009)(186003)(26005)(41533002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR12MB2818; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 356c572a-42b5-441b-b6fe-08d74dfe331c
X-MS-TrafficTypeDiagnostic: BL0PR12MB2818:
X-Microsoft-Antispam-PRVS: <BL0PR12MB2818D56C827BCF76DA55EDC595970@BL0PR12MB2818.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 0187F3EA14
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xPJ/cGMgy7/n9CMbeNwDDY+VhkDU95LP50TN51hThHhzM+DVDJ8V0uW8x6MlTst/CQtegV+n/7+2jZ/dmmrCSoHjMzreuLl7aC3ff6j9smPoZLKjhpimWuCcVvGK9GT44Y4D6bUZVW74fs6o1Q+zQW8j5J477Tnq4/jH08+EP1mHmH56DKJZPNQpk+t/B5zqxYKwgZ1IioX0H69t3QUaRv7FJGNuVb6epTdlMdk5XhLrLzs8zbbpcz5NSRNWxIgrEhYt1Tq9G8SUUFrSECHyth3kA7I386Xy4H4h0o/Kk+uFvISYuCvhfZRWGsSTwQuqmeJjcNPmAXr6Did6Eh5JaLejQw4s/2TM1gK9G1ueqAcjAogyRdN2J1IIv/I5RyfubuU/O2tJR4o6nQAYUzr8U1C1KychIKxmGzEkaA0zVeo=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2019 03:50:46.9165 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 356c572a-42b5-441b-b6fe-08d74dfe331c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2818
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l/P7Qt+glpbOsLNkjF50XOAT0AXBxXl2aHcnGmSkurk=;
 b=cjhhkGcZQZJWwWCQdth0oPm990e7/3g6Hn+xUjOW1Uf7erRV54uykeNS8eUD3T+b5oXOe6KHCgP/y3jKj5R24fi9s5reXmQK9OuASGxKy3Pg+pJf3FmFLp8rUViuyiWgYZeHsahGgC1iX74GkQIZHLQy1CKdYNGkiDvqFjK5VsM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
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
Cc: Deucher Alexander <Alexander.Deucher@amd.com>,
 Tuikov Luben <Luben.Tuikov@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Tianci Yin <tianci.yin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogIlRpYW5jaS5ZaW4iIDx0aWFuY2kueWluQGFtZC5jb20+CgphZGQgYSBnZW5lcmljIGhl
bHBlciBmdW5jdGlvbiBmb3IgYWNjZXNzaW5nIGZyYW1lYnVmZmVyIHZpYSBNTUlPCgpDaGFuZ2Ut
SWQ6IEk0YmFhMGFhNTNjOTNhOTRjMmVmZjk4YzYyMTFhNjFmMzY5MjM5OTgyClJldmlld2VkLWJ5
OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6
IFRpYW5jaS5ZaW4gPHRpYW5jaS55aW5AYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHUuaCAgICAgICAgICAgfCAgMiArKwogZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2RldmljZS5jICAgIHwgMzQgKysrKysrKysrKysrKysrKysrKwogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rpc2NvdmVyeS5jIHwgMTMgKy0tLS0tLQogMyBm
aWxlcyBjaGFuZ2VkLCAzNyBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaCBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdS5oCmluZGV4IDUxY2NmMTc1Y2RhMC4uMTEwMmU2YmFlNWQ1IDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaAorKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaApAQCAtOTkxLDYgKzk5MSw4IEBAIGludCBh
bWRncHVfZGV2aWNlX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiB2b2lkIGFtZGdw
dV9kZXZpY2VfZmluaShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7CiBpbnQgYW1kZ3B1X2dw
dV93YWl0X2Zvcl9pZGxlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsKIAoraW50IGFtZGdw
dV9kZXZpY2VfdnJhbV9hY2Nlc3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIGxvZmZfdCBw
b3MsCisJCQkgICAgICB1aW50MzJfdCAqYnVmLCBzaXplX3Qgc2l6ZSwgYm9vbCB3cml0ZSk7CiB1
aW50MzJfdCBhbWRncHVfbW1fcnJlZyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdWludDMy
X3QgcmVnLAogCQkJdWludDMyX3QgYWNjX2ZsYWdzKTsKIHZvaWQgYW1kZ3B1X21tX3dyZWcoc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHVpbnQzMl90IHJlZywgdWludDMyX3QgdiwKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwppbmRleCA1OTgxNThlOTVlYzEu
LmZiMjFlYzFmOGE2MSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2RldmljZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZp
Y2UuYwpAQCAtMTU0LDYgKzE1NCw0MCBAQCBib29sIGFtZGdwdV9kZXZpY2VfaXNfcHgoc3RydWN0
IGRybV9kZXZpY2UgKmRldikKIAlyZXR1cm4gZmFsc2U7CiB9CiAKKy8qKgorICogVlJBTSBhY2Nl
c3MgaGVscGVyIGZ1bmN0aW9ucy4KKyAqCisgKiBhbWRncHVfZGV2aWNlX3ZyYW1fYWNjZXNzIC0g
cmVhZC93cml0ZSBhIGJ1ZmZlciBpbiB2cmFtCisgKgorICogQGFkZXY6IGFtZGdwdV9kZXZpY2Ug
cG9pbnRlcgorICogQHBvczogb2Zmc2V0IG9mIHRoZSBidWZmZXIgaW4gdnJhbQorICogQGJ1Zjog
dmlydHVhbCBhZGRyZXNzIG9mIHRoZSBidWZmZXIgaW4gc3lzdGVtIG1lbW9yeQorICogQHNpemU6
IHJlYWQvd3JpdGUgc2l6ZSwgc2l6ZW9mKEBidWYpIG11c3QgPiBAc2l6ZQorICogQHdyaXRlOiB0
cnVlIC0gd3JpdGUgdG8gdnJhbSwgb3RoZXJ3aXNlIC0gcmVhZCBmcm9tIHZyYW0KKyAqCisgKiBS
ZXR1cm5zIDAgb24gc3VjY2VzcyBvciBhbiAtZXJyb3Igb24gZmFpbHVyZS4KKyAqLworaW50IGFt
ZGdwdV9kZXZpY2VfdnJhbV9hY2Nlc3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIGxvZmZf
dCBwb3MsCisJCQkgICAgICB1aW50MzJfdCAqYnVmLCBzaXplX3Qgc2l6ZSwgYm9vbCB3cml0ZSkK
K3sKKwl1aW50NjRfdCBlbmQgPSBwb3MgKyBzaXplOworCXVuc2lnbmVkIGxvbmcgZmxhZ3M7CisK
Kwl3aGlsZSAocG9zIDwgZW5kKSB7CisJCXNwaW5fbG9ja19pcnFzYXZlKCZhZGV2LT5tbWlvX2lk
eF9sb2NrLCBmbGFncyk7CisJCVdSRUczMl9OT19LSVEobW1NTV9JTkRFWCwgKCh1aW50MzJfdClw
b3MpIHwgMHg4MDAwMDAwMCk7CisJCVdSRUczMl9OT19LSVEobW1NTV9JTkRFWF9ISSwgcG9zID4+
IDMxKTsKKwkJaWYgKHdyaXRlKQorCQkJV1JFRzMyX05PX0tJUShtbU1NX0RBVEEsICpidWYrKyk7
CisJCWVsc2UKKwkJCSpidWYrKyA9IFJSRUczMl9OT19LSVEobW1NTV9EQVRBKTsKKwkJc3Bpbl91
bmxvY2tfaXJxcmVzdG9yZSgmYWRldi0+bW1pb19pZHhfbG9jaywgZmxhZ3MpOworCQlwb3MgKz0g
NDsKKwl9CisKKwlyZXR1cm4gMDsKK30KKwogLyoKICAqIE1NSU8gcmVnaXN0ZXIgYWNjZXNzIGhl
bHBlciBmdW5jdGlvbnMuCiAgKi8KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9kaXNjb3ZlcnkuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9kaXNjb3ZlcnkuYwppbmRleCBkYjJkYWIzYTZkZmYuLjMyNGMyZDYwNWY1NCAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rpc2NvdmVyeS5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kaXNjb3ZlcnkuYwpAQCAtMTM0LDIxICsx
MzQsMTAgQEAgc3RhdGljIGludCBod19pZF9tYXBbTUFYX0hXSVBdID0gewogCiBzdGF0aWMgaW50
IGFtZGdwdV9kaXNjb3ZlcnlfcmVhZF9iaW5hcnkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYs
IHVpbnQ4X3QgKmJpbmFyeSkKIHsKLQl1aW50MzJfdCAqcCA9ICh1aW50MzJfdCAqKWJpbmFyeTsK
IAl1aW50NjRfdCB2cmFtX3NpemUgPSAodWludDY0X3QpUlJFRzMyKG1tUkNDX0NPTkZJR19NRU1T
SVpFKSA8PCAyMDsKIAl1aW50NjRfdCBwb3MgPSB2cmFtX3NpemUgLSBCSU5BUllfTUFYX1NJWkU7
Ci0JdW5zaWduZWQgbG9uZyBmbGFnczsKLQotCXdoaWxlIChwb3MgPCB2cmFtX3NpemUpIHsKLQkJ
c3Bpbl9sb2NrX2lycXNhdmUoJmFkZXYtPm1taW9faWR4X2xvY2ssIGZsYWdzKTsKLQkJV1JFRzMy
X05PX0tJUShtbU1NX0lOREVYLCAoKHVpbnQzMl90KXBvcykgfCAweDgwMDAwMDAwKTsKLQkJV1JF
RzMyX05PX0tJUShtbU1NX0lOREVYX0hJLCBwb3MgPj4gMzEpOwotCQkqcCsrID0gUlJFRzMyX05P
X0tJUShtbU1NX0RBVEEpOwotCQlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZhZGV2LT5tbWlvX2lk
eF9sb2NrLCBmbGFncyk7Ci0JCXBvcyArPSA0OwotCX0KIAotCXJldHVybiAwOworCXJldHVybiBh
bWRncHVfZGV2aWNlX3ZyYW1fYWNjZXNzKGFkZXYsIHBvcywgKHVpbnQzMl90ICopYmluYXJ5LCBC
SU5BUllfTUFYX1NJWkUsIGZhbHNlKTsKIH0KIAogc3RhdGljIHVpbnQxNl90IGFtZGdwdV9kaXNj
b3ZlcnlfY2FsY3VsYXRlX2NoZWNrc3VtKHVpbnQ4X3QgKmRhdGEsIHVpbnQzMl90IHNpemUpCi0t
IAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
