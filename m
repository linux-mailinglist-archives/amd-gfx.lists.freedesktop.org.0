Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2933A85B05
	for <lists+amd-gfx@lfdr.de>; Thu,  8 Aug 2019 08:48:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CAE96E464;
	Thu,  8 Aug 2019 06:48:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740040.outbound.protection.outlook.com [40.107.74.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9F056E464
 for <amd-gfx@lists.freedesktop.org>; Thu,  8 Aug 2019 06:48:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ajLihg1wYhF6qs0nkffPpCsjX5siNeKokaOzQF8fZoxs/UTKVRCBlH4iCoHz28WEComZNu/Y15ut90n0m+dKL1Hn8eIOnJV5lsCogclkkCx2K06pTEhJ0IJXwgyEDN/Dcp2CBw2VQndt+Gkz/yyHOBX24gAQbEVlgIaLNdgzL99jzAzyQ+jhrM9UUAm2ZWf6IauRN6Vrkva95nmzXezCug6ihaB2kxGQNJkM2gNJa9nKDXvFepZKfejeVV2/op8Vb9ePDUAiQmKZ9jolhdhfboZDnd10oifjsZsNcKnlMnSAF/Egz8B0j2kJBf+FAEp1dNxF5Je8WCR36mvPI7hUgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gQrr7+BgOo6MeorZw7sQl8aXBbxqEsQ+CPs5WAWMLUM=;
 b=Z9tXMXHnTOqCelHsl10sQ+2Ar24hV0pmhVdEynsR/fokxbMc1k6HMmIkR9UWhONeet6NT7lsewDguSfRg/dYulp7mlhSOvbkKz4CMgLI09DTIW+gS6KJoeoL5d48SQh7HI6uFqpqvZUJx2lg6JomdXCjQ4Y90jyglD8cG5NUIL2CIt9PoRbP1ygtlePYnWHMGHne0KTTtNPnrKFyxB269r7qKUvGo8uXe1Fpdgh36z814E/+ZfPQBuzxajHp1l4g3/MJ+J2IN/VBeXDDaPv4YwtW2fzj0NEWTBd1t9niNFz/rCWhNtl8cemLuuZK3YNq89wwVv+nGgE9IN8gqyYaYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM3PR12CA0051.namprd12.prod.outlook.com (2603:10b6:0:56::19) by
 DM6PR12MB2713.namprd12.prod.outlook.com (2603:10b6:5:49::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Thu, 8 Aug 2019 06:48:27 +0000
Received: from CO1NAM03FT057.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::201) by DM3PR12CA0051.outlook.office365.com
 (2603:10b6:0:56::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.17 via Frontend
 Transport; Thu, 8 Aug 2019 06:48:27 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT057.mail.protection.outlook.com (10.152.81.124) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2157.15 via Frontend Transport; Thu, 8 Aug 2019 06:48:26 +0000
Received: from taozhou1u2.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Thu, 8 Aug 2019
 01:48:25 -0500
From: Tao Zhou <tao.zhou1@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <hawking.zhang@amd.com>,
 <guchun.chen@amd.com>, <dennis.li@amd.com>, <xinhui.pan@amd.com>
Subject: [PATCH] drm/amdgpu: add sub block parameter in ras inject command
Date: Thu, 8 Aug 2019 14:48:02 +0800
Message-ID: <20190808064802.32759-1-tao.zhou1@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(396003)(136003)(376002)(2980300002)(428003)(189003)(199004)(51416003)(110136005)(186003)(5660300002)(26005)(6636002)(8676002)(4326008)(81166006)(48376002)(50466002)(86362001)(8936002)(53416004)(47776003)(16586007)(486006)(50226002)(36756003)(2906002)(81156014)(316002)(305945005)(7696005)(70586007)(2201001)(1076003)(70206006)(53936002)(2616005)(126002)(356004)(6666004)(336012)(478600001)(476003)(426003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2713; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a10bfacb-060c-4e6c-bb0d-08d71bcc6a65
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM6PR12MB2713; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB2713:
X-Microsoft-Antispam-PRVS: <DM6PR12MB2713A8603DB7D075DADB86CDB0D70@DM6PR12MB2713.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:419;
X-Forefront-PRVS: 012349AD1C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: nlo2hnrKF5tIGlWRObC3ApaUbN4Fq6yq5WSPLgJBsSysonAYFxJsgyDXad1mI2kxuMzVk/KEbf25nUQKhKEYTdqsT02GWOd0zgj8A9rGutUUbzWBHDK9RjNUqtlEF3ehDnU5ZiA0IL+mlKR29BMrwBX/FnD470Ths7Ux3O7GX3p7cHSYMmD4iCRvwiZLmjxI9tYYPfq05aU73kZbdSy3eaZRemyf6YXKNqxrCcNozCAVzvjgPhkcxx3My0iIevZvOGKzNXEZ5iM63TDtKELfaoazDPsLy5fSsRWvjFwmP0ZALfAdxN5mWJ+muplD1JWTH+fN/Ji+6iM+ob01cjgsTvzMvsnEKAWhUFhRd0zOCfxg+RqZjoJX38mOe+1Lzfjg+O9GIC2XyUyG1ieqZUVdv2ExsbhIzM6i0iGSX7S3Xv0=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2019 06:48:26.6493 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a10bfacb-060c-4e6c-bb0d-08d71bcc6a65
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2713
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gQrr7+BgOo6MeorZw7sQl8aXBbxqEsQ+CPs5WAWMLUM=;
 b=WDthr9zhIWNBMrBSt+4Pts6PykIU3VKhFU0TOY3TnH7yET96Y7JcjwaRdz8aJa1MysgV68Q7kvboktyqH/8RU303PoUXyeSekBTHLprFmPIgoLOcLEf8M8WijTwt68RBrR6tZHUzK/mN1f3pZIcX52rmDRLSAcpojsKY05GKPXI=
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

cmFzIHN1YiBibG9jayBpbmRleCBjb3VsZCBiZSBwYXNzZWQgZnJvbSBzaGVsbCBjb21tYW5kCgpT
aWduZWQtb2ZmLWJ5OiBUYW8gWmhvdSA8dGFvLnpob3UxQGFtZC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jIHwgMTcgKysrKysrKysrKy0tLS0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYwppbmRleCAzNjk2NTEyNDdiMjMuLmJjNzY2Y2Ri
ZWFhZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYwpAQCAtMTI5LDYg
KzEyOSw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3Jhc19kZWJ1Z2ZzX2N0cmxfcGFyc2VfZGF0YShz
dHJ1Y3QgZmlsZSAqZiwKIAljaGFyIGVycls5XSA9ICJ1ZSI7CiAJaW50IG9wID0gLTE7CiAJaW50
IGJsb2NrX2lkOworCXVpbnQzMl90IHN1Yl9ibG9jazsKIAl1NjQgYWRkcmVzcywgdmFsdWU7CiAK
IAlpZiAoKnBvcykKQEAgLTE2NywxMSArMTY4LDEyIEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3Jhc19k
ZWJ1Z2ZzX2N0cmxfcGFyc2VfZGF0YShzdHJ1Y3QgZmlsZSAqZiwKIAkJZGF0YS0+b3AgPSBvcDsK
IAogCQlpZiAob3AgPT0gMikgewotCQkJaWYgKHNzY2FuZihzdHIsICIlKnMgJSpzICUqcyAlbGx1
ICVsbHUiLAotCQkJCQkJJmFkZHJlc3MsICZ2YWx1ZSkgIT0gMikKLQkJCQlpZiAoc3NjYW5mKHN0
ciwgIiUqcyAlKnMgJSpzIDB4JWxseCAweCVsbHgiLAotCQkJCQkJCSZhZGRyZXNzLCAmdmFsdWUp
ICE9IDIpCisJCQlpZiAoc3NjYW5mKHN0ciwgIiUqcyAlKnMgJSpzICV1ICVsbHUgJWxsdSIsCisJ
CQkJCQkmc3ViX2Jsb2NrLCAmYWRkcmVzcywgJnZhbHVlKSAhPSAzKQorCQkJCWlmIChzc2NhbmYo
c3RyLCAiJSpzICUqcyAlKnMgMHgleCAweCVsbHggMHglbGx4IiwKKwkJCQkJCQkmc3ViX2Jsb2Nr
LCAmYWRkcmVzcywgJnZhbHVlKSAhPSAzKQogCQkJCQlyZXR1cm4gLUVJTlZBTDsKKwkJCWRhdGEt
PmhlYWQuc3ViX2Jsb2NrX2luZGV4ID0gc3ViX2Jsb2NrOwogCQkJZGF0YS0+aW5qZWN0LmFkZHJl
c3MgPSBhZGRyZXNzOwogCQkJZGF0YS0+aW5qZWN0LnZhbHVlID0gdmFsdWU7CiAJCX0KQEAgLTIx
Niw3ICsyMTgsNyBAQCBzdGF0aWMgaW50IGFtZGdwdV9yYXNfZGVidWdmc19jdHJsX3BhcnNlX2Rh
dGEoc3RydWN0IGZpbGUgKmYsCiAgKiB3cml0ZSB0aGUgc3RydWN0IHRvIHRoZSBjb250cm9sIG5v
ZGUuCiAgKgogICogYmFzaDoKLSAqIGVjaG8gb3AgYmxvY2sgW2Vycm9yIFthZGRyZXNzIHZhbHVl
XV0gPiAuLi4vcmFzL3Jhc19jdHJsCisgKiBlY2hvIG9wIGJsb2NrIFtlcnJvciBbc3ViX2JsY29r
IGFkZHJlc3MgdmFsdWVdXSA+IC4uLi9yYXMvcmFzX2N0cmwKICAqCW9wOiBkaXNhYmxlLCBlbmFi
bGUsIGluamVjdAogICoJCWRpc2FibGU6IG9ubHkgYmxvY2sgaXMgbmVlZGVkCiAgKgkJZW5hYmxl
OiBibG9jayBhbmQgZXJyb3IgYXJlIG5lZWRlZApAQCAtMjI2LDEwICsyMjgsMTEgQEAgc3RhdGlj
IGludCBhbWRncHVfcmFzX2RlYnVnZnNfY3RybF9wYXJzZV9kYXRhKHN0cnVjdCBmaWxlICpmLAog
ICoJZXJyb3I6IHVlLCBjZQogICoJCXVlOiBtdWx0aV91bmNvcnJlY3RhYmxlCiAgKgkJY2U6IHNp
bmdsZV9jb3JyZWN0YWJsZQorICoJc3ViX2Jsb2NrOiBzdWIgYmxvY2sgaW5kZXgsIHBhc3MgMCBp
ZiB0aGVyZSBpcyBubyBzdWIgYmxvY2sKICAqCiAgKiBoZXJlIGFyZSBzb21lIGV4YW1wbGVzIGZv
ciBiYXNoIGNvbW1hbmRzLAotICoJZWNobyBpbmplY3QgdW1jIHVlIDB4MCAweDAgPiAvc3lzL2tl
cm5lbC9kZWJ1Zy9kcmkvMC9yYXMvcmFzX2N0cmwKLSAqCWVjaG8gaW5qZWN0IHVtYyBjZSAwIDAg
PiAvc3lzL2tlcm5lbC9kZWJ1Zy9kcmkvMC9yYXMvcmFzX2N0cmwKKyAqCWVjaG8gaW5qZWN0IHVt
YyB1ZSAweDAgMHgwIDB4MCA+IC9zeXMva2VybmVsL2RlYnVnL2RyaS8wL3Jhcy9yYXNfY3RybAor
ICoJZWNobyBpbmplY3QgdW1jIGNlIDAgMCAwID4gL3N5cy9rZXJuZWwvZGVidWcvZHJpLzAvcmFz
L3Jhc19jdHJsCiAgKgllY2hvIGRpc2FibGUgdW1jID4gL3N5cy9rZXJuZWwvZGVidWcvZHJpLzAv
cmFzL3Jhc19jdHJsCiAgKgogICogSG93IHRvIGNoZWNrIHRoZSByZXN1bHQ/Ci0tIAoyLjE3LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
