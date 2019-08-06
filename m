Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE8D82FC1
	for <lists+amd-gfx@lfdr.de>; Tue,  6 Aug 2019 12:33:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62C7E6E351;
	Tue,  6 Aug 2019 10:33:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790079.outbound.protection.outlook.com [40.107.79.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E5DC6E351
 for <amd-gfx@lists.freedesktop.org>; Tue,  6 Aug 2019 10:32:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VkWUHFVTLa2aaw4ZLfYaTTv1mMGRDJ2WUt4fZRoKhSYY6NDsdLZ6TUMhSPA4lULNiUl57fif5WtpeKuqIoqvFxLz5TZc3TBx6yQ5uvX9wZnjRN5MjqsVzhTCOVaqla7UdqXGFr/jLBhwvdxbORtvOAJVMqD/ywH/15m823hHk2iDu0RtxJ6WRIsGVYmfKJT/+VETagHoOLqwav1neZSSg4vWhV+kCcV+hhGyvW1Kcstf4aiiLJSCCgRdzkQ2x8jiu3dKm+luPpNpI0POtHN4ELbh76BltzTKCGDpHZjQBedPnujGcAwKzLSiTHzOLS2LqydCF3tpLySlj6gw4LaDFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dzAXGpSTkbbExFeOoqJkDsCFO2FrfxE8FI4e1WDjUU8=;
 b=RpZcgzbJpFl9P+IJPUXrKgIttYaMdKqAzmQJTjCE7E0Ugfw9CEqEs2GQxEyj3tTUvclSw3p+PPf534HOfL3Ev2EOQagADXIHoW2hDiIyDbjQI/0YwQTROIPqWm9dPZN9aR9izsS3gv7n2wNlIKP0CaSsWTbWfhPRt75uLZbq2Nsm36f/jQMrYZxoAYtctld4fW/5/sIMa5jaQNZAVmGdiQCMrIAHfTWEEjB3N5ZASqsRxEMQzc5BjuzFnBdhNbX9pefnCJIGllFX6xEaiTvZif+tlhtifbiL7kh7H6HK7xAhy5rc4VighqFce8oyi+V2WKuXwv6F8QF6MW2X1fei3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM3PR12CA0049.namprd12.prod.outlook.com (2603:10b6:0:56::17) by
 BN7PR12MB2708.namprd12.prod.outlook.com (2603:10b6:408:21::25) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.14; Tue, 6 Aug 2019 10:32:56 +0000
Received: from CO1NAM03FT035.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::208) by DM3PR12CA0049.outlook.office365.com
 (2603:10b6:0:56::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.15 via Frontend
 Transport; Tue, 6 Aug 2019 10:32:55 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT035.mail.protection.outlook.com (10.152.80.179) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2136.14 via Frontend Transport; Tue, 6 Aug 2019 10:32:55 +0000
Received: from taozhou1u2.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Tue, 6 Aug 2019
 05:32:54 -0500
From: Tao Zhou <tao.zhou1@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <alexander.deucher@amd.com>,
 <hawking.zhang@amd.com>, <dennis.li@amd.com>, <broonie@kernel.org>
Subject: [PATCH] drm/amdgpu: fix compile error about readq/writeq on arm ARCH
Date: Tue, 6 Aug 2019 18:31:56 +0800
Message-ID: <20190806103156.3778-1-tao.zhou1@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(39860400002)(396003)(136003)(2980300002)(428003)(199004)(189003)(70586007)(48376002)(70206006)(86362001)(8936002)(316002)(305945005)(81156014)(26005)(81166006)(186003)(68736007)(1076003)(53416004)(486006)(5660300002)(47776003)(36756003)(8676002)(51416003)(7696005)(50226002)(50466002)(4744005)(2616005)(476003)(126002)(53936002)(336012)(54906003)(356004)(426003)(2906002)(16586007)(478600001)(2201001)(110136005)(4326008)(2101003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR12MB2708; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e804145-08ce-4a84-62b6-08d71a59719d
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BN7PR12MB2708; 
X-MS-TrafficTypeDiagnostic: BN7PR12MB2708:
X-Microsoft-Antispam-PRVS: <BN7PR12MB27084DA08DC9552B7237B40EB0D50@BN7PR12MB2708.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:386;
X-Forefront-PRVS: 0121F24F22
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 6pTUcoNUBVv5Ae7rpBHXaaa/xWecxGRsqTrDLEfxET1jbNeB3KChoOAjIkFPEkxXC/qDSPJGdvmXYz0BkJfpWK9Gf2xHE5mDxkgfrJQDQpUE/AJy7L+H5EwB3oPmwm9rEKNVG+VnbB2lLkqU0METR8FnbL0aoVN+QKx9ORIGijd5vXXANnf/EfXj+EgChfJYnAYJgfVDnGH5Xxy5Xs/kPF+FSUeCMNU6Cqb2ocC5CIJ+vkBhxLGZ0MCj3r1JfpTDf56SbB3UaZDudo4LONv08bvEAOyBJhfxQyskiGqmgFaJ6V2An7Tq6y+6L8jU8Vl+iwOtCeGX83I8DHmWhQdPk6dUByuRSXy4d0bl3EjaKRosHvLeHFhpDyxTmfbyAJ39je9pD4b0OoV776jR3w9Ta2q1YwbzWHSJF2+k29h2bHk=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2019 10:32:55.4717 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e804145-08ce-4a84-62b6-08d71a59719d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2708
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dzAXGpSTkbbExFeOoqJkDsCFO2FrfxE8FI4e1WDjUU8=;
 b=O3CnbVdPSC2O80WmMJbD0tX+wRjMUKEclQuJovsOdCMpQRbd99Z0PyuP+XrQxbNVRfTqdTZ04YsDhEGaRwLrd9AAK/kMEXlnLb4OTxSz7AfZDs+kkDvCsF2ofD/mmf+Nyw9jEVvEZg2hNPX8yn72OjSiT1kCgOjavMe11+rrXgs=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is
 165.204.84.17)
 smtp.mailfrom=amd.com; lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=permerror action=none
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
Cc: Tao Zhou <tao.zhou1@amd.com>, linux-next@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel-build-reports@lists.linaro.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

cmVhZHEvd3JpdGVxIGNhbid0IGJlIGZvdW5kIG9uIGFybSBhcmNoaXRlY3R1cmUsIGltcGxlbWVu
dCB0aGVtCndpdGggMzIgYml0cyBvcGVyYXRpb25zCgpTaWduZWQtb2ZmLWJ5OiBUYW8gWmhvdSA8
dGFvLnpob3UxQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2RldmljZS5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKaW5kZXggZjYyZDRmMzBlODEwLi5h
YWY3ZjMxY2Y4ZGYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9kZXZpY2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNl
LmMKQEAgLTI5LDYgKzI5LDcgQEAKICNpbmNsdWRlIDxsaW51eC9rdGhyZWFkLmg+CiAjaW5jbHVk
ZSA8bGludXgvY29uc29sZS5oPgogI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KKyNpbmNsdWRlIDxs
aW51eC9pby02NC1ub25hdG9taWMtbG8taGkuaD4KICNpbmNsdWRlIDxkcm0vZHJtUC5oPgogI2lu
Y2x1ZGUgPGRybS9kcm1fYXRvbWljX2hlbHBlci5oPgogI2luY2x1ZGUgPGRybS9kcm1fcHJvYmVf
aGVscGVyLmg+Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA==
