Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FBF2E9F51
	for <lists+amd-gfx@lfdr.de>; Mon,  4 Jan 2021 22:08:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 791BC6E063;
	Mon,  4 Jan 2021 21:08:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2084.outbound.protection.outlook.com [40.107.237.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 954416E05D;
 Mon,  4 Jan 2021 21:08:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ehFTufcg0hqlG8k8c8NJ+7ALeda5h02BwheUWl5fN+swLJAXkTLrn18u2SCyUAQIBq0f5OsObYmQl67JE0jvSxNHBGClnC5ZhcnjV0V3RoNhhUbPpSASB019m8hyzP3vua/OE24yEizGpcveQ1wYmFs4oHhDA31jZE60VZUNlocT1LdkBbBWVulHOywTGYcWLG/GTzogaD0dW4G0f3BVVJAvgq2YwKg3HQ24/5mtgVWgy0MsXjhibAX5l52RoD9txffRWXR/cWh8cw0ojodkFm+ZmoYzE1rqviormAHc2bHaYksiAuCZIk4YruBzsYN9SFt9DeMPveXxU4+XtCKMaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5zqCRdcaAywgsVO+0Si1o8c7i9LRN8NHlDcA2s2SEZ0=;
 b=TvcDJ8/8z9fRRe4OV+aAusednH9badWWUH28XIqxR1Lpq6OUgJADDvaeSVl1iSIh+lSb/e26h/NCZrKr2sVyH5ePLrwUYZt4W+pUH8+dlJdPH9zNjADjl8QXzgrkNQoM2mqpOhaahT8akL/sdpXxr0x0+/GsnzxgQNWB7romu4/iIFXAlloyWxNekQ77B/RqXftQD4rTSqVCdsFj0yKgcMIpw1hlial3v4HoQxrE7iU0N3A6ltE7o6ivhe6nPyPrM531dpLYUYTEkmuH/4fi1nizweJs7LgKufmtk8XKFugfpi8rHlfYybq0PtKFvos3QHF0o9vO6FlATCPa93Bc3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5zqCRdcaAywgsVO+0Si1o8c7i9LRN8NHlDcA2s2SEZ0=;
 b=Qmx4Ur/ZXlId3z2DGrY/hfzNx6JDW6fyzkoYJunnEKPn+Xb+YtK4jiFXFK+REnZ1PsAuagF1SJBTORUpNo2M9ZKXiHUkpxV1eFHghoUFoPRfbLwQrAP0nyFUoIVVQdQvxR2D658l9JCHLLrF6Uy2shWvGamd/vQfUS6s+nxGWMk=
Received: from DM3PR12CA0049.namprd12.prod.outlook.com (2603:10b6:0:56::17) by
 CH2PR12MB3701.namprd12.prod.outlook.com (2603:10b6:610:23::27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3721.23; Mon, 4 Jan 2021 21:08:23 +0000
Received: from DM6NAM11FT040.eop-nam11.prod.protection.outlook.com
 (2603:10b6:0:56:cafe::25) by DM3PR12CA0049.outlook.office365.com
 (2603:10b6:0:56::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.19 via Frontend
 Transport; Mon, 4 Jan 2021 21:08:23 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none
 (message not signed) header.d=none;lists.freedesktop.org; dmarc=fail
 action=none header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 165.204.84.17 as permitted sender)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 DM6NAM11FT040.mail.protection.outlook.com (10.13.173.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3721.23 via Frontend Transport; Mon, 4 Jan 2021 21:08:22 +0000
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Mon, 4 Jan 2021
 15:08:20 -0600
Received: from elite-desk-aura.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1979.3 via
 Frontend Transport; Mon, 4 Jan 2021 15:08:19 -0600
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <nicholas.kazlauskas@amd.com>
Subject: [PATCH v3 2/3] drm/amd/display: Add freesync video modes based on
 preferred modes
Date: Mon, 4 Jan 2021 16:07:59 -0500
Message-ID: <20210104210800.789944-3-aurabindo.pillai@amd.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210104210800.789944-1-aurabindo.pillai@amd.com>
References: <20210104210800.789944-1-aurabindo.pillai@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45bf5b33-68c9-4aec-6695-08d8b0f4de64
X-MS-TrafficTypeDiagnostic: CH2PR12MB3701:
X-Microsoft-Antispam-PRVS: <CH2PR12MB37015CBD74DF839F30A4F9BF8BD20@CH2PR12MB3701.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XU1FD8WJwDqa/XdIkGJkDi+R8uMPQVW7j4Rwp1KYU/LlLV9dn5dSC0tt2VhSUPGssdBSbPottbS21D4efrJgAc9txsCO73RsXmZpwlgyel96iGaAsMh+JEOU3j9VyG0HQYMUSbXcoygIscRSEdUX7dFoZOY5piX8kvl81kjpvid4/xmCXZfvsV+Lddu0knCbIgRuBafZfC3/9cqQNau2caiJK9o6e0Lr2QN1ELCB0ARV3oR+yRGNUgzozk5SglWm+iZ/hRnIrWSnTsjhtKZCmPldQ5UvHbpBX//vvSuJE+h8IdTsytYWmTPJGwz31iNvAm+5LUrt6upGUJei1ezR5rtWeYIPLlV6jrcp3iMbvD1r4np0XI4PFgBhXcriX3+6gTVvTfBVSmgCVvDX7tLS6S2CiUQZLFCRnsvMRAX0vW2n3ivgq33YBAip8SNcYrPQ4iNsLB5YZvrNH4NDDKmOZg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB02.amd.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(4636009)(396003)(376002)(39860400002)(136003)(346002)(46966006)(8936002)(82310400003)(70586007)(5660300002)(86362001)(70206006)(2906002)(2616005)(44832011)(450100002)(356005)(1076003)(82740400003)(478600001)(8676002)(6636002)(186003)(26005)(36756003)(47076005)(54906003)(6666004)(336012)(316002)(83380400001)(81166007)(426003)(4326008)(110136005)(7696005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2021 21:08:22.1616 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45bf5b33-68c9-4aec-6695-08d8b0f4de64
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT040.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3701
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: stylon.wang@amd.com, thong.thai@amd.com, shashank.sharma@amd.com,
 aurabindo.pillai@amd.com, wayne.lin@amd.com, alexander.deucher@amd.com,
 Harry.Wentland@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W1doeSZIb3ddCklmIGV4cGVyaW1lbnRhbCBmcmVlc3luYyB2aWRlbyBtb2RlIG1vZHVsZSBwYXJh
bWV0ZXIgaXMgZW5hYmxlZCwgYWRkCmZldyBleHRyYSBkaXNwbGF5IG1vZGVzIGludG8gdGhlIGRy
aXZlcidzIG1vZGUgbGlzdCBjb3JyZXNwb25kaW5nIHRvIGNvbW1vbgp2aWRlbyBmcmFtZSByYXRl
cy4gV2hlbiB1c2Vyc3BhY2Ugc2V0cyB0aGVzZSBtb2Rlcywgbm8gbW9kZXNldCB3aWxsIGJlCnBl
cmZvcm1lZCAoaWYgY3VycmVudCBtb2RlIHdhcyBvbmUgb2YgZnJlZXN5bmMgbW9kZXMgb3IgdGhl
IGJhc2UgZnJlZXN5bmMgbW9kZQpiYXNlZCBvZmYgd2hpY2ggdGltaW5ncyBoYXZlIGJlZW4gZ2Vu
ZXJhdGVkIGZvciB0aGUgcmVzdCBvZiB0aGUgZnJlZXN5bmMgbW9kZXMpCnNpbmNlIHRoZXNlIG1v
ZGVzIG9ubHkgZGlmZmVyIGZyb20gdGhlIGJhc2UgbW9kZSB3aXRoIGZyb250IHBvcmNoIHRpbWlu
Zy4KClNpZ25lZC1vZmYtYnk6IEF1cmFiaW5kbyBQaWxsYWkgPGF1cmFiaW5kby5waWxsYWlAYW1k
LmNvbT4KQWNrZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNv
bT4KUmV2aWV3ZWQtYnk6IFNoYXNoYW5rIFNoYXJtYSA8c2hhc2hhbmsuc2hhcm1hQGFtZC5jb20+
Ci0tLQogLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgMTcw
ICsrKysrKysrKysrKysrKysrKwogLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2Ft
ZGdwdV9kbS5oIHwgICAyICsKIDIgZmlsZXMgY2hhbmdlZCwgMTcyIGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9k
bS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwpp
bmRleCAyNDViZDEyODRlNWYuLmFhZWYyZmI1MjhmZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCkBAIC01MTc0LDYgKzUxNzQsNTkg
QEAgc3RhdGljIHZvaWQgZG1fZW5hYmxlX3Blcl9mcmFtZV9jcnRjX21hc3Rlcl9zeW5jKHN0cnVj
dCBkY19zdGF0ZSAqY29udGV4dCkKIAlzZXRfbWFzdGVyX3N0cmVhbShjb250ZXh0LT5zdHJlYW1z
LCBjb250ZXh0LT5zdHJlYW1fY291bnQpOwogfQogCitzdGF0aWMgc3RydWN0IGRybV9kaXNwbGF5
X21vZGUgKgorZ2V0X2hpZ2hlc3RfcmVmcmVzaF9yYXRlX21vZGUoc3RydWN0IGFtZGdwdV9kbV9j
b25uZWN0b3IgKmFjb25uZWN0b3IsCisJCQkgIGJvb2wgdXNlX3Byb2JlZF9tb2RlcykKK3sKKwlz
dHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbSwgKm1fcHJlZiA9IE5VTEw7CisJdTE2IGN1cnJlbnRf
cmVmcmVzaCwgaGlnaGVzdF9yZWZyZXNoOworCXN0cnVjdCBsaXN0X2hlYWQgKmxpc3RfaGVhZCA9
IHVzZV9wcm9iZWRfbW9kZXMgPworCQkJCQkJICAgICZhY29ubmVjdG9yLT5iYXNlLnByb2JlZF9t
b2RlcyA6CisJCQkJCQkgICAgJmFjb25uZWN0b3ItPmJhc2UubW9kZXM7CisKKwlpZiAoYWNvbm5l
Y3Rvci0+ZnJlZXN5bmNfdmlkX2Jhc2UuY2xvY2sgIT0gMCkKKwkJcmV0dXJuICZhY29ubmVjdG9y
LT5mcmVlc3luY192aWRfYmFzZTsKKworCS8qIEZpbmQgdGhlIHByZWZlcnJlZCBtb2RlICovCisJ
bGlzdF9mb3JfZWFjaF9lbnRyeSAobSwgbGlzdF9oZWFkLCBoZWFkKSB7CisJCWlmIChtLT50eXBl
ICYgRFJNX01PREVfVFlQRV9QUkVGRVJSRUQpIHsKKwkJCW1fcHJlZiA9IG07CisJCQlicmVhazsK
KwkJfQorCX0KKworCWlmICghbV9wcmVmKSB7CisJCS8qIFByb2JhYmx5IGFuIEVESUQgd2l0aCBu
byBwcmVmZXJyZWQgbW9kZS4gRmFsbGJhY2sgdG8gZmlyc3QgZW50cnkgKi8KKwkJbV9wcmVmID0g
bGlzdF9maXJzdF9lbnRyeV9vcl9udWxsKAorCQkJJmFjb25uZWN0b3ItPmJhc2UubW9kZXMsIHN0
cnVjdCBkcm1fZGlzcGxheV9tb2RlLCBoZWFkKTsKKwkJaWYgKCFtX3ByZWYpIHsKKwkJCURSTV9E
RUJVR19EUklWRVIoIk5vIHByZWZlcnJlZCBtb2RlIGZvdW5kIGluIEVESURcbiIpOworCQkJcmV0
dXJuIE5VTEw7CisJCX0KKwl9CisKKwloaWdoZXN0X3JlZnJlc2ggPSBkcm1fbW9kZV92cmVmcmVz
aChtX3ByZWYpOworCisJLyoKKwkgKiBGaW5kIHRoZSBtb2RlIHdpdGggaGlnaGVzdCByZWZyZXNo
IHJhdGUgd2l0aCBzYW1lIHJlc29sdXRpb24uCisJICogRm9yIHNvbWUgbW9uaXRvcnMsIHByZWZl
cnJlZCBtb2RlIGlzIG5vdCB0aGUgbW9kZSB3aXRoIGhpZ2hlc3QKKwkgKiBzdXBwb3J0ZWQgcmVm
cmVzaCByYXRlLgorCSAqLworCWxpc3RfZm9yX2VhY2hfZW50cnkgKG0sIGxpc3RfaGVhZCwgaGVh
ZCkgeworCQljdXJyZW50X3JlZnJlc2ggID0gZHJtX21vZGVfdnJlZnJlc2gobSk7CisKKwkJaWYg
KG0tPmhkaXNwbGF5ID09IG1fcHJlZi0+aGRpc3BsYXkgJiYKKwkJICAgIG0tPnZkaXNwbGF5ID09
IG1fcHJlZi0+dmRpc3BsYXkgJiYKKwkJICAgIGhpZ2hlc3RfcmVmcmVzaCA8IGN1cnJlbnRfcmVm
cmVzaCkgeworCQkJaGlnaGVzdF9yZWZyZXNoID0gY3VycmVudF9yZWZyZXNoOworCQkJbV9wcmVm
ID0gbTsKKwkJfQorCX0KKworCWFjb25uZWN0b3ItPmZyZWVzeW5jX3ZpZF9iYXNlID0gKm1fcHJl
ZjsKKwlyZXR1cm4gbV9wcmVmOworfQorCiBzdGF0aWMgc3RydWN0IGRjX3N0cmVhbV9zdGF0ZSAq
CiBjcmVhdGVfc3RyZWFtX2Zvcl9zaW5rKHN0cnVjdCBhbWRncHVfZG1fY29ubmVjdG9yICphY29u
bmVjdG9yLAogCQkgICAgICAgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKmRybV9tb2Rl
LApAQCAtNjk5OSw2ICs3MDUyLDEyMiBAQCBzdGF0aWMgdm9pZCBhbWRncHVfZG1fY29ubmVjdG9y
X2RkY19nZXRfbW9kZXMoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciwKIAl9CiB9CiAK
K3N0YXRpYyBib29sIGlzX2R1cGxpY2F0ZV9tb2RlKHN0cnVjdCBhbWRncHVfZG1fY29ubmVjdG9y
ICphY29ubmVjdG9yLAorCQkJICAgICAgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUpCit7
CisJc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm07CisKKwlsaXN0X2Zvcl9lYWNoX2VudHJ5ICht
LCAmYWNvbm5lY3Rvci0+YmFzZS5wcm9iZWRfbW9kZXMsIGhlYWQpIHsKKwkJaWYgKGRybV9tb2Rl
X2VxdWFsKG0sIG1vZGUpKQorCQkJcmV0dXJuIHRydWU7CisJfQorCisJcmV0dXJuIGZhbHNlOwor
fQorCitzdGF0aWMgdWludCBhZGRfZnNfbW9kZXMoc3RydWN0IGFtZGdwdV9kbV9jb25uZWN0b3Ig
KmFjb25uZWN0b3IsCisJCQkgc3RydWN0IGRldGFpbGVkX2RhdGFfbW9uaXRvcl9yYW5nZSAqcmFu
Z2UpCit7CisJY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm07CisJc3RydWN0IGRybV9k
aXNwbGF5X21vZGUgKm5ld19tb2RlOworCXVpbnQgaTsKKwl1aW50MzJfdCBuZXdfbW9kZXNfY291
bnQgPSAwOworCisJLyogU3RhbmRhcmQgRlBTIHZhbHVlcworCSAqCisJICogMjMuOTc2ICAgLSBU
Vi9OVFNDCisJICogMjQgCSAgICAtIENpbmVtYQorCSAqIDI1IAkgICAgLSBUVi9QQUwKKwkgKiAy
OS45NyAgICAtIFRWL05UU0MKKwkgKiAzMCAJICAgIC0gVFYvTlRTQworCSAqIDQ4IAkgICAgLSBD
aW5lbWEgSEZSCisJICogNTAgCSAgICAtIFRWL1BBTAorCSAqIDYwIAkgICAgLSBDb21tb25seSB1
c2VkCisJICogNDgsNzIsOTYgLSBNdWx0aXBsZXMgb2YgMjQKKwkgKi8KKwljb25zdCB1aW50MzJf
dCBjb21tb25fcmF0ZXNbXSA9IHsgMjM5NzYsIDI0MDAwLCAyNTAwMCwgMjk5NzAsIDMwMDAwLAor
CQkJCQkgNDgwMDAsIDUwMDAwLCA2MDAwMCwgNzIwMDAsIDk2MDAwIH07CisKKwkvKgorCSAqIEZp
bmQgbW9kZSB3aXRoIGhpZ2hlc3QgcmVmcmVzaCByYXRlIHdpdGggdGhlIHNhbWUgcmVzb2x1dGlv
bgorCSAqIGFzIHRoZSBwcmVmZXJyZWQgbW9kZS4gU29tZSBtb25pdG9ycyByZXBvcnQgYSBwcmVm
ZXJyZWQgbW9kZQorCSAqIHdpdGggbG93ZXIgcmVzb2x1dGlvbiB0aGFuIHRoZSBoaWdoZXN0IHJl
ZnJlc2ggcmF0ZSBzdXBwb3J0ZWQuCisJICovCisKKwltID0gZ2V0X2hpZ2hlc3RfcmVmcmVzaF9y
YXRlX21vZGUoYWNvbm5lY3RvciwgdHJ1ZSk7CisJaWYgKCFtKQorCQlyZXR1cm4gMDsKKworCWZv
ciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpFKGNvbW1vbl9yYXRlcyk7IGkrKykgeworCQl1aW50NjRf
dCB0YXJnZXRfdnRvdGFsLCB0YXJnZXRfdnRvdGFsX2RpZmY7CisJCXVpbnQ2NF90IG51bSwgZGVu
OworCisJCWlmIChkcm1fbW9kZV92cmVmcmVzaChtKSAqIDEwMDAgPCBjb21tb25fcmF0ZXNbaV0p
CisJCQljb250aW51ZTsKKworCQlpZiAoY29tbW9uX3JhdGVzW2ldIDwgcmFuZ2UtPm1pbl92ZnJl
cSAqIDEwMDApCisJCQljb250aW51ZTsKKworCQludW0gPSAodW5zaWduZWQgbG9uZyBsb25nKW0t
PmNsb2NrICogMTAwMCAqIDEwMDA7CisJCWRlbiA9IGNvbW1vbl9yYXRlc1tpXSAqICh1bnNpZ25l
ZCBsb25nIGxvbmcpbS0+aHRvdGFsOworCQl0YXJnZXRfdnRvdGFsID0gZGl2X3U2NChudW0sIGRl
bik7CisJCXRhcmdldF92dG90YWxfZGlmZiA9IHRhcmdldF92dG90YWwgLSBtLT52dG90YWw7CisK
KwkJLyogQ2hlY2sgZm9yIGlsbGVnYWwgbW9kZXMgKi8KKwkJaWYgKG0tPnZzeW5jX3N0YXJ0ICsg
dGFyZ2V0X3Z0b3RhbF9kaWZmIDwgbS0+dmRpc3BsYXkgfHwKKwkJICAgIG0tPnZzeW5jX2VuZCAr
IHRhcmdldF92dG90YWxfZGlmZiA8IG0tPnZzeW5jX3N0YXJ0IHx8CisJCSAgICBtLT52dG90YWwg
KyB0YXJnZXRfdnRvdGFsX2RpZmYgPCBtLT52c3luY19lbmQpCisJCQljb250aW51ZTsKKworCQlu
ZXdfbW9kZSA9IGRybV9tb2RlX2R1cGxpY2F0ZShhY29ubmVjdG9yLT5iYXNlLmRldiwgbSk7CisJ
CWlmICghbmV3X21vZGUpCisJCQlnb3RvIG91dDsKKworCQluZXdfbW9kZS0+dnRvdGFsICs9ICh1
MTYpdGFyZ2V0X3Z0b3RhbF9kaWZmOworCQluZXdfbW9kZS0+dnN5bmNfc3RhcnQgKz0gKHUxNil0
YXJnZXRfdnRvdGFsX2RpZmY7CisJCW5ld19tb2RlLT52c3luY19lbmQgKz0gKHUxNil0YXJnZXRf
dnRvdGFsX2RpZmY7CisJCW5ld19tb2RlLT50eXBlICY9IH5EUk1fTU9ERV9UWVBFX1BSRUZFUlJF
RDsKKwkJbmV3X21vZGUtPnR5cGUgfD0gRFJNX01PREVfVFlQRV9EUklWRVI7CisKKwkJaWYgKCFp
c19kdXBsaWNhdGVfbW9kZShhY29ubmVjdG9yLCBuZXdfbW9kZSkpIHsKKwkJCWRybV9tb2RlX3By
b2JlZF9hZGQoJmFjb25uZWN0b3ItPmJhc2UsIG5ld19tb2RlKTsKKwkJCW5ld19tb2Rlc19jb3Vu
dCArPSAxOworCQl9IGVsc2UKKwkJCWRybV9tb2RlX2Rlc3Ryb3koYWNvbm5lY3Rvci0+YmFzZS5k
ZXYsIG5ld19tb2RlKTsKKwl9Cisgb3V0OgorCXJldHVybiBuZXdfbW9kZXNfY291bnQ7Cit9CisK
K3N0YXRpYyB2b2lkIGFtZGdwdV9kbV9jb25uZWN0b3JfYWRkX2ZyZWVzeW5jX21vZGVzKHN0cnVj
dCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsCisJCQkJCQkgICBzdHJ1Y3QgZWRpZCAqZWRpZCkK
K3sKKwl1aW50OF90IGk7CisJc3RydWN0IGRldGFpbGVkX3RpbWluZyAqdGltaW5nOworCXN0cnVj
dCBkZXRhaWxlZF9ub25fcGl4ZWwgKmRhdGE7CisJc3RydWN0IGRldGFpbGVkX2RhdGFfbW9uaXRv
cl9yYW5nZSAqcmFuZ2U7CisJc3RydWN0IGFtZGdwdV9kbV9jb25uZWN0b3IgKmFtZGdwdV9kbV9j
b25uZWN0b3IgPQorCQl0b19hbWRncHVfZG1fY29ubmVjdG9yKGNvbm5lY3Rvcik7CisKKwlpZiAo
IShhbWRncHVfZXhwX2ZyZWVzeW5jX3ZpZF9tb2RlICYmIGVkaWQpKQorCQlyZXR1cm47CisKKwlp
ZiAoZWRpZC0+dmVyc2lvbiA9PSAxICYmIGVkaWQtPnJldmlzaW9uID4gMSkgeworCQlmb3IgKGkg
PSAwOyBpIDwgNDsgaSsrKSB7CisJCQl0aW1pbmcgPSAmZWRpZC0+ZGV0YWlsZWRfdGltaW5nc1tp
XTsKKwkJCWRhdGEgPSAmdGltaW5nLT5kYXRhLm90aGVyX2RhdGE7CisJCQlyYW5nZSA9ICZkYXRh
LT5kYXRhLnJhbmdlOworCisJCQkvKiBDaGVjayBpZiBtb25pdG9yIGhhcyBjb250aW51b3VzIGZy
ZXF1ZW5jeSBtb2RlICovCisJCQlpZiAoZGF0YS0+dHlwZSA9PSBFRElEX0RFVEFJTF9NT05JVE9S
X1JBTkdFICYmCisJCQkgICAgcmFuZ2UtPm1heF92ZnJlcSAtIHJhbmdlLT5taW5fdmZyZXEgPiAx
MCkgeworCQkJCWFtZGdwdV9kbV9jb25uZWN0b3ItPm51bV9tb2RlcyArPSBhZGRfZnNfbW9kZXMo
YW1kZ3B1X2RtX2Nvbm5lY3RvciwgcmFuZ2UpOworCQkJCWJyZWFrOworCQkJfQorCQl9CisJfQor
fQorCiBzdGF0aWMgaW50IGFtZGdwdV9kbV9jb25uZWN0b3JfZ2V0X21vZGVzKHN0cnVjdCBkcm1f
Y29ubmVjdG9yICpjb25uZWN0b3IpCiB7CiAJc3RydWN0IGFtZGdwdV9kbV9jb25uZWN0b3IgKmFt
ZGdwdV9kbV9jb25uZWN0b3IgPQpAQCAtNzAxNCw2ICs3MTgzLDcgQEAgc3RhdGljIGludCBhbWRn
cHVfZG1fY29ubmVjdG9yX2dldF9tb2RlcyhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9y
KQogCX0gZWxzZSB7CiAJCWFtZGdwdV9kbV9jb25uZWN0b3JfZGRjX2dldF9tb2Rlcyhjb25uZWN0
b3IsIGVkaWQpOwogCQlhbWRncHVfZG1fY29ubmVjdG9yX2FkZF9jb21tb25fbW9kZXMoZW5jb2Rl
ciwgY29ubmVjdG9yKTsKKwkJYW1kZ3B1X2RtX2Nvbm5lY3Rvcl9hZGRfZnJlZXN5bmNfbW9kZXMo
Y29ubmVjdG9yLCBlZGlkKTsKIAl9CiAJYW1kZ3B1X2RtX2ZiY19pbml0KGNvbm5lY3Rvcik7CiAK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1
X2RtLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5o
CmluZGV4IGM5ZDgyYjllNGQ3ZS4uM2VhODViZTljNTQ2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5oCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmgKQEAgLTQzMiw2ICs0MzIsOCBA
QCBzdHJ1Y3QgYW1kZ3B1X2RtX2Nvbm5lY3RvciB7CiAjZW5kaWYKIAlib29sIGZvcmNlX3l1djQy
MF9vdXRwdXQ7CiAJc3RydWN0IGRzY19wcmVmZXJyZWRfc2V0dGluZ3MgZHNjX3NldHRpbmdzOwor
CS8qIENhY2hlZCBkaXNwbGF5IG1vZGVzICovCisJc3RydWN0IGRybV9kaXNwbGF5X21vZGUgZnJl
ZXN5bmNfdmlkX2Jhc2U7CiB9OwogCiAjZGVmaW5lIHRvX2FtZGdwdV9kbV9jb25uZWN0b3IoeCkg
Y29udGFpbmVyX29mKHgsIHN0cnVjdCBhbWRncHVfZG1fY29ubmVjdG9yLCBiYXNlKQotLSAKMi4z
MC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngK
