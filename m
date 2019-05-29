Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F102D421
	for <lists+amd-gfx@lfdr.de>; Wed, 29 May 2019 05:12:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29B0E6E069;
	Wed, 29 May 2019 03:12:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810077.outbound.protection.outlook.com [40.107.81.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B57B6E069
 for <amd-gfx@lists.freedesktop.org>; Wed, 29 May 2019 03:12:16 +0000 (UTC)
Received: from DM5PR12CA0066.namprd12.prod.outlook.com (2603:10b6:3:103::28)
 by BN6PR1201MB0049.namprd12.prod.outlook.com (2603:10b6:405:57::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1922.17; Wed, 29 May
 2019 03:12:14 +0000
Received: from DM3NAM03FT013.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::200) by DM5PR12CA0066.outlook.office365.com
 (2603:10b6:3:103::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1922.15 via Frontend
 Transport; Wed, 29 May 2019 03:12:14 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT013.mail.protection.outlook.com (10.152.82.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1922.16 via Frontend Transport; Wed, 29 May 2019 03:12:13 +0000
Received: from build-machine.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Tue, 28 May 2019
 22:12:12 -0500
From: Emily Deng <Emily.Deng@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2] drm/amdgpu/display: Fix reload driver error
Date: Wed, 29 May 2019 11:12:05 +0800
Message-ID: <1559099525-9742-1-git-send-email-Emily.Deng@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(346002)(376002)(396003)(39860400002)(136003)(2980300002)(428003)(189003)(199004)(48376002)(4326008)(14444005)(305945005)(50466002)(316002)(53936002)(2351001)(8676002)(478600001)(36756003)(72206003)(8936002)(5660300002)(16586007)(47776003)(26005)(70586007)(356004)(51416003)(7696005)(86362001)(81156014)(486006)(336012)(426003)(81166006)(2616005)(476003)(126002)(50226002)(68736007)(6916009)(186003)(2906002)(70206006)(6666004)(77096007)(53416004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR1201MB0049; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd3adfa4-85ca-4e9e-3173-08d6e3e372b2
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:BN6PR1201MB0049; 
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0049:
X-Microsoft-Antispam-PRVS: <BN6PR1201MB00493D893BCF2D2C3D2A51038F1F0@BN6PR1201MB0049.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1013;
X-Forefront-PRVS: 0052308DC6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: gWrZZ0BdolJuTjfOKHfrWNrfoNNy/V5J8CJp35Re48vsDqwuvNCXOznACweyX0ajIfFhLQImcJVMawYXWBgdcNZoXN7LksPpOeVJ/4Kj6yoAsVeRFQ/GzXYVTqIBcHO7f0oQmeEvvo2dx3lRoDyj+c8kNvj8lU4qmF/WeN40R8EDLNb2nEOftb3l+mRhxbIDXZun8Hq5PqGVVEH99d9e1NKxkf44z4BhFlEXD0MWLWZ14WmaNJ7J/yjvHx2WITjtX0lYjDg6Z0Js1fpJNChFrr3KHP5EeO4xCEEu21oUMdMu6RWeeZrt/5dhdqYb6SB+H6KWh4b5Q2A2c7tX/gBOZLQAogwId1/dAGmWTGExAIOSeVKyNO64hGFFX1BYhKiKbrJ3VeGaunXCJ+eqncSXYY+HksR34Ap65GKWZaZyY3s=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2019 03:12:13.9783 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd3adfa4-85ca-4e9e-3173-08d6e3e372b2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0049
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XkrUwlNnmuXKKH7VXrI1Gs5MOmXmkrReW25OkNfnIz0=;
 b=ymvmiNSqfM3U20hjP8cyYL82rugcRORy1zbjF8DVyswpkRKbq8LmAqyOE9oSJ/sclYdcqfKMIWqZRkVzzKoHA8C5HoYBR9qO6bvvt26viOz/wCe88frE+a2n0QX0Kal12nJi7nSVPi4IoIy5hYuWuUeWuWgXtbUMIPdZMcUjLEg=
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
Cc: Emily Deng <Emily.Deng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SXNzdWU6CldpbGwgaGF2ZSBmb2xsb3cgZXJyb3Igd2hlbiByZWxvYWQgZHJpdmVyOgpbIDM5ODYu
NTY3NzM5XSBzeXNmczogY2Fubm90IGNyZWF0ZSBkdXBsaWNhdGUgZmlsZW5hbWUgJy9kZXZpY2Vz
L3BjaTAwMDA6MDAvMDAwMDowMDowNy4wL2RybV9kcF9hdXhfZGV2JwpbIDM5ODYuNTY3NzQzXSBD
UFU6IDYgUElEOiAxNzY3IENvbW06IG1vZHByb2JlIFRhaW50ZWQ6IEcgICAgICAgICAgIE9FICAg
ICA1LjAuMC1yYzEtY3VzdG9tICMxClsgMzk4Ni41Njc3NDVdIEhhcmR3YXJlIG5hbWU6IFFFTVUg
U3RhbmRhcmQgUEMgKGk0NDBGWCArIFBJSVgsIDE5OTYpLCBCSU9TIFVidW50dS0xLjguMi0xdWJ1
bnR1MSAwNC8wMS8yMDE0ClsgMzk4Ni41Njc3NDZdIENhbGwgVHJhY2U6Ci4uLi4uLgpbIDM5ODYu
NTY3ODA4XSAgZHJtX2RwX2F1eF9yZWdpc3Rlcl9kZXZub2RlKzB4ZGMvMHgxNDAgW2RybV9rbXNf
aGVscGVyXQouLi4uLi4KWyAzOTg2LjU2OTA4MV0ga29iamVjdF9hZGRfaW50ZXJuYWwgZmFpbGVk
IGZvciBkcm1fZHBfYXV4X2RldiB3aXRoIC1FRVhJU1QsIGRvbid0IHRyeSB0byByZWdpc3RlciB0
aGluZ3Mgd2l0aCB0aGUgc2FtZSBuYW1lIGluIHRoZSBzYW1lIGRpcmVjdG9yeS4KClJlcHJvZHVj
ZSBzZXF1ZW5jZXM6CjEubW9kcHJvYmUgYW1kZ3B1CjIubW9kcHJvYmUgLXIgYW1kZ3B1CjMubW9k
cHJvYmUgYW1kZ3B1CgpSb290IGNhdXNlOgpXaGVuIHVubG9hZCBkcml2ZXIsIGl0IGRvZXNuJ3Qg
dW5yZWdpc3RlciBhdXguCgp2MjogRG9uJ3QgdXNlIGhhc19hdXgKClNpZ25lZC1vZmYtYnk6IEVt
aWx5IERlbmcgPEVtaWx5LkRlbmdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgMTUgKysrKysrKysrKysrKystCiAxIGZpbGUg
Y2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCmluZGV4IDhmZTE2ODUu
Ljk0MTMxM2IgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVf
ZG0vYW1kZ3B1X2RtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9k
bS9hbWRncHVfZG0uYwpAQCAtMzc2MCw2ICszNzYwLDEzIEBAIGludCBhbWRncHVfZG1fY29ubmVj
dG9yX2F0b21pY19nZXRfcHJvcGVydHkoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciwK
IAlyZXR1cm4gcmV0OwogfQogCitzdGF0aWMgdm9pZCBhbWRncHVfZG1fY29ubmVjdG9yX3VucmVn
aXN0ZXIoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikKK3sKKwlzdHJ1Y3QgYW1kZ3B1
X2RtX2Nvbm5lY3RvciAqYW1kZ3B1X2RtX2Nvbm5lY3RvciA9IHRvX2FtZGdwdV9kbV9jb25uZWN0
b3IoY29ubmVjdG9yKTsKKworCWRybV9kcF9hdXhfdW5yZWdpc3RlcigmYW1kZ3B1X2RtX2Nvbm5l
Y3Rvci0+ZG1fZHBfYXV4LmF1eCk7Cit9CisKIHN0YXRpYyB2b2lkIGFtZGdwdV9kbV9jb25uZWN0
b3JfZGVzdHJveShzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQogewogCXN0cnVjdCBh
bWRncHVfZG1fY29ubmVjdG9yICphY29ubmVjdG9yID0gdG9fYW1kZ3B1X2RtX2Nvbm5lY3Rvcihj
b25uZWN0b3IpOwpAQCAtMzc4OCw2ICszNzk1LDExIEBAIHN0YXRpYyB2b2lkIGFtZGdwdV9kbV9j
b25uZWN0b3JfZGVzdHJveShzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQogCWRybV9k
cF9jZWNfdW5yZWdpc3Rlcl9jb25uZWN0b3IoJmFjb25uZWN0b3ItPmRtX2RwX2F1eC5hdXgpOwog
CWRybV9jb25uZWN0b3JfdW5yZWdpc3Rlcihjb25uZWN0b3IpOwogCWRybV9jb25uZWN0b3JfY2xl
YW51cChjb25uZWN0b3IpOworCWlmIChhY29ubmVjdG9yLT5pMmMpIHsKKwkJaTJjX2RlbF9hZGFw
dGVyKCZhY29ubmVjdG9yLT5pMmMtPmJhc2UpOworCQlrZnJlZShhY29ubmVjdG9yLT5pMmMpOwor
CX0KKwogCWtmcmVlKGNvbm5lY3Rvcik7CiB9CiAKQEAgLTM4NDYsNyArMzg1OCw4IEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9mdW5jcyBhbWRncHVfZG1fY29ubmVjdG9yX2Z1
bmNzID0gewogCS5hdG9taWNfZHVwbGljYXRlX3N0YXRlID0gYW1kZ3B1X2RtX2Nvbm5lY3Rvcl9h
dG9taWNfZHVwbGljYXRlX3N0YXRlLAogCS5hdG9taWNfZGVzdHJveV9zdGF0ZSA9IGRybV9hdG9t
aWNfaGVscGVyX2Nvbm5lY3Rvcl9kZXN0cm95X3N0YXRlLAogCS5hdG9taWNfc2V0X3Byb3BlcnR5
ID0gYW1kZ3B1X2RtX2Nvbm5lY3Rvcl9hdG9taWNfc2V0X3Byb3BlcnR5LAotCS5hdG9taWNfZ2V0
X3Byb3BlcnR5ID0gYW1kZ3B1X2RtX2Nvbm5lY3Rvcl9hdG9taWNfZ2V0X3Byb3BlcnR5CisJLmF0
b21pY19nZXRfcHJvcGVydHkgPSBhbWRncHVfZG1fY29ubmVjdG9yX2F0b21pY19nZXRfcHJvcGVy
dHksCisJLmVhcmx5X3VucmVnaXN0ZXIgPSBhbWRncHVfZG1fY29ubmVjdG9yX3VucmVnaXN0ZXIK
IH07CiAKIHN0YXRpYyBpbnQgZ2V0X21vZGVzKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0
b3IpCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
