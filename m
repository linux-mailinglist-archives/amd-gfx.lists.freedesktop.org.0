Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AA569DB5
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:21:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1786F89C55;
	Mon, 15 Jul 2019 21:21:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam03on0601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe48::601])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3972E89C52
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:21:37 +0000 (UTC)
Received: from MN2PR12CA0014.namprd12.prod.outlook.com (2603:10b6:208:a8::27)
 by CH2PR12MB3927.namprd12.prod.outlook.com (2603:10b6:610:2d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2052.19; Mon, 15 Jul
 2019 21:21:35 +0000
Received: from CO1NAM03FT049.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::209) by MN2PR12CA0014.outlook.office365.com
 (2603:10b6:208:a8::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.11 via Frontend
 Transport; Mon, 15 Jul 2019 21:21:35 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT049.mail.protection.outlook.com (10.152.81.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:21:34 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:21 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 33/87] drm/amd/display: Check for valid stream_encode
Date: Mon, 15 Jul 2019 17:19:55 -0400
Message-ID: <20190715212049.4584-34-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(376002)(136003)(346002)(2980300002)(428003)(189003)(199004)(54906003)(2870700001)(316002)(68736007)(1076003)(6666004)(356004)(86362001)(4326008)(49486002)(48376002)(478600001)(5660300002)(36756003)(50466002)(26005)(6916009)(70586007)(51416003)(14444005)(186003)(2616005)(126002)(8936002)(486006)(81166006)(11346002)(81156014)(2906002)(426003)(8676002)(76176011)(446003)(476003)(50226002)(336012)(2351001)(47776003)(2876002)(305945005)(53936002)(70206006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB3927; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88e74f56-9402-4bd0-3fc5-08d7096a6a4a
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:CH2PR12MB3927; 
X-MS-TrafficTypeDiagnostic: CH2PR12MB3927:
X-Microsoft-Antispam-PRVS: <CH2PR12MB3927E611058B88887D823CB382CF0@CH2PR12MB3927.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:381;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: OQe4qPoZIdeDp4pTA79KKGyamRZ3iZvL63aTkU7M+JvIYlnif9ty6ltomE19hZMahdbMd8F9VW/2lYJQjxYGTazxS7bdfRuCvHgjUxgm0+J7dg71H9vZRi+jyQcG//mlb+MitN9ZgBRO/snCkaCP+UZnTm3SN6o34Fy3fXM7efJz4YYEgW8Y207iw0dIqrivA411bf9AYKj57TcZ/8xFyO0ibo81RaRLiUjKL2xn9UbyXZwVgMlgRaonMxQJpn7QgzU2fiBGY2BFCjQACZExk1eruUnxVsmRe5Yg6oS3XPesTcbsNSHtK7BvNpXJcd65nFCuRenYJsGrU+UlvPgX0MWjDLoGJrKRQnetwBJaAOSHHziCQLcNBNuFoV27TdP7W2YIz6hqnZLiox4NWk841BDco4Qb82jcqrfHOHfbD/4=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:21:34.8697 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88e74f56-9402-4bd0-3fc5-08d7096a6a4a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3927
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qxxdRZsaE9T3C1xE/ukLGKyl8ImHjoq6BJ1oGzNYya0=;
 b=wVCMj4TD8NrMcbOF3+74hZ8iQnE6iLKR41WPyg5qQqqsxNYxdPyH2jcgPW6fP8KUaZh26S/45Vk/l+DWy4Sd1WuwuBzfrYgi/VCOopIzhzbvj77qTP0b3NtrmGhbOEohfBkZQG2VwgNhmCJxNbC7frZmK6kZxbXf9WXjegWfmMc=
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
Cc: Ilya Bakoulin <Ilya.Bakoulin@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Eric Bernstein <Eric.Bernstein@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogSWx5YSBCYWtvdWxpbiA8SWx5YS5CYWtvdWxpbkBhbWQuY29tPgoKQmVmb3JlIGFjY2Vz
c2luZyBpdCdzIHZ0YWJsZSwgY2hlY2sgdGhhdCBzdHJlYW1fZW5jb2RlciBpcyBub24tbnVsbC4K
ClNpZ25lZC1vZmYtYnk6IElseWEgQmFrb3VsaW4gPElseWEuQmFrb3VsaW5AYW1kLmNvbT4KUmV2
aWV3ZWQtYnk6IEVyaWMgQmVybnN0ZWluIDxFcmljLkJlcm5zdGVpbkBhbWQuY29tPgpBY2tlZC1i
eTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2NvcmUvZGNfc3RyZWFtLmMgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9jb3JlL2RjX3N0cmVhbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2NvcmUvZGNfc3RyZWFtLmMKaW5kZXggMWJjMTlkNDJmYzlmLi4zNWQ2OTdkZDU4MDgg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX3N0cmVh
bS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX3N0cmVhbS5j
CkBAIC02MDksNyArNjA5LDggQEAgYm9vbCBkY19zdHJlYW1fc2V0X2R5bmFtaWNfbWV0YWRhdGEo
c3RydWN0IGRjICpkYywKIAogCXBpcGVfY3R4LT5zdHJlYW0tPmRtZGF0YV9hZGRyZXNzID0gYXR0
ci0+YWRkcmVzczsKIAotCWlmIChwaXBlX2N0eC0+c3RyZWFtX3Jlcy5zdHJlYW1fZW5jLT5mdW5j
cy0+c2V0X2R5bmFtaWNfbWV0YWRhdGEgIT0gTlVMTCkgeworCWlmIChwaXBlX2N0eC0+c3RyZWFt
X3Jlcy5zdHJlYW1fZW5jICYmCisJCQlwaXBlX2N0eC0+c3RyZWFtX3Jlcy5zdHJlYW1fZW5jLT5m
dW5jcy0+c2V0X2R5bmFtaWNfbWV0YWRhdGEgIT0gTlVMTCkgewogCQlpZiAocGlwZV9jdHgtPnN0
cmVhbS0+ZG1kYXRhX2FkZHJlc3MucXVhZF9wYXJ0ICE9IDApIHsKIAkJCS8qIGlmIHVzaW5nIGR5
bmFtaWMgbWV0YSwgZG9uJ3Qgc2V0IHVwIGdlbmVyaWMgaW5mb3BhY2tldHMgKi8KIAkJCXBpcGVf
Y3R4LT5zdHJlYW1fcmVzLmVuY29kZXJfaW5mb19mcmFtZS5oZHJzbWQudmFsaWQgPSBmYWxzZTsK
LS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
