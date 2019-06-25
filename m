Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2165552ED
	for <lists+amd-gfx@lfdr.de>; Tue, 25 Jun 2019 17:07:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 310DA6E142;
	Tue, 25 Jun 2019 15:07:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760058.outbound.protection.outlook.com [40.107.76.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 321D26E142
 for <amd-gfx@lists.freedesktop.org>; Tue, 25 Jun 2019 15:07:53 +0000 (UTC)
Received: from DM5PR12CA0054.namprd12.prod.outlook.com (2603:10b6:3:103::16)
 by MWHPR12MB1167.namprd12.prod.outlook.com (2603:10b6:300:8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2008.16; Tue, 25 Jun
 2019 15:07:51 +0000
Received: from CO1NAM03FT034.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::205) by DM5PR12CA0054.outlook.office365.com
 (2603:10b6:3:103::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2008.16 via Frontend
 Transport; Tue, 25 Jun 2019 15:07:50 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT034.mail.protection.outlook.com (10.152.80.177) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2008.13 via Frontend Transport; Tue, 25 Jun 2019 15:07:50 +0000
Received: from build-machine.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Tue, 25 Jun 2019
 10:07:49 -0500
From: Evan Quan <evan.quan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/powerplay: add missing smu_get_clk_info_from_vbios()
 call
Date: Tue, 25 Jun 2019 23:07:42 +0800
Message-ID: <20190625150742.9121-1-evan.quan@amd.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(346002)(376002)(39860400002)(396003)(136003)(2980300002)(428003)(189003)(199004)(126002)(476003)(47776003)(7696005)(26005)(36756003)(53936002)(336012)(2351001)(305945005)(81156014)(72206003)(6666004)(51416003)(81166006)(8676002)(478600001)(8936002)(44832011)(1076003)(48376002)(356004)(2870700001)(186003)(77096007)(50466002)(4744005)(2906002)(4326008)(70206006)(426003)(68736007)(70586007)(86362001)(50226002)(486006)(2616005)(53416004)(316002)(5660300002)(6916009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1167; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d66984e7-23d0-4a7d-70c4-08d6f97ee3fe
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR12MB1167; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1167:
X-Microsoft-Antispam-PRVS: <MWHPR12MB116770460C57B4FB51BC95BCE4E30@MWHPR12MB1167.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-Forefront-PRVS: 0079056367
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: +4Wny3Xv5AM/4+C5GbpJXBMWcg21rzJGYQcGfTCxYKm4PMLVARqJX70MFcIffxJYcV/c77W5aACAnrMfG6OsEhEexn1w5NS1UI8Ri7gGAcRo8viYQJYPo9gpqiEZUx7E4vAxl8f4MOEAhL+KZWR7riBYgqGiJOzA+60d4R5EStG61R2d+EnmTzwEoZc/Fd96KhnaCCgptpV0Xayghc0cD0y/pSlQeIm/y1vX/hDI7WP1w+bVPLIEVm6cX9b7XVD/AqMI0PnJMxPhIVbdz+h3GOZqin3DGUXr+sKMpbRYRK1J+ORRWyf5+qm4tq8guRm7qtEJ9rgxeiW0Lq+yNyUNkXAcDvG22ddJdW6zuJd4uNweNRApfNYKOzOaPnNWM2RJCQ7bVkjDI3UsVh+7jXegqS8P98qB/lLi6N1jzXyMVkI=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2019 15:07:50.3840 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d66984e7-23d0-4a7d-70c4-08d6f97ee3fe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1167
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hyZpdvjiFuoNvF0I/r5Xgug3v1SHEMshLXaYNWNMMEU=;
 b=SFbCQM6OD5Seze+CQdM0sOadnTXgIIB7mRqTAjGk1zyWCZyonjUzrRoack6QAGOPIdQ7+U1C4oq7zbFF0UMuIs71Ff+7EIVifDGn6enZ+53UQkPaC6FeTt/oIpyTmcbKilsVZa3mZthrhoaG5C4+7r3QC1Oazbddy6j33RcyUao=
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
Cc: Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyBzZWVtcyBhIG1lcmdlIGVycm9yLgoKQ2hhbmdlLUlkOiBJNjczODk3Mzk1MTJjODI5N2Rh
MTE4NzQyODY4MmNjNTlmNTYwYWIwMwpTaWduZWQtb2ZmLWJ5OiBFdmFuIFF1YW4gPGV2YW4ucXVh
bkBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUu
YyB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYwppbmRleCBmZTgzYzVlMzExMWYuLjQ3YjIx
YWQ0MzY1YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1
X3NtdS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYwpA
QCAtODIzLDYgKzgyMywxMCBAQCBzdGF0aWMgaW50IHNtdV9zbWNfdGFibGVfaHdfaW5pdChzdHJ1
Y3Qgc211X2NvbnRleHQgKnNtdSwKIAkJICogY2hlY2sgaWYgdGhlIGZvcm1hdF9yZXZpc2lvbiBp
biB2YmlvcyBpcyB1cCB0byBwcHRhYmxlIGhlYWRlcgogCQkgKiB2ZXJzaW9uLCBhbmQgdGhlIHN0
cnVjdHVyZSBzaXplIGlzIG5vdCAwLgogCQkgKi8KKwkJcmV0ID0gc211X2dldF9jbGtfaW5mb19m
cm9tX3ZiaW9zKHNtdSk7CisJCWlmIChyZXQpCisJCQlyZXR1cm4gcmV0OworCiAJCXJldCA9IHNt
dV9jaGVja19wcHRhYmxlKHNtdSk7CiAJCWlmIChyZXQpCiAJCQlyZXR1cm4gcmV0OwotLSAKMi4y
MS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
