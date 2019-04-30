Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 672C0FBDF
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Apr 2019 16:48:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0745E891A1;
	Tue, 30 Apr 2019 14:48:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820072.outbound.protection.outlook.com [40.107.82.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34CC7891A1
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Apr 2019 14:48:43 +0000 (UTC)
Received: from MWHPR1201CA0008.namprd12.prod.outlook.com
 (2603:10b6:301:4a::18) by CH2PR12MB3752.namprd12.prod.outlook.com
 (2603:10b6:610:25::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1835.15; Tue, 30 Apr
 2019 14:48:41 +0000
Received: from DM3NAM03FT023.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::201) by MWHPR1201CA0008.outlook.office365.com
 (2603:10b6:301:4a::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1835.12 via Frontend
 Transport; Tue, 30 Apr 2019 14:48:41 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT023.mail.protection.outlook.com (10.152.82.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1835.14 via Frontend Transport; Tue, 30 Apr 2019 14:48:40 +0000
Received: from bb-VirtualBox.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 30 Apr 2019
 09:48:24 -0500
From: Trigger Huang <Trigger.Huang@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH V2] drm/amdgpu: Fix VM clean check method
Date: Tue, 30 Apr 2019 22:48:20 +0800
Message-ID: <1556635700-29967-1-git-send-email-Trigger.Huang@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(136003)(346002)(376002)(396003)(39860400002)(2980300002)(428003)(199004)(189003)(14444005)(53416004)(81166006)(47776003)(2616005)(81156014)(356004)(6666004)(70586007)(7696005)(2351001)(70206006)(48376002)(476003)(8936002)(50466002)(5660300002)(36756003)(72206003)(316002)(8676002)(50226002)(126002)(86362001)(478600001)(16586007)(6916009)(26005)(97736004)(77096007)(4326008)(336012)(486006)(426003)(2906002)(53936002)(305945005)(68736007)(51416003)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB3752; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c8f0fb6-8150-4998-0727-08d6cd7aefaf
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328);
 SRVR:CH2PR12MB3752; 
X-MS-TrafficTypeDiagnostic: CH2PR12MB3752:
X-Microsoft-Antispam-PRVS: <CH2PR12MB37523380992E3A2FC9A4774FFE3A0@CH2PR12MB3752.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 00235A1EEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: ek1jKevdq6V1raEedLQ8GqAXvXGQyzxLt00dCWNk8qEfBu0eaJfcoTCz100fGzBMqRg92UJgEMX+xQX2OIaK5/szavwFBEJOIsyibAkb4Dw+7NWVv/E26gwo0ZsVEgTWRVuxl10hAEAgpjZQpcbjZ+uVpA9N+O/XoDKhfFSBCMuJJ22Gi9y5Dl6lCY+F/XdWokRC9Ru2nFsGcYA1hUlhqsxzRROxA0VGwcCsYpx7Fih8bWBYrCqijJ8ACRqZoZHU/M0eVTJlo8iZKkHQFuGl24IzC9xAL8q20LM7PeZypzYp3BwDGOjb9xRLJeYakWy4KUk1Qs65dazN0cdy0RLIEaylZOrtrIaVkFj9Vt8LJ77eSe4RCkAQYWFgct3tiwsKG6WXh5BSHqr1Kal86yGH0cTmJ4rhO4YVPmmIVpYfDyM=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2019 14:48:40.9282 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c8f0fb6-8150-4998-0727-08d6cd7aefaf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3752
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LkDTf+3l+h+EdXLHMiYFn/1oDmxMsSFEeaReKiHtBOA=;
 b=e1YBesET8DmmopQirm+R1+63hgJnRZJpdFbdrXu+CUHnwXA4KM4NrS9JYv2vR4zZDuBsSXCX50HxzrA91+biUiJXgapa9T0pF7bxjgjJN8VjiIG9X+372J24LWFHt/NQ1u0aZeqIu3nSmGyJVVKDPcKnz6ySyZiaedIxGH2122E=
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
Cc: Trigger.Huang@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

YW1kZ3B1X3ZtX21ha2VfY29tcHV0ZSBpcyB1c2VkIHRvIHR1cm4gYSBHRlggVk0gaW50byBhIGNv
bXB1dGUgVk0sCnRoZSBwcmVyZXF1aXNpdGUgaXMgdGhpcyBWTSBpcyBjbGVhbi4gTGV0J3MgY2hl
Y2sgaWYgc29tZSBwYWdlIHRhYmxlcwphcmUgYWxyZWFkeSBmaWxsZWQgLCB3aGlsZSBub3QgY2hl
Y2sgaWYgc29tZSBtYXBwaW5nIGlzIGFscmVhZHkgbWFkZS4KClNpZ25lZC1vZmYtYnk6IFRyaWdn
ZXIgSHVhbmcgPFRyaWdnZXIuSHVhbmdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfdm0uYyB8IDMzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
LQogMSBmaWxlIGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jCmluZGV4IDU2ZDgzOGYuLmJkZThiY2QgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jCkBAIC0yNzU1LDYgKzI3NTUsMzcg
QEAgaW50IGFtZGdwdV92bV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBzdHJ1Y3Qg
YW1kZ3B1X3ZtICp2bSwKIH0KIAogLyoqCisgKiBhbWRncHVfdm1fY2hlY2tfY2xlYW5fcmVzZXJ2
ZWQgLSBjaGVjayBpZiBhIFZNIGlzIGNsZWFuCisgKgorICogQGFkZXY6IGFtZGdwdV9kZXZpY2Ug
cG9pbnRlcgorICogQHZtOiB0aGUgVk0gdG8gY2hlY2sKKyAqCisgKiBjaGVjayBhbGwgZW50cmll
cyBvZiB0aGUgcm9vdCBQRCwgaWYgYW55IHN1YnNlcXVlbnQgUERzIGFyZSBhbGxvY2F0ZWQsCisg
KiBpdCBtZWFucyB0aGVyZSBhcmUgcGFnZSB0YWJsZSBjcmVhdGluZyBhbmQgZmlsbGluZywgYW5k
IGlzIG5vIGEgY2xlYW4KKyAqIFZNCisgKgorICogUmV0dXJuczoKKyAqCTAgaWYgdGhpcyBWTSBp
cyBjbGVhbgorICovCitzdGF0aWMgaW50IGFtZGdwdV92bV9jaGVja19jbGVhbl9yZXNlcnZlZChz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKKwlzdHJ1Y3QgYW1kZ3B1X3ZtICp2bSkKK3sKKwll
bnVtIGFtZGdwdV92bV9sZXZlbCByb290ID0gYWRldi0+dm1fbWFuYWdlci5yb290X2xldmVsOwor
CXVuc2lnbmVkIGludCBlbnRyaWVzID0gYW1kZ3B1X3ZtX251bV9lbnRyaWVzKGFkZXYsIHJvb3Qp
OworCXVuc2lnbmVkIGludCBpID0gMDsKKworCWlmICghKHZtLT5yb290LmVudHJpZXMpKQorCQly
ZXR1cm4gMDsKKworCWZvciAoaSA9IDA7IGkgPCBlbnRyaWVzOyBpKyspIHsKKwkJaWYgKHZtLT5y
b290LmVudHJpZXNbaV0uYmFzZS5ibykKKwkJCXJldHVybiAtRUlOVkFMOworCX0KKworCXJldHVy
biAwOworfQorCisvKioKICAqIGFtZGdwdV92bV9tYWtlX2NvbXB1dGUgLSBUdXJuIGEgR0ZYIFZN
IGludG8gYSBjb21wdXRlIFZNCiAgKgogICogQGFkZXY6IGFtZGdwdV9kZXZpY2UgcG9pbnRlcgpA
QCAtMjc4NCw3ICsyODE1LDcgQEAgaW50IGFtZGdwdV92bV9tYWtlX2NvbXB1dGUoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYsIHN0cnVjdCBhbWRncHVfdm0gKnZtLCB1bnMKIAkJcmV0dXJuIHI7
CiAKIAkvKiBTYW5pdHkgY2hlY2tzICovCi0JaWYgKCFSQl9FTVBUWV9ST09UKCZ2bS0+dmEucmJf
cm9vdCkgfHwgdm0tPnJvb3QuZW50cmllcykgeworCWlmIChhbWRncHVfdm1fY2hlY2tfY2xlYW5f
cmVzZXJ2ZWQoYWRldiwgdm0pKSB7CiAJCXIgPSAtRUlOVkFMOwogCQlnb3RvIHVucmVzZXJ2ZV9i
bzsKIAl9Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
