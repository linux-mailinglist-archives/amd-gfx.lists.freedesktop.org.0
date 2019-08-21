Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DAF97530
	for <lists+amd-gfx@lfdr.de>; Wed, 21 Aug 2019 10:42:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DC246E93F;
	Wed, 21 Aug 2019 08:42:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730085.outbound.protection.outlook.com [40.107.73.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AB196E2F5
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 08:41:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XvWI+tt9kp5geMkX/x3Bhv3GoRey6npbj1OuTsllMvlTjksp6aMvEz5t2kRL7+UEfWoiHg+RFmN6UbnkWLzOypqvrJqfBCxvl7O53T4oUQFeyr5OQvt4xkocX1hxo1IjBYJ48r/zPHHG08V22lonLwJYgVCG9FA8TkFI7McEdP4x2VDF9Riy97gVfhTmP37awa0iOM07OI+MHdwX5nKEKY+3rGgwv0CcQKR9jsVpiW46EgFPVG1SvQFD6JgGxqi6Wulqndq83zEiMKmMuPerLj/0+WXLI+FI7qqR2WGNMoCvQ5668eK8b83Xfxa7gfVJ7nQje4CHwP9Jiv4+S6PWLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Md3XTk6EYsiqkwDyJwXTWb+fxOVEjY+vpmjRNBtwn0=;
 b=nHk7cj5tdkC2YZuhXnEigYySchP/11gurZ3zZVtwuQAhi2qHKsTX9NJNjiwSNYP88HT5QLuqzT0WddRJzNM9K7AmtlaqIkcH3jTfqjo73fxbjTvMRpvYSc3MCGAUEEcTkj025QuOkwooOQemVN3FVXALH3vTrrYXsNMbrdgTNjID7SLMOYPvkX7Jjsi9Ollj3bBaquRf2U/Cuu2oxkluYqmJadGbyTl7dosKuOYr/DcxmK7MZg6AevaQrBNt18oDX8UbKDBth31LfhlUQLVBm38plrtVKAlvqjk1YIGyhHs/hDasHxTT7XKPm9raCp2j37lepu4W/YjCA3Al038cQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from BN6PR12CA0034.namprd12.prod.outlook.com (2603:10b6:405:70::20)
 by DM5PR12MB1276.namprd12.prod.outlook.com (2603:10b6:3:79::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2178.16; Wed, 21 Aug
 2019 08:41:57 +0000
Received: from CO1NAM03FT046.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::204) by BN6PR12CA0034.outlook.office365.com
 (2603:10b6:405:70::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2199.14 via Frontend
 Transport; Wed, 21 Aug 2019 08:41:56 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT046.mail.protection.outlook.com (10.152.81.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.16 via Frontend Transport; Wed, 21 Aug 2019 08:41:56 +0000
Received: from equan-buildpc.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 21 Aug 2019
 03:41:55 -0500
From: Evan Quan <evan.quan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amd/powerplay: correct the pp_feature output on
 Arcturus
Date: Wed, 21 Aug 2019 16:41:43 +0800
Message-ID: <20190821084143.25713-2-evan.quan@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190821084143.25713-1-evan.quan@amd.com>
References: <20190821084143.25713-1-evan.quan@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(136003)(39860400002)(396003)(2980300002)(428003)(189003)(199004)(126002)(478600001)(5660300002)(8676002)(6916009)(53936002)(486006)(51416003)(7696005)(47776003)(44832011)(81166006)(48376002)(81156014)(50466002)(8936002)(2351001)(2906002)(36756003)(70586007)(70206006)(2870700001)(53416004)(76176011)(4326008)(50226002)(446003)(305945005)(316002)(186003)(336012)(6666004)(356004)(1076003)(86362001)(26005)(2616005)(426003)(11346002)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1276; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 21556110-be64-4266-7976-08d726136ca7
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM5PR12MB1276; 
X-MS-TrafficTypeDiagnostic: DM5PR12MB1276:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1276B4085AAD118D2F332E50E4AA0@DM5PR12MB1276.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:227;
X-Forefront-PRVS: 0136C1DDA4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: ACVwhxQI2D1BUND4rnZlZjoIxzb7ujaA7sH81p/Ys1LXxMVuQaUdO4143GPaBQaO3uxvMLAO0UbkikgCEV1VlDskoH2xhdgTTjv2MDKZ6KQT+F+d4lTk0zBVYwqJqTybwmLUdTwnLMwUyahcHkzUEXBvYbxtSeJUfabCR5J4MWrYt1VsvE2BzW9vn+zxlQ2Iw3uYsa5THBwt5Lx/c0fHwSJa67OCGGdkh3O7zWTyipFmKjK4hVeg7+uNJdPsllDIwpnEJ932cogbVHArRihmDy3Ve471TdFNMFHsxQ4XV7kRbkySUZRyksugwDJ3UgmngGBK1NqmQfuJT+rPtmp58Wwsg1zd8Bwuuv221GhxZhZIWgRVCcLrA5ffeyjyS1w0PskTjsVZdAaEHrcYYj+kbfneGbzjdkWC4uLnDGc6K68=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2019 08:41:56.3351 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21556110-be64-4266-7976-08d726136ca7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1276
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Md3XTk6EYsiqkwDyJwXTWb+fxOVEjY+vpmjRNBtwn0=;
 b=C+HkLd7eNlN7QwUxGqfquyFX+YKOY5Jbz4flCGAxd4XpuA8o8H3Scob8fa5qCag7zpwtvXblN7Rwb/O7C0TLvHGR32JkGpXRShCEdt5V0Wg3SoOzeABhhq7Dfd/eHSz3c2xE6XXJt/yMUXI1GqGw+M3J2eRA90vAZr39RWQkeJ4=
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

Rml4IGZvciB0aGUgY29tbWl0IGJlbG93Ogpkcm0vYW1kL3Bvd2VycGxheTogaW1wbG1lbnQgc3lz
ZnMgZmVhdHVyZSBzdGF0dXMgZnVuY3Rpb24gaW4gc211CgpDaGFuZ2UtSWQ6IElkOWEzNzNmOGQ4
ODY2Yjk3NDUwYmUwYWVmMGJhMTlkMDgzNWQ0MGQ4ClNpZ25lZC1vZmYtYnk6IEV2YW4gUXVhbiA8
ZXZhbi5xdWFuQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYXJj
dHVydXNfcHB0LmMgIHwgMiArKwogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3Nt
dV90eXBlcy5oIHwgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FyY3R1cnVzX3BwdC5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYXJjdHVydXNfcHB0LmMKaW5kZXggZGQ2NTYzMzU4
ZThlLi5mMWYwNzIwMTJmYWMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJw
bGF5L2FyY3R1cnVzX3BwdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2Fy
Y3R1cnVzX3BwdC5jCkBAIC0xNDEsNiArMTQxLDcgQEAgc3RhdGljIHN0cnVjdCBzbXVfMTFfMF9j
bW4yYWlzY19tYXBwaW5nIGFyY3R1cnVzX2ZlYXR1cmVfbWFza19tYXBbU01VX0ZFQVRVUkVfQ08K
IAlGRUFfTUFQKERQTV9TT0NDTEspLAogCUZFQV9NQVAoRFBNX0ZDTEspLAogCUZFQV9NQVAoRFBN
X01QMENMSyksCisJQVJDVFVSVVNfRkVBX01BUChTTVVfRkVBVFVSRV9YR01JX0JJVCwgRkVBVFVS
RV9EUE1fWEdNSV9CSVQpLAogCUZFQV9NQVAoRFNfR0ZYQ0xLKSwKIAlGRUFfTUFQKERTX1NPQ0NM
SyksCiAJRkVBX01BUChEU19MQ0xLKSwKQEAgLTE0OSw2ICsxNTAsNyBAQCBzdGF0aWMgc3RydWN0
IHNtdV8xMV8wX2NtbjJhaXNjX21hcHBpbmcgYXJjdHVydXNfZmVhdHVyZV9tYXNrX21hcFtTTVVf
RkVBVFVSRV9DTwogCUZFQV9NQVAoR0ZYX1VMViksCiAJQVJDVFVSVVNfRkVBX01BUChTTVVfRkVB
VFVSRV9WQ05fUEdfQklULCBGRUFUVVJFX0RQTV9WQ05fQklUKSwKIAlGRUFfTUFQKFJTTVVfU01O
X0NHKSwKKwlGRUFfTUFQKFdBRkxfQ0cpLAogCUZFQV9NQVAoUFBUKSwKIAlGRUFfTUFQKFREQyks
CiAJRkVBX01BUChBUENDX1BMVVMpLApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9w
b3dlcnBsYXkvaW5jL3NtdV90eXBlcy5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkv
aW5jL3NtdV90eXBlcy5oCmluZGV4IDcyOTYyZTg0MmQ2OS4uYzNjNzQwOThmNjE0IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvc211X3R5cGVzLmgKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL3NtdV90eXBlcy5oCkBAIC0yMDcsNiAr
MjA3LDcgQEAgZW51bSBzbXVfY2xrX3R5cGUgewogICAgICAgIF9fU01VX0RVTU1ZX01BUChURU1Q
X0RFUEVOREVOVF9WTUlOKSwgICAgICAgICAgIAlcCiAgICAgICAgX19TTVVfRFVNTVlfTUFQKE1N
SFVCX1BHKSwgICAgICAgICAgICAgICAgICAgICAgCVwKICAgICAgICBfX1NNVV9EVU1NWV9NQVAo
QVRIVUJfUEcpLCAgICAgICAgICAgICAgICAgICAgICAJXAorICAgICAgIF9fU01VX0RVTU1ZX01B
UChXQUZMX0NHKSwKIAogI3VuZGVmIF9fU01VX0RVTU1ZX01BUAogI2RlZmluZSBfX1NNVV9EVU1N
WV9NQVAoZmVhdHVyZSkJU01VX0ZFQVRVUkVfIyNmZWF0dXJlIyNfQklUCi0tIAoyLjIzLjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
