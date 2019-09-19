Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7FBB8073
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Sep 2019 19:52:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14FE36F8B1;
	Thu, 19 Sep 2019 17:52:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730042.outbound.protection.outlook.com [40.107.73.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A9DF6F8B1
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 17:52:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Emgrd2RGsbAqpNVzitpzYK0hPLOd6Fk+LU+S0rTUTGQNHP48Gsda+HEajyB5fN+nmPiRLZBHM9sjDoxtehQL3rSQ/9t714cPFjKyjbO7mUd+fq2YaW4guj8QoNzAFI3adrD48Upyn0REkBW1NUt78qQpQLbqpluTjCh+UmA6+mM2Nse+S0ZV7csTqMj+Bo7Ni0RkldGFmTT8J/r8W4NpJfjOztOqlDPIeScRIIxgJu8c8Yv9ZsqI5Ncsq8xO4dq4pwYZRPquXN+yypU0CJVPBaJLDOey6YOdjEPJzBgQCuQpTnGNdBwkSN3Q5YbdTs/6VIZxE/vnQcg9tqV2I2NzVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1SB2DW8oOsKL3TUA8ikOvbeAc5YmVT6N4MG4dBU7sBQ=;
 b=S/As5scHLvBz0vDc+xCjlsPHShEC1msqBOoXHqlwSLexS9fA41cV5Fmi0LKDp/l2neGSqpqe112vFy7aZRKYem4B9ID17agLvL+vIeUaAJaq17CnvV/SoH62ygC725H4Av9RniNeB11Pujk/jGY/7s85XQKgyh5T85o4PtCHMj22o8XDIhTX5d/oJLJQ4/I4N2NnCipNTq5c+zXD1LX/WTfJlZCyeawQd+BkOwwXlYEvXFfwnVvPEehIUqqkiMIQ1yRkmVbJl4PP+OG4Pj6xWFwNypWSDxxEcXGOVpZl5WkE2T4pLKjkNmleVeIIFlbX9ae14+S82RBXbG8K5tI/hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0127.namprd12.prod.outlook.com (2603:10b6:0:51::23) by
 CY4PR12MB1367.namprd12.prod.outlook.com (2603:10b6:903:3c::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Thu, 19 Sep 2019 17:52:47 +0000
Received: from BY2NAM03FT012.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e4a::209) by DM3PR12CA0127.outlook.office365.com
 (2603:10b6:0:51::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.20 via Frontend
 Transport; Thu, 19 Sep 2019 17:52:46 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 BY2NAM03FT012.mail.protection.outlook.com (10.152.84.235) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2284.20 via Frontend Transport; Thu, 19 Sep 2019 17:52:46 +0000
Received: from hwentlanhp.amd.com (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Thu, 19 Sep 2019
 12:52:44 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/display; Fix kernel doc warnings
Date: Thu, 19 Sep 2019 13:52:43 -0400
Message-ID: <20190919175243.31592-1-harry.wentland@amd.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <37bcfe0e-6ef8-cbbe-cdcc-b456a3a25353@amd.com>
References: <37bcfe0e-6ef8-cbbe-cdcc-b456a3a25353@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(346002)(136003)(376002)(428003)(199004)(189003)(50466002)(47776003)(186003)(81166006)(2616005)(446003)(126002)(8936002)(11346002)(336012)(8676002)(476003)(70586007)(50226002)(5660300002)(81156014)(316002)(356004)(486006)(2906002)(76176011)(7696005)(51416003)(1076003)(54906003)(2870700001)(44832011)(426003)(86362001)(2351001)(26005)(478600001)(305945005)(14444005)(6916009)(4326008)(70206006)(53416004)(36756003)(48376002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1367; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b9a217a0-d596-40c7-149f-08d73d2a2dbf
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:CY4PR12MB1367; 
X-MS-TrafficTypeDiagnostic: CY4PR12MB1367:
X-Microsoft-Antispam-PRVS: <CY4PR12MB13678EE459C48BEB5BC2C7878C890@CY4PR12MB1367.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 016572D96D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 0kzvImUdpM8XRobuLGESECMjW6locF8jN5DJuURjJdJFEJib4kcnDBKtk4oS/vTBkYD7rMg9nj/1S7X7Kj2VZxtM2cKbT3+z6tr2PlhG0+nwo3imThHwMcIYch+J2LtgVx12y+7URee6ueNk6DOktI8ggAgTIm+tk3CY32wRLJT0tXjthnlONa57odCsKPbsxcP4Xn9fMOAQJTdRpdbjyA75Hu6na/Byd+JBwxYefzPOSQ0KlIYOWe9Hl34C5JojNnGjIZt4QYxTRonIcTFjlKirm/nEmzrAQ/OWkMW+r89wrrA1kDG9zLhA5XR+mgN4SkTtDhr5kwSgB2t4W6R4zvPuaz4/LQQMawzZjQs6fEkuAoRcko65enfHbQbwC5g/UXv0BXksLZzjAUnuKf/hsLfKoJkSt1bbWF5wwYjs93A=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2019 17:52:46.0041 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9a217a0-d596-40c7-149f-08d73d2a2dbf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1367
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1SB2DW8oOsKL3TUA8ikOvbeAc5YmVT6N4MG4dBU7sBQ=;
 b=jQBfRqNpEG9wuaOvul1yn/G/tUCerydx0ow9rzG+r7Cc5LzEvwqHmDnr9T70XnU6NGobDZvKck0Gdns+giGnjUbvbSkrAamSrmYuZvtq1b/7yQNRSLIHRLJORsovL3c2hx0Ixt2FwzKqAMtW7UsRcFJ9IEW73KsoOhcc94VshfA=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=permerror action=none header.from=amd.com;
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
Cc: Harry Wentland <harry.wentland@amd.com>, Nicholas
 Kazlauskas <nicholas.kazlauskas@amd.com>, daniel@ffwll.ch
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

V2UgaGFkIGEgY291cGxlIG9mIG1pc3NpbmcgZGVmaW5pdGlvbnMgYW5kIGZvcm1hdHRpbmcgZXJy
b3JzLgoKdjI6IEZpeCAnbm90aWZ5aW5nJyB0eXBlCgpTaWduZWQtb2ZmLWJ5OiBIYXJyeSBXZW50
bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IE5pY2hvbGFzIEthemxh
dXNrYXMgPG5pY2hvbGFzLmthemxhdXNrYXNAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgMTQgKysrKysrKysrKysrKysKIGRy
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmggfCAxMCArKysr
KysrKystCiAyIGZpbGVzIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdw
dV9kbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0u
YwppbmRleCA3ZDYyYjRlODYzODYuLjFhMjNlZWJjMjRkYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCkBAIC0yNjEsNiArMjYxLDEz
IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBhbWRncHVfZG1fdnJyX2FjdGl2ZShzdHJ1Y3QgZG1fY3J0
Y19zdGF0ZSAqZG1fc3RhdGUpCiAJICAgICAgIGRtX3N0YXRlLT5mcmVlc3luY19jb25maWcuc3Rh
dGUgPT0gVlJSX1NUQVRFX0FDVElWRV9GSVhFRDsKIH0KIAorLyoqCisgKiBkbV9wZmxpcF9oaWdo
X2lycSgpIC0gSGFuZGxlIHBhZ2VmbGlwIGludGVycnVwdAorICogQGludGVycnVwdF9wYXJhbXM6
IGlnbm9yZWQKKyAqCisgKiBIYW5kbGVzIHRoZSBwYWdlZmxpcCBpbnRlcnJ1cHQgYnkgbm90aWZ5
aW5nIGFsbCBpbnRlcmVzdGVkIHBhcnRpZXMKKyAqIHRoYXQgdGhlIHBhZ2VmbGlwIGhhcyBiZWVu
IGNvbXBsZXRlZC4KKyAqLwogc3RhdGljIHZvaWQgZG1fcGZsaXBfaGlnaF9pcnEodm9pZCAqaW50
ZXJydXB0X3BhcmFtcykKIHsKIAlzdHJ1Y3QgYW1kZ3B1X2NydGMgKmFtZGdwdV9jcnRjOwpAQCAt
NDA1LDYgKzQxMiwxMyBAQCBzdGF0aWMgdm9pZCBkbV92dXBkYXRlX2hpZ2hfaXJxKHZvaWQgKmlu
dGVycnVwdF9wYXJhbXMpCiAJfQogfQogCisvKioKKyAqIGRtX2NydGNfaGlnaF9pcnEoKSAtIEhh
bmRsZXMgQ1JUQyBpbnRlcnJ1cHQKKyAqIEBpbnRlcnJ1cHRfcGFyYW1zOiBpZ25vcmVkCisgKgor
ICogSGFuZGxlcyB0aGUgQ1JUQy9WU1lOQyBpbnRlcnJ1cHQgYnkgbm90ZnlpbmcgRFJNJ3MgVkJM
QU5LCisgKiBldmVudCBoYW5kbGVyLgorICovCiBzdGF0aWMgdm9pZCBkbV9jcnRjX2hpZ2hfaXJx
KHZvaWQgKmludGVycnVwdF9wYXJhbXMpCiB7CiAJc3RydWN0IGNvbW1vbl9pcnFfcGFyYW1zICpp
cnFfcGFyYW1zID0gaW50ZXJydXB0X3BhcmFtczsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5oCmluZGV4IDE3YTM1YjUwNDU1Mi4uYWYyMDI1
ZjNhYzFhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2Rt
L2FtZGdwdV9kbS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0v
YW1kZ3B1X2RtLmgKQEAgLTEwNSw2ICsxMDUsMTIgQEAgc3RydWN0IGFtZGdwdV9kbV9iYWNrbGln
aHRfY2FwcyB7CiAgKiBAZGlzcGxheV9pbmRleGVzX251bTogTWF4IG51bWJlciBvZiBkaXNwbGF5
IHN0cmVhbXMgc3VwcG9ydGVkCiAgKiBAaXJxX2hhbmRsZXJfbGlzdF90YWJsZV9sb2NrOiBTeW5j
aHJvbml6ZXMgYWNjZXNzIHRvIElSUSB0YWJsZXMKICAqIEBiYWNrbGlnaHRfZGV2OiBCYWNrbGln
aHQgY29udHJvbCBkZXZpY2UKKyAqIEBiYWNrbGlnaHRfbGluazogTGluayBvbiB3aGljaCB0byBj
b250cm9sIGJhY2tsaWdodAorICogQGJhY2tsaWdodF9jYXBzOiBDYXBhYmlsaXRpZXMgb2YgdGhl
IGJhY2tsaWdodCBkZXZpY2UKKyAqIEBmcmVlc3luY19tb2R1bGU6IE1vZHVsZSBoYW5kbGluZyBm
cmVlc3luYyBjYWxjdWxhdGlvbnMKKyAqIEBmd19kbWN1OiBSZWZlcmVuY2UgdG8gRE1DVSBmaXJt
d2FyZQorICogQGRtY3VfZndfdmVyc2lvbjogVmVyc2lvbiBvZiB0aGUgRE1DVSBmaXJtd2FyZQor
ICogQHNvY19ib3VuZGluZ19ib3g6IFNPQyBib3VuZGluZyBib3ggdmFsdWVzIHByb3ZpZGVkIGJ5
IGdwdV9pbmZvIEZXCiAgKiBAY2FjaGVkX3N0YXRlOiBDYWNoZXMgZGV2aWNlIGF0b21pYyBzdGF0
ZSBmb3Igc3VzcGVuZC9yZXN1bWUKICAqIEBjb21wcmVzc29yOiBGcmFtZSBidWZmZXIgY29tcHJl
c3Npb24gYnVmZmVyLiBTZWUgJnN0cnVjdCBkbV9jb21yZXNzb3JfaW5mbwogICovCkBAIC0xMjUs
NyArMTMxLDcgQEAgc3RydWN0IGFtZGdwdV9kaXNwbGF5X21hbmFnZXIgewogCXUxNiBkaXNwbGF5
X2luZGV4ZXNfbnVtOwogCiAJLyoqCi0JICogQGF0b21pY19vYmoKKwkgKiBAYXRvbWljX29iajoK
IAkgKgogCSAqIEluIGNvbWJpbmF0aW9uIHdpdGggJmRtX2F0b21pY19zdGF0ZSBpdCBoZWxwcyBt
YW5hZ2UKIAkgKiBnbG9iYWwgYXRvbWljIHN0YXRlIHRoYXQgZG9lc24ndCBtYXAgY2xlYW5seSBp
bnRvIGV4aXN0aW5nCkBAIC0yMzEsNiArMjM3LDggQEAgc3RydWN0IGFtZGdwdV9kaXNwbGF5X21h
bmFnZXIgewogCXVpbnQzMl90IGRtY3VfZndfdmVyc2lvbjsKICNpZmRlZiBDT05GSUdfRFJNX0FN
RF9EQ19EQ04yXzAKIAkvKioKKwkgKiBAc29jX2JvdW5kaW5nX2JveDoKKwkgKgogCSAqIGdwdV9p
bmZvIEZXIHByb3ZpZGVkIHNvYyBib3VuZGluZyBib3ggc3RydWN0IG9yIDAgaWYgbm90CiAJICog
YXZhaWxhYmxlIGluIEZXCiAJICovCi0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
