Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 739199F234
	for <lists+amd-gfx@lfdr.de>; Tue, 27 Aug 2019 20:17:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AC6A89AAD;
	Tue, 27 Aug 2019 18:17:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790053.outbound.protection.outlook.com [40.107.79.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFB7189AAD
 for <amd-gfx@lists.freedesktop.org>; Tue, 27 Aug 2019 18:17:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U/ISWTxoAa5X8Wt8ke2LThflU452uJQXeNBP5XUQCNZxFo9BYLk6/fpz23m+aiDDY7IGvrZMVpOB/0T6VlW0T2WtDz3+ZCGARxFIGOIQAA7ERfj7ie1dIcm0jjeit249sm/dHinhhpOHYs9r88rHT1u9Y25gweRrU+Rckfv7LVA7+MawOvpYJOgx+MEFIZPqkCPSgibqco/nickdWwVQ1bOO887T4rs0I9+AwA5PQq4Hb/oe4i63r7aZrxREQsPBN7arbjLjAJl+XI+Q3zpSwu4KkkxyeNsaLZcVwzgvt/n7l/SF1d/Qbx/eoO6qW0CQgKoFIv02AfVH8ttsxeRJWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HCVScnVH9aTn25pYeGFddzKRyXg9nx0UJ5vR6XU+yVs=;
 b=Pz+7QW1ITBCUTLsXpk/xGvvoBkm7fNKTeTZHVYcWXzHTsbp6eL2F6SpyubXTrXWSrdpoKpAcOtxN6v2kwO6ZIMr9m0INJroQWyJipAYzlsyBmF3O9LXdW5WDG/Cjhari0yjRVvbfvdYSyBucgszJf7kSnn81yIV0zhC0kVDtDb9mZvERSTJ3xIPt24qk8RembkOnrE+IyFdLZsXb3xs0q5baTsLT10KhsQvQFDA7rWTzePrJ5vl/My2DScv5U92fzHsHdPWIGlllGI5+BAfcUDeKlriwwTBK69PRnnDjuQyEOaAYwZy+4VJ34wtBhC0vBHPZzWDsGVZ9xUt+Tm+klw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MN2PR12CA0030.namprd12.prod.outlook.com (2603:10b6:208:a8::43)
 by BN7PR12MB2708.namprd12.prod.outlook.com (2603:10b6:408:21::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.20; Tue, 27 Aug
 2019 18:17:10 +0000
Received: from BY2NAM03FT056.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::205) by MN2PR12CA0030.outlook.office365.com
 (2603:10b6:208:a8::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.17 via Frontend
 Transport; Tue, 27 Aug 2019 18:17:10 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT056.mail.protection.outlook.com (10.152.85.45) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Tue, 27 Aug 2019 18:17:09 +0000
Received: from agrodzovsky-All-Series.amd.com (10.34.1.3) by
 SATLEXCHOV01.amd.com (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; 
 Tue, 27 Aug 2019 13:17:08 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: Handle job is NULL use case in
 amdgpu_device_gpu_recover
Date: Tue, 27 Aug 2019 14:17:03 -0400
Message-ID: <1566929823-17398-1-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(346002)(136003)(39860400002)(2980300002)(428003)(189003)(199004)(186003)(6916009)(47776003)(70206006)(5660300002)(86362001)(14444005)(478600001)(2351001)(316002)(126002)(16586007)(476003)(70586007)(486006)(8676002)(2616005)(53416004)(81166006)(81156014)(44832011)(50226002)(2906002)(36756003)(53936002)(6666004)(356004)(50466002)(426003)(48376002)(7696005)(51416003)(305945005)(26005)(336012)(8936002)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR12MB2708; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f04c088-2e70-48fa-56f1-08d72b1ac6bb
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:BN7PR12MB2708; 
X-MS-TrafficTypeDiagnostic: BN7PR12MB2708:
X-Microsoft-Antispam-PRVS: <BN7PR12MB27082ED7549F19812C52BEE4EAA00@BN7PR12MB2708.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-Forefront-PRVS: 0142F22657
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 67pPM/uQJuNmXNt/OYUYbZfD6TIR2/uR6n09hSawP+MalCizEi4XRYYpWdzsxua+FXnkbm6SUTIUm2sxe5SXxBMoDWq0pssR3K8SKkB8FE9i8BfIAERprDYM5Ysqvo/PczDQeI5Ddrx6kqKwgbDKLL1nN7cRz7AcK0jdtqWAaTNNS1S6EtJAPuKhe2NPJTtLspsfFg+rD00ls2e/yuz8Yg8hXf9f4fc3vVIfCuy9GUU4LjZvhcpmgs/OKxNtiYI0pf+8NyDxcoawXrhbIpCc+l1jWPELuzvJlA/eISu27cbvfV4fpNhdnrYT/CVG5rYZi0lX4IM9FCLQH1fLAOskve2R3HglTV3x7bCUS04bWuD10Cq91sX8T1qHDyUeLe7A0g+iN8VVOK384rjM9kX3lDZwiP6Nr1sD5o7k8rB+atg=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2019 18:17:09.6232 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f04c088-2e70-48fa-56f1-08d72b1ac6bb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2708
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HCVScnVH9aTn25pYeGFddzKRyXg9nx0UJ5vR6XU+yVs=;
 b=nZvcYHJaOY+sX76CMiro5ZZOvrgDz0gYVhwzjluBZPQpWGsw4IBXk3cu56F9sJ+aHdUDzHuP+bWAKHaQHPFtvmmcqXP+EXeqq929KSx9z60bj9mGs5uOsbKc/20AqV+QL0j96AOqR5ghgfhHZU/vQAefPTP8CRnT97E49jfIn90=
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
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyBzaG91bGQgYmUgY2hlY2tlZCBhdCBhbGwgcGxhY2VzIGpvYiBpcyBhY2Nlc3NlZC4KClNp
Z25lZC1vZmYtYnk6IEFuZHJleSBHcm9kem92c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyB8IDggKysr
Ky0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCmluZGV4IDAyYjNlN2Qu
LjE5MGQ5YTMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9k
ZXZpY2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMK
QEAgLTM3OTAsMTQgKzM3OTAsMTQgQEAgaW50IGFtZGdwdV9kZXZpY2VfZ3B1X3JlY292ZXIoc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAKIAlpZiAoaGl2ZSAmJiAhbXV0ZXhfdHJ5bG9jaygm
aGl2ZS0+cmVzZXRfbG9jaykpIHsKIAkJRFJNX0lORk8oIkJhaWxpbmcgb24gVERSIGZvciBzX2pv
YjolbGx4LCBoaXZlOiAlbGx4IGFzIGFub3RoZXIgYWxyZWFkeSBpbiBwcm9ncmVzcyIsCi0JCQkg
am9iLT5iYXNlLmlkLCBoaXZlLT5oaXZlX2lkKTsKKwkJCSAgam9iID8gam9iLT5iYXNlLmlkIDog
LTEsIGhpdmUtPmhpdmVfaWQpOwogCQlyZXR1cm4gMDsKIAl9CiAKIAkvKiBTdGFydCB3aXRoIGFk
ZXYgcHJlIGFzaWMgcmVzZXQgZmlyc3QgZm9yIHNvZnQgcmVzZXQgY2hlY2suKi8KIAlpZiAoIWFt
ZGdwdV9kZXZpY2VfbG9ja19hZGV2KGFkZXYsICFoaXZlKSkgewogCQlEUk1fSU5GTygiQmFpbGlu
ZyBvbiBURFIgZm9yIHNfam9iOiVsbHgsIGFzIGFub3RoZXIgYWxyZWFkeSBpbiBwcm9ncmVzcyIs
Ci0JCQkJCSBqb2ItPmJhc2UuaWQpOworCQkJICBqb2IgPyBqb2ItPmJhc2UuaWQgOiAtMSk7CiAJ
CXJldHVybiAwOwogCX0KIApAQCAtMzgzOCw3ICszODM4LDcgQEAgaW50IGFtZGdwdV9kZXZpY2Vf
Z3B1X3JlY292ZXIoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJCQlpZiAoIXJpbmcgfHwg
IXJpbmctPnNjaGVkLnRocmVhZCkKIAkJCQljb250aW51ZTsKIAotCQkJZHJtX3NjaGVkX3N0b3Ao
JnJpbmctPnNjaGVkLCAmam9iLT5iYXNlKTsKKwkJCWRybV9zY2hlZF9zdG9wKCZyaW5nLT5zY2hl
ZCwgam9iID8gJmpvYi0+YmFzZSA6IE5VTEwpOwogCQl9CiAJfQogCkBAIC0zODY0LDcgKzM4NjQs
NyBAQCBpbnQgYW1kZ3B1X2RldmljZV9ncHVfcmVjb3ZlcihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldiwKIAogCS8qIEd1aWx0eSBqb2Igd2lsbCBiZSBmcmVlZCBhZnRlciB0aGlzKi8KIAlyID0g
YW1kZ3B1X2RldmljZV9wcmVfYXNpY19yZXNldChhZGV2LAotCQkJCQkgam9iLAorCQkJCQkgam9i
ID8gam9iIDogTlVMTCwKIAkJCQkJICZuZWVkX2Z1bGxfcmVzZXQpOwogCWlmIChyKSB7CiAJCS8q
VE9ETyBTaG91bGQgd2Ugc3RvcCA/Ki8KLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZng=
