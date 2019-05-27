Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8352BAF1
	for <lists+amd-gfx@lfdr.de>; Mon, 27 May 2019 21:52:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16C2A89B18;
	Mon, 27 May 2019 19:52:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam03on0628.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe49::628])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB01789B03
 for <amd-gfx@lists.freedesktop.org>; Mon, 27 May 2019 19:52:24 +0000 (UTC)
Received: from DM5PR12CA0003.namprd12.prod.outlook.com (2603:10b6:4:1::13) by
 CY4PR12MB1270.namprd12.prod.outlook.com (2603:10b6:903:43::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.22; Mon, 27 May 2019 19:52:23 +0000
Received: from CO1NAM03FT022.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::200) by DM5PR12CA0003.outlook.office365.com
 (2603:10b6:4:1::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1922.16 via Frontend
 Transport; Mon, 27 May 2019 19:52:22 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT022.mail.protection.outlook.com (10.152.80.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1922.16 via Frontend Transport; Mon, 27 May 2019 19:52:22 +0000
Received: from leodev.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 27 May 2019
 14:52:03 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 25/26] drm/amd/display: CS_TFM_1D only applied post EOTF
Date: Mon, 27 May 2019 15:51:04 -0400
Message-ID: <1558986665-12964-26-git-send-email-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558986665-12964-1-git-send-email-sunpeng.li@amd.com>
References: <1558986665-12964-1-git-send-email-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(376002)(39860400002)(136003)(396003)(346002)(2980300002)(428003)(189003)(199004)(26005)(2906002)(336012)(50226002)(47776003)(6916009)(2351001)(2616005)(36756003)(11346002)(305945005)(81156014)(8676002)(2876002)(86152003)(476003)(76176011)(53936002)(53416004)(8936002)(81166006)(70206006)(70586007)(316002)(16586007)(5660300002)(478600001)(126002)(86362001)(4326008)(426003)(7696005)(51416003)(356004)(68736007)(48376002)(446003)(14444005)(50466002)(77096007)(186003)(486006)(72206003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1270; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d5cf5e8-d61e-4b2d-3b04-08d6e2dcd5d0
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CY4PR12MB1270; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1270:
X-Microsoft-Antispam-PRVS: <CY4PR12MB127047E7F2FD600F20CA6CDB821D0@CY4PR12MB1270.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-Forefront-PRVS: 0050CEFE70
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: Iru7HxR3kzhBkqkEwoKwK6M0kScQnU5LjYrXZEeGd++egpHJrIblTQe5+bvYNgaViieNDjpppBLdRdBUbbGCYVKteuA1o8yA3X7CpuupjPt8TgU3ZlzHrww3uLTUwrMLE1RSBWhSvyN78DIdrF9/tnPa3EmssjpihvJqZdJh7NtTc+tRcd2CxXJ1J0NK2blR1wg7FUzBfnpqE3C/NfHa/XEOyDHSGPOq+t9FVV8aognb66BTsIiZJkWnDogzC6HvG2DqQrRche6OxJbeGmxWqFHpEz2yQJyW7IfTDq7s8DSZ8m5b0Vf6LyNlhzk5peS9KgG3KGFreoXGbCJckw+fa3cxZcLW9+ZnPygTYCvfQT73wIJ+sa9KDn4N8GQYA5KkGSQFj4Oay6rs+U1K1rgtjJ8HBJx6QiGwshxuJDoe8qY=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2019 19:52:22.5538 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d5cf5e8-d61e-4b2d-3b04-08d6e2dcd5d0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1270
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fACWEn28zd5JLiBmpa3ZFn2GS9BrxQghm0rB1WB/A80=;
 b=lc4h9uo94vwcUuOzVU/b2p6oXZvYL/oCdeLVBKdP7oAeKvCPcxEtgvC3T+0yu8xTXp0+c9uiLxkOHEhPc3YH5C4RDw7WweRQDrgeRv/if4TuVLXiZ2ulc3fAabgOBHpEux8PGqXJCslLttVxsWJ6lXiAGnTsoPgozCztd2j35TQ=
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
Cc: Krunoslav Kovac <Krunoslav.Kovac@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogS3J1bm9zbGF2IEtvdmFjIDxLcnVub3NsYXYuS292YWNAYW1kLmNvbT4KCltXaHldClRo
ZXJlJ3Mgc29tZSB1bm5lY2Vzc2FyeSBtZW0gYWxsb2NhdGlvbiBmb3IgQ1NfVEZNX0lELiBXaGF0
J3Mgd29yc2UsIGl0CmRlcGVuZHMgb24gTFVUIHNpemUgYW5kIHNpbmNlIGl0J3MgNEsgZm9yIENT
X1RGTV8xRCwgaXQgaXMgMTZ4IGJpZ2dlcgp0aGFuIGluIHJlZ3VsYXIgY2FzZSB3aGVuIGl0J3Mg
YWN0dWFsbHkgbmVlZGVkLiBUaGlzIGxlYWRzIHRvIHNvbWUKY3Jhc2hlcyBpbiBzdHJlc3MgY29u
ZGl0aW9ucy4KCltIb3ddClNraXAgcmFtcCBjb21iaW5pbmcgZGVzaWduZWQgZm9yIFJHQjI1NiBh
bmQgRFhHSSBnYW1tYSB3aXRoIENTX1RGTV8xRC4KClNpZ25lZC1vZmYtYnk6IEtydW5vc2xhdiBL
b3ZhYyA8S3J1bm9zbGF2LktvdmFjQGFtZC5jb20+ClJldmlld2VkLWJ5OiBBcmljIEN5ciA8QXJp
Yy5DeXJAYW1kLmNvbT4KQWNrZWQtYnk6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2NvbG9yL2NvbG9yX2dhbW1hLmMg
fCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2NvbG9yL2Nv
bG9yX2dhbW1hLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9jb2xvci9j
b2xvcl9nYW1tYS5jCmluZGV4IDM2OWE4OTAuLjg5YTY1ZTEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2NvbG9yL2NvbG9yX2dhbW1hLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMvY29sb3IvY29sb3JfZ2FtbWEuYwpAQCAt
MTU3Niw3ICsxNTc2LDggQEAgYm9vbCBtb2RfY29sb3JfY2FsY3VsYXRlX3JlZ2FtbWFfcGFyYW1z
KHN0cnVjdCBkY190cmFuc2Zlcl9mdW5jICpvdXRwdXRfdGYsCiAKIAlvdXRwdXRfdGYtPnR5cGUg
PSBURl9UWVBFX0RJU1RSSUJVVEVEX1BPSU5UUzsKIAotCWlmIChyYW1wICYmIChtYXBVc2VyUmFt
cCB8fCByYW1wLT50eXBlICE9IEdBTU1BX1JHQl8yNTYpKSB7CisJaWYgKHJhbXAgJiYgcmFtcC0+
dHlwZSAhPSBHQU1NQV9DU19URk1fMUQgJiYKKwkJCShtYXBVc2VyUmFtcCB8fCByYW1wLT50eXBl
ICE9IEdBTU1BX1JHQl8yNTYpKSB7CiAJCXJnYl91c2VyID0ga3ZjYWxsb2MocmFtcC0+bnVtX2Vu
dHJpZXMgKyBfRVhUUkFfUE9JTlRTLAogCQkJICAgIHNpemVvZigqcmdiX3VzZXIpLAogCQkJICAg
IEdGUF9LRVJORUwpOwotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeA==
