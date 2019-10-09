Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FEFD1A93
	for <lists+amd-gfx@lfdr.de>; Wed,  9 Oct 2019 23:06:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 070316EA6A;
	Wed,  9 Oct 2019 21:06:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690088.outbound.protection.outlook.com [40.107.69.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B24406EA5A
 for <amd-gfx@lists.freedesktop.org>; Wed,  9 Oct 2019 21:06:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PPHogcF/KlzYFPAnAXIf4ooJMbB00okifGCkUBk0TgODvho7R3JTkmZTPfBNFi3hnroBRu5mPNzsqcguc1T+ZjkXI9wcckpJTABzQYYgTtdO5OZoKTJjmSgj+34ZK5nRPU0jY+V2MKNeTx6eWCYnE9kP/LBbc5LvuutnVAIbJwjYG43oda4NXoKMiWyRV6fwgxrjuSqtMqt6lgwFe8RrrSoV3/oqBCQI/VmZLkQx9enEj+vgb3A95xmSbOg6e133ztLS6k42ANhc2Rjw1kalkYjqcgR+932musr8xq1USZFfWWmxQcCjvGbEefkJQidDtMYeha0GtfxksO3B3AWmlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0LpUSVfHgQuiyjJ5GaM/75bJkapfJyvpYYoZlpFpeOo=;
 b=bW1uKbZDdh/pJxnMcXe+icVicd+nnjTquEc5v2yN/YhfpzkdB9mtDKb5XVO93jWqd1LGGN9/09N2YWlEJSrSpgTk3Oln/6HWWfAVscNeSIyHAiJr4NZm9tPfUDJgD8QBrhLVOkI/yTj6RQmbRt9ABsE9lccD2HP+S5aMPYLuX3Zm7rT4ZvAlOzmXX6hHLB4KU838L2nQ2HMutrINbEQm1Tr94ETOHL9TLxgBdcbejIBKGBCAGptR8rcIGS+oYLX3dA/MJUXGR3l393BtgkayfwEUMDmnMsPo84XVhbHZn6IcD8FAYfySqEnt4vKZKd8YH6Ua4Wnwe7u9Qx9MPGu9KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
Received: from MWHPR1201CA0019.namprd12.prod.outlook.com
 (2603:10b6:301:4a::29) by SN1PR12MB2381.namprd12.prod.outlook.com
 (2603:10b6:802:25::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Wed, 9 Oct
 2019 21:06:25 +0000
Received: from DM3NAM03FT052.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::204) by MWHPR1201CA0019.outlook.office365.com
 (2603:10b6:301:4a::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Wed, 9 Oct 2019 21:06:24 +0000
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT052.mail.protection.outlook.com (10.152.83.107) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Wed, 9 Oct 2019 21:06:24 +0000
Received: from blakha.amd.com (10.180.168.240) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Wed, 9 Oct 2019
 16:06:22 -0500
From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 08/26] drm/amd/display: move the bounding box patch before
 calculate wm
Date: Wed, 9 Oct 2019 17:05:55 -0400
Message-ID: <20191009210613.17929-9-Bhawanpreet.Lakha@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191009210613.17929-1-Bhawanpreet.Lakha@amd.com>
References: <20191009210613.17929-1-Bhawanpreet.Lakha@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(39860400002)(376002)(396003)(428003)(199004)(189003)(11346002)(8936002)(51416003)(1076003)(2906002)(81166006)(16586007)(81156014)(8676002)(54906003)(70586007)(50226002)(5660300002)(356004)(70206006)(6666004)(476003)(2616005)(426003)(126002)(446003)(336012)(486006)(316002)(26005)(4326008)(50466002)(478600001)(76176011)(186003)(305945005)(7696005)(47776003)(86362001)(6916009)(53416004)(14444005)(2351001)(36756003)(48376002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN1PR12MB2381; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f38bfc67-5c06-4fae-5d4f-08d74cfc8b44
X-MS-TrafficTypeDiagnostic: SN1PR12MB2381:
X-Microsoft-Antispam-PRVS: <SN1PR12MB23817E7D278930A8EF8B5761F9950@SN1PR12MB2381.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-Forefront-PRVS: 018577E36E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WnjwE6Vjpc0O+pG+eHbQkOhkcIEVgGH6HhlsSOMdMY5+bAtFboYHT21rJHEw8PuYsOA68H/9IrsN47WHwU+eC8si/tM3d/4vNZ74IkM7eEP3apMfnVPL1BjwfgB7TDxrGymjviYuvhz+VERWpYd/swmZVIFb3NmB04rokF+wrZYP9nxb0ZJI4ZO3yVx1ySv/fvgH3K1qDopRskULHOEBBDV0x1hHu12gzIFqPnZaONUs8dcEs2fQispDFoFUaUDZjzIF0mnB9wLOmLWIQpmTgRQ2qKQfH8n/SOOgS5x1n03XSoLCYggw41u0il6JruXms3KsPVTFpgGqXcZyCdR/UnIIaqQxTKaezruZo8DLog/01ew6cl8EO+Nbk0c/meqyicNp2Zfkn7vRYuYBizFecR0tNM5vfQ2/EV4RFKC75a4=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2019 21:06:24.7296 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f38bfc67-5c06-4fae-5d4f-08d74cfc8b44
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2381
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0LpUSVfHgQuiyjJ5GaM/75bJkapfJyvpYYoZlpFpeOo=;
 b=JIbmyPyG1ukDSxuk06d1a/8hcMRtqyqRCrSJwxM2pvwWwpRgydBjamhwIziYjBa56Sld/QewC1evCA60xnpRno9eT3zwt3uHFwzfLXXlnDA6TIBh/kQX7u0pAqx0+TXS7MUP5AKNXpGefYyiQFHRl75vA9PUDxxJEHAouRMDCZw=
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
 harry.wentland@amd.com, joseph graveno <joseph.gravenor@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

RnJvbTogTGV3aXMgSHVhbmcgPExld2lzLkh1YW5nQGFtZC5jb20+Cgpbd2h5XQpkcml2ZXIgdXBk
YXRlaXMgdGhlIGRjbjJfMV9zb2MgaW50byBkbWwgYmVmb3JlIGNhbGwgdXBkYXRlX2J3X2JvdW5k
aW5nX2JveAoKW0hvd10KTW92ZSB0aGUgcGF0Y2ggZnVuY3Rpb24gYmVmb3JlIGNhbGN1bGF0ZSB3
bS4KClNpZ25lZC1vZmYtYnk6IExld2lzIEh1YW5nIDxMZXdpcy5IdWFuZ0BhbWQuY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBqb3NlcGggZ3JhdmVubyA8am9zZXBoLmdyYXZlbm9yQGFtZC5jb20+CkFja2Vk
LWJ5OiBCaGF3YW5wcmVldCBMYWtoYSA8Qmhhd2FucHJlZXQuTGFraGFAYW1kLmNvbT4KLS0tCiAu
Li4vZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIxL2RjbjIxX3Jlc291cmNlLmMgfCAyNSArKysrKysr
KysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMS9kY24yMV9yZXNvdXJjZS5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIxL2RjbjIxX3Jlc291cmNlLmMK
aW5kZXggZGRmNTJlMjYwZWQ2Li5lMzk5NjFkMGYyNGUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMS9kY24yMV9yZXNvdXJjZS5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMS9kY24yMV9yZXNvdXJjZS5jCkBAIC0xMDA3LDYg
KzEwMDcsMjkgQEAgc3RhdGljIHZvaWQgY2FsY3VsYXRlX3dtX3NldF9mb3JfdmxldmVsKAogCiB9
CiAKK3N0YXRpYyB2b2lkIHBhdGNoX2JvdW5kaW5nX2JveChzdHJ1Y3QgZGMgKmRjLCBzdHJ1Y3Qg
X3Zjc19kcGlfc29jX2JvdW5kaW5nX2JveF9zdCAqYmIpCit7CisJa2VybmVsX2ZwdV9iZWdpbigp
OworCWlmIChkYy0+YmJfb3ZlcnJpZGVzLnNyX2V4aXRfdGltZV9ucykgeworCQliYi0+c3JfZXhp
dF90aW1lX3VzID0gZGMtPmJiX292ZXJyaWRlcy5zcl9leGl0X3RpbWVfbnMgLyAxMDAwLjA7CisJ
fQorCisJaWYgKGRjLT5iYl9vdmVycmlkZXMuc3JfZW50ZXJfcGx1c19leGl0X3RpbWVfbnMpIHsK
KwkJYmItPnNyX2VudGVyX3BsdXNfZXhpdF90aW1lX3VzID0KKwkJCQlkYy0+YmJfb3ZlcnJpZGVz
LnNyX2VudGVyX3BsdXNfZXhpdF90aW1lX25zIC8gMTAwMC4wOworCX0KKworCWlmIChkYy0+YmJf
b3ZlcnJpZGVzLnVyZ2VudF9sYXRlbmN5X25zKSB7CisJCWJiLT51cmdlbnRfbGF0ZW5jeV91cyA9
IGRjLT5iYl9vdmVycmlkZXMudXJnZW50X2xhdGVuY3lfbnMgLyAxMDAwLjA7CisJfQorCisJaWYg
KGRjLT5iYl9vdmVycmlkZXMuZHJhbV9jbG9ja19jaGFuZ2VfbGF0ZW5jeV9ucykgeworCQliYi0+
ZHJhbV9jbG9ja19jaGFuZ2VfbGF0ZW5jeV91cyA9CisJCQkJZGMtPmJiX292ZXJyaWRlcy5kcmFt
X2Nsb2NrX2NoYW5nZV9sYXRlbmN5X25zIC8gMTAwMC4wOworCX0KKwlrZXJuZWxfZnB1X2VuZCgp
OworfQorCiB2b2lkIGRjbjIxX2NhbGN1bGF0ZV93bSgKIAkJc3RydWN0IGRjICpkYywgc3RydWN0
IGRjX3N0YXRlICpjb250ZXh0LAogCQlkaXNwbGF5X2UyZV9waXBlX3BhcmFtc19zdCAqcGlwZXMs
CkBAIC0xMDIxLDYgKzEwNDQsOCBAQCB2b2lkIGRjbjIxX2NhbGN1bGF0ZV93bSgKIAogCUFTU0VS
VChid19wYXJhbXMpOwogCisJcGF0Y2hfYm91bmRpbmdfYm94KGRjLCAmY29udGV4dC0+YndfY3R4
LmRtbC5zb2MpOworCiAJZm9yIChpID0gMCwgcGlwZV9pZHggPSAwLCBwaXBlX2NudCA9IDA7IGkg
PCBkYy0+cmVzX3Bvb2wtPnBpcGVfY291bnQ7IGkrKykgewogCQkJaWYgKCFjb250ZXh0LT5yZXNf
Y3R4LnBpcGVfY3R4W2ldLnN0cmVhbSkKIAkJCQljb250aW51ZTsKLS0gCjIuMTcuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5n
IGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
