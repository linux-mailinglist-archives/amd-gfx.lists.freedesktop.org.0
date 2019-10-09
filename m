Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6109DD1A99
	for <lists+amd-gfx@lfdr.de>; Wed,  9 Oct 2019 23:06:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7139D6EA73;
	Wed,  9 Oct 2019 21:06:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740058.outbound.protection.outlook.com [40.107.74.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C70D6EA67
 for <amd-gfx@lists.freedesktop.org>; Wed,  9 Oct 2019 21:06:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bDftgh+FBmuIO2xsB327vXB5HgUrhhfl5CDIc5hmFs6a7Z3Pw8E76DVfbZe9cyE2lxi71IK+sSoIkxs30cBfIJFer44UrFdsAgi65V7KBUMc8j74GGYdOl8aoDhDHMPUlTjWBBzujAudlr946Sd2CDGR4gVfH5a7BpyePnktg8xotxbyOGp0FD+4mWwzhtA12+wiNROGm3k75ehKHVvyoVBXhxl/6Lhs+Mz/Jjw1EWMHwHatdzQOODGwNj468J9UhcSJpST4Z+BUFn7bFU/PNS+6gjvq8WwhrXoL+1wzRvDmerFxgD1Bc3WY5Lf7pdvuvmSfeWrQjXKP8lV7mwHVkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WuCY/L2ej1Py0opKp+y5vuK/PFlGzucnZ4yC3vvkI4s=;
 b=RZAposfruau5urBG1N2xo0aYrOAJDMVcrDbpiCKm8v5nS06bNrMZIuPudbF7sbEq/DCIfjLO/FQeaF3/9hHO/oZKJrR0kgaqvcoqTAXAaOmmieFEglZGhqfs+HuuERZJyWrt2dLfvvfKhvMvhtcrAAbiWincQ7BXjggTmsi4KdmAmKCOkjCvhldsaTVhI38lDCc++U3hSFfLRlp+uKDZ9q5pAguuTuZ4ARUs/U4TJYKisG4CfXxB5chZlrVtUv7Txx6UMt0blpxSWi5PbUWwf0l8847CZMhZbIq21EnfdUcND6HnoxxvCOBgZU+TJWQRLmDaHZx3L0ZMcP7Gv0/yIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM6PR12CA0009.namprd12.prod.outlook.com (2603:10b6:5:1c0::22)
 by DM6PR12MB3244.namprd12.prod.outlook.com (2603:10b6:5:186::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.17; Wed, 9 Oct
 2019 21:06:31 +0000
Received: from DM3NAM03FT032.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::208) by DM6PR12CA0009.outlook.office365.com
 (2603:10b6:5:1c0::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Wed, 9 Oct 2019 21:06:31 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT032.mail.protection.outlook.com (10.152.82.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Wed, 9 Oct 2019 21:06:31 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 9 Oct 2019
 16:06:31 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 25/26] drm/amd/display: enable smu set dcfclk
Date: Wed, 9 Oct 2019 17:06:12 -0400
Message-ID: <20191009210613.17929-26-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191009210613.17929-1-Bhawanpreet.Lakha@amd.com>
References: <20191009210613.17929-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(136003)(396003)(39860400002)(428003)(189003)(199004)(186003)(2351001)(16586007)(446003)(36756003)(2616005)(11346002)(6666004)(76176011)(356004)(81166006)(7696005)(81156014)(51416003)(4326008)(476003)(47776003)(126002)(486006)(6916009)(316002)(26005)(53416004)(2906002)(48376002)(50226002)(70206006)(8676002)(54906003)(305945005)(50466002)(5660300002)(426003)(8936002)(336012)(478600001)(1076003)(70586007)(86362001)(17423001)(156123004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3244; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 27df72e1-5278-44af-321e-08d74cfc8f73
X-MS-TrafficTypeDiagnostic: DM6PR12MB3244:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3244525C26EC348DCD1445D3F9950@DM6PR12MB3244.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:489;
X-Forefront-PRVS: 018577E36E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nd6kCIMsdp1L2PbQHr60lpfxn2vYHMVmRsXuCeTgb7OQxTDALhWDWgb5OTkiTggKTWltSrJowksJX+DRIOy3px0FhMBorcvvKLudi8JG38EPeYSuUUB4qeptvLWUidTG+NTvDHfDMZcd2FvyesnAtUvv1biUt7RURNO4+oVqr+NmHXHoAUtatmL1gRtuhoIA7iIfLNPZGCTk7+bh7laDDgQfJ2yKL5bwBWSWixWLOf/JL6/tyfAtZWrp7rlv2FkbJwlFAW29A3w4r6y8iWJcEYL81owcWcnKhCm0maY2l3Jb0PS/qttmUgrwDHgG3HcE9BiXj7gd2OV+z0zDrKxlL4XIABnnbu1I5KL78kwkg11TqeObbzlZRL9MRUyA8HWx1bvSn8YIaWyTvp47urBK4Io61LViyi2rB/m4BKZo8Ts=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2019 21:06:31.5192 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27df72e1-5278-44af-321e-08d74cfc8f73
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3244
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WuCY/L2ej1Py0opKp+y5vuK/PFlGzucnZ4yC3vvkI4s=;
 b=JbOn2AjbuiRT5MdEjeu2us7m/LgBfUf/JK3Liov7mvik9XgJFqWHA8uQjzcVsBao8stWIt8ZSDFfGcJH33+2m0kpvb5goBx+Ey7rj9AQzImUCbcfmB3idiM0mZewriWWN43JGhN1XXgEh0SmzXSaATnYfxA0QyF3+IzVy1kUbgU=
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
Cc: sunpeng.li@amd.com, Lewis Huang <Lewis.Huang@amd.com>,
 harry.wentland@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGV3aXMgSHVhbmcgPExld2lzLkh1YW5nQGFtZC5jb20+CgpbV2h5XQpTTVUgZml4ZWQg
dGhpcyBpc3N1ZSBhZnRlciB2ZXJzaW9uIDB4MzcwYzAwCgpbSG93XQplbmFibGUgc211IHNlbmQg
bWVzc2FnZSB0byBzZXQgZGNmY2xrIGFmdGVyIHNtdSB2ZXJzaW9uIDB4MzcwYzAwCgpTaWduZWQt
b2ZmLWJ5OiBMZXdpcyBIdWFuZyA8TGV3aXMuSHVhbmdAYW1kLmNvbT4KQWNrZWQtYnk6IEJoYXdh
bnByZWV0IExha2hhIDxCaGF3YW5wcmVldC5MYWtoYUBhbWQuY29tPgotLS0KIC4uLi9kcm0vYW1k
L2Rpc3BsYXkvZGMvY2xrX21nci9kY24yMS9ybl9jbGtfbWdyX3ZiaW9zX3NtdS5jICAgfCA0ICsr
LS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nsa19tZ3IvZGNuMjEvcm5f
Y2xrX21ncl92Ymlvc19zbXUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jbGtf
bWdyL2RjbjIxL3JuX2Nsa19tZ3JfdmJpb3Nfc211LmMKaW5kZXggZGIyOGU5MWFkYjNkLi4yNjUw
Nzc2YWNiYzMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jbGtf
bWdyL2RjbjIxL3JuX2Nsa19tZ3JfdmJpb3Nfc211LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2Nsa19tZ3IvZGNuMjEvcm5fY2xrX21ncl92Ymlvc19zbXUuYwpAQCAtMTI0
LDcgKzEyNCw3IEBAIGludCBybl92Ymlvc19zbXVfc2V0X2hhcmRfbWluX2RjZmNsayhzdHJ1Y3Qg
Y2xrX21ncl9pbnRlcm5hbCAqY2xrX21nciwgaW50IHJlcXVlCiB7CiAJaW50IGFjdHVhbF9kY2Zj
bGtfc2V0X21oeiA9IC0xOwogCi0JaWYgKGNsa19tZ3ItPnNtdV92ZXIgPCAweEZGRkZGRkZGKQor
CWlmIChjbGtfbWdyLT5zbXVfdmVyIDwgMHgzNzBjMDApCiAJCXJldHVybiBhY3R1YWxfZGNmY2xr
X3NldF9taHo7CiAKIAlhY3R1YWxfZGNmY2xrX3NldF9taHogPSBybl92Ymlvc19zbXVfc2VuZF9t
c2dfd2l0aF9wYXJhbSgKQEAgLTEzOSw3ICsxMzksNyBAQCBpbnQgcm5fdmJpb3Nfc211X3NldF9t
aW5fZGVlcF9zbGVlcF9kY2ZjbGsoc3RydWN0IGNsa19tZ3JfaW50ZXJuYWwgKmNsa19tZ3IsIGlu
dAogewogCWludCBhY3R1YWxfbWluX2RzX2RjZmNsa19taHogPSAtMTsKIAotCWlmIChjbGtfbWdy
LT5zbXVfdmVyIDwgMHhGRkZGRkZGRikKKwlpZiAoY2xrX21nci0+c211X3ZlciA8IDB4MzcwYzAw
KQogCQlyZXR1cm4gYWN0dWFsX21pbl9kc19kY2ZjbGtfbWh6OwogCiAJYWN0dWFsX21pbl9kc19k
Y2ZjbGtfbWh6ID0gcm5fdmJpb3Nfc211X3NlbmRfbXNnX3dpdGhfcGFyYW0oCi0tIAoyLjE3LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
