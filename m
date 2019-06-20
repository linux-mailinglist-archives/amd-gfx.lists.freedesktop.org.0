Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5F84CDC9
	for <lists+amd-gfx@lfdr.de>; Thu, 20 Jun 2019 14:34:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADE476E42E;
	Thu, 20 Jun 2019 12:34:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760057.outbound.protection.outlook.com [40.107.76.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 927356E42E
 for <amd-gfx@lists.freedesktop.org>; Thu, 20 Jun 2019 12:34:09 +0000 (UTC)
Received: from DM3PR12CA0085.namprd12.prod.outlook.com (2603:10b6:0:57::29) by
 DM5PR12MB1275.namprd12.prod.outlook.com (2603:10b6:3:75::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Thu, 20 Jun 2019 12:34:08 +0000
Received: from DM3NAM03FT061.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::206) by DM3PR12CA0085.outlook.office365.com
 (2603:10b6:0:57::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2008.13 via Frontend
 Transport; Thu, 20 Jun 2019 12:34:08 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT061.mail.protection.outlook.com (10.152.83.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2008.13 via Frontend Transport; Thu, 20 Jun 2019 12:34:07 +0000
Received: from kazbox.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Thu, 20 Jun 2019
 07:34:06 -0500
From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] Revert "drm/amd/display: Enable fast plane updates when
 state->allow_modeset = true"
Date: Thu, 20 Jun 2019 08:34:03 -0400
Message-ID: <20190620123403.10252-1-nicholas.kazlauskas@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(396003)(39860400002)(376002)(136003)(346002)(2980300002)(428003)(199004)(189003)(478600001)(50226002)(186003)(77096007)(2351001)(305945005)(126002)(4326008)(356004)(50466002)(6916009)(15650500001)(476003)(336012)(70586007)(8936002)(48376002)(53936002)(6666004)(70206006)(44832011)(26005)(316002)(7696005)(51416003)(47776003)(54906003)(16586007)(68736007)(8676002)(2616005)(1076003)(5660300002)(2906002)(426003)(81166006)(486006)(36756003)(53416004)(81156014)(86362001)(72206003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1275; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a55fe7e-6751-4897-94bd-08d6f57b96d3
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR12MB1275; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1275:
X-Microsoft-Antispam-PRVS: <DM5PR12MB127557CC7EAF5D5B3445F80FECE40@DM5PR12MB1275.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:873;
X-Forefront-PRVS: 0074BBE012
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 6gbHoL4tcM6pM8xOvY8VjpOFhputxkJ9MQmzmDxk+uYeCAtvGLnFCAzw3MkN6LH1xaiZlaztH7se0saHM4/W4Gv9zlHC9MPYv2b00I5lcpUQwDTrIk4fX1gvH7MqP3nGKvtJkt/DATfmowq3BtDJK79mUYT/aUaNxYepr5cpvRCYPyK+hmrhR8Ndy7Fv53EgkdYSwi35rlYRTU+SXayJbTdOge92sEkev5thehUKaA1nPBFFANkU3qBxZqIIYgKEV2jU16gyZCaaG3GkzKym7ojR21P4zOHng7S9eHYKKCwce9nNvqCk5gqaBX4qndOW99TCgf8I1aE1A+zzwAQQsM5vYnKoq/ktJs7fzLV4EFq7KzCxL33SUyH3Qz5y+YaA2GqLFqZtS7J7CFdau1Bb1oLm3PSQISqzO1ZMUAwh5JU=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2019 12:34:07.6802 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a55fe7e-6751-4897-94bd-08d6f57b96d3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1275
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0lxgz2FOD5E6Y9WmIYl8cz4Lh0q2NrsmBVvBI/khY7E=;
 b=ld7Aw3C3GiqtJ8sE3dFdS0C7BQM5Q96zEqA8nULKp8xpDdbF4XjHZ3y3Bwn8Raj30kpz35M/W/PJXnwriBIEAXyvTcoIqEJwsJezrL9pZhZTCDA5xfomn1nvlKO3Yxg3rPzJYJDeYDc+XmR1OMYQOcPiCZ1Q3U9+JrzVmGHC4/A=
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
Cc: David Francis <david.francis@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyByZXZlcnRzIGNvbW1pdCBlYmM4YzZmMTgzMjJhZDU0Mjc1OTk3YTg4OGNhMTczMWQ3NGI3
MTFmLgoKVGhlcmUgYXJlIHN0aWxsIG1pc3NpbmcgY29ybmVyIGNhc2VzIHdpdGggY3Vyc29yIGlu
dGVyYWN0aW9uIGFuZCB0aGVzZQpmYXN0IHBsYW5lIHVwZGF0ZXMgb24gUGljYXNzbyBhbmQgUmF2
ZW4yIGxlYWRpbmcgdG8gZW5kbGVzcyBQU1RBVEUKd2FybmluZ3MgZm9yIHR5cGljYWwgZGVza3Rv
cCB1c2FnZSBkZXBlbmRpbmcgb24gdGhlIHVzZXJzcGFjZS4KClRoaXMgY2hhbmdlIHNob3VsZCBi
ZSByZXZlcnRlZCB1bnRpbCB0aGVzZSBpc3N1ZXMgaGF2ZSBiZWVuIHJlc29sdmVkLgoKQ2M6IERh
dmlkIEZyYW5jaXMgPGRhdmlkLmZyYW5jaXNAYW1kLmNvbT4KQ2M6IEhhcnJ5IFdlbnRsYW5kIDxo
YXJyeS53ZW50bGFuZEBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBOaWNob2xhcyBLYXpsYXVza2Fz
IDxuaWNob2xhcy5rYXpsYXVza2FzQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyB8IDggKysrKysrKysKIDEgZmlsZSBjaGFuZ2Vk
LCA4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3Bs
YXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Ft
ZGdwdV9kbS9hbWRncHVfZG0uYwppbmRleCAzM2RjZDQxODcxNTcuLmQ2YWNiY2ZhNTcwYyAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0u
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5j
CkBAIC02NDcxLDYgKzY0NzEsMTQgQEAgc3RhdGljIGJvb2wgc2hvdWxkX3Jlc2V0X3BsYW5lKHN0
cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSwKIAlzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKm5l
d19jcnRjX3N0YXRlOwogCWludCBpOwogCisJLyoKKwkgKiBUT0RPOiBSZW1vdmUgdGhpcyBoYWNr
IG9uY2UgdGhlIGNoZWNrcyBiZWxvdyBhcmUgc3VmZmljaWVudAorCSAqIGVub3VnaCB0byBkZXRl
cm1pbmUgd2hlbiB3ZSBuZWVkIHRvIHJlc2V0IGFsbCB0aGUgcGxhbmVzIG9uCisJICogdGhlIHN0
cmVhbS4KKwkgKi8KKwlpZiAoc3RhdGUtPmFsbG93X21vZGVzZXQpCisJCXJldHVybiB0cnVlOwor
CiAJLyogRXhpdCBlYXJseSBpZiB3ZSBrbm93IHRoYXQgd2UncmUgYWRkaW5nIG9yIHJlbW92aW5n
IHRoZSBwbGFuZS4gKi8KIAlpZiAob2xkX3BsYW5lX3N0YXRlLT5jcnRjICE9IG5ld19wbGFuZV9z
dGF0ZS0+Y3J0YykKIAkJcmV0dXJuIHRydWU7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
