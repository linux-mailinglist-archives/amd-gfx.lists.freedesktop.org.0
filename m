Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 600657BBFF
	for <lists+amd-gfx@lfdr.de>; Wed, 31 Jul 2019 10:42:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAF3889176;
	Wed, 31 Jul 2019 08:42:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam04on060f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4d::60f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D77FD89176
 for <amd-gfx@lists.freedesktop.org>; Wed, 31 Jul 2019 08:42:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OdkMkoJwhZ7vg1p43aJ39E0f1zOxSGz8qu9cuSnkxV5+GaCU4FEQaNXD0S+ub9dSbtVq1YWdGsiwZHg0qajqioY0sbQ5HIn1r4z9fi4zS+7hv7DHcAy+1HC43Py8tXSo//bH9tXf5Pa2+rv2OMaLop7igYoTOtM4T0gXeLXoUMVWy5LgpOzcKMkToH/tZrwMj6Zpz49KT9n6LiEkJw1Gj9DEyEihNOaPZ75H6yEm/1+zLlk0uH6OqjU4OKSsEfZ5Q/6ZFNaDaOIHCulIxsIhgzSI/mGharvEXizN05puxe8kUGEe6LkWzUvnZvpzleUlMjkP0m2/sZwpghQZIfV2dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8656y+bfRMwX3dhMOhmLD5SPe0us1XBVBVhBeQLK3GU=;
 b=fVc1SCwQeSf6JeJFKSjrl8b1miGL40VmK3KYX7eIfafmEzIIF4W/C9AtOKzKenwZPst/MSBv5mOA59BNe9JCxHJKGgal8oBFdqlYEHBWce7b/HzudN8V5EDCVYLEw0pqDwR79J5c//+Ogl7l4NFVyaeQnIVCNpEMbUSqbgHkQWWbRClcokS4OvXyNGE4R/fwRb3DlwbGTJu+00kOiGjjiDf+jv2V25ozAv4bY8vxmLEKk4CYLAkbA4WRzRTygs7lYcP5QOJxzL7IDTHg3AWWnGsSHIHTolzvwSKGrXS5JDyP+WzyT60htXmbZ8FbnZ+oKBB+vkdoBsREBDkmxGp5Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM6PR12CA0006.namprd12.prod.outlook.com (2603:10b6:5:1c0::19)
 by SN1PR12MB2543.namprd12.prod.outlook.com (2603:10b6:802:2a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2094.15; Wed, 31 Jul
 2019 08:42:32 +0000
Received: from CO1NAM03FT052.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::208) by DM6PR12CA0006.outlook.office365.com
 (2603:10b6:5:1c0::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.13 via Frontend
 Transport; Wed, 31 Jul 2019 08:42:31 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT052.mail.protection.outlook.com (10.152.81.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2115.10 via Frontend Transport; Wed, 31 Jul 2019 08:42:31 +0000
Received: from monk-build.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 31 Jul 2019
 03:42:29 -0500
From: Monk Liu <Monk.Liu@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: fix double ucode load by PSP(v2)
Date: Wed, 31 Jul 2019 16:42:23 +0800
Message-ID: <1564562543-21885-1-git-send-email-Monk.Liu@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(346002)(376002)(396003)(2980300002)(428003)(199004)(189003)(81166006)(426003)(126002)(4326008)(356004)(16586007)(26005)(53936002)(51416003)(14444005)(2906002)(7696005)(68736007)(50466002)(70206006)(336012)(53416004)(48376002)(478600001)(316002)(6666004)(70586007)(6916009)(186003)(50226002)(2351001)(36756003)(486006)(47776003)(5660300002)(2616005)(86362001)(8676002)(476003)(305945005)(8936002)(81156014)(21314003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN1PR12MB2543; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ff179eb-d2b1-4326-c8f9-08d7159306e4
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:SN1PR12MB2543; 
X-MS-TrafficTypeDiagnostic: SN1PR12MB2543:
X-Microsoft-Antispam-PRVS: <SN1PR12MB2543E8CF081CB4166B282D9384DF0@SN1PR12MB2543.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-Forefront-PRVS: 011579F31F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: Txoh75so8B58Dgfx+QRwSKk78hTk2JxXg9YnxOY26da/LrmooZjsoi0bTjfxn4ZHzDpP5NUSSh7qtJHetq14vLVyZHoj/MMOuMuYWiBCQHoWyWy+HrlD4JJ30Qpm0AtpznR1zcyCMHBq6HUqNsQBrzo82ZdDWp8LgDCknqRRUhYQueQ7Jr9eDG3Bq/TQNqh7imzCFGxT3WG+UsMHhHovZo8SQ/X0a2Ws20FZ8eXRYn0izTu1pnyTBOhETYPphny9detXXw3iNUTuMoLYvQviGO/mzD4Lq41peLk44e/qGThXJqEJC+lhE5uJ7ely2weWtrLIeFyQ10T/tubjzZIC48r9+4cbZbUT8ALZR9OXqIg2i1p4+FKyujZmmEYgkvN8Qy5AcI7b7aOKo2O6lk+A3Av0JSDBnrF7ynDWZ1GwgF4=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2019 08:42:31.4288 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ff179eb-d2b1-4326-c8f9-08d7159306e4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2543
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8656y+bfRMwX3dhMOhmLD5SPe0us1XBVBVhBeQLK3GU=;
 b=DRyRM+yMt4exDN57yLU8I9mm5JKc8HRxaDyWjJ6o8LpJg0s2cv6Wgb2FdisquKlH/tJFgAarTndq3HbA3usKBx7FWc3WL6FAwPhwoArejGgwFmWLFt8Hmg3CZdwdyWhxN/w/PSOp4MHCcof0l6Q1Eb5gqxcNY15r0S9Sh2HjxSI=
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
Cc: Monk Liu <Monk.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

cHJldmlvdXNseSB0aGUgdWNvZGUgbG9hZGluZyBvZiBQU1Agd2FzIHJlcHJlYXRlZCwgb25lIGV4
ZWN1dGVkIGluCnBoYXNlXzEgaW5pdC9yZS1pbml0L3Jlc3VtZSBhbmQgdGhlIG90aGVyIGluIGZ3
X2xvYWRpbmcgcm91dGluZQoKQXZvaWQgdGhpcyBkb3VibGUgbG9hZGluZyBieSBjbGVhcmluZyBp
cF9ibG9ja3Muc3RhdHVzLmh3IGluIHN1c3BlbmQgb3IgcmVzZXQKcHJpb3IgdG8gdGhlIEZXIGxv
YWRpbmcgYW5kIGFueSBibG9jaydzIGh3X2luaXQvcmVzdW1lCgp2MjoKc3RpbGwgZG8gdGhlIHNt
dSBmdyBsb2FkaW5nIHNpbmNlIGl0IGlzIG5lZWRlZCBieSBiYXJlLW1ldGFsCgpTaWduZWQtb2Zm
LWJ5OiBNb25rIExpdSA8TW9uay5MaXVAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgfCA3NyArKysrKysrKysrKysrKysrKysrLS0tLS0tLS0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCA0OCBpbnNlcnRpb25zKCspLCAyOSBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKaW5kZXggNmNiMzU4Yy4u
MzhiMTRiYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rl
dmljZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwpA
QCAtMTY3MywyOCArMTY3MywzNCBAQCBzdGF0aWMgaW50IGFtZGdwdV9kZXZpY2VfZndfbG9hZGlu
ZyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAogCWlmIChhZGV2LT5hc2ljX3R5cGUgPj0g
Q0hJUF9WRUdBMTApIHsKIAkJZm9yIChpID0gMDsgaSA8IGFkZXYtPm51bV9pcF9ibG9ja3M7IGkr
KykgewotCQkJaWYgKGFkZXYtPmlwX2Jsb2Nrc1tpXS52ZXJzaW9uLT50eXBlID09IEFNRF9JUF9C
TE9DS19UWVBFX1BTUCkgewotCQkJCWlmIChhZGV2LT5pbl9ncHVfcmVzZXQgfHwgYWRldi0+aW5f
c3VzcGVuZCkgewotCQkJCQlpZiAoYW1kZ3B1X3NyaW92X3ZmKGFkZXYpICYmIGFkZXYtPmluX2dw
dV9yZXNldCkKLQkJCQkJCWJyZWFrOyAvKiBzcmlvdiBncHUgcmVzZXQsIHBzcCBuZWVkIHRvIGRv
IGh3X2luaXQgYmVmb3JlIElIIGJlY2F1c2Ugb2YgaHcgbGltaXQgKi8KLQkJCQkJciA9IGFkZXYt
PmlwX2Jsb2Nrc1tpXS52ZXJzaW9uLT5mdW5jcy0+cmVzdW1lKGFkZXYpOwotCQkJCQlpZiAocikg
ewotCQkJCQkJRFJNX0VSUk9SKCJyZXN1bWUgb2YgSVAgYmxvY2sgPCVzPiBmYWlsZWQgJWRcbiIs
CisJCQlpZiAoYWRldi0+aXBfYmxvY2tzW2ldLnZlcnNpb24tPnR5cGUgIT0gQU1EX0lQX0JMT0NL
X1RZUEVfUFNQKQorCQkJCWNvbnRpbnVlOworCisJCQkvKiBubyBuZWVkIHRvIGRvIHRoZSBmdyBs
b2FkaW5nIGFnYWluIGlmIGFscmVhZHkgZG9uZSovCisJCQlpZiAoYWRldi0+aXBfYmxvY2tzW2ld
LnN0YXR1cy5odyA9PSB0cnVlKQorCQkJCWJyZWFrOworCisJCQlpZiAoYWRldi0+aW5fZ3B1X3Jl
c2V0IHx8IGFkZXYtPmluX3N1c3BlbmQpIHsKKwkJCQlyID0gYWRldi0+aXBfYmxvY2tzW2ldLnZl
cnNpb24tPmZ1bmNzLT5yZXN1bWUoYWRldik7CisJCQkJaWYgKHIpIHsKKwkJCQkJRFJNX0VSUk9S
KCJyZXN1bWUgb2YgSVAgYmxvY2sgPCVzPiBmYWlsZWQgJWRcbiIsCiAJCQkJCQkJICBhZGV2LT5p
cF9ibG9ja3NbaV0udmVyc2lvbi0+ZnVuY3MtPm5hbWUsIHIpOwotCQkJCQkJcmV0dXJuIHI7Ci0J
CQkJCX0KLQkJCQl9IGVsc2UgewotCQkJCQlyID0gYWRldi0+aXBfYmxvY2tzW2ldLnZlcnNpb24t
PmZ1bmNzLT5od19pbml0KGFkZXYpOwotCQkJCQlpZiAocikgewotCQkJCQkJRFJNX0VSUk9SKCJo
d19pbml0IG9mIElQIGJsb2NrIDwlcz4gZmFpbGVkICVkXG4iLAotCQkJCQkJICBhZGV2LT5pcF9i
bG9ja3NbaV0udmVyc2lvbi0+ZnVuY3MtPm5hbWUsIHIpOwotCQkJCQkJcmV0dXJuIHI7Ci0JCQkJ
CX0KKwkJCQkJcmV0dXJuIHI7CisJCQkJfQorCQkJfSBlbHNlIHsKKwkJCQlyID0gYWRldi0+aXBf
YmxvY2tzW2ldLnZlcnNpb24tPmZ1bmNzLT5od19pbml0KGFkZXYpOworCQkJCWlmIChyKSB7CisJ
CQkJCURSTV9FUlJPUigiaHdfaW5pdCBvZiBJUCBibG9jayA8JXM+IGZhaWxlZCAlZFxuIiwKKwkJ
CQkJCQkgIGFkZXYtPmlwX2Jsb2Nrc1tpXS52ZXJzaW9uLT5mdW5jcy0+bmFtZSwgcik7CisJCQkJ
CXJldHVybiByOwogCQkJCX0KLQkJCQlhZGV2LT5pcF9ibG9ja3NbaV0uc3RhdHVzLmh3ID0gdHJ1
ZTsKIAkJCX0KKworCQkJYWRldi0+aXBfYmxvY2tzW2ldLnN0YXR1cy5odyA9IHRydWU7CisJCQli
cmVhazsKIAkJfQogCX0KKwogCXIgPSBhbWRncHVfcG1fbG9hZF9zbXVfZmlybXdhcmUoYWRldiwg
JnNtdV92ZXJzaW9uKTsKIAogCXJldHVybiByOwpAQCAtMjEyOCw2ICsyMTM0LDcgQEAgc3RhdGlj
IGludCBhbWRncHVfZGV2aWNlX2lwX3N1c3BlbmRfcGhhc2UxKHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2KQogCWZvciAoaSA9IGFkZXYtPm51bV9pcF9ibG9ja3MgLSAxOyBpID49IDA7IGktLSkg
ewogCQlpZiAoIWFkZXYtPmlwX2Jsb2Nrc1tpXS5zdGF0dXMudmFsaWQpCiAJCQljb250aW51ZTsK
KwogCQkvKiBkaXNwbGF5cyBhcmUgaGFuZGxlZCBzZXBhcmF0ZWx5ICovCiAJCWlmIChhZGV2LT5p
cF9ibG9ja3NbaV0udmVyc2lvbi0+dHlwZSA9PSBBTURfSVBfQkxPQ0tfVFlQRV9EQ0UpIHsKIAkJ
CS8qIFhYWCBoYW5kbGUgZXJyb3JzICovCkBAIC0yMTM2LDcgKzIxNDMsOSBAQCBzdGF0aWMgaW50
IGFtZGdwdV9kZXZpY2VfaXBfc3VzcGVuZF9waGFzZTEoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYpCiAJCQlpZiAocikgewogCQkJCURSTV9FUlJPUigic3VzcGVuZCBvZiBJUCBibG9jayA8JXM+
IGZhaWxlZCAlZFxuIiwKIAkJCQkJICBhZGV2LT5pcF9ibG9ja3NbaV0udmVyc2lvbi0+ZnVuY3Mt
Pm5hbWUsIHIpOworCQkJCXJldHVybiByOwogCQkJfQorCQkJYWRldi0+aXBfYmxvY2tzW2ldLnN0
YXR1cy5odyA9IGZhbHNlOwogCQl9CiAJfQogCkBAIC0yMTc2LDE0ICsyMTg1LDE2IEBAIHN0YXRp
YyBpbnQgYW1kZ3B1X2RldmljZV9pcF9zdXNwZW5kX3BoYXNlMihzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldikKIAkJCWlmIChpc19zdXBwb3J0X3N3X3NtdShhZGV2KSkgewogCQkJCS8qIHRvZG8g
Ki8KIAkJCX0gZWxzZSBpZiAoYWRldi0+cG93ZXJwbGF5LnBwX2Z1bmNzICYmCi0JCQkJICAgYWRl
di0+cG93ZXJwbGF5LnBwX2Z1bmNzLT5zZXRfbXAxX3N0YXRlKSB7CisJCQkJCSAgIGFkZXYtPnBv
d2VycGxheS5wcF9mdW5jcy0+c2V0X21wMV9zdGF0ZSkgewogCQkJCXIgPSBhZGV2LT5wb3dlcnBs
YXkucHBfZnVuY3MtPnNldF9tcDFfc3RhdGUoCiAJCQkJCWFkZXYtPnBvd2VycGxheS5wcF9oYW5k
bGUsCiAJCQkJCWFkZXYtPm1wMV9zdGF0ZSk7CiAJCQkJaWYgKHIpIHsKIAkJCQkJRFJNX0VSUk9S
KCJTTUMgZmFpbGVkIHRvIHNldCBtcDEgc3RhdGUgJWQsICVkXG4iLAogCQkJCQkJICBhZGV2LT5t
cDFfc3RhdGUsIHIpOworCQkJCQlyZXR1cm4gcjsKIAkJCQl9CisJCQkJYWRldi0+aXBfYmxvY2tz
W2ldLnN0YXR1cy5odyA9IGZhbHNlOwogCQkJfQogCQl9CiAJfQpAQCAtMjIzMSwyMSArMjI0Miwy
NCBAQCBzdGF0aWMgaW50IGFtZGdwdV9kZXZpY2VfaXBfcmVpbml0X2Vhcmx5X3NyaW92KHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2KQogCQlBTURfSVBfQkxPQ0tfVFlQRV9JSCwKIAl9OwogCi0J
Zm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUoaXBfb3JkZXIpOyBpKyspIHsKKwlmb3IgKGkgPSAw
OyBpIDwgYWRldi0+bnVtX2lwX2Jsb2NrczsgaSsrKSB7CiAJCWludCBqOwotCQlzdHJ1Y3QgYW1k
Z3B1X2lwX2Jsb2NrICpibG9jazsKIAotCQlmb3IgKGogPSAwOyBqIDwgYWRldi0+bnVtX2lwX2Js
b2NrczsgaisrKSB7Ci0JCQlibG9jayA9ICZhZGV2LT5pcF9ibG9ja3Nbal07CisJCWlmICghYWRl
di0+aXBfYmxvY2tzW2ldLnN0YXR1cy52YWxpZCkKKwkJCWNvbnRpbnVlOwogCi0JCQlpZiAoYmxv
Y2stPnZlcnNpb24tPnR5cGUgIT0gaXBfb3JkZXJbaV0gfHwKLQkJCQkhYmxvY2stPnN0YXR1cy52
YWxpZCkKKwkJYWRldi0+aXBfYmxvY2tzW2ldLnN0YXR1cy5odyA9IGZhbHNlOworCisJCWZvciAo
aiA9IDA7IGogPCBBUlJBWV9TSVpFKGlwX29yZGVyKTsgaisrKSB7CisJCQlpZiAoaXBfb3JkZXJb
al0gIT0gYWRldi0+aXBfYmxvY2tzW2ldLnZlcnNpb24tPnR5cGUpCiAJCQkJY29udGludWU7CiAK
LQkJCXIgPSBibG9jay0+dmVyc2lvbi0+ZnVuY3MtPmh3X2luaXQoYWRldik7Ci0JCQlEUk1fSU5G
TygiUkUtSU5JVC1lYXJseTogJXMgJXNcbiIsIGJsb2NrLT52ZXJzaW9uLT5mdW5jcy0+bmFtZSwg
cj8iZmFpbGVkIjoic3VjY2VlZGVkIik7CisJCQlyID0gYWRldi0+aXBfYmxvY2tzW2ldLnZlcnNp
b24tPmZ1bmNzLT5od19pbml0KGFkZXYpOworCQkJRFJNX0lORk8oIlJFLUlOSVQtZWFybHk6ICVz
ICVzXG4iLCBhZGV2LT5pcF9ibG9ja3NbaV0udmVyc2lvbi0+ZnVuY3MtPm5hbWUsIHI/ImZhaWxl
ZCI6InN1Y2NlZWRlZCIpOwogCQkJaWYgKHIpCiAJCQkJcmV0dXJuIHI7CisKKwkJCWFkZXYtPmlw
X2Jsb2Nrc1tpXS5zdGF0dXMuaHcgPSB0cnVlOwogCQl9CiAJfQogCkBAIC0yMjczLDEzICsyMjg3
LDE1IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2RldmljZV9pcF9yZWluaXRfbGF0ZV9zcmlvdihzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAkJCWJsb2NrID0gJmFkZXYtPmlwX2Jsb2Nrc1tqXTsK
IAogCQkJaWYgKGJsb2NrLT52ZXJzaW9uLT50eXBlICE9IGlwX29yZGVyW2ldIHx8Ci0JCQkJIWJs
b2NrLT5zdGF0dXMudmFsaWQpCisJCQkJIWJsb2NrLT5zdGF0dXMudmFsaWQgfHwKKwkJCQlibG9j
ay0+c3RhdHVzLmh3KQogCQkJCWNvbnRpbnVlOwogCiAJCQlyID0gYmxvY2stPnZlcnNpb24tPmZ1
bmNzLT5od19pbml0KGFkZXYpOwogCQkJRFJNX0lORk8oIlJFLUlOSVQtbGF0ZTogJXMgJXNcbiIs
IGJsb2NrLT52ZXJzaW9uLT5mdW5jcy0+bmFtZSwgcj8iZmFpbGVkIjoic3VjY2VlZGVkIik7CiAJ
CQlpZiAocikKIAkJCQlyZXR1cm4gcjsKKwkJCWJsb2NrLT5zdGF0dXMuaHcgPSB0cnVlOwogCQl9
CiAJfQogCkBAIC0yMzAzLDE3ICsyMzE5LDE5IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2RldmljZV9p
cF9yZXN1bWVfcGhhc2UxKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCWludCBpLCByOwog
CiAJZm9yIChpID0gMDsgaSA8IGFkZXYtPm51bV9pcF9ibG9ja3M7IGkrKykgewotCQlpZiAoIWFk
ZXYtPmlwX2Jsb2Nrc1tpXS5zdGF0dXMudmFsaWQpCisJCWlmICghYWRldi0+aXBfYmxvY2tzW2ld
LnN0YXR1cy52YWxpZCB8fCBhZGV2LT5pcF9ibG9ja3NbaV0uc3RhdHVzLmh3KQogCQkJY29udGlu
dWU7CiAJCWlmIChhZGV2LT5pcF9ibG9ja3NbaV0udmVyc2lvbi0+dHlwZSA9PSBBTURfSVBfQkxP
Q0tfVFlQRV9DT01NT04gfHwKIAkJICAgIGFkZXYtPmlwX2Jsb2Nrc1tpXS52ZXJzaW9uLT50eXBl
ID09IEFNRF9JUF9CTE9DS19UWVBFX0dNQyB8fAogCQkgICAgYWRldi0+aXBfYmxvY2tzW2ldLnZl
cnNpb24tPnR5cGUgPT0gQU1EX0lQX0JMT0NLX1RZUEVfSUgpIHsKKwogCQkJciA9IGFkZXYtPmlw
X2Jsb2Nrc1tpXS52ZXJzaW9uLT5mdW5jcy0+cmVzdW1lKGFkZXYpOwogCQkJaWYgKHIpIHsKIAkJ
CQlEUk1fRVJST1IoInJlc3VtZSBvZiBJUCBibG9jayA8JXM+IGZhaWxlZCAlZFxuIiwKIAkJCQkJ
ICBhZGV2LT5pcF9ibG9ja3NbaV0udmVyc2lvbi0+ZnVuY3MtPm5hbWUsIHIpOwogCQkJCXJldHVy
biByOwogCQkJfQorCQkJYWRldi0+aXBfYmxvY2tzW2ldLnN0YXR1cy5odyA9IHRydWU7CiAJCX0K
IAl9CiAKQEAgLTIzMzgsNyArMjM1Niw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2RldmljZV9pcF9y
ZXN1bWVfcGhhc2UyKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCWludCBpLCByOwogCiAJ
Zm9yIChpID0gMDsgaSA8IGFkZXYtPm51bV9pcF9ibG9ja3M7IGkrKykgewotCQlpZiAoIWFkZXYt
PmlwX2Jsb2Nrc1tpXS5zdGF0dXMudmFsaWQpCisJCWlmICghYWRldi0+aXBfYmxvY2tzW2ldLnN0
YXR1cy52YWxpZCB8fCBhZGV2LT5pcF9ibG9ja3NbaV0uc3RhdHVzLmh3KQogCQkJY29udGludWU7
CiAJCWlmIChhZGV2LT5pcF9ibG9ja3NbaV0udmVyc2lvbi0+dHlwZSA9PSBBTURfSVBfQkxPQ0tf
VFlQRV9DT01NT04gfHwKIAkJICAgIGFkZXYtPmlwX2Jsb2Nrc1tpXS52ZXJzaW9uLT50eXBlID09
IEFNRF9JUF9CTE9DS19UWVBFX0dNQyB8fApAQCAtMjM1MSw2ICsyMzY5LDcgQEAgc3RhdGljIGlu
dCBhbWRncHVfZGV2aWNlX2lwX3Jlc3VtZV9waGFzZTIoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYpCiAJCQkJICBhZGV2LT5pcF9ibG9ja3NbaV0udmVyc2lvbi0+ZnVuY3MtPm5hbWUsIHIpOwog
CQkJcmV0dXJuIHI7CiAJCX0KKwkJYWRldi0+aXBfYmxvY2tzW2ldLnN0YXR1cy5odyA9IHRydWU7
CiAJfQogCiAJcmV0dXJuIDA7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4
