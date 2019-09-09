Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 829A5ADB52
	for <lists+amd-gfx@lfdr.de>; Mon,  9 Sep 2019 16:38:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D16489C1A;
	Mon,  9 Sep 2019 14:38:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690062.outbound.protection.outlook.com [40.107.69.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2DD389B42
 for <amd-gfx@lists.freedesktop.org>; Mon,  9 Sep 2019 14:38:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d9rESRy3FXbXHR66bepo19CVqmfjvb9Iy5yn7m5Dn3ZB3eNI0DwfQzKWcwkWW9DRlo6iBQXsRVNAmVZg958FSYwNvkarU2K9atdb/Xwo2QtCzKLAemWRdWCW8hJw+YUxl+rwHxxfNbWddIBbnLiydwkKPUVbGH0QyPI+0DZLEGy7abjgIrIT++eUKSUtUnG18oABsif5dUGDJocA+YttyfslKRoP4/chuntA55Q+7wCQDfS0xszhIFb9hOdm2U/PfnvmiDKD15zeaTaGPt7PrRmjx24iciLP/hw45d6oP7c82VJ98bpDA+F/eVhblfMqxgVqLdtRAcmfAwl5brqEUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r3Z4ZoiljUDW2I5wKCuUzq1BzbsGFCuMwFv3dvPA85o=;
 b=VvleAk8aBDnihz/oHb64mPnqnqmRtFa0C7zMYK+DXX7/RnAULYSa57osKMYllx1KKeqGP7WYw70u8Haok3n64hmT2PF0p3kXIbcKLwUknUeWnGjA9cOzauRrdJe6nZVXabaEXllcEWEcd7aiLuQplaq8fEmIYdZpm2w9vXP6oouRczhEKb7BH3SgtIP+bToBE4+gfoUJU9PPZZyp6W3wACJnMwb8AkPMmh8rE1Os1RLd1vFZP0B4JnxJjQ2rChaUmBZSK6i4cxDL+zVWAs641iyhOGO6U1LqsOOd1FKrjVZBtKd7ya7BOBKvgvV9PLMwLXSwzorRRtx+GxN3JGTT0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR12CA0054.namprd12.prod.outlook.com (2603:10b6:300:103::16)
 by DM6PR12MB3436.namprd12.prod.outlook.com (2603:10b6:5:3b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.14; Mon, 9 Sep
 2019 14:38:35 +0000
Received: from CO1NAM03FT039.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::207) by MWHPR12CA0054.outlook.office365.com
 (2603:10b6:300:103::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2241.13 via Frontend
 Transport; Mon, 9 Sep 2019 14:38:34 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT039.mail.protection.outlook.com (10.152.81.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2241.14 via Frontend Transport; Mon, 9 Sep 2019 14:38:34 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 9 Sep 2019
 09:38:31 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amd/display: Implement voltage limitation for dali
Date: Mon, 9 Sep 2019 10:38:00 -0400
Message-ID: <20190909143800.3850-3-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190909143800.3850-1-Bhawanpreet.Lakha@amd.com>
References: <20190909143800.3850-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(396003)(136003)(346002)(2980300002)(428003)(189003)(199004)(26005)(47776003)(51416003)(8936002)(53936002)(36756003)(6916009)(76176011)(81156014)(50226002)(86362001)(81166006)(8676002)(4326008)(53416004)(305945005)(2351001)(478600001)(70586007)(6666004)(4744005)(316002)(356004)(186003)(1076003)(2906002)(336012)(11346002)(476003)(126002)(446003)(426003)(2616005)(486006)(7696005)(5660300002)(16586007)(48376002)(50466002)(70206006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3436; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 35563629-13c4-4537-4c1b-08d7353364cd
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328);
 SRVR:DM6PR12MB3436; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB3436:
X-Microsoft-Antispam-PRVS: <DM6PR12MB343686F6DC46499AC16EAFC1F9B70@DM6PR12MB3436.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-Forefront-PRVS: 01559F388D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: Gijinuv6isojX627TtE+IxU7MihzF4efRx0Pu81err+l5eo0tbZ93jy+suYJVfGNGB1t+88PlTfZBpUpw56o8UO3deNr48jnnjxXdQ5Hv3z4O+b6UTeTTTTFt/g8Oc5IAo67Zvtl9mtfUSWQ7r7yAmhiZdSG8AJA5EuJ0LCOEmtfVL0gfOVpemJZulpMl1H9UHaQLqmGJDk4MHlocnmaOFuvyDQseVUrYAs44FPV2+yf5m/tJhWsywuZiiKxdt5JdcpmH9M5au/nXpEgCYjAEZMqxJ+sXa8nxwHKIM2i9p92pxmfAqCiXEoC7PLhTfyhCo7eHKwiNZuJLGZQ0RabzcqmlTBuzdIIegchK7VDJJjAkR3hIRzmcs9soQFUj+K7p7p7ce/FtKUgX1534gBZVXVl5uUgpxqLoBp1XiCytQY=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2019 14:38:34.4943 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35563629-13c4-4537-4c1b-08d7353364cd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3436
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r3Z4ZoiljUDW2I5wKCuUzq1BzbsGFCuMwFv3dvPA85o=;
 b=OwYhcDLyXsseF6MAis70txfZunGHsoixNKXtff27kwRDbDp9rP2bhB9R2A4l0hou3zfcaNUvvh08f8RX2vcsLOmf9fy6ulzTh/zsj9gEiMbJgIeZ7BsiV/nX44R5dff8YD/sDhCBHn0MsVpbCScI8BUCG3xP/UXxspg/1DaGbg8=
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
Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W1doeV0Kd2Ugb25seSB3YW50IHRoZSBsb3dlc3Qgdm9sdGFnZSB0byBiZSBhdmFpbGFibGUgZm9y
IGRhbGkuCgpbSG93XQpVc2UgdGhlIGdldF9oaWdoZXN0X2FsbG93ZWRfdm9sdGFnZV9sZXZlbCBm
dW5jdGlvbgp0byByZXR1cm4gMCBmb3IgZGFsaQoKU2lnbmVkLW9mZi1ieTogQmhhd2FucHJlZXQg
TGFraGEgPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+ClJldmlld2VkLWJ5OiBIdWFuZyBSdWkg
PHJheS5odWFuZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9j
YWxjcy9kY25fY2FsY3MuYyB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jYWxjcy9kY25f
Y2FsY3MuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jYWxjcy9kY25fY2FsY3Mu
YwppbmRleCAzODNmNGY4ZGI4ZjQuLjliMmNiNTdiZjJiYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NhbGNzL2Rjbl9jYWxjcy5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9jYWxjcy9kY25fY2FsY3MuYwpAQCAtNzA4LDYgKzcwOCwxMCBA
QCBzdGF0aWMgdm9pZCBoYWNrX2JvdW5kaW5nX2JveChzdHJ1Y3QgZGNuX2J3X2ludGVybmFsX3Zh
cnMgKnYsCiAKIHVuc2lnbmVkIGludCBnZXRfaGlnaGVzdF9hbGxvd2VkX3ZvbHRhZ2VfbGV2ZWwo
dWludDMyX3QgaHdfaW50ZXJuYWxfcmV2KQogeworCS8qIGZvciBkYWxpLCB0aGUgaGlnaGVzdCB2
b2x0YWdlIGxldmVsIHdlIHdhbnQgaXMgMCAqLworCWlmIChBU0lDUkVWX0lTX0RBTEkoaHdfaW50
ZXJuYWxfcmV2KSkKKwkJcmV0dXJuIDA7CisKIAkvKiB3ZSBhcmUgb2sgd2l0aCBhbGwgbGV2ZWxz
ICovCiAJcmV0dXJuIDQ7CiB9Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
