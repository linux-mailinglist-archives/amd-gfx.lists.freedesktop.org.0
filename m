Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8418CD7871
	for <lists+amd-gfx@lfdr.de>; Tue, 15 Oct 2019 16:27:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F36EC6E24B;
	Tue, 15 Oct 2019 14:27:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680048.outbound.protection.outlook.com [40.107.68.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E39366E24B
 for <amd-gfx@lists.freedesktop.org>; Tue, 15 Oct 2019 14:27:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iGIYnN35boY73uwm+undwytwowFTS/RviespdSKywFjxjZ0Ffx0BmGPZTJ40OixaRxt4K0PwNs939qBvc3ptLWBdyQrm8EjmnXGu2y/3LCqGx4DJJcGHeJRLP/dtIY5cZWOmW6EXsqPU4Pm1/Mbypvx8qzX0304CWHnTj18OcxObWmpVbcDeS2k3wrbKxQuYgRQiaSfGgMwnFGvjWtZUsbjPZ/y1hWhhYVa4YAd5qsC5W2TPM0Xdcunuo6FXAswmPHcX6sYyQSLoeF9Ao3FOGaPVxdtgXqm8oR9MIq96i6Lj2CueAlLkfSFCnhGugG8cQSYjeXFK8XSsvacuvFaWAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+JLoZb1Hb2SsfYhsMmvKattsECGBjJ71y5o79rRKP2k=;
 b=X+4xDfYk7bGsepwniElekZ5VruT8JKxzE+GdUf/zYm9zcIp5z+PYRjSXuaI5h3jjmo1JXQKTGY9HaP0mRNiI/l5sjKt4vMpnshYlxNQcgGyPMNEgnhLR1v1TWz/Ai5wfHOIg8Q7NDWtuhmyX8DrQ7Ff92kXinOVsw8AzDFSMsqjSfLj6k+jBr7XAGNRPkRUBUPsjA6OrsWztlNZodGUnVmq6C3UL3UBQGOR66Tb4abx2nIPN6luEeFX06fUwX5vXh1D8cwBBbs/NjJVUCglfGivkd/SA6PCVZ0um1SkLk0ebg8ek7uKbG/t/HmtyFd6yPv4WbXBLutRB/HzjEppBsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN4PR12CA0001.namprd12.prod.outlook.com (2603:10b6:403:2::11)
 by MN2PR12MB2990.namprd12.prod.outlook.com (2603:10b6:208:cc::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.18; Tue, 15 Oct
 2019 14:27:44 +0000
Received: from BY2NAM03FT021.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::204) by BN4PR12CA0001.outlook.office365.com
 (2603:10b6:403:2::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.18 via Frontend
 Transport; Tue, 15 Oct 2019 14:27:44 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 BY2NAM03FT021.mail.protection.outlook.com (10.152.84.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2347.21 via Frontend Transport; Tue, 15 Oct 2019 14:27:43 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 15 Oct
 2019 09:27:43 -0500
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 15 Oct
 2019 09:27:42 -0500
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Tue, 15 Oct 2019 09:27:42 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: dmr/amdgpu: Fix crash on SRIOV for ERREVENT_ATHUB_INTERRUPT interrupt.
Date: Tue, 15 Oct 2019 10:27:41 -0400
Message-ID: <1571149661-4587-1-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(136003)(346002)(396003)(428003)(199004)(189003)(126002)(426003)(336012)(4326008)(47776003)(36756003)(26005)(2616005)(186003)(476003)(86362001)(316002)(44832011)(70586007)(70206006)(16586007)(356004)(4744005)(7696005)(51416003)(48376002)(5660300002)(2351001)(50226002)(53416004)(8676002)(305945005)(2906002)(81156014)(6916009)(486006)(50466002)(478600001)(8936002)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2990; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c7eae40-b746-4a29-b612-08d7517bd7bd
X-MS-TrafficTypeDiagnostic: MN2PR12MB2990:
X-Microsoft-Antispam-PRVS: <MN2PR12MB2990125A4CBE45117E0D0F38EA930@MN2PR12MB2990.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-Forefront-PRVS: 01917B1794
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nHY+hxdkY68BdNr+Cngns3UhtztN2A1OH1LM1ir/F9bJ21NGxq104IawExkCh6492791KrRIEf5rCAqsiSmBTOEWGj8jF6Z+A456BE4pf2AfXeJzAjvyH35sbZ57pTF1Ii8hdIftZkFPeotz0P3np3xcS6oGpeSe91x9ssEP27vfBnMDsnNF72hZ2VIg2btObOcU0zsWOTgKAz7/B1PV4L4zsm5f+me3aeuG24nnDmrwYotrCYD0ScQrCkd7BpnlHt0Jrpyz8M+hp3aUm/TRayRVyoj5COelrBrWavoW0A5YaFueVuO+O+mgpo2AQkLv+1hpVU0PYcy9pEP3hfALeVfbYIMLUEQ+MivY72tg8p+imhV5MExzRFMH2DsBT1NPzH5bedUH0hAnDPM7bs1QbuNnrVYiMaWCBVV4cxvuFMk=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2019 14:27:43.7255 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c7eae40-b746-4a29-b612-08d7517bd7bd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2990
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+JLoZb1Hb2SsfYhsMmvKattsECGBjJ71y5o79rRKP2k=;
 b=rb3q8CfGz1t46VEtyawLhOoiPuFuZp0HqeV5Q1r8Ul2a/Uw9eg5OxCkf2yyrWrwsOBcmh2ASOEnwVdZy1TbS9WbzxECyJ8cif/A6clYwhz5MtGUzx95centbVQ3Huysb+m3H/06XcN+NYsyQq9hhgGbW+KyeLwZx9ElKjBkwEDs=
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

SWducmUgdGhlIEVSUkVWRU5UX0FUSFVCX0lOVEVSUlVQVCBmb3Igc3lzdGVtcyB3aXRob3V0IFJB
Uy4KClNpZ25lZC1vZmYtYnk6IEFuZHJleSBHcm9kem92c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBh
bWQuY29tPgpSZXZpZXdlZC1hbmQtdGVzdGVkLWJ5OiBKYWNrIFpoYW5nIDxKYWNrLlpoYW5nMUBh
bWQuY29tPgoKLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMgfCA2
ICsrKysrKwogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9yYXMuYwppbmRleCA4NGQ4YzMzLi5jZDg0MzMyIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jCkBAIC0xODQ0LDYgKzE4NDQsMTIgQEAgaW50
IGFtZGdwdV9yYXNfZmluaShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAogdm9pZCBhbWRn
cHVfcmFzX2dsb2JhbF9yYXNfaXNyKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogeworCXVp
bnQzMl90IGh3X3N1cHBvcnRlZCwgc3VwcG9ydGVkOworCisJYW1kZ3B1X3Jhc19jaGVja19zdXBw
b3J0ZWQoYWRldiwgJmh3X3N1cHBvcnRlZCwgJnN1cHBvcnRlZCk7CisJaWYgKCFod19zdXBwb3J0
ZWQpCisJCXJldHVybjsKKwogCWlmIChhdG9taWNfY21weGNoZygmYW1kZ3B1X3Jhc19pbl9pbnRy
LCAwLCAxKSA9PSAwKSB7CiAJCURSTV9XQVJOKCJSQVMgZXZlbnQgb2YgdHlwZSBFUlJFVkVOVF9B
VEhVQl9JTlRFUlJVUFQgZGV0ZWN0ZWQhXG4iKTsKIAotLSAKMi43LjQKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
