Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5E269DB9
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:21:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6A0C89C6B;
	Mon, 15 Jul 2019 21:21:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730045.outbound.protection.outlook.com [40.107.73.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D55189C6C
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:21:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kRCcx7bWRZONLKva077jNRJ23wc66QLAUJ4oIyxtfQgDnQyXumxQcpKbQ2qNvMKcl+G/K9HAxfftkpPBEOpCw139JgvUSNZKog5OgLcEEUtCofnioF4iOx9uBqK5np4mp/7odwTpMvTpdtqE3Zm2Wn6bhANfL+mQKbF08SKtTnR+uXbj0U6awiTSsWp6WlUlL3wP36LoGDzj3u6OT8ZFUGGxonz2wC/ql1rAjW+aS8t8xoeej5lbL93ODJIOMV2bkuGsVu2S3x1/4614AUb3JTxYgw/rywBIzhWtKnLD6+YExOvXfbDT2sb2AX5bFXZRo+YErY7rvd87Xodoypui/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jCtoiVpbWUK5jxFh7jFZuDzchAFrhx1BEkjTSLSk5lI=;
 b=ZA5img9lMTlc/rRc0sRtFUUkqsdhoxDSJVorrJolKrLui4qHe8wbvQhpMT8RzJnySvMJcoQhPe77nLXxuWUrtonbRa5SVnhcFAglH/rO4qg7IcADr6PfdrD1Us7SL8e7zLk0zIfW5OBKzYrpVLmXyJ8rYSlEYpm4Ux7xl/1IO6T8DMyIUYY3/To0a2NqKbx8u92tDr8ZtrB53eZsyeDYSg7bg7XOVab2FyguU1gM5nmr9GUiLhbP420Go48XfRvsitGNr5mBHBxjAcCUSztNXBh+AMwtnw0zWKcgGzm/C/i4wigkPDazBJPRuHload5oKnAyc748LKxcJWY29eHvJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM5PR12CA0004.namprd12.prod.outlook.com (2603:10b6:4:1::14) by
 DM5PR12MB1929.namprd12.prod.outlook.com (2603:10b6:3:106::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Mon, 15 Jul 2019 21:21:39 +0000
Received: from CO1NAM03FT028.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::206) by DM5PR12CA0004.outlook.office365.com
 (2603:10b6:4:1::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.10 via Frontend
 Transport; Mon, 15 Jul 2019 21:21:39 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT028.mail.protection.outlook.com (10.152.80.189) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:21:39 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:25 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 41/87] drm/amd/display: Remove unnecessary NULL check in
 set_preferred_link_settings
Date: Mon, 15 Jul 2019 17:20:03 -0400
Message-ID: <20190715212049.4584-42-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(396003)(376002)(346002)(2980300002)(428003)(189003)(199004)(336012)(305945005)(2870700001)(446003)(6666004)(356004)(6916009)(2906002)(186003)(4326008)(36756003)(26005)(53936002)(68736007)(48376002)(47776003)(5660300002)(2876002)(49486002)(486006)(1076003)(76176011)(478600001)(81166006)(81156014)(8936002)(50466002)(86362001)(51416003)(2351001)(426003)(11346002)(70206006)(54906003)(70586007)(476003)(50226002)(2616005)(126002)(316002)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1929; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f786fbb6-7bad-4fb7-ca79-08d7096a6ccd
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR12MB1929; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1929:
X-Microsoft-Antispam-PRVS: <DM5PR12MB192962C47E86E9B5FC99BAD182CF0@DM5PR12MB1929.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 7K8yg2aXT9xrsz0xClA3KlHsgcRJSdoNbidBPxtIYMSvlDRfQ+FebPfvvWAvVImDs8dhtXGwzhZSCVF4S8IxeNbDR7nS3mD3VkkLsJmjikA+isItygqIqxBKogAkHNQEZQ1nDppTunPsbXXjt73vFqN+Ho8ZcRUnGTpN67d9eq2YaRI6kUNLFlsLtj4O6MOn1zFFpp3sr0l+FLJR0m/bmnzFu0yL1FgfvUtsFsUjTaSJTdlQrGdWcbGt4IXnUQiVBsI73yn8QtAopir2BufsScQU2ae6bSeuEO1GT+g03G8nmK1E7lQGyjN5BImh+aB2o3oGjAzHuBqoVQfmiNq8/NmiRIHOUIU3wFMmCTbY49Wre4KgP6zcv+iptO7r/ne8tW+5718A4X8NYrzBgwfmkOtI6gG1W/GtZJ7ESnTMK5M=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:21:39.0912 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f786fbb6-7bad-4fb7-ca79-08d7096a6ccd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1929
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jCtoiVpbWUK5jxFh7jFZuDzchAFrhx1BEkjTSLSk5lI=;
 b=rM/HDL9cS0outCEXiyrBC4biQNajWHMlWW/bOFkqrx+ir3ekpgzT49UFvW83AIF9JAvtbvRFGnyJ8Uay666uoOdflmDBHU7zU3/+eEsLaV+YtUxmDXvs1kD27n8pXBwygu1diTKvrBm4QBRVwESxzJgywtcNowouomRk8wOO56s=
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
Cc: Leo Li <sunpeng.li@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+CgpbV2h5XQpsaW5r
X3N0cmVhbSBpcyBuZXZlciBOVUxMIGhlcmUgYXMgd2UndmUgZGVyZWZlcmVuY2VkIGl0IGEgY291
cGxlIGxpbmVzIGJlZm9yZQphbmQgaGF2ZSBkb25lIHNvIGZvciBhIGNvdXBsZSBtb250aHMgbm93
LgoKW0hvd10KLSBEcm9wIHRoZSBOVUxMIGNoZWNrLgotIEluaXRpYWxpemUgd2hlcmUgd2Uga25v
dyBsaW5rX3N0cmVhbSBpcyBub24tTlVMTAoKU2lnbmVkLW9mZi1ieTogSGFycnkgV2VudGxhbmQg
PGhhcnJ5LndlbnRsYW5kQGFtZC5jb20+ClJldmlld2VkLWJ5OiBOaWNob2xhcyBLYXpsYXVza2Fz
IDxOaWNob2xhcy5LYXpsYXVza2FzQGFtZC5jb20+CkFja2VkLWJ5OiBMZW8gTGkgPHN1bnBlbmcu
bGlAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19s
aW5rLmMgfCA5ICsrKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNSBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
Y29yZS9kY19saW5rLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19s
aW5rLmMKaW5kZXggNWQ2Y2Y2YmRjY2Y3Li44ODAzZjZjYzU0MTQgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmsuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rLmMKQEAgLTMwMjEsOCArMzAyMSwxMCBA
QCB2b2lkIGRjX2xpbmtfc2V0X3ByZWZlcnJlZF9saW5rX3NldHRpbmdzKHN0cnVjdCBkYyAqZGMs
CiAJZm9yIChpID0gMDsgaSA8IE1BWF9QSVBFUzsgaSsrKSB7CiAJCXBpcGUgPSAmZGMtPmN1cnJl
bnRfc3RhdGUtPnJlc19jdHgucGlwZV9jdHhbaV07CiAJCWlmIChwaXBlLT5zdHJlYW0gJiYgcGlw
ZS0+c3RyZWFtLT5saW5rKSB7Ci0JCQlpZiAocGlwZS0+c3RyZWFtLT5saW5rID09IGxpbmspCisJ
CQlpZiAocGlwZS0+c3RyZWFtLT5saW5rID09IGxpbmspIHsKKwkJCQlsaW5rX3N0cmVhbSA9IHBp
cGUtPnN0cmVhbTsKIAkJCQlicmVhazsKKwkJCX0KIAkJfQogCX0KIApAQCAtMzAzMCwxNCArMzAz
MiwxMSBAQCB2b2lkIGRjX2xpbmtfc2V0X3ByZWZlcnJlZF9saW5rX3NldHRpbmdzKHN0cnVjdCBk
YyAqZGMsCiAJaWYgKGkgPT0gTUFYX1BJUEVTKQogCQlyZXR1cm47CiAKLQlsaW5rX3N0cmVhbSA9
IGxpbmstPmRjLT5jdXJyZW50X3N0YXRlLT5yZXNfY3R4LnBpcGVfY3R4W2ldLnN0cmVhbTsKLQog
CS8qIENhbm5vdCByZXRyYWluIGxpbmsgaWYgYmFja2VuZCBpcyBvZmYgKi8KIAlpZiAobGlua19z
dHJlYW0tPmRwbXNfb2ZmKQogCQlyZXR1cm47CiAKLQlpZiAobGlua19zdHJlYW0pCi0JCWRlY2lk
ZV9saW5rX3NldHRpbmdzKGxpbmtfc3RyZWFtLCAmc3RvcmVfc2V0dGluZ3MpOworCWRlY2lkZV9s
aW5rX3NldHRpbmdzKGxpbmtfc3RyZWFtLCAmc3RvcmVfc2V0dGluZ3MpOwogCiAJaWYgKChzdG9y
ZV9zZXR0aW5ncy5sYW5lX2NvdW50ICE9IExBTkVfQ09VTlRfVU5LTk9XTikgJiYKIAkJKHN0b3Jl
X3NldHRpbmdzLmxpbmtfcmF0ZSAhPSBMSU5LX1JBVEVfVU5LTk9XTikpCi0tIAoyLjIyLjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
