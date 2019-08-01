Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 892137DAB7
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 13:55:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D87A6E554;
	Thu,  1 Aug 2019 11:55:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810057.outbound.protection.outlook.com [40.107.81.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE9596E554
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 11:55:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F0FC2S/TMBrfiJfBVPGznGPulXOOrlXPu1eTlB6KVq8MAxtAhCJc52Nt/Sp/YHrX80YsfHw7+wvLb8KsqGkmBfIba8w8ltJ1pVGoM6WqgiE9Um8QDN73B2DtqJGCB1Epbqmxw9BSLkOq6TIdJ+m5veJWnPxB8L9byket/Hlbt75C6Lu8SwkaHjK9Qk/uGrGVARG/niKihKtXpoIopC8ng4vYA7wSGj+G3nNn2A+jqMkrHtGtd67V3E0i2mx0m2svEe9Jq24kdfYwBvUdaY3kXVoSXRFPc4Q4X51FEAy0RCPBEwB1fQ6Dzwcnpy/CaOn71Rn9aJfFxtwPKaECW9/1Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vS9NYZ5slUwKGOT5PqYddS0VBVUOeh0ZAey844kvcxQ=;
 b=cJpbH2o6Kht7lQa1X3PpDA4Wb8hfaW6cSbiRxt2MsP4QTl2aAsGpqVPxzUlvva1OXbJSkWuCpRSCSPXlMQzRH368Aq5bqSkhRbixs6CqOPgIIlACsR3RjhM4akMplQVKXA58ZS8a616qKmngW6ZzRTcPhz4+pA7Z9vtypNK9IA0qjXmiWk0DC7pAiJ2lqqM8hVy0XOSYkP44CK1RINin3VptT508VQFpWZMh/jJlmrmWZ1ftI/xUy0Tq0tUN+PUzV4EmGI5I47RGdzZGQng3ZJRIqQtuvk44rhmtYoHCt3zmLVtvUVXTqTvo5A2NZAKH8I95jdj4d1kK1DkacjDRzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from MN2PR12CA0010.namprd12.prod.outlook.com (2603:10b6:208:a8::23)
 by MW2PR12MB2428.namprd12.prod.outlook.com (2603:10b6:907:8::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2115.15; Thu, 1 Aug
 2019 11:55:28 +0000
Received: from BY2NAM03FT064.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::209) by MN2PR12CA0010.outlook.office365.com
 (2603:10b6:208:a8::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.16 via Frontend
 Transport; Thu, 1 Aug 2019 11:55:28 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 BY2NAM03FT064.mail.protection.outlook.com (10.152.85.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2136.14 via Frontend Transport; Thu, 1 Aug 2019 11:55:27 +0000
Received: from taozhou1u2.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Thu, 1 Aug 2019
 06:55:24 -0500
From: Tao Zhou <tao.zhou1@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <hawking.zhang@amd.com>,
 <dennis.li@amd.com>, <guchun.chen@amd.com>, <xinhui.pan@amd.com>
Subject: [PATCH 1/5] drm/amdgpu: support ce interrupt in ras module
Date: Thu, 1 Aug 2019 19:54:50 +0800
Message-ID: <20190801115454.21867-2-tao.zhou1@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190801115454.21867-1-tao.zhou1@amd.com>
References: <20190801115454.21867-1-tao.zhou1@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(346002)(376002)(136003)(2980300002)(428003)(189003)(199004)(8676002)(81166006)(68736007)(81156014)(4326008)(53416004)(316002)(110136005)(5660300002)(50226002)(36756003)(8936002)(2201001)(50466002)(48376002)(16586007)(6636002)(47776003)(26005)(2906002)(70206006)(336012)(70586007)(186003)(356004)(305945005)(86362001)(76176011)(478600001)(486006)(426003)(11346002)(446003)(126002)(6666004)(53936002)(476003)(2616005)(51416003)(7696005)(1076003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MW2PR12MB2428; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 714108eb-4aa5-4542-9360-08d716772567
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MW2PR12MB2428; 
X-MS-TrafficTypeDiagnostic: MW2PR12MB2428:
X-Microsoft-Antispam-PRVS: <MW2PR12MB242831BC2A724A593BA0CDF4B0DE0@MW2PR12MB2428.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 01165471DB
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: a8H+JbGg0mzDhHv1F4grHAwdVcgdu2fO2nyPmpMQNc9yM5prbnHQICkW806q8nzXQsT1AqWA2HGtyYcV5W+M5I0vbH9AjaNUixVGVYbRMBG9KPsqlxtUAH2sAnLePQ8GSDITCPW837EZOz2o4F+pS/TrFTawnXyg+/c4HrKSMf66ol1sgQu7E2nt9AuXY3QHTojEPNDnT3omYvuReyLKLC1hzx+mtlRt9F1k9DixvHD7N+ujQi+cQ7RQFj4xxTdiRW/tz8e+WYxHmXbaQ9i57dDCoz4OgDRi/fuxfJSTuURBydpv/4lh0PIUhLr6DzFVdvh0DACsPcuxKdkHm0tWGTxNo465JnTEBHNSYwOirIBNr1zBpXM/tdCFH8Q0qmVND2Cyqr+jOFljvOpyre77EQSyKEgLzB1SQK7Per8fDW0=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2019 11:55:27.9227 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 714108eb-4aa5-4542-9360-08d716772567
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2428
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vS9NYZ5slUwKGOT5PqYddS0VBVUOeh0ZAey844kvcxQ=;
 b=yV3oEy5298UMNMbHaPlL0HPfaheR+JcPZaE/ytmNXK6z8QpcfT7UeoiYB6NYVDy7be6Qud1VzNnxor771jE1iEhhXqnC2Wi/vlr76FiNAdPAf+tmeuH7FcXmUh4jySt2IQyYdcolcZneuciuW1149VWfvekNeZ69OthbcS1O3R8=
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
Cc: Tao Zhou <tao.zhou1@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Y29ycmVjdGFibGUgZXJyb3IgY2FuIGFsc28gdHJpZ2dlciBpbnRlcnJ1cHQgaW4gc29tZSByYXMg
YmxvY2tzCgpTaWduZWQtb2ZmLWJ5OiBUYW8gWmhvdSA8dGFvLnpob3UxQGFtZC5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jIHwgMTIgKysrKysrKystLS0t
CiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYwppbmRleCAwOTRjMjcwMDBiODMuLjRhMGRj
NTI2OWRkZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jh
cy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYwpAQCAtMTA0
NywxMiArMTA0NywxMiBAQCBzdGF0aWMgdm9pZCBhbWRncHVfcmFzX2ludGVycnVwdF9oYW5kbGVy
KHN0cnVjdCByYXNfbWFuYWdlciAqb2JqKQogCQkJICogdGhlIGVycm9yLgogCQkJICovCiAJCQlp
ZiAocmV0ID09IEFNREdQVV9SQVNfVUUpIHsKKwkJCQkvKiB0aGVzZSBjb3VudHMgY291bGQgYmUg
bGVmdCBhcyAwIGlmCisJCQkJICogc29tZSBibG9ja3MgZG8gbm90IGNvdW50IGVycm9yIG51bWJl
cgorCQkJCSAqLwogCQkJCW9iai0+ZXJyX2RhdGEudWVfY291bnQgKz0gZXJyX2RhdGEudWVfY291
bnQ7CisJCQkJb2JqLT5lcnJfZGF0YS5jZV9jb3VudCArPSBlcnJfZGF0YS5jZV9jb3VudDsKIAkJ
CX0KLQkJCS8qIE1pZ2h0IG5lZWQgZ2V0IGNlIGNvdW50IGJ5IHJlZ2lzdGVyLCBidXQgbm90IGFs
bCBJUAotCQkJICogc2F2ZXMgY2UgY291bnQsIHNvbWUgSVAganVzdCB1c2Ugb25lIGJpdCBvciB0
d28gYml0cwotCQkJICogdG8gaW5kaWNhdGUgY2UgaGFwcGVuZWQuCi0JCQkgKi8KIAkJfQogCX0K
IH0KQEAgLTE1NDksNiArMTU0OSwxMCBAQCBpbnQgYW1kZ3B1X3Jhc19pbml0KHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2KQogCWlmIChhbWRncHVfcmFzX2ZzX2luaXQoYWRldikpCiAJCWdvdG8g
ZnNfb3V0OwogCisJLyogcmFzIGluaXQgZm9yIGVhY2ggcmFzIGJsb2NrICovCisJaWYgKGFkZXYt
PnVtYy5mdW5jcy0+cmFzX2luaXQpCisJCWFkZXYtPnVtYy5mdW5jcy0+cmFzX2luaXQoYWRldik7
CisKIAlEUk1fSU5GTygiUkFTIElORk86IHJhcyBpbml0aWFsaXplZCBzdWNjZXNzZnVsbHksICIK
IAkJCSJoYXJkd2FyZSBhYmlsaXR5WyV4XSByYXNfbWFza1sleF1cbiIsCiAJCQljb24tPmh3X3N1
cHBvcnRlZCwgY29uLT5zdXBwb3J0ZWQpOwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
