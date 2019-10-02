Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D965DC907B
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Oct 2019 20:16:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B2DE6E15A;
	Wed,  2 Oct 2019 18:16:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760072.outbound.protection.outlook.com [40.107.76.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDD526E15C
 for <amd-gfx@lists.freedesktop.org>; Wed,  2 Oct 2019 18:16:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g94gxom8c4hDYo/9JA6r7I3XDksGF0AwoRMM8oTXKDkAGtSJpk2sjvCD/BsWyvMvwqOFODGFZ6CWRy5lP/PWnZnO7ChJ9o2GGvhtiXWCLu2uN+My24XpyFtJ0JntFFqvzj/SY2VOYhXuuHJI1bXurr8IQn2m0FSamxWjZ/LE6OCQ2/ZyMT7YvBy6tr5a69/QZfn8WNQxLUkRkQttz9ENe+Wg30jFN8lJbYQhCeQvEkQGvJiQsgpsFUDA1X4CIUCp57rhdvwdAzL/zx3UDyWRCDXlN+7Wh9AFmx/CYTZJyomV+WVQS2GxyEjHNTKCuYBpgUUfZiQe6KXKJWJwygRXIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qkMb1x/ZeXIU1gq+joCU3z+hKhiH7E0gmmTHA7QdDhI=;
 b=oO8SohuuYy59rCfE/xTNVxZzsbaXQYLBUHpcdUnkqe0zPEKpcI5sDwh72U2F32EoFnNKa90vnk5agOfrvx4uECMP4LiJvox8twePA/sLIJB1UN/oy5y96dG+pObuDRRmoA1mv8oo0fRdWYs/rdfSAckZxikuOGbTTNyr0h0Ugagb2J0+pAr67T2mJQI9KjdWG6u+rL/2qvRU0kJ3uDxa2cZoZOVUtnJpo7mkMhoTTaEnhoImrkV+cxUROuHAB1XR5dSz5r9Y5VZvcbjpzPxcM9bjDd1vVumIRGZyMGHthIq+FObSAtMGcGYCa9yARClI3/WJHEcPFimUF7mTDWDVsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0131.namprd12.prod.outlook.com (2603:10b6:0:51::27) by
 BYAPR12MB3191.namprd12.prod.outlook.com (2603:10b6:a03:134::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.20; Wed, 2 Oct
 2019 18:16:37 +0000
Received: from DM3NAM03FT053.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::200) by DM3PR12CA0131.outlook.office365.com
 (2603:10b6:0:51::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.15 via Frontend
 Transport; Wed, 2 Oct 2019 18:16:37 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT053.mail.protection.outlook.com (10.152.83.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Wed, 2 Oct 2019 18:16:36 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 2 Oct 2019
 13:16:36 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 02/38] drm/amd/display: Correct values in AVI infoframe
Date: Wed, 2 Oct 2019 14:15:57 -0400
Message-ID: <20191002181633.22805-3-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191002181633.22805-1-Bhawanpreet.Lakha@amd.com>
References: <20191002181633.22805-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(39860400002)(396003)(376002)(428003)(199004)(189003)(5660300002)(6666004)(11346002)(305945005)(356004)(26005)(51416003)(76176011)(7696005)(2906002)(186003)(126002)(476003)(486006)(316002)(426003)(86362001)(47776003)(446003)(8936002)(81166006)(2616005)(81156014)(16586007)(53416004)(8676002)(70206006)(70586007)(36756003)(1076003)(48376002)(2351001)(4326008)(6916009)(478600001)(50466002)(336012)(50226002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3191; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 78904f5b-efe1-45f3-79f6-08d74764a9eb
X-MS-TrafficTypeDiagnostic: BYAPR12MB3191:
X-Microsoft-Antispam-PRVS: <BYAPR12MB319175343843526B9174E6F3F99C0@BYAPR12MB3191.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 0178184651
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CiAvk2UMU/h2KkSuYNUjjfJHPCGbCms5K3Xbm5xKYzO3Wl35pDsmPu9FNwdGEtNB+GiDSp8w9ya90eIufZ30ZARvq1VsjfIoFl08eVhZA22l3JYJvI1JDJF0eKBKi53pFUPZHIs+ZU5GusRKFh7g8n+SbSPcg1woyOGuVTW2/NdiJEChc/EB+KvJ7rpsPDI1e17Zmz+0sK6YMzWfzR0Ue9eMZKx4dtFD07BXl4C34/RejWDGCLbWitSHx3VjKvarsYIJySAtwfRp63imtF8bp3Fnck0vLigohB0ULmc2ljmArS7E/oaAw90QIi2uAp0wBPCC8v+iXm7Sx034AWMD8y+KGc6eu6ObyC0TyXt+fUdlE/qRff7P/yLzBaEoey1+dlxFzJUlK476MVlpBP22PJim/pQmDZZ2rfSAp9/P+1U=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2019 18:16:36.8307 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78904f5b-efe1-45f3-79f6-08d74764a9eb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3191
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qkMb1x/ZeXIU1gq+joCU3z+hKhiH7E0gmmTHA7QdDhI=;
 b=NgOeyOoe9Dad1OZKXLDRP8D/KAyt9KUdwdUOPBc8M3VvV0g8mOV7/DJAIS7IouIYgh0/lWJzfbB0vnqix3mFkydKYYFgfaT3+pAccVqDxGDEGfHKs8kpsLdJn8XTqeQyG2ukmSq+Hwn0xTLImgbLHVVZqHoeGbX0lwByYf40AkM=
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
Cc: Wayne Lin <Wayne.Lin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogV2F5bmUgTGluIDxXYXluZS5MaW5AYW1kLmNvbT4KCltXaHldCldoaWxlIGRpc3BsYXlp
bmcgNGsgbW9kZXMgZGVmaW5lZCBpbiBIRE1JMS40Yiwgc2hvdWxkIHNldCBWSUMgdG8gMAphbmQg
dXNlIFZTUCBIRE1JX1ZJQyB0byBpbmRpY2F0ZSB0aGUgbW9kZS4KCltIb3ddClVzZSBmdW5jdGlv
bnMgZGVmaW5lZCBpbiBkcm0gdG8gc2V0IHVwIHRoZSBWSUMgY29ycmVzcG9uZGluZ2x5LgoKQ2hh
bmdlLUlkOiBJYjg1Y2U3YmFjZDZkN2YyNmI3NjVkZDk3MGVjOGMwMjRmZTYzMGEyMQpTaWduZWQt
b2ZmLWJ5OiBXYXluZSBMaW4gPFdheW5lLkxpbkBhbWQuY29tPgpSZXZpZXdlZC1ieTogTmljaG9s
YXMgS2F6bGF1c2thcyA8TmljaG9sYXMuS2F6bGF1c2thc0BhbWQuY29tPgpBY2tlZC1ieTogQmhh
d2FucHJlZXQgTGFraGEgPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyB8IDkgKysrKysrKysrCiAx
IGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKaW5kZXggYmRhYjNmN2RiNzMyLi5hZDM5
ZGM1MmFhOTggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVf
ZG0vYW1kZ3B1X2RtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9k
bS9hbWRncHVfZG0uYwpAQCAtMzQ2OCw2ICszNDY4LDggQEAgc3RhdGljIHZvaWQgZmlsbF9zdHJl
YW1fcHJvcGVydGllc19mcm9tX2RybV9kaXNwbGF5X21vZGUoCiAJc3RydWN0IGRjX2NydGNfdGlt
aW5nICp0aW1pbmdfb3V0ID0gJnN0cmVhbS0+dGltaW5nOwogCWNvbnN0IHN0cnVjdCBkcm1fZGlz
cGxheV9pbmZvICppbmZvID0gJmNvbm5lY3Rvci0+ZGlzcGxheV9pbmZvOwogCXN0cnVjdCBhbWRn
cHVfZG1fY29ubmVjdG9yICphY29ubmVjdG9yID0gdG9fYW1kZ3B1X2RtX2Nvbm5lY3Rvcihjb25u
ZWN0b3IpOworCXN0cnVjdCBoZG1pX3ZlbmRvcl9pbmZvZnJhbWUgaHZfZnJhbWU7CisJc3RydWN0
IGhkbWlfYXZpX2luZm9mcmFtZSBhdmlfZnJhbWU7CiAJbWVtc2V0KHRpbWluZ19vdXQsIDAsIHNp
emVvZihzdHJ1Y3QgZGNfY3J0Y190aW1pbmcpKTsKIAogCXRpbWluZ19vdXQtPmhfYm9yZGVyX2xl
ZnQgPSAwOwpAQCAtMzUwNSw2ICszNTA3LDEzIEBAIHN0YXRpYyB2b2lkIGZpbGxfc3RyZWFtX3By
b3BlcnRpZXNfZnJvbV9kcm1fZGlzcGxheV9tb2RlKAogCQkJdGltaW5nX291dC0+ZmxhZ3MuVlNZ
TkNfUE9TSVRJVkVfUE9MQVJJVFkgPSAxOwogCX0KIAorCWlmIChzdHJlYW0tPnNpZ25hbCA9PSBT
SUdOQUxfVFlQRV9IRE1JX1RZUEVfQSkgeworCQlkcm1faGRtaV9hdmlfaW5mb2ZyYW1lX2Zyb21f
ZGlzcGxheV9tb2RlKCZhdmlfZnJhbWUsIChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqKWNvbm5lY3Rv
ciwgbW9kZV9pbik7CisJCXRpbWluZ19vdXQtPnZpYyA9IGF2aV9mcmFtZS52aWRlb19jb2RlOwor
CQlkcm1faGRtaV92ZW5kb3JfaW5mb2ZyYW1lX2Zyb21fZGlzcGxheV9tb2RlKCZodl9mcmFtZSwg
KHN0cnVjdCBkcm1fY29ubmVjdG9yICopY29ubmVjdG9yLCBtb2RlX2luKTsKKwkJdGltaW5nX291
dC0+aGRtaV92aWMgPSBodl9mcmFtZS52aWM7CisJfQorCiAJdGltaW5nX291dC0+aF9hZGRyZXNz
YWJsZSA9IG1vZGVfaW4tPmNydGNfaGRpc3BsYXk7CiAJdGltaW5nX291dC0+aF90b3RhbCA9IG1v
ZGVfaW4tPmNydGNfaHRvdGFsOwogCXRpbWluZ19vdXQtPmhfc3luY193aWR0aCA9Ci0tIAoyLjE3
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
