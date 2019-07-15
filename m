Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD3069DE2
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 23:22:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B98B889D79;
	Mon, 15 Jul 2019 21:22:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740059.outbound.protection.outlook.com [40.107.74.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A52D389D4A
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 21:22:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BvULrmIGo2T+0jUFJa8200HFV5O46n58rI++HDeGQRJXUkPfe0xHX3twUafqQNy4nE+8o+GIaBXJRcS9e8CfZeFfWqg3qJGDr6fuWVF2IwaffEBT8vK2PfEliJ4HgeBH2NBHgoSjZLjrv2VlYZfZ71jSD2HzVyXK4mPjXj/l+DpRmOp6eInVhWdGty3ELlwap6EqXqx4AcEQzlTT/VoG8/PomzmzUmooFIusz608r56f7glXNdfo4zOFBGwpRmOALSqWcUg18ScQkEh4hAAUqx+X8DnCAc84BSPrU91vNUddHDGuCrfK34wIS1uzNm3gNbKc8Z817uvUaxpYsvD5zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x5OSTouda2JYPeazKyHlVaOmane9ENCTQzZSRPcH2es=;
 b=gJAuwP84nh+HXOwxFmzSXYGU+xnbrKJB4yg1PdaIoEBDqYAfCJd+5CMn+CVn4+NT+uveagmqqYqm5ox6m9k3gD04KNkLiQ7qdPpGwYfz+S3LCj9cJuYNm9Chk3X1moNqmyeV8Phl+LOp7AjQfhkchE4nI1+L5IOuNALtlZVZQCrMbqUZzknPLTHeZNGkR9p4jdo7gsMxw57cJxDClNrIJaFZrryJ6NPv4XuZqcTDNzsXQjz8Dk4pHV8+mVPeGIrAJOrR63pjPyziEMye5X0YQi7nFDYStfLwKZjdcRdOLFPeRE7/1ABCZoZTJP3ltmZUGH8zZ9hpVDGGavnzDzpX2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
Received: from DM6PR12CA0008.namprd12.prod.outlook.com (2603:10b6:5:1c0::21)
 by MWHPR12MB1935.namprd12.prod.outlook.com (2603:10b6:300:113::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.14; Mon, 15 Jul
 2019 21:22:02 +0000
Received: from CO1NAM03FT063.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::207) by DM6PR12CA0008.outlook.office365.com
 (2603:10b6:5:1c0::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.14 via Frontend
 Transport; Mon, 15 Jul 2019 21:22:01 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 CO1NAM03FT063.mail.protection.outlook.com (10.152.81.61) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Mon, 15 Jul 2019 21:22:01 +0000
Received: from localhost.localdomain (10.180.168.240) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1;
 Mon, 15 Jul 2019 16:21:40 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 78/87] drm/amd/display: Increase size of audios array
Date: Mon, 15 Jul 2019 17:20:40 -0400
Message-ID: <20190715212049.4584-79-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190715212049.4584-1-sunpeng.li@amd.com>
References: <20190715212049.4584-1-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(136003)(346002)(396003)(2980300002)(428003)(199004)(189003)(126002)(2870700001)(2876002)(2616005)(476003)(70586007)(4326008)(70206006)(48376002)(486006)(53936002)(426003)(2906002)(11346002)(8676002)(50466002)(36756003)(81166006)(446003)(81156014)(68736007)(186003)(49486002)(6916009)(305945005)(54906003)(86362001)(316002)(478600001)(26005)(8936002)(356004)(336012)(76176011)(51416003)(1076003)(47776003)(2351001)(5660300002)(14444005)(50226002)(106533001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1935; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff95e737-3c38-4e9e-d5b1-08d7096a7a24
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:MWHPR12MB1935; 
X-MS-TrafficTypeDiagnostic: MWHPR12MB1935:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1935DF608AD236AA15A2453F82CF0@MWHPR12MB1935.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 00997889E7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: zgNpcmgiRPh251CiY224kAgKKjXYhp9EHPOemddp/zjMbU404Q+bX1pvzkHX8gnNaQWtT1cse4MPEvtScoWe6GJNmG6V/2roSXedwdQXAWrx9Mh7/3i+f6GBKdYZ9HzcW3UV+ZbE0hYsT2BbOfWNmB1AMG7sVLFvClUVHudGfFdKDKjbqSyX/SzoYBdnMoRwkkpZntFnCrARxa3xfLRFxdq8FK8qWxgxbh7ptYrv56jVuXb1GS7Qzbfkoqz5Ct9c+QFHRNJ02pCoUbSp+JugVWBnCECdI73vizQ+QsQXre/2Cuhnyd4P3gGpnUxvbhDsy+ueVcpwir1TDO3mc1cSQZgqMVHIYIBE53Mb3bCPUe6UfablJ76x78wYEwjHLVYCt4Hvgq3TTbKLajNMHXOfi09jWexQbiCvxSj7FHEwvao=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2019 21:22:01.4749 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff95e737-3c38-4e9e-d5b1-08d7096a7a24
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1935
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x5OSTouda2JYPeazKyHlVaOmane9ENCTQzZSRPcH2es=;
 b=tQeV4QY9WROnz8j5vRHEl62npUFdp7WUuviOgX90QBapfXMrcR2wQOJetkD8/dYjknQtvdLfXKsmEfu4ZH9K0d4a5exIb+HjFlIew4oUQMK5MgtXY7bTzMIqrOCAsfsmmLR6ZAVmEEu+raeUO9oLaXDbYOMzhPh8Z9GnNKjRty4=
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
Cc: Leo Li <sunpeng.li@amd.com>, Joshua Aberback <Joshua.Aberback@amd.com>,
 Tai Man <taiman.wong@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogVGFpIE1hbiA8dGFpbWFuLndvbmdAYW1kLmNvbT4KCltXaHldClRoZSBhdWRpb3MgYXJy
YXkgZGVmaW5lZCBpbiAic3RydWN0IHJlc291cmNlX3Bvb2wiIGlzIG9ubHkgNiAoTUFYX1BJUEVT
KQpidXQgdGhlIG1heCBudW1iZXIgb2YgYXVkaW8gZGV2aWNlcyAobnVtX2F1ZGlvKSBpcyA3LiBJ
biBzb21lIHByb2plY3RzLAppdCB3aWxsIHJ1biBvdXQgb2YgYXVkaW9zIGFycmF5LgoKW0hvd10K
SW5jcmFlc2UgdGhlIGF1ZGlvcyBhcnJheSBzaXplIHRvIDcuCgpTaWduZWQtb2ZmLWJ5OiBUYWkg
TWFuIFdvbmcgPHRhaW1hbi53b25nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBKb3NodWEgQWJlcmJh
Y2sgPEpvc2h1YS5BYmVyYmFja0BhbWQuY29tPgpBY2tlZC1ieTogTGVvIExpIDxzdW5wZW5nLmxp
QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2luYy9jb3JlX3R5
cGVzLmggICB8IDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9pbmMvaHcvaHdf
c2hhcmVkLmggfCAxICsKIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2luYy9j
b3JlX3R5cGVzLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvaW5jL2NvcmVfdHlw
ZXMuaAppbmRleCBjODkzOTNjMTkyMzIuLmExNDhmZmRlOGIxMiAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2luYy9jb3JlX3R5cGVzLmgKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2luYy9jb3JlX3R5cGVzLmgKQEAgLTIxMiw3ICsyMTIsNyBA
QCBzdHJ1Y3QgcmVzb3VyY2VfcG9vbCB7CiAJc3RydWN0IGNsb2NrX3NvdXJjZSAqY2xvY2tfc291
cmNlc1tNQVhfQ0xPQ0tfU09VUkNFU107CiAJdW5zaWduZWQgaW50IGNsa19zcmNfY291bnQ7CiAK
LQlzdHJ1Y3QgYXVkaW8gKmF1ZGlvc1tNQVhfUElQRVNdOworCXN0cnVjdCBhdWRpbyAqYXVkaW9z
W01BWF9BVURJT1NdOwogCXVuc2lnbmVkIGludCBhdWRpb19jb3VudDsKIAlzdHJ1Y3QgYXVkaW9f
c3VwcG9ydCBhdWRpb19zdXBwb3J0OwogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvaW5jL2h3L2h3X3NoYXJlZC5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2luYy9ody9od19zaGFyZWQuaAppbmRleCA4NzU5ZWMwM2FlZGUuLmY4MjM2NWUyZDAz
YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2luYy9ody9od19z
aGFyZWQuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvaW5jL2h3L2h3X3No
YXJlZC5oCkBAIC0zNCw2ICszNCw3IEBACiAgKiBEYXRhIHR5cGVzIHNoYXJlZCBiZXR3ZWVuIGRp
ZmZlcmVudCBWaXJ0dWFsIEhXIGJsb2NrcwogICoqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKi8KIAorI2Rl
ZmluZSBNQVhfQVVESU9TIDcKICNkZWZpbmUgTUFYX1BJUEVTIDYKICNpZiBkZWZpbmVkKENPTkZJ
R19EUk1fQU1EX0RDX0RDTjJfMCkKICNkZWZpbmUgTUFYX0RXQl9QSVBFUwkxCi0tIAoyLjIyLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZngg
bWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
