Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 056ECD48BE
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 21:54:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E1C96ECA6;
	Fri, 11 Oct 2019 19:54:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730070.outbound.protection.outlook.com [40.107.73.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A79596ECA6
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 19:53:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FPJJRZN8O0qtZoiqEHYuyqFA5d58U05POu1CrJ2AI0XbyucH3/kQi14t+IudAYZzNMRU/aBepOLfvtnI1S4gmnouCF6gZm0RIuLRm+83JWyW128esz11lUNUkitF8gq9WF6xrLDOHRExXg9376AQTQKOs3waZRtlIcnYEyPKyXkwFE8jXSfkMvGc3dLmBO9T1PElUfmkyeY139Ac7pfjAmK40gyeoD8xtTFzHdBtuQlv8RShpY7NdrQfoJumvabGouE1PqL+0La7sZbi3JCehsJ0b8z4uWzWOiYJAS+AxDGKDsRLz9wiTtIhUe5k7tFNtl9T9KrG7bVfIJxVEpQAkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XQmabgMqHFz9CEMvLTyObdiZUcmV62qg4AZa5dYUxNM=;
 b=Mgfz2/4X4ypj4smaRnF8SFksZIXNe8YV8lGr549Qq1mskeVxb87QiN5n0YYjjtmwTrqqVyTJnF7xspmxnd2sQFjpbo0siuPMKUH27fHgc6d1vCVO1g2kG0LLcEp8SIY0f4mUgmlLHvVZFypTSWwu3D//WA20vCv9TOWjT1w2ZPwA/2bndi/5hOh48ZdNOrWn0rV51xaUlPBKja/wRJry4T1QT2tt3c1odzY7RLHvvHqrl5qcbd5T9Kjt8Kmd06WIgKoh8I6PvSsdAPj2A2ytPpL13kME1sMAmnaH+1fNwIiiDyvjp13goqFh/yKzGjgyR33M9/mCiqhEXqABISqHjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM6PR12CA0020.namprd12.prod.outlook.com (2603:10b6:5:1c0::33)
 by SN1PR12MB2367.namprd12.prod.outlook.com (2603:10b6:802:25::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.21; Fri, 11 Oct
 2019 19:53:56 +0000
Received: from BY2NAM03FT051.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::206) by DM6PR12CA0020.outlook.office365.com
 (2603:10b6:5:1c0::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16 via Frontend
 Transport; Fri, 11 Oct 2019 19:53:56 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT051.mail.protection.outlook.com (10.152.85.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2347.21 via Frontend Transport; Fri, 11 Oct 2019 19:53:55 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Fri, 11 Oct 2019
 14:53:51 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 29/29] drm/amd/display: null check pp_smu clock table before
 using it
Date: Fri, 11 Oct 2019 15:53:24 -0400
Message-ID: <20191011195324.16268-30-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011195324.16268-1-Bhawanpreet.Lakha@amd.com>
References: <20191011195324.16268-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(346002)(396003)(136003)(428003)(189003)(199004)(26005)(478600001)(186003)(305945005)(86362001)(6916009)(2906002)(14444005)(336012)(426003)(356004)(6666004)(446003)(11346002)(476003)(486006)(126002)(2616005)(50226002)(8936002)(50466002)(70586007)(36756003)(81166006)(81156014)(70206006)(8676002)(316002)(76176011)(53416004)(16586007)(4326008)(7696005)(51416003)(48376002)(2351001)(1076003)(5660300002)(47776003)(4744005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN1PR12MB2367; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ce1fe0d-1ac1-485f-6c5c-08d74e84bffd
X-MS-TrafficTypeDiagnostic: SN1PR12MB2367:
X-Microsoft-Antispam-PRVS: <SN1PR12MB23678E2FF5C3A66AAC628F60F9970@SN1PR12MB2367.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:346;
X-Forefront-PRVS: 0187F3EA14
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EvvivKdKPCtAOrbkKpM4rY+FyPG/QzUVoONN7laqSHIzHdS/+SvQIxzrFd96jVtS/dXg5N5IihwxwiLP0uKjqdgmwEh15V371Nf7drxGvWVTqFu/q3uwDReDVeuuw27evVNGVohsNfxWrjlr7VkCp7CGraT7U+hXNW7b/TtubZtFBxan3XyIO8F26upphBTBGwqqoEYabyKTVWfCNAg9L8fE/AyfnEHua5zQIaOqaNILlC12FPClHqjgdUDHH8gKGZZDq8t00I4fIfBlW9cfh64bzhd+ILdsf7fSTLKyzqCGt6JRIEX7FZdCvWEOwRWowJfwp5kgh9+reOLuhdXgSODPBJkCBHJxPYwcj7KN9gGMef+3EIwVur6Jg38D6bc8Coy6EhYSrJedI0io6RrGN89PBcTBQOSi06Qc+NCqdj4=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2019 19:53:55.8359 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ce1fe0d-1ac1-485f-6c5c-08d74e84bffd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2367
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XQmabgMqHFz9CEMvLTyObdiZUcmV62qg4AZa5dYUxNM=;
 b=lTYfR4uyG8tFNR1SypVV00ep5KIqIlhFwy7qzaerIm9B+EGunpDlhchiWuj7gRucBSCPmbvbg66qOYzzr4NrBbUAwEt92H6DSdo+Uv5pn2pIPc1F77XSie58CYQCVdGNJW/zlk4wmYBzmphwyIFw0i59FlVYQ+pyDd/un0r6LlY=
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
Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogQmhhd2FucHJlZXQgTGFraGEgPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nsa19tZ3IvZGNuMjEvcm5f
Y2xrX21nci5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nsa19t
Z3IvZGNuMjEvcm5fY2xrX21nci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Ns
a19tZ3IvZGNuMjEvcm5fY2xrX21nci5jCmluZGV4IDBlNzEyZGY4NzEwOS4uYjY0N2UwMzIwZTRi
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY2xrX21nci9kY24y
MS9ybl9jbGtfbWdyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nsa19t
Z3IvZGNuMjEvcm5fY2xrX21nci5jCkBAIC02NTYsNyArNjU2LDcgQEAgdm9pZCBybl9jbGtfbWdy
X2NvbnN0cnVjdCgKIAogCWNsa19tZ3ItPmJhc2UuYndfcGFyYW1zID0gJnJuX2J3X3BhcmFtczsK
IAotCWlmIChwcF9zbXUpIHsKKwlpZiAocHBfc211ICYmIHBwX3NtdS0+cm5fZnVuY3MuZ2V0X2Rw
bV9jbG9ja190YWJsZSkgewogCQlwcF9zbXUtPnJuX2Z1bmNzLmdldF9kcG1fY2xvY2tfdGFibGUo
JnBwX3NtdS0+cm5fZnVuY3MucHBfc211LCAmY2xvY2tfdGFibGUpOwogCQlybl9jbGtfbWdyX2hl
bHBlcl9wb3B1bGF0ZV9id19wYXJhbXMoY2xrX21nci0+YmFzZS5id19wYXJhbXMsICZjbG9ja190
YWJsZSwgJmN0eC0+YXNpY19pZCk7CiAJfQotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
