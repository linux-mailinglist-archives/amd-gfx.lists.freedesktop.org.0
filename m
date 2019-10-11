Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBEFD3808
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 05:50:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 584EA6EA88;
	Fri, 11 Oct 2019 03:50:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710068.outbound.protection.outlook.com [40.107.71.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8FB56EA88
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 03:50:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OOzhkj0YPwu0sMA3V8CNTGTiMr9vmQlBg0/10s9NxryU3pn2NdDvnMPx7H9Y4sCQ40+zV4dRbKaOBXezkXofGhNkQTwTifFsC8iZ3WExDEusKYblWbSjAimNhg/WKV/s+8CrVVsft4ppnAMN+XwtESFDnv43TsjQcYuE6/uRCdo+EiJ6vr7SneDASf5RH0c6KZLi2zuQKqmadq1QZT0oySWrP1m3iPGyChsiAbAiDzvXooUgwzmEZm7daTFrWMB6miOTFFCmuc1uNsw9VxA28VqyHtDXxo2w4vTI2p9K/NaoE6zv7cBgWEXDlInLac5PcwHR9qXizA7qwwTfFngEYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XxGE8Me04iJOewVLpn5EWqr56JBgF+TVV3Ehlw8zy7Q=;
 b=g2q5XQSDOcLS3E2RUZV1l/py+BhJz41ikjYx4wB1Gj6OtZIJH4TTYzExat0B3IKBaqs1BGn/TxqbmwwnLreVAqj0Du47bg10IN4ptMQQIl/3zpZR6otKSf5edZ+dFkMblxEwSz56OYGi7j1NuwhlEj6iojRLDcb71Z3UPZisurqf2n6wPDoun5BErA/eunz3qWrKL8z83Fr1Zh12hu0uET2yHqiMDdLkEFCQ+FYjIjf12CZoaaEx7IqOHbWGBUGtqveKY4S8smlfl47UzftYJJwTAYqk1DiieLHBLd5xGMSSfx77/t3aGn8GxmY2TegUCjfLRUfyb8VR7FK4t7Ssuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MN2PR12CA0015.namprd12.prod.outlook.com (2603:10b6:208:a8::28)
 by CY4PR12MB1909.namprd12.prod.outlook.com (2603:10b6:903:124::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.17; Fri, 11 Oct
 2019 03:50:44 +0000
Received: from BY2NAM03FT025.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::201) by MN2PR12CA0015.outlook.office365.com
 (2603:10b6:208:a8::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Fri, 11 Oct 2019 03:50:44 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT025.mail.protection.outlook.com (10.152.84.232) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Fri, 11 Oct 2019 03:50:42 +0000
Received: from rico-code.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Thu, 10 Oct 2019
 22:50:40 -0500
From: Tianci Yin <tianci.yin@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/8] drm/amdgpu: update amdgpu_discovery to handle revision
Date: Fri, 11 Oct 2019 11:50:26 +0800
Message-ID: <20191011035033.24935-1-tianci.yin@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(39860400002)(346002)(396003)(428003)(189003)(199004)(14444005)(478600001)(51416003)(36756003)(70206006)(70586007)(7696005)(6666004)(356004)(305945005)(5660300002)(1076003)(47776003)(50226002)(53416004)(15650500001)(8936002)(8676002)(54906003)(2351001)(6916009)(86362001)(4326008)(26005)(50466002)(81166006)(81156014)(336012)(2616005)(426003)(2906002)(486006)(476003)(44832011)(126002)(16586007)(316002)(186003)(48376002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1909; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 093bae8b-2088-4b24-0675-08d74dfe30aa
X-MS-TrafficTypeDiagnostic: CY4PR12MB1909:
X-Microsoft-Antispam-PRVS: <CY4PR12MB19090934BFBB2594EFF37A1695970@CY4PR12MB1909.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:431;
X-Forefront-PRVS: 0187F3EA14
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: anlcF4uBeuaHzrnPKkHYFrmxlnOKJlUXVk0L0/ga2PQJoZjViyUKfZWbQm6CTA2Hutouetwh3k0FSY0dpLa+12nCe9ZxZuDBcpLHJX+lHp/o98xO0gmph21QoFDBRQ9wmTsdyUD38HB9vyC71tfQOZrxDW0WvrBoEYyr+GllfE2voIMuxWXoMIhHpraSdx5Glm3gBkOcDilIXFFX2YAjdBqQtRB1ejz9AuURgXEzMK9gfJqsvHI5OtaZAmlf+j/QSl8SsylOId6YiK4xndXM2pBjvkfOfNr1sZC4K71o8bJ/9NLgb4U5w/ESgqO1RD3ukx+XVnHh50/7MLgjm8cDaJ6RVVNtIa544DOEk/LVmsNUFzPlculBjdBe5OHLt4MDO0OoAZJdnABGM4HK+9V4L0+T3msY0Hom8UBF5jePOgo=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2019 03:50:42.8072 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 093bae8b-2088-4b24-0675-08d74dfe30aa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1909
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XxGE8Me04iJOewVLpn5EWqr56JBgF+TVV3Ehlw8zy7Q=;
 b=PSI4UKuDtJNw/7fWdjdDeYboNuVorUjlaszmOTXcgStE2sBxvJZ1hPupUFFWDjuCvo80nQwN9mO1E7NPUz/qePJviLC6e7ak9cWP4n8dBXL8h/I+F12KpTvlkuJbX0e6EQeuM+o1tGL5BCIPg0HiZRe3Y6UvGkm1hcX9qr4Onak=
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

RnJvbTogIlRpYW5jaS5ZaW4iIDx0aWFuY2kueWluQGFtZC5jb20+Cgp1cGRhdGUgYW1kZ3B1X2Rp
c2NvdmVyeSB0byBnZXQgSVAgcmV2aXNpb24uCgpDaGFuZ2UtSWQ6IElmODE1MjEwM2QwM2I1OGUx
ZGMwZjMyZGI2MzYyNWUyOTBmNWYwOGEwClJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhh
bmRlci5kZXVjaGVyQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IFRpYW5jaS5ZaW4gPHRpYW5jaS55
aW5AYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGlzY292
ZXJ5LmMgfCA0ICsrKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kaXNjb3Zl
cnkuaCB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kaXNj
b3ZlcnkuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kaXNjb3ZlcnkuYwpp
bmRleCAxNDgxODk5Zjg2YzEuLmRiMmRhYjNhNmRmZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rpc2NvdmVyeS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9kaXNjb3ZlcnkuYwpAQCAtMzMzLDcgKzMzMyw3IEBAIGludCBhbWRn
cHVfZGlzY292ZXJ5X3JlZ19iYXNlX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiB9
CiAKIGludCBhbWRncHVfZGlzY292ZXJ5X2dldF9pcF92ZXJzaW9uKHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2LCBpbnQgaHdfaWQsCi0JCQkJICAgIGludCAqbWFqb3IsIGludCAqbWlub3IpCisJ
CQkJICAgIGludCAqbWFqb3IsIGludCAqbWlub3IsIGludCAqcmV2aXNpb24pCiB7CiAJc3RydWN0
IGJpbmFyeV9oZWFkZXIgKmJoZHI7CiAJc3RydWN0IGlwX2Rpc2NvdmVyeV9oZWFkZXIgKmloZHI7
CkBAIC0zNjksNiArMzY5LDggQEAgaW50IGFtZGdwdV9kaXNjb3ZlcnlfZ2V0X2lwX3ZlcnNpb24o
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIGludCBod19pZCwKIAkJCQkJKm1ham9yID0gaXAt
Pm1ham9yOwogCQkJCWlmIChtaW5vcikKIAkJCQkJKm1pbm9yID0gaXAtPm1pbm9yOworCQkJCWlm
IChyZXZpc2lvbikKKwkJCQkJKnJldmlzaW9uID0gaXAtPnJldmlzaW9uOwogCQkJCXJldHVybiAw
OwogCQkJfQogCQkJaXBfb2Zmc2V0ICs9IHNpemVvZigqaXApICsgNCAqIChpcC0+bnVtX2Jhc2Vf
YWRkcmVzcyAtIDEpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2Rpc2NvdmVyeS5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rpc2Nv
dmVyeS5oCmluZGV4IDg1YjhjNGQ0ZDU3Ni4uYWRhMzBjZmQ5ZDM1IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGlzY292ZXJ5LmgKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rpc2NvdmVyeS5oCkBAIC0yOCw3ICsyOCw3IEBAIGlu
dCBhbWRncHVfZGlzY292ZXJ5X2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOwogdm9p
ZCBhbWRncHVfZGlzY292ZXJ5X2Zpbmkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOwogaW50
IGFtZGdwdV9kaXNjb3ZlcnlfcmVnX2Jhc2VfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
dik7CiBpbnQgYW1kZ3B1X2Rpc2NvdmVyeV9nZXRfaXBfdmVyc2lvbihzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldiwgaW50IGh3X2lkLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgaW50ICptYWpvciwgaW50ICptaW5vcik7CisgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBpbnQgKm1ham9yLCBpbnQgKm1pbm9yLCBpbnQgKnJldmlzaW9uKTsKIGludCBhbWRn
cHVfZGlzY292ZXJ5X2dldF9nZnhfaW5mbyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7CiAK
ICNlbmRpZiAvKiBfX0FNREdQVV9ESVNDT1ZFUllfXyAqLwotLSAKMi4xNy4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
