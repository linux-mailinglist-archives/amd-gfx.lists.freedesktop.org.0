Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E77B7D1A98
	for <lists+amd-gfx@lfdr.de>; Wed,  9 Oct 2019 23:06:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 115FC6EA67;
	Wed,  9 Oct 2019 21:06:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760077.outbound.protection.outlook.com [40.107.76.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 464AA6EA6A
 for <amd-gfx@lists.freedesktop.org>; Wed,  9 Oct 2019 21:06:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eRvvIFb+scnP5oCEkz+U95fc5jwABqcj6bWurvoHdFzPM9TxqWu24LDLzzoYFMEfY6Wh6+KJTxs0sVbf8acbA1KxzE1GmrMCFyN5mo8+CAr3tg9+2GsgO598L8n+RrsfB6SWAKw1cxUypkrhqCMfUPTKMmt0pnbe6RbLJt10z3Ui1Vb/gO9+Pk1HLBxbm5LXwpkdhC8ZwMmKu0plQTXI44gLZx+OXvHXkiECQaS/W1Y+72/kNE+3G3/SQUiweB2liknrwNiTrdCMKZ8iqDsu/Z2jrKdNTAGwR0eP0ntolhrSVtuP6LVovDghQUNWpm4VT1PPSjOarkwPnHR8TWL+lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dpc6EVvsJdZ8WDmQas5rhmtQcIprAAHcq+ctNn2NeE0=;
 b=VePwOlr4WL1SDywqOWxusFbwudY8bgl6enaA8YxeFfy8AHlHWReV4OFGT01CywLqEJ++EQtRN8tpjNt4bSnBDdm92CzsHbn89AkUe0ob+FS2ox6DUJpss5ZQ88B4lfCJxFQ0Xt187WGhpKlX5O6pJb9e7AJj/UIq0nveUhQVyzYpYRM5AaQYNa3mCqyVBXJ9accYfpJOaqgYQqeB1+o2vPLieuknLCUGs8uicMnFKqR6cloPUMaH28wfu5aU6m35LgCTSO+IFheAxgi9chdNKCxhA5+O30UoJDhTKrCth9gefYcQayYVKNwiYpSVtIusVTg327kGzCxISa4TLKX9Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from DM6PR12CA0009.namprd12.prod.outlook.com (2603:10b6:5:1c0::22)
 by MN2PR12MB3088.namprd12.prod.outlook.com (2603:10b6:208:c4::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2327.23; Wed, 9 Oct
 2019 21:06:32 +0000
Received: from DM3NAM03FT032.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::208) by DM6PR12CA0009.outlook.office365.com
 (2603:10b6:5:1c0::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Wed, 9 Oct 2019 21:06:32 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT032.mail.protection.outlook.com (10.152.82.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Wed, 9 Oct 2019 21:06:32 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 9 Oct 2019
 16:06:31 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 26/26] drm/amd/display: use requested_dispclk_khz instead of
 clk
Date: Wed, 9 Oct 2019 17:06:13 -0400
Message-ID: <20191009210613.17929-27-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191009210613.17929-1-Bhawanpreet.Lakha@amd.com>
References: <20191009210613.17929-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(136003)(376002)(39860400002)(428003)(199004)(189003)(70206006)(5660300002)(478600001)(48376002)(2906002)(8936002)(70586007)(50226002)(476003)(36756003)(86362001)(186003)(2616005)(11346002)(50466002)(446003)(426003)(7696005)(305945005)(126002)(76176011)(26005)(4326008)(336012)(486006)(51416003)(6666004)(2351001)(356004)(53416004)(6916009)(81166006)(81156014)(8676002)(54906003)(316002)(1076003)(47776003)(16586007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3088; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b7113a5d-68d7-4e15-b7de-08d74cfc8fbd
X-MS-TrafficTypeDiagnostic: MN2PR12MB3088:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3088128337675F6E2B2C76A3F9950@MN2PR12MB3088.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:136;
X-Forefront-PRVS: 018577E36E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z0vo5kn/tr1npHscuqNceI5Ocqum4JRFDy0ut7V72YcIfhpEozgthLFqljM5670JpN0FlHmpVdGmRKaxOIB1EjX6ymSdzrF36XJMURwOafL4xIyIHPp1wxHOAQxfpWB/pltBGpF7Bv1IA+FqPNWST0axkwe88jrDWFnUHA6yAO0lJ43klEsOBSGm3o+DY2kaH//1Oq6nceGIZJTf7m5jXXksRFnzKDkF/ZapLzVVIsN8ozoTGSgCEaQx0OnKGVwiqek0xaDpfDUwZPYev2/2YLx4iGxoE1yr0knkLEYhoolx7DVqng7t3GALrJsLICxAjMl4SeP4yjC0wIE/g5rsMUypxYr+8prGFZWjE3mrtPnrNZwvSacKnZChjmzYBmPZsu7S9viQ32H+hp7N+3n5YYcgXI43SY2epPQl34eD6Jg=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2019 21:06:32.1888 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7113a5d-68d7-4e15-b7de-08d74cfc8fbd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3088
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dpc6EVvsJdZ8WDmQas5rhmtQcIprAAHcq+ctNn2NeE0=;
 b=WVcWizFoBue0wgt/PSyzLcqCgW7tAe7O7JBUmUq99khXyP8lDzFK8akt174K14zRKmF0e6xq5j/fzo4q6CPZb7FEBldA+a04vgdJ7mKeko54+8RV3N/8MEnBbGDGNhMsdX2xEUMRqWlVxUMxu8H5mJkmDzf/A9YUwEZosW6UcJA=
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
Cc: sunpeng.li@amd.com, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 harry.wentland@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VXNlIHJlcXVlc3RlZF9kaXNwY2xrX2toeiAvIDEwMDAgZGlyZWN0bHkKClNpZ25lZC1vZmYtYnk6
IEJoYXdhbnByZWV0IExha2hhIDxCaGF3YW5wcmVldC5MYWtoYUBhbWQuY29tPgotLS0KIC4uLi9k
aXNwbGF5L2RjL2Nsa19tZ3IvZGNuMjEvcm5fY2xrX21ncl92Ymlvc19zbXUuYyB8IDEzICsrLS0t
LS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jbGtfbWdyL2Rj
bjIxL3JuX2Nsa19tZ3JfdmJpb3Nfc211LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvY2xrX21nci9kY24yMS9ybl9jbGtfbWdyX3ZiaW9zX3NtdS5jCmluZGV4IDI2NTA3NzZhY2Jj
My4uNTY0N2ZjZjEwNzE3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvY2xrX21nci9kY24yMS9ybl9jbGtfbWdyX3ZiaW9zX3NtdS5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9jbGtfbWdyL2RjbjIxL3JuX2Nsa19tZ3JfdmJpb3Nfc211LmMK
QEAgLTg0LDE2ICs4NCwxMiBAQCBpbnQgcm5fdmJpb3Nfc211X3NldF9kaXNwY2xrKHN0cnVjdCBj
bGtfbWdyX2ludGVybmFsICpjbGtfbWdyLCBpbnQgcmVxdWVzdGVkX2RpcwogCWludCBhY3R1YWxf
ZGlzcGNsa19zZXRfbWh6ID0gLTE7CiAJc3RydWN0IGRjICpjb3JlX2RjID0gY2xrX21nci0+YmFz
ZS5jdHgtPmRjOwogCXN0cnVjdCBkbWN1ICpkbWN1ID0gY29yZV9kYy0+cmVzX3Bvb2wtPmRtY3U7
Ci0JdWludDMyX3QgY2xrID0gcmVxdWVzdGVkX2Rpc3BjbGtfa2h6IC8gMTAwMDsKLQotCWlmIChj
bGsgPD0gMTAwKQotCQljbGsgPSAxMDE7CiAKIAkvKiAgVW5pdCBvZiBTTVUgbXNnIHBhcmFtZXRl
ciBpcyBNaHogKi8KIAlhY3R1YWxfZGlzcGNsa19zZXRfbWh6ID0gcm5fdmJpb3Nfc211X3NlbmRf
bXNnX3dpdGhfcGFyYW0oCiAJCQljbGtfbWdyLAogCQkJVkJJT1NTTUNfTVNHX1NldERpc3BjbGtG
cmVxLAotCQkJY2xrKTsKKwkJCXJlcXVlc3RlZF9kaXNwY2xrX2toeiAvIDEwMDApOwogCiAJaWYg
KCFJU19GUEdBX01BWElNVVNfREMoY29yZV9kYy0+Y3R4LT5kY2VfZW52aXJvbm1lbnQpKSB7CiAJ
CWlmIChkbWN1ICYmIGRtY3UtPmZ1bmNzLT5pc19kbWN1X2luaXRpYWxpemVkKGRtY3UpKSB7CkBA
IC0xNjIsMTUgKzE1OCwxMCBAQCBpbnQgcm5fdmJpb3Nfc211X3NldF9kcHBjbGsoc3RydWN0IGNs
a19tZ3JfaW50ZXJuYWwgKmNsa19tZ3IsIGludCByZXF1ZXN0ZWRfZHBwXwogewogCWludCBhY3R1
YWxfZHBwY2xrX3NldF9taHogPSAtMTsKIAotCXVpbnQzMl90IGNsayA9IHJlcXVlc3RlZF9kcHBf
a2h6IC8gMTAwMDsKLQotCWlmIChjbGsgPD0gMTAwKQotCQljbGsgPSAxMDE7Ci0KIAlhY3R1YWxf
ZHBwY2xrX3NldF9taHogPSBybl92Ymlvc19zbXVfc2VuZF9tc2dfd2l0aF9wYXJhbSgKIAkJCWNs
a19tZ3IsCiAJCQlWQklPU1NNQ19NU0dfU2V0RHBwY2xrRnJlcSwKLQkJCWNsayk7CisJCQlyZXF1
ZXN0ZWRfZHBwX2toeiAvIDEwMDApOwogCiAJcmV0dXJuIGFjdHVhbF9kcHBjbGtfc2V0X21oeiAq
IDEwMDA7CiB9Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA==
