Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A26BAF1F8
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2019 21:41:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9E6B6E0EE;
	Tue, 10 Sep 2019 19:41:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730046.outbound.protection.outlook.com [40.107.73.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2A926E0EE
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 19:41:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ahbYn/5D75Q6HUMufSaFlpGQS0r+WgENBntf8NaNFxcHhA/9Vr+C+siPS70B+tISEAy0jGZZRQyjJF5scmamm7XPm7ErP4/6xMSof18Y+27GjbfiB5ikJ8EmaZ/Nj4Vj6cqju64rXz99LmA4VAM2i45AQ0ToNO3CBph3juDDNjUdS6eAD+EvYp2bS+AbhYqTwyiDLXQH6YX/+hMMFfnSfFZxnzLifH491fLlU5KmhIhkPsLoSMZI/Cf7XDw4oO3QhhDA6nPM5044lWKy0NvQCwBDiB6ekelKYqhl27i+AFMVDNLQ+ud/+FjiBGnlo0ZeZp6TLPFc6XRbjGkEaZnPcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uFS2uUt+4AS42Ctrhl+oJnINnGymfA7XarxrDxPzAJM=;
 b=QMtIc2oIByhMCum8oZ1WIVieX7gqCDKJVjHWd0CvxV5O8TNS2aWJQUj6TfNkWZk56NIyo7+QY2DX/eV6wDCswYT0JmoOLBHsAbXYwXyX049JvCl0kqt0o6/THPhJTX8b6J/zbtHzUXImemeYelc252Z9zCfY9LP/IYOelvL3X2Ml4MZOLLiEdxahcpOgXHnuoKZTpJHyUJ+3Bshmxhe8v1ynSOZeFolH837zvIliwXtm2AJteuzzPlGHjzn4ZAQdUIzXQig1w1atI7qFyQUjIO6fZw4nIHg6vq9d1Cv08+3w4wjcFt/AWnXG3LFGlUAXub+C1o7HWpc1QWzDBiBHjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MN2PR12CA0019.namprd12.prod.outlook.com (2603:10b6:208:a8::32)
 by BN8PR12MB3041.namprd12.prod.outlook.com (2603:10b6:408:46::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.18; Tue, 10 Sep
 2019 19:41:32 +0000
Received: from CO1NAM03FT026.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::205) by MN2PR12CA0019.outlook.office365.com
 (2603:10b6:208:a8::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2241.15 via Frontend
 Transport; Tue, 10 Sep 2019 19:41:31 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT026.mail.protection.outlook.com (10.152.80.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2241.14 via Frontend Transport; Tue, 10 Sep 2019 19:41:31 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXCHOV01.amd.com (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; 
 Tue, 10 Sep 2019 14:41:31 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: Fix mutex lock from atomic context.
Date: Tue, 10 Sep 2019 15:41:27 -0400
Message-ID: <1568144487-27802-1-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(136003)(376002)(346002)(2980300002)(428003)(189003)(199004)(476003)(54906003)(8676002)(305945005)(8936002)(81156014)(14444005)(53416004)(86362001)(4326008)(478600001)(2351001)(316002)(6916009)(81166006)(50226002)(5660300002)(16586007)(44832011)(48376002)(356004)(6666004)(47776003)(486006)(126002)(36756003)(70206006)(426003)(336012)(51416003)(26005)(50466002)(7696005)(186003)(53936002)(2906002)(70586007)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3041; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 38fa88c6-388a-40e0-fffc-08d73626e182
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:BN8PR12MB3041; 
X-MS-TrafficTypeDiagnostic: BN8PR12MB3041:
X-Microsoft-Antispam-PRVS: <BN8PR12MB30417BDE2A6AA92A3F07F11AEAB60@BN8PR12MB3041.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 01565FED4C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: V1yIhhb8WXbDBaAInIfM9JojGntQGlYvE3F1KVPm6ofPuoN/rV4AwraWWYuMHa7owv/JAR4RVoe/PAePOsY92/kdXNSkg3JOzIEr6qw4ZVZaXlM0s2Ox2vBIkd6lancjAUGSakp0dOoBthNB4Sai7hlFEYwwQvZp+iPqyqcUCCxd+DGyEhYzcp5pWhB5hifgHvKwe1gpyyfoat5wHCri8R1y5zDD2S/sp/rha495ptac3H6Ezw5LxLM4enXWgc78uUCxECoGweRcS2J/MPpLcnTvIGEb1oOt9W5N39qou1+yGcOn+6bsOoZPbZ1yYfLwTmy2UNjvY32zCnHAlzx78w9tHzS1cLSdWMtoC40Of5Cd4qhaijhXBKeofnY43RISN3TN2m6j5G0ta83FqZ/4+g==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2019 19:41:31.3728 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38fa88c6-388a-40e0-fffc-08d73626e182
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3041
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uFS2uUt+4AS42Ctrhl+oJnINnGymfA7XarxrDxPzAJM=;
 b=3i+2NKMbCcUyCObdIPAKqXF1H8EbOZTb5Cgs1G4MTKBNVwghKehfG7CgvHWs0G8ti7laE69dbfXjgk29sdpYeRFYOLGBLJoukzmyFG2v95MQBCXfEiU17JzGTbDOytyjNAmgYEPzynJLia177yGielo78XjFfVxXaeXNvR6l1rs=
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
Cc: Alexander.Deucher@amd.com, Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Tao.Zhou1@amd.com, Guchun.Chen@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UHJvYmxlbToKYW1kZ3B1X3Jhc19yZXNlcnZlX2JhZF9wYWdlcyB3YXMgbW92ZWQgdG8gYW1kZ3B1
X3Jhc19yZXNldF9ncHUKYmVjYXVzZSB3cml0aW5nIHRvIEVFUFJPTSBkdXJpbmcgQVNJQyByZXNl
dCB3YXMgdW5zdGFibGUuCkJ1dCBmb3IgRVJSRVZFTlRfQVRIVUJfSU5URVJSVVBUIGFtZGdwdV9y
YXNfcmVzZXRfZ3B1IGlzIGNhbGxlZApkaXJlY3RseSBmcm9tIElTUiBjb250ZXh0IGFuZCBzbyBs
b2NraW5nIGlzIG5vdCBhbGxvd2VkLiBBbHNvIGl0J3MKaXJyZWxldmFudCBmb3IgdGhpcyBwYXJ0
aWxjdWxhciBpbnRlcnJ1cHQgYXMgdGhpcyBpcyBnZW5lcmljIFJBUwppbnRlcnJ1cHQgYW5kIG5v
dCBtZW1vcnkgZXJyb3JzIHNwZWNpZmljLgoKRml4OgpBdm9pZCBjYWxsaW5nIGFtZGdwdV9yYXNf
cmVzZXJ2ZV9iYWRfcGFnZXMgaWYgbm90IGluIHRhc2sgY29udGV4dC4KClNpZ25lZC1vZmYtYnk6
IEFuZHJleSBHcm9kem92c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuaCB8IDQgKysrLQogMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9yYXMuaAppbmRleCAwMTIwMzRkLi5kZDVkYTNjIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmgKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5oCkBAIC01MDQsNyArNTA0LDkgQEAgc3RhdGljIGlubGlu
ZSBpbnQgYW1kZ3B1X3Jhc19yZXNldF9ncHUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJ
Lyogc2F2ZSBiYWQgcGFnZSB0byBlZXByb20gYmVmb3JlIGdwdSByZXNldCwKIAkgKiBpMmMgbWF5
IGJlIHVuc3RhYmxlIGluIGdwdSByZXNldAogCSAqLwotCWFtZGdwdV9yYXNfcmVzZXJ2ZV9iYWRf
cGFnZXMoYWRldik7CisJaWYgKGluX3Rhc2soKSkKKwkJYW1kZ3B1X3Jhc19yZXNlcnZlX2JhZF9w
YWdlcyhhZGV2KTsKKwogCWlmIChhdG9taWNfY21weGNoZygmcmFzLT5pbl9yZWNvdmVyeSwgMCwg
MSkgPT0gMCkKIAkJc2NoZWR1bGVfd29yaygmcmFzLT5yZWNvdmVyeV93b3JrKTsKIAlyZXR1cm4g
MDsKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
