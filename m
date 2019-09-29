Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9F9C1393
	for <lists+amd-gfx@lfdr.de>; Sun, 29 Sep 2019 08:19:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C40AF89CF6;
	Sun, 29 Sep 2019 06:19:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750077.outbound.protection.outlook.com [40.107.75.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A71289CF6
 for <amd-gfx@lists.freedesktop.org>; Sun, 29 Sep 2019 06:19:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bJro3sSbjYj4INLdNbESVKYFkR7ZixPU8KnjQBHEcY75tRq/huwSpizvphV3IaK/GB97qRTx5jXeOJYJK+nAhkQWjAPKt/WfzVrXuM8cwUk/zTM7hq0f/9UymGbWf/V2iaqvo2USu4VG144oVI4c/TwdQx9VBpgWUdqmDY5YT30bfiMTFNHluPlHEy4N9lTTuBBFH3h4OhKN6Ds90ijiUYGlDg/HPK40wEh5118C/6AqZv/tUH0H0N3TG8Mxe9kSm6hK36twlnLvHZddd4lgA6tAroW3fhf2goFvEOGSMy4xkIs/4w8zFgYRAJD9uD3jA/SsBpS+aSZxjt9FfC8YbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aYZfnCLDMJfhNfqBSAd61CvA4D7tjqV7OnxClXSFX84=;
 b=JBvHwVQ8h3nBs2mGJ0TyhGSewc90bmJSWEEaYBMBcswMKMz6XuZ7Jjza8ONnBGDm6q6SURtkj5As/cysvS2WbZLrxf90VmyG7IdpkrkQCKggIA5sfoOaUOKZW2UU+O88/jcSZyubXLCR2SXAsuBbfhl7yZLwFxM0nkIUZoS3Py1ftR7NnF9zCYLZE7fW/4rEVAL0zyhWhMWiNrZ3co000vrLI2gpxdNSYdjMU+B8MwnvBajdniiFGczQxDOXyWM5yxTjHMTxlzRmhzqAIMjWNUgP6MbY2eIYwPLJ0/uXW93fRPESKEk0PF1Fzjcvg6SCTDBdrmWeZIexd3yS2p5EUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR1201CA0024.namprd12.prod.outlook.com
 (2603:10b6:301:4a::34) by BN6PR12MB1828.namprd12.prod.outlook.com
 (2603:10b6:404:108::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.20; Sun, 29 Sep
 2019 06:19:50 +0000
Received: from DM3NAM03FT051.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::208) by MWHPR1201CA0024.outlook.office365.com
 (2603:10b6:301:4a::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2305.17 via Frontend
 Transport; Sun, 29 Sep 2019 06:19:50 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT051.mail.protection.outlook.com (10.152.83.56) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Sun, 29 Sep 2019 06:19:49 +0000
Received: from gc-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXCHOV01.amd.com (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; 
 Sun, 29 Sep 2019 01:19:45 -0500
From: chen gong <curry.gong@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: Do not implement power-on for SDMA after do mode2
 reset on Renoir
Date: Sun, 29 Sep 2019 14:19:36 +0800
Message-ID: <1569737976-23985-1-git-send-email-curry.gong@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(396003)(376002)(136003)(428003)(199004)(189003)(48376002)(476003)(2616005)(126002)(47776003)(336012)(486006)(6666004)(356004)(426003)(50466002)(478600001)(2351001)(53416004)(6916009)(5660300002)(305945005)(70206006)(70586007)(81166006)(316002)(36756003)(8676002)(81156014)(16586007)(50226002)(8936002)(26005)(7696005)(51416003)(14444005)(2906002)(4326008)(86362001)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1828; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6fc24ec6-a689-45ab-30b5-08d744a5088c
X-MS-TrafficTypeDiagnostic: BN6PR12MB1828:
X-Microsoft-Antispam-PRVS: <BN6PR12MB1828E04332046E2AC0A544509D830@BN6PR12MB1828.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 017589626D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kq2g8F8CqJq/0lksOoc09UjwT0gNB1KKwwfz7hMXQsxKQ9zocyBo4TqDTJVS/5RKWRbILjaGNvz/HyIMORFuwq69DadCuU53JlK7ylT8VwqTXo+wLHowNJBEcc0Ws54II3HwhoC8lcqEuVuCXVFIthiRz+lgcydshKPv4emThwCSVbC9V2avmG+3YfszyI5NKhgcWPTgFalg9eNnFC7QC0FoHvFfl8ktard5Slq6rSNE4qXOz3lF8+YePY0zbLA8e3DYyJgoCQlnrU2ErP4iXQj0Hk3EyGlEZj8bTt4eeyUH52Wm17DNcdixJD9NTc0RAtTtaiPXqBKYVoD+1xjQ9DNxAMMKH4d8NbuhqaICVBYGscL8PdT9mcA18HtaWsZpVKWg6180sg/Oj4eee0UXz/5Uwa288sS5V42JPr5N01Y=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2019 06:19:49.8961 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fc24ec6-a689-45ab-30b5-08d744a5088c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1828
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aYZfnCLDMJfhNfqBSAd61CvA4D7tjqV7OnxClXSFX84=;
 b=4cNXLq3sI8yZhN88Me1gYMGlR68VrJ860EHKlWAFTePjWLyzDaDDUeCqFvIgD6Uf2MaMx1suepJRTqStBJ9J46qKNPDFPyeltC3LQYEujzwHyTsLYzy4fXxX9gGq28TVqjZ/0POIqBs2lR4oEkWICRGVdN/vbbrmS4r/HemHwDE=
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
Cc: chen gong <curry.gong@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RmluZCB0aGF0IHJpbmcgc2RtYTAgdGVzdCBmYWlsZWQgaWYgdHVybiBvbiBTRE1BIHBvd2VyZ2F0
aW5nIGFmdGVyIGRvCm1vZGUyIHJlc2V0LgoKUGVyaGFwcyB0aGUgbW9kZTIgcmVzZXQgZG9lcyBu
b3QgcmVzZXQgdGhlIFNETUEgUEcgc3RhdGUsIFNETUEgaXMKYWxyZWFkeSBwb3dlcmVkIHVwIHNv
IHRoZXJlIGlzIG5vIG5lZWQgdG8gYXNrIHRoZSBTTVUgdG8gcG93ZXIgaXQgdXAKYWdhaW4uIFNv
IEkgc2tpcCB0aGlzIGZ1bmN0aW9uIGZvciBhIG1vbWVudC4KClNpZ25lZC1vZmYtYnk6IGNoZW4g
Z29uZyA8Y3VycnkuZ29uZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L3NkbWFfdjRfMC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92
NF8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y0XzAuYwppbmRleCA5NjU4
MWI1Li5lMGViMjQ1MCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2Rt
YV92NF8wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMKQEAg
LTE3OTIsNyArMTc5Miw3IEBAIHN0YXRpYyBpbnQgc2RtYV92NF8wX2h3X2luaXQodm9pZCAqaGFu
ZGxlKQogCiAJaWYgKChhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJUF9SQVZFTiAmJiBhZGV2LT5wb3dl
cnBsYXkucHBfZnVuY3MgJiYKIAkJCWFkZXYtPnBvd2VycGxheS5wcF9mdW5jcy0+c2V0X3Bvd2Vy
Z2F0aW5nX2J5X3NtdSkgfHwKLQkJCWFkZXYtPmFzaWNfdHlwZSA9PSBDSElQX1JFTk9JUikKKwkJ
CShhZGV2LT5hc2ljX3R5cGUgPT0gQ0hJUF9SRU5PSVIgJiYgYWRldi0+aW5fZ3B1X3Jlc2V0ICE9
IDEpKQogCQlhbWRncHVfZHBtX3NldF9wb3dlcmdhdGluZ19ieV9zbXUoYWRldiwgQU1EX0lQX0JM
T0NLX1RZUEVfU0RNQSwgZmFsc2UpOwogCiAJaWYgKCFhbWRncHVfc3Jpb3ZfdmYoYWRldikpCi0t
IAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
