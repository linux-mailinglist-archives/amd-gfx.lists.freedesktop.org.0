Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F5D2BAEF
	for <lists+amd-gfx@lfdr.de>; Mon, 27 May 2019 21:52:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BD3B89B0C;
	Mon, 27 May 2019 19:52:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820052.outbound.protection.outlook.com [40.107.82.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9784689B0C
 for <amd-gfx@lists.freedesktop.org>; Mon, 27 May 2019 19:52:23 +0000 (UTC)
Received: from DM5PR12CA0003.namprd12.prod.outlook.com (2603:10b6:4:1::13) by
 DM6PR12MB2665.namprd12.prod.outlook.com (2603:10b6:5:4a::26) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.18; Mon, 27 May 2019 19:52:22 +0000
Received: from CO1NAM03FT022.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e48::200) by DM5PR12CA0003.outlook.office365.com
 (2603:10b6:4:1::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1922.16 via Frontend
 Transport; Mon, 27 May 2019 19:52:22 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 CO1NAM03FT022.mail.protection.outlook.com (10.152.80.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1922.16 via Frontend Transport; Mon, 27 May 2019 19:52:21 +0000
Received: from leodev.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 27 May 2019
 14:52:02 -0500
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 24/26] drm/amd/display: Reset planes for color management
 changes
Date: Mon, 27 May 2019 15:51:03 -0400
Message-ID: <1558986665-12964-25-git-send-email-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558986665-12964-1-git-send-email-sunpeng.li@amd.com>
References: <1558986665-12964-1-git-send-email-sunpeng.li@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(376002)(346002)(396003)(136003)(39860400002)(2980300002)(428003)(199004)(189003)(316002)(186003)(50226002)(68736007)(2876002)(6916009)(305945005)(50466002)(77096007)(86152003)(53936002)(8936002)(5660300002)(81166006)(81156014)(8676002)(36756003)(53416004)(70586007)(70206006)(76176011)(26005)(11346002)(2616005)(16586007)(2906002)(336012)(476003)(47776003)(486006)(126002)(4326008)(48376002)(356004)(7696005)(72206003)(86362001)(2351001)(478600001)(51416003)(446003)(426003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2665; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 074497f6-7945-4be4-1972-08d6e2dcd552
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM6PR12MB2665; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB2665:
X-Microsoft-Antispam-PRVS: <DM6PR12MB2665F758149A08C25057C13F821D0@DM6PR12MB2665.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1002;
X-Forefront-PRVS: 0050CEFE70
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: LSvnFx3ol148iUWdckY+AcOcmVdjBk0JIh9AfmdSoZQXm17q8h5J23DQcennZ+67AE83+LSq1SnoajxlJmO/TQy03yQ2n6003DiVynHdPKVZA0QLOAH2FRyvx+2BkvT3W82BWhT/oDLysRDS4/glaxTeQkZJtlq+B3kkL9B5s17/NOgD9umUbfuCARkzvvLXtHl+LHVN8KR4iTwiMnqJZ8YSqWs16nSXZ95bdgitbaxo5uB9yfvNoYAzNsloCLWthjCK1r4rD1FcSgWcFziFs2T4rRZaY4FMNG35a8X+DdpvPbuYpiftTQYO9nAKv0+D8xk+mieaupsQA52QEv50FFKwhboTGUg346IucdxYkY224GugWuMVsS581JZ4db8eFj9IRLkIa0LSNlILDfcmg25Vk0eyGKIZn+AKGNv1QwI=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2019 19:52:21.7282 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 074497f6-7945-4be4-1972-08d6e2dcd552
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2665
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Loi1RC9SreRjYk/aI2GaDoNXRdOYy2maPp5jbwHfzE0=;
 b=1QMHw3Q0xbKBpc2qASp4yHIgVbKrVMR+w2SsW+O6jyZCBW1y3OXMgZIBH6X8q47E6cKDV91PO7bixl1XkKs3OgvqZL3Hdio2y4cOxNZwAWZw8Wsg394SERkbDDwUpbcZuzEbewt6od0Mi4O+wyhWcWEJkx0Bbmr9ycwj6qKzxKg=
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
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0BhbWQuY29tPgoK
W1doeV0KRm9yIGNvbW1pdHMgd2l0aCBhbGxvd19tb2Rlc2V0PWZhbHNlIGFuZCBDUlRDIGRlZ2Ft
bWEgY2hhbmdlcyB0aGUgcGxhbmVzCmFyZW4ndCByZXNldC4gVGhpcyByZXN1bHRzIGluIGluY29y
cmVjdCByZW5kZXJpbmcuCgpbSG93XQpSZXNldCB0aGUgcGxhbmVzIHdoZW4gY29sb3IgbWFuYWdl
bWVudCBoYXMgY2hhbmdlZCBvbiB0aGUgQ1JUQy4KVGVjaG5pY2FsbHkgdGhpcyB3aWxsIGluY2x1
ZGUgcmVnYW1tYSBjaGFuZ2VzIGFzIHdlbGwsIGJ1dCBpdCBkb2Vzbid0CnJlYWxseSBhZnRlciBs
ZWdhY3kgdXNlcnNwYWNlIHNpbmNlIHRob3NlIGNvbW1pdCB3aXRoCmFsbG93X21vZGVzZXQ9dHJ1
ZS4KClNpZ25lZC1vZmYtYnk6IE5pY2hvbGFzIEthemxhdXNrYXMgPG5pY2hvbGFzLmthemxhdXNr
YXNAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEhhcnJ5IFdlbnRsYW5kIDxIYXJyeS5XZW50bGFuZEBh
bWQuY29tPgpBY2tlZC1ieTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyB8IDQgKysrKwogMSBm
aWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCmluZGV4IGMxMGEzOTguLjIyNTQ2YzMgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2Rt
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0u
YwpAQCAtNjQ0Myw2ICs2NDQzLDEwIEBAIHN0YXRpYyBib29sIHNob3VsZF9yZXNldF9wbGFuZShz
dHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqc3RhdGUsCiAJaWYgKCFuZXdfY3J0Y19zdGF0ZSkKIAkJ
cmV0dXJuIHRydWU7CiAKKwkvKiBDUlRDIERlZ2FtbWEgY2hhbmdlcyBjdXJyZW50bHkgcmVxdWly
ZSB1cyB0byByZWNyZWF0ZSBwbGFuZXMuICovCisJaWYgKG5ld19jcnRjX3N0YXRlLT5jb2xvcl9t
Z210X2NoYW5nZWQpCisJCXJldHVybiB0cnVlOworCiAJaWYgKGRybV9hdG9taWNfY3J0Y19uZWVk
c19tb2Rlc2V0KG5ld19jcnRjX3N0YXRlKSkKIAkJcmV0dXJuIHRydWU7CiAKLS0gCjIuNy40Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1h
aWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
