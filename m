Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74740C9093
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Oct 2019 20:16:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 387A96E973;
	Wed,  2 Oct 2019 18:16:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810053.outbound.protection.outlook.com [40.107.81.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F35016E96B
 for <amd-gfx@lists.freedesktop.org>; Wed,  2 Oct 2019 18:16:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QZUTxHxAeNXPywoC2dAvoy+PHA1+xmex1m9prYf1k8i9bRT+RAHz6AP6dQ6Z+inqH//ITmbNo7DQD9RHenV3h1mbADzDKCts4bcYZE6hcIsWl5X4OmAlgRR6kEhzJu2imyEdsP9QHEN4b44+7XlFMQvY2lDYFL0V6WRAvgyyj1X0cAGhf78HWGIrvB5N10DVVUKK3TnnPp8ogfRMqP/nli84AX+mb4qyKL0yU1aW8nnlIPYrV+yA1Nfx/85j5wytAzpI1rstWHNyH3Euw6DmoIY0rJVeP5uJ0Ty89RlcT9lIHxLZSOQr8Fd6nuA9M7ACO4mPbIkViV7+YN4cFzn4Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xA9J1c9Vbpxki1uk+HE8Gj+6Til9uJhXq+gm7LFeZGg=;
 b=QdTlwidEU96ZvApkpuThAMIHQcLhAdBDhijI8x87RRZo/9ky9DSZX34HR2pTzDqsVQl3BtBMAl9SJZ+cFxl+lDobrH6S5YUotyLid12EijApQ0fiV4icpqLHR0o0Z+NSO2lLgOafm/RX63OHmN2tkvuai907veXhlbhh1CgZ2af4ILjRxqS2CoyXnQQqsut83Am1Uj6N4CXI4xss/D+UVNQMLu1CuFBf+VBXzd4XcsJvT7Snh7FPL5WKs/qJBSIbJ0s5ClYetiby8gfWkD+8by2DwyCafg8mfKVy2Y92rMT6S+ddlSIvUR4JuQ2q+eQQNGQItIA9DMvMjd//59oM6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM3PR12CA0125.namprd12.prod.outlook.com (2603:10b6:0:51::21) by
 BN8PR12MB3460.namprd12.prod.outlook.com (2603:10b6:408:48::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Wed, 2 Oct 2019 18:16:46 +0000
Received: from DM3NAM03FT053.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::203) by DM3PR12CA0125.outlook.office365.com
 (2603:10b6:0:51::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.20 via Frontend
 Transport; Wed, 2 Oct 2019 18:16:46 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT053.mail.protection.outlook.com (10.152.83.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Wed, 2 Oct 2019 18:16:46 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 2 Oct 2019
 13:16:44 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 26/38] drm/amd/display: Update number of dcn21 audio endpoints
Date: Wed, 2 Oct 2019 14:16:21 -0400
Message-ID: <20191002181633.22805-27-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191002181633.22805-1-Bhawanpreet.Lakha@amd.com>
References: <20191002181633.22805-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(346002)(376002)(136003)(428003)(189003)(199004)(2616005)(4326008)(476003)(15650500001)(426003)(6666004)(356004)(336012)(316002)(446003)(186003)(86362001)(53416004)(11346002)(50466002)(126002)(486006)(26005)(2906002)(14444005)(16586007)(48376002)(51416003)(7696005)(70206006)(478600001)(47776003)(36756003)(1076003)(6916009)(81156014)(8676002)(81166006)(5660300002)(8936002)(76176011)(305945005)(50226002)(70586007)(2351001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3460; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3835cd58-b03d-4620-428d-08d74764afce
X-MS-TrafficTypeDiagnostic: BN8PR12MB3460:
X-Microsoft-Antispam-PRVS: <BN8PR12MB34607DB1BFBE7088AB9CC834F99C0@BN8PR12MB3460.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-Forefront-PRVS: 0178184651
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hZzvDFHGFI8+4Bue1wdlPc/f/reIBAmOYt6ws20XZ5rDnHcCSw+PqG4aj8T1UFVazN/vHAszPXW3ktqAugSKigeRNCK4U5hSSmLO9FursN32qsXxUViTgf9Iz3b3EyYmSevGWdmbUI0OctoEil53Cgqyb2NmTfH/du/uSdMfZt3s747A1jhPPdgUxGI4pbmUc7NLeVLp3WDfdiQgEKduXkSJbjK+SA3Cr+G49ILpC76nKCCo/LFe5q5A3pz/FP6PTmhkJd/azZ7UZMmhlGkVKJRTh+0U7uW09/uux7sF7t/xqOcYVK0sz3Moug24y2EdW81go98ZTaGfcpjYWiYbAXRw5b86LpNxFFV+21WT82z5vcdm4ZiQO9jQUI7D3q2Ij1YbZGVxzck5sW7bhoUO/NooW6RmczErhiexJqZVP18=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2019 18:16:46.7065 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3835cd58-b03d-4620-428d-08d74764afce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3460
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xA9J1c9Vbpxki1uk+HE8Gj+6Til9uJhXq+gm7LFeZGg=;
 b=QacF7Tv1qC6cdrk8lYkjliHFrghB1ODneIYbvlFUn/UUDPcDzekVMXGzPDmKP3qkErgRXI5BjKlZNzajVfNhWnGWrwEGiYQmy0DZl+N4VrR4vKpnNdVtIGQZGIS9hGoJRWm/UngT9vWGhGKmY1ZtIf8gmQV4NdR3dBVg0U0Zi7Y=
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
Cc: Michael Strauss <michael.strauss@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTWljaGFlbCBTdHJhdXNzIDxtaWNoYWVsLnN0cmF1c3NAYW1kLmNvbT4KCltXSFldCk51
bWJlciBvZiBhdWRpbyBlbmRwb2ludHMgd2Fzbid0IHVwZGF0ZWQgZnJvbSBkY24yMCdzIDYgd2hl
biBjcmVhdGVkCgpbSE9XXQpDaGFuZ2VkIG51bV9hdWRpbyB0byA0IHRvIG1hdGNoIHRoZSBjb3Jy
ZWN0IHNiaW9zIHZhbHVlCgpDaGFuZ2UtSWQ6IEkyYjc5ZWY3Mjc2MmQ2YjRlNWZmNDkxYzFkZGY1
ODg0N2Y5NmM5NzNiClNpZ25lZC1vZmYtYnk6IE1pY2hhZWwgU3RyYXVzcyA8bWljaGFlbC5zdHJh
dXNzQGFtZC5jb20+ClJldmlld2VkLWJ5OiBZb25ncWlhbmcgU3VuIDx5b25ncWlhbmcuc3VuQGFt
ZC5jb20+CkFja2VkLWJ5OiBCaGF3YW5wcmVldCBMYWtoYSA8Qmhhd2FucHJlZXQuTGFraGFAYW1k
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjEvZGNuMjFfcmVz
b3VyY2UuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMS9k
Y24yMV9yZXNvdXJjZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIxL2Rj
bjIxX3Jlc291cmNlLmMKaW5kZXggYmU4NjRiZmQ1Nzk3Li5jYjQ2OWYzN2MxZWIgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMS9kY24yMV9yZXNvdXJjZS5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMS9kY24yMV9yZXNvdXJj
ZS5jCkBAIC03MjYsNyArNzI2LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCByZXNvdXJjZV9jYXBz
IHJlc19jYXBfcm4gPSB7CiAJCS5udW1fdGltaW5nX2dlbmVyYXRvciA9IDQsCiAJCS5udW1fb3Bw
ID0gNCwKIAkJLm51bV92aWRlb19wbGFuZSA9IDQsCi0JCS5udW1fYXVkaW8gPSA2LCAvLyA2IGF1
ZGlvIGVuZHBvaW50cy4gIDQgYXVkaW8gc3RyZWFtcworCQkubnVtX2F1ZGlvID0gNCwgLy8gNCBh
dWRpbyBlbmRwb2ludHMuICA0IGF1ZGlvIHN0cmVhbXMKIAkJLm51bV9zdHJlYW1fZW5jb2RlciA9
IDUsCiAJCS5udW1fcGxsID0gNSwgIC8vIG1heWJlIDMgYmVjYXVzZSB0aGUgbGFzdCB0d28gdXNl
ZCBmb3IgVVNCLWMKIAkJLm51bV9kd2IgPSAxLAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
