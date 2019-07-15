Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C4469DAD
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:21:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D45389C28;
	Mon, 15 Jul 2019 21:21:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800089.outbound.protection.outlook.com [40.107.80.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6519889BFB
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:21:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ys5Jh8ThqZRkFKioRO+y1sElewxagx2rrA1v3OCRi3SqDGBuig3Q4RfLzM6jSjUokphMPEOCUaKq4VEbxS/lIz9kEch8OpGk49JVUsghW+QMpiSpEN5Foqc36/jy5N0m3KaRy0Vwu/PmMzQWNlY1vweQuJ59fswi0JR219RUvmMMCF+9C8RQRepaLuJ0LFyL5NhXFm8UORplF4+fgJJKAacBgub09ajUC5kVtsaNrji3FG4BpcR4x7LgrEgrktZ1e7LXJb8FcG23j6lhyxxVX6+f2Y5mzM/W2XqFFJhuM6j167GukldCCt4I28ivkddg7A5c844yq/ICSPVHtACnMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6P7opfE8dLQDYrA6IKnC7rqrY54GWuLUw8n+r8ENwGc=;
 b=Y+GkrRzKidURaWK7/wNdIfdRiEChcuHkxtHqseULTIiPnGcQpf25WCb2F9x05b9gFm2g5Tec5AGZ9epyRBJvOhj30s/HRTpE5LuSALWxZNvjP44QYWG2Dcs+cJWkI5b1Gp9prgewYVLziRTRw4Oco3ZEgCslpCEiPxuSrr1+WEO4EvlE1oMddFomsIRCV1kXN30jcj0ShVcXbAv25uHoNq1bFhXGOLKrbfipe6EYmaaq4NcQIpMnaWEYKmLF3gqMq7AhmssAAKTC0yrgc5VrGPoobpBzoGIOaERYItyAlkC7zVEaja11jVW+emz9AkgfgnzJabc57R4aSYYGJXWTaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from MWHPR12CA0040.namprd12.prod.outlook.com (2603:10b6:301:2::26)
 by DM6PR12MB3932.namprd12.prod.outlook.com (2603:10b6:5:1cb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.14; Mon, 15 Jul
 2019 21:21:25 +0000
Received: from CO1NAM03FT009.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::200) by MWHPR12CA0040.outlook.office365.com
 (2603:10b6:301:2::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.13 via Frontend
 Transport; Mon, 15 Jul 2019 21:21:25 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT009.mail.protection.outlook.com (10.152.80.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:21:25 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:16 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 20/87] drm/amd/display: Clock does not lower in Updateplanes
Date: Mon, 15 Jul 2019 17:19:42 -0400
Message-ID: <20190715212049.4584-21-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(396003)(39860400002)(346002)(2980300002)(428003)(199004)(189003)(426003)(51416003)(316002)(54906003)(1076003)(68736007)(50226002)(186003)(26005)(8936002)(2870700001)(4326008)(5660300002)(47776003)(15650500001)(478600001)(336012)(305945005)(50466002)(76176011)(48376002)(70586007)(6666004)(86362001)(53936002)(8676002)(70206006)(356004)(486006)(126002)(36756003)(2616005)(49486002)(11346002)(2351001)(2906002)(446003)(81156014)(81166006)(476003)(2876002)(6916009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3932; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e57599d3-016c-4f5c-9eb8-08d7096a64ab
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM6PR12MB3932; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB3932:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3932414850D8B7EC9172651A82CF0@DM6PR12MB3932.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: g12hrqKlvXs0g9XBEn7d2pdFbd1E7K5iCh4TgaqkhKOCIeaA4h4kBm2hkqc9gLZqlycYo5+Mdw+ckBXpeiHHm06qY0k9pgX9+dm5oCi2gHKfKyJGB/WiuR7l7IdbF3rRLvBi1T5nuZl/i/rFen9XHcY0Cx1zR2uGvOUJH8IRSb0elrUyq4HJ70xNGNH/0mez/LCcM5mHss0HWnarZHFO8cUIIL5J6oeA6m3Us0Zt2s7GZGQtX7hHsMh4Du/4/nPX759VkO0XJL9onCR3hPU7f1OQzWGcE9/JxfLew/1AIHl/PYnFm6DpxGsooJ8YnaLXdFcnbO5II0zmtVdfH6Bpvcgv1m2quRnDaIiKulbn+z1sHWMATxje0rDZ6+lMaxZGIDh/APkfkBnIwi2d92p4bhySgP0/SpWX86w6Hohjh90=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:21:25.4339 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e57599d3-016c-4f5c-9eb8-08d7096a64ab
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3932
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6P7opfE8dLQDYrA6IKnC7rqrY54GWuLUw8n+r8ENwGc=;
 b=2AYjfUKjeoInHHZNZ6O4ZHU8lyIEkD/zOQujIj4UPBvwhhpl1cqljLuyThZXkrChvz3DQTaXRgw1c930/7gnqp3SU77d+GCSFgFFlitSr1ahxzmI2DNaVFHYDBEvanL5incBJg5o/jv15QSMAKXuZZLyaZuqbixB3vt+slT8AY8=
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
Cc: Leo Li <sunpeng.li@amd.com>, Murton Liu <murton.liu@amd.com>,
 Tony Cheng <Tony.Cheng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTXVydG9uIExpdSA8bXVydG9uLmxpdUBhbWQuY29tPgoKW3doeV0KV2UgcmVzZXQgdGhl
IG9wdGltaXplZF9yZXF1aXJlZCBpbiBhdG9taWNfcGxhbmVfZGlzYWJsZQpmbGFnIGltbWVkaWF0
ZWx5IGFmdGVyIGl0IGlzIHNldCBpbiBhdG9taWNfcGxhbmVfZGlzY29ubmVjdCwgY2F1c2luZyB1
cyB0bwpuZXZlciBoYXZlIGZsYWcgc2V0IGR1cmluZyBuZXh0IGZsaXAgaW4gVXBkYXRlUGxhbmVz
LgoKW2hvd10KT3B0aW1pemUgZGlyZWN0bHkgYWZ0ZXIgZWFjaCB0aW1lIHBsYW5lIGlzIHJlbW92
ZWQuCgpTaWduZWQtb2ZmLWJ5OiBNdXJ0b24gTGl1IDxtdXJ0b24ubGl1QGFtZC5jb20+ClJldmll
d2VkLWJ5OiBUb255IENoZW5nIDxUb255LkNoZW5nQGFtZC5jb20+CkFja2VkLWJ5OiBMZW8gTGkg
PHN1bnBlbmcubGlAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
ZGNuMTAvZGNuMTBfaHdfc2VxdWVuY2VyLmMgfCA2ICsrKysrKwogMSBmaWxlIGNoYW5nZWQsIDYg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kY24xMC9kY24xMF9od19zZXF1ZW5jZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9kY24xMC9kY24xMF9od19zZXF1ZW5jZXIuYwppbmRleCAzODM0OTc5ZTYxZDAuLjlmMDhi
ZmI3ZjIzOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEw
L2RjbjEwX2h3X3NlcXVlbmNlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kY24xMC9kY24xMF9od19zZXF1ZW5jZXIuYwpAQCAtMjUxNSw2ICsyNTE1LDEyIEBAIHN0YXRp
YyB2b2lkIGRjbjEwX2FwcGx5X2N0eF9mb3Jfc3VyZmFjZSgKIAkJaWYgKHJlbW92ZWRfcGlwZVtp
XSkKIAkJCWRjbjEwX2Rpc2FibGVfcGxhbmUoZGMsICZkYy0+Y3VycmVudF9zdGF0ZS0+cmVzX2N0
eC5waXBlX2N0eFtpXSk7CiAKKwlmb3IgKGkgPSAwOyBpIDwgZGMtPnJlc19wb29sLT5waXBlX2Nv
dW50OyBpKyspCisJCWlmIChyZW1vdmVkX3BpcGVbaV0pIHsKKwkJCWRjLT5od3NzLm9wdGltaXpl
X2JhbmR3aWR0aChkYywgY29udGV4dCk7CisJCQlicmVhazsKKwkJfQorCiAJaWYgKGRjLT5od3Nl
cS0+d2EuREVHVklEQ04xMF8yNTQpCiAJCWh1YmJ1YjFfd21fY2hhbmdlX3JlcV93YShkYy0+cmVz
X3Bvb2wtPmh1YmJ1Yik7CiB9Ci0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
